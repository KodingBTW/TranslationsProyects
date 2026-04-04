#Wurm text editor v0.1
import argparse
import re
import sys
import os
    
class Assembler:
    def __init__(self):
        pass

    @staticmethod
    def create_asm_file(output_path, pointers_list, asm_type=0):
        """
        Parameters:
            output_path (str): ASM file.
            pointers_list (list of list): Pointer data.
        """
        asm_path = output_path + ".asm"
        label_base = os.path.basename(output_path)

        if asm_type == 0:
            asm_label = ""
            asm_equal = " = "
            asm_hex = "$"
        elif asm_type == 1:
            asm_label = "!"
            asm_equal = " = "
            asm_hex = "$"
        elif asm_type == 2:
            asm_label = ".definelabel "
            asm_equal = ", "
            asm_hex = "0x"
   
        with open(asm_path, "w", encoding="utf-8") as f:
            for i, pointer in enumerate(pointers_list, start=1):
                label = f"{label_base}_{i:04d}"
                bytes_str = f"{asm_hex}" + "".join(f"{b:02X}" for b in pointer)
                f.write(f"{asm_label}{label}{asm_equal}{bytes_str}\n")

        print(f"ASM file exported: {asm_path}")

class Pointers:
    def __init__(self):
        pass

    def calculate_pointers_1_byte(self, list_cumulative_length):
        """
        Parameters:
            list_cumulative_length (list): A list of cumulative pointer lengths to adjust.

        Returns:
            tuple: A tuple containing:
                - pointers_data (bytearray): The encoded pointer data.
                - data_length (int): The length of the encoded pointer data.
        """
        pointers_data = []

        for ptr in list_cumulative_length:
            byte_val = ptr & 0xFF
            pointers_data.append([byte_val])
        
        return pointers_data, len(pointers_data)

    # La Base es el fisrt pointer, el calculo de base real no se ocupa en este programa.
    def calculate_pointers_2_bytes(self, list_cumulative_length, first_pointer, base, endianness):
        """
        Parameters:
            list_cumulative_length (list): A list of cumulative pointer lengths to adjust.
            first_pointer (int): The first pointer to add to each cumulative length.
            base (int): The base address to subtract from each pointer.
            endianness (int): The endianness (0 for little-endian, 1 for big-endian).

        Returns:
            tuple: A tuple containing:
                - pointers_data (bytearray): The encoded pointer data.
                - data_length (int): The length of the encoded pointer data.
        """
        pointers_data = []
        pointers_list = [ptr + first_pointer for ptr in list_cumulative_length]
        pointers_list = [ptr - base for ptr in pointers_list]
        if endianness == 0:
            for ptr in pointers_list:
                pointers_data.append([(ptr >> 8) & 0xFF, ptr & 0xFF])                        
        elif endianness == 1:
            for ptr in pointers_list:
                pointers_data.append([ptr & 0xFF,(ptr >> 8) & 0xFF])                 
        return pointers_data, len(pointers_data)

    def calculate_pointers_3_bytes(self, list_cumulative_length, first_pointer, base, endianness):
        """
        Parameters:
            list_cumulative_length (list): A list of cumulative pointer lengths to adjust.
            first_pointer (int): The first pointer to add to each cumulative length.
            base (int): The base address to subtract from each pointer.
            endianness (int): The endianness (0 for little-endian, 1 for big-endian).

        Returns:
            tuple: A tuple containing:
                - pointers_data (bytearray): The encoded pointer data.
                - data_length (int): The length of the encoded pointer data.
        """
        pointers_data = []
        pointers_list = [ptr + first_pointer for ptr in list_cumulative_length]
        pointers_list = [ptr - base for ptr in pointers_list]
        if endianness == 0:
            for ptr in pointers_list:
                pointers_data.append([(ptr >> 16) & 0xFF, (ptr >> 8) & 0xFF, ptr & 0xFF])               
        elif endianness == 1:
            for ptr in pointers_list:
                pointers_data.append([ptr & 0xFF, (ptr >> 8) & 0xFF, (ptr >> 16) & 0xFF])
        return pointers_data, len(pointers_data)
        
    def calculate_pointers_4_bytes(self, list_cumulative_length, first_pointer, base, endianness):
        """
        Parameters:
            list_cumulative_length (list): A list of cumulative pointer lengths to adjust.
            first_pointer (int): The first pointer to add to each cumulative length.
            base (int): The base address to subtract from each pointer.
            endianness (int): The endianness (0 for little-endian, 1 for big-endian).

        Returns:
            tuple: A tuple containing:
                - pointers_data (bytearray): The encoded pointer data.
                - data_length (int): The length of the encoded pointer data.
        """
        pointers_data = []
        pointers_list = [ptr + first_pointer for ptr in list_cumulative_length]
        pointers_list = [ptr - base for ptr in pointers_list]
        if endianness == 0:
            for ptr in pointers_list:
                pointers_data.append([(ptr >> 24) & 0xFF, (ptr >> 16) & 0xFF, (ptr >> 8) & 0xFF, ptr & 0xFF])
        elif endianness == 1:
            for ptr in pointers_list:
                pointers_data.append([ptr & 0xFF, (ptr >> 8) & 0xFF, (ptr >> 16) & 0xFF, (ptr >> 24) & 0xFF])                
        return pointers_data, len(pointers_data)

class CustomArgumentParser(argparse.ArgumentParser):
    def error(self, message):
        print(f"\nError: {message}\n")
        self.show_help()
        sys.exit(1)

    def print_help(self):
        self.show_help()

    @staticmethod
    def show_help():
        print("+----------------------------------------------")
        print("| Dejavu Editor by koda v0.1")
        print("+----------------------------------------------")
        print("| Usage:")
        print("|   extract      Extract from ROM")
        print("|   insert       Insert to ROM")
        print("|   help         Show this message.")
        print("+----------------------------------------------")
        print("| Extract:")
        print("|  -r <path>     Path to the ROM file")
        print("|  -f <path>     Output file")
        print("|  -t <path>     Table file path")
        print("|  --no-comments No comments")
        print("|")
        print("| Insert:")
        print("|  -r <path>     Path to the ROM file")
        print("|  -f <path>     Input file")
        print("|  -t <path>     Table file path")
        print("|  -a <path>     Assembler file path")       
        print("|  --fill <hex>  Fill free space (default=FF)")
        print("+---------------------------------------------")
        sys.exit(1)

class Decoder:
    def __init__(self):
        pass

    def read_tbl(self, tbl_file):
        """
        Parameters:
            tbl_file (str): The path to the .tbl file.

        Returns:
            char_table (dict): A dictionary with the table map.
        """               
        char_table = {}
        
        with open(tbl_file, "r", encoding="UTF-8") as f:
            for line in f:
                if not line or line.startswith(";") or line.startswith("/"):
                    continue  
                if "=" in line:
                    hex_value, chars = line.split("=", 1)
                    try:
                        if len(hex_value.replace(" ", "")) % 2 != 0:
                            print(f"Warning: '{hex_value}' is invalid! Skipped.")
                            continue
                        byte_key = bytes.fromhex(hex_value)
                        char_table[byte_key] = chars.strip("\n")
                    except ValueError:
                        print(f"Warning: '{hex_value}' is invalid! Skipped.")
                        continue
        return char_table

    def read_rom(self, rom_file, start_address, size):
        """
        Parameters:
            rom_file (str): The path to the ROM file.
            start_address (int): The starting position in the file to read from.
            size (int): The number of bytes to read.

        Returns:
            bytes: The data read from the ROM file.
        """
        try:
            with open(rom_file, "rb") as f:
                f.seek(start_address)
                data = f.read(size)
            return data
        except ValueError:
            return

    def decompress_sextets(self, raw_bytes, tbl):

        lines = []
        lengths = [0]

        current_line = []

        bit_buffer = 0
        bit_count = 0

        bytes_used = 0

        i = 0
        while i < len(raw_bytes):

            byte = raw_bytes[i]
            bit_buffer = (bit_buffer << 8) | byte
            bit_count += 8

            bytes_used += 1

            while bit_count >= 6:
                sextet = (bit_buffer >> (bit_count - 6)) & 0x3F
                bit_count -= 6

                key = bytes([sextet])
                value = tbl.get(key, f"<{sextet:02X}>")

                current_line.append(value)

                if sextet == 0x3F:

                    # Guardar línea
                    lines.append("".join(current_line))

                    # Guardar acumulado actual
                    lengths.append(bytes_used)

                    # Reset para siguiente texto
                    current_line = []
                    bit_buffer = 0
                    bit_count = 0
                    break

            i += 1

        if len(lengths) > 1:
            lengths.pop()

        return lines, lengths

    def write_output(self, outfile, lines, byte_starts, base, no_comments=False):
        with open(outfile, 'w', encoding='utf-8') as f:
            for i, line in enumerate(lines):
                f.write(f"@{i+1}\n")
                if not no_comments:
                    f.write(f";{byte_starts[i] + base:08X}{{{line}}}\n")
                f.write(f"{line}\n")
                f.write("|\n")

class Encoder:
    def __init__(self):
        pass

    def read_script(self, file):
        """
        Parameters:
            file (str): The path to the file to read.

        Returns:
            list: A list of strings, each representing a line of text from the file.
        """
        with open(file, "r", encoding='UTF-8') as f:
            script = []
            for line in f:
                line = line.rstrip('\n')
                if line.startswith(";") or line.startswith("@") or line.startswith("|"):
                    continue
                script.append(line)
        return script

    def visible_length(self, token):
        if token.startswith("<") and token.endswith(">"):
            return 1
        return len(token)

    def wrap_text_list(self, text_list, max_len=16):

        result = []
        token_re = re.compile(r"<[^>]+>")

        for text in text_list:

            output_parts = []
            visible_count = 0

            parts = re.split(r"(<LINE>|<END>)", text)

            for part in parts:

                if part in ("<LINE>", "<END>"):
                    output_parts.append(part)
                    visible_count = 0
                    continue


                words = part.split(" ")

                for i, word in enumerate(words):

                    if word == "":
                        continue

                    vis_len = 0
                    pos = 0
                    while pos < len(word):
                        match = token_re.match(word, pos)
                        if match:
                            vis_len += 1
                            pos = match.end()
                        else:
                            vis_len += 1
                            pos += 1

                    if visible_count > 0 and visible_count + 1 + vis_len > max_len:
                        output_parts.append("<LINE>")
                        visible_count = 0

                    if visible_count > 0:
                        output_parts.append(" ")
                        visible_count += 1

                    output_parts.append(word)
                    visible_count += vis_len

            result.append("".join(output_parts))

        return result

    def read_inverted_tbl(self, tbl_file):
        """
        Parameters:
            tbl_file (str): The path to the .tbl file.
        
        Returns:
            tuple: Contains:
                - char_table (dict): A dictionary where keys are byte characters or sequences.
                - chars_lengths (set): Set array with chain char lengths.
        """
        char_table = {}
        chars_lengths = set()

        with open(tbl_file, "r", encoding="UTF-8") as f:
            for line in f:
                if not line or line.startswith(";") or line.startswith("/"):
                    continue
                if "=" in line:
                    hex_value, chars = line.split("=", 1)
                    chars = chars.strip('\n')
                    try:
                        if len(hex_value) % 2 != 0:
                            print(f"Warning: '{hex_value}' is invalid! Skipped.")
                            continue
                        byte_key = bytes.fromhex(hex_value)
                        char_table[chars] = byte_key
                        chars_lengths.add(len(chars))
                    except ValueError:
                        print(f"Warning: '{hex_value}' is invalid! Skipped.")
                        continue        
        chars_lengths = sorted([l for l in chars_lengths if l > 0], reverse=True)
        
        return char_table, chars_lengths

    def compress_sextets(self, script, char_table, max_char_lengths):

        bit_buffer = 0
        bit_count = 0

        output_bytes = bytearray()

        lengths = [0]        # offsets acumulados
        accumulated = 0      # acumulador real

        token_pattern = re.compile(r'<[^>]+>')

        for line in script:

            pos = 0
            encoded_values = []

            # -------------------------
            # PARSEO DE LA LINEA
            # -------------------------
            while pos < len(line):

                match = token_pattern.match(line, pos)

                if match:
                    token = match.group(0) 

                    if token in char_table:
                        value = char_table[token][0]
                        encoded_values.append(value)
                        pos = match.end()
                        continue

                    hex_value = token[1:-1]

                    try:
                        value = int(hex_value, 16)
                    except ValueError:
                        raise ValueError(f"Invalid token {token}")

                    if value > 0x3F:
                        raise ValueError(f"Sextet value too large: {token}")

                    encoded_values.append(value)
                    pos = match.end()
                    continue

                matched = False
                for size in max_char_lengths:
                    chunk = line[pos:pos+size]
                    if chunk in char_table:
                        encoded_values.append(char_table[chunk][0])
                        pos += size
                        matched = True
                        break

                if not matched:
                    raise ValueError(f"Character not in TBL: '{line[pos]}'")

            line_start_size = len(output_bytes)

            for value in encoded_values:
                bit_buffer = (bit_buffer << 6) | value
                bit_count += 6

                while bit_count >= 8:
                    byte = (bit_buffer >> (bit_count - 8)) & 0xFF
                    output_bytes.append(byte)
                    bit_count -= 8

            if bit_count > 0:
                byte = (bit_buffer << (8 - bit_count)) & 0xFF
                output_bytes.append(byte)
                bit_buffer = 0
                bit_count = 0

            line_size = len(output_bytes) - line_start_size
            accumulated += line_size
            lengths.append(accumulated)

        if len(lengths) > 1:
            lengths.pop()

        total_size = len(output_bytes)

        return bytes(output_bytes), total_size, lengths

    def write_rom(self, rom_file, start_offset, original_size, data, fill_free_space, fill_free_space_byte):
        free_space = int(original_size) - len(data)
        if fill_free_space:
            filled_data = data + fill_free_space_byte * free_space
        else:
            filled_data = data    
        with open(rom_file, "r+b") as f: 
            f.seek(start_offset)
            f.write(filled_data)
        return free_space

def main():
    parser = CustomArgumentParser(add_help=False)
    subparsers = parser.add_subparsers(dest='command', required=True)

    # --- Subcomando: extract ---
    extract_parser = subparsers.add_parser('extract')
    extract_parser.add_argument('-r', '--rom', required=True)
    extract_parser.add_argument('-f', '--file', required=True)
    extract_parser.add_argument('-t', '--tbl', required=True)

    # Options
    extract_parser.add_argument('--no-comments', action='store_true')

    # --- Subcomando: insert ---
    insert_parser = subparsers.add_parser('insert')
    insert_parser.add_argument('-r', '--rom', required=True)
    insert_parser.add_argument('-f', '--file', required=True)
    insert_parser.add_argument('-t', '--tbl', required=True)
    insert_parser.add_argument('-a', '--asm', required=True)

    # Options
    insert_parser.add_argument('--fill', nargs='?', default=None, const='FF', type=lambda x: int(x, 16) if x else None)

    help_parser = subparsers.add_parser('help')
    
    args = parser.parse_args()

    #ROM DATA
    HEADER = 0x10
    
    TEXT1_START_OFFSET = 0x218A + HEADER
    TEXT1_END_OFFSET = 0x36E3 + HEADER
    TEXT1_SIZE = TEXT1_END_OFFSET - TEXT1_START_OFFSET + 1
    BASE1 = 0x8000 + HEADER
    FIRST_POINTER1 = 0xA18A

    TEXT2_START_OFFSET = 0x1B4AC + HEADER
    TEXT2_END_OFFSET = 0x1BDB6 + HEADER
    TEXT2_SIZE = TEXT2_END_OFFSET - TEXT2_START_OFFSET + 1
    TEXT2_EXTRA_SPACE = 0xB51
    BASE2 = 0x10000 + HEADER
    FIRST_POINTER2 = 0xB4AC
    
    # Extract
    if args.command == 'extract':
        # constructor
        decoder = Decoder()
        # read tbl
        char_table = decoder.read_tbl(args.tbl)
        # read rom
        script1 = decoder.read_rom(args.rom, TEXT1_START_OFFSET, TEXT1_SIZE)
        script2 = decoder.read_rom(args.rom, TEXT2_START_OFFSET, TEXT2_SIZE)
        # decompress
        decompress_text1, lines_lenght1 = decoder.decompress_sextets(script1, char_table)
        decompress_text2, lines_lenght2 = decoder.decompress_sextets(script2, char_table)
        # write dump text
        name, ext = os.path.splitext(args.file)
        decoder.write_output(name + "_1" + ext, decompress_text1, lines_lenght1, TEXT1_START_OFFSET - HEADER, args.no_comments)
        decoder.write_output(name + "_2" + ext, decompress_text2, lines_lenght2, TEXT2_START_OFFSET - HEADER, args.no_comments)
        print(f"Extracted File1 {TEXT1_SIZE}/0x{TEXT1_SIZE:X} bytes from 0x{TEXT1_START_OFFSET:X}.")
        print(f"Extracted File2 {TEXT2_SIZE}/0x{TEXT2_SIZE:X} bytes from 0x{TEXT2_START_OFFSET:X}.\n")

    elif args.command == 'insert':
        # Constructor
        encoder = Encoder()
        assembler = Assembler()
        pointers = Pointers()
        # Fill option
        if args.fill is None:
            fill_free_space = False
            fill_free_space_byte = None
        else:
            fill_free_space = True
            fill_free_space_byte = bytes([args.fill])
        # Read script
        name, ext = os.path.splitext(args.file)
        file1 = name + "_1" + ext
        file2 = name + "_2" + ext        
        script1 = encoder.read_script(file1)
        script2 = encoder.read_script(file2)
        # Wrap text
        script1_wrapped = encoder.wrap_text_list(script1, 16)
        script2_wrapped = encoder.wrap_text_list(script2, 16)
        # Read tbl
        char_table, max_char_lenght = encoder.read_inverted_tbl(args.tbl)
        # Encode text
        compressed_text1, new_script1_size, line_length_list1 = encoder.compress_sextets(script1_wrapped, char_table, max_char_lenght)
        compressed_text2, new_script2_size, line_length_list2 = encoder.compress_sextets(script2_wrapped, char_table, max_char_lenght)
        # ASM Mode
        pointers_list1, _  = pointers.calculate_pointers_2_bytes(line_length_list1, FIRST_POINTER1, 0, 0)
        pointers_list2, _  = pointers.calculate_pointers_2_bytes(line_length_list2, FIRST_POINTER2, 0, 0)
        # Write ROM
        if new_script1_size > TEXT1_SIZE:
            print(f"\nERROR: Script size has exceeded its maximum size.")
            print(f"Actual Size: {new_script1_size:X}, Original Size: {TEXT1_SIZE:X}, Remove {new_script1_size - TEXT1_SIZE} bytes.\n")
            sys.exit(1)
        if new_script2_size > TEXT2_EXTRA_SPACE:
            print(f"\nERROR: Script size has exceeded its maximum size.")
            print(f"Actual Size: {new_script2_size:X}, Original Size: {TEXT2_SIZE:X}, Remove {new_script2_size - TEXT2_EXTRA_SPACE} bytes.\n")
            sys.exit(1)   
        free_space_script1 = encoder.write_rom(args.rom, TEXT1_START_OFFSET, TEXT1_SIZE, compressed_text1, fill_free_space, fill_free_space_byte)
        free_space_script2 = encoder.write_rom(args.rom, TEXT2_START_OFFSET, TEXT2_EXTRA_SPACE, compressed_text2, fill_free_space, fill_free_space_byte)
        # Write assembler file
        name, ext = os.path.splitext(args.asm)
        asm1 = name + "_1" + ext
        asm2 = name + "_2" + ext     
        assembler.create_asm_file(asm1, pointers_list1, 0)
        assembler.create_asm_file(asm2, pointers_list2, 0)
        print(f"{file1} written to {args.rom} at offset 0x{TEXT1_START_OFFSET:X}")
        print(f"Free Space: {free_space_script1} bytes.")
        print(f"{file2} written to {args.rom} at offset 0x{TEXT2_START_OFFSET:X}")
        print(f"Free Space: {free_space_script2} bytes.\n")

    elif args.command == 'help':
        parser.print_help()
        sys.exit(0)

    else:
        show_help()
         
if __name__ == '__main__':
    main()
