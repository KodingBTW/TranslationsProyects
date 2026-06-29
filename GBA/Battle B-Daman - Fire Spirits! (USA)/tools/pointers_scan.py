import argparse
import re
import struct
import os
import sys

class CustomArgumentParser(argparse.ArgumentParser):
    def error(self, message):
        print(f"\nError: {message}\n")
        self.show_help()
        sys.exit(1)

    def print_help(self):
        self.show_help()

    @staticmethod
    def show_help():
        print("+-----------------------------------------------------------")
        print("| Pointers Scan by koda v0.2")
        print("+-----------------------------------------------------------")
        print("|")
        print("|  -r <path>         Path to the ROM file")
        print("|  -f <path>         Input ASM file")
        print("|  -o <hex>          Start offset")
        print("|  -s <hex>          Block size")
        print("|  -p <1b,2b,2bb,3b,3bb,4b,4bb>    Pointer format")
        print("|  --base <hex>                    CPU position")
        print("|  --type <0|1|2>                  Assembler label")
        print("|        0   -   ca65,asm6")    
        print("|        1   -   asar")
        print("|        2   -   armips")
        print("|  --out             Output file")
        print("|  --force           Force look every byte")
        print("+-----------------------------------------------------------")
        sys.exit(1)

def read_rom(rom_file, start_address, size):
        try:
            with open(rom_file, "rb") as f:
                f.seek(start_address)
                data = f.read(size)
            return data
        except ValueError:
            return
        
def load_asm_file(data, asm_type):
    """
        0 = NES ASM6        label = $123456
        1 = SNES ASAR      !label = $123456
        2 = armips        .definelabel label, 0x123456
    """

    labels = []

    if asm_type == 0:
        pattern = re.compile(r'^\s*(\w+)\s*=\s*\$([0-9A-Fa-f]+)')
        ptr_tag = ''
    elif asm_type == 1:
        pattern = re.compile(r'^\s*!(\w+)\s*=\s*\$([0-9A-Fa-f]+)')
        ptr_tag = ''
    elif asm_type == 2:
        pattern = re.compile(r'^\s*\.definelabel\s+(\w+)\s*,\s*0x([0-9A-Fa-f]+)')
        ptr_tag = '.'
    else:
        raise ValueError("Unknown ASM type.\n")
        sys.exit(1)

    for line in data:
        m = pattern.search(line)
        if m:
            label = m.group(1)
            offset = int(m.group(2), 16)
            labels.append([label, offset])
    return labels, ptr_tag

def pointer_format(ptr, ptr_tag):
    if ptr == '1b':
        return(1, 'little', f'{ptr_tag}db')     
    elif ptr == '2b':
        return(2, 'little', f'{ptr_tag}dw') 
    elif ptr == '2bb':
        return(2, 'big', f'{ptr_tag}dw')
    elif ptr == '3b':
        return(3, 'little', f'{ptr_tag}dl')
    elif ptr == '3bb':
        return(3, 'big', f'{ptr_tag}dl')
    elif ptr == '4b':
        return(4, 'little', f'{ptr_tag}word')
    elif ptr == '4bb':
        return(4, 'big', f'{ptr_tag}word')
    raise ValueError("Unknown pointer format.\n")

def scan_pointers(rom, asm_ptr_list, ptr_size, ptr_endian,
                  ptr_directive, base_offset, start_offset,
                  output_path, asm_type, slide=False):

    asm_map = {offset: label for label, offset in asm_ptr_list}

    if asm_type == 2:
        offset_symbol = "0x"
    else:
        offset_symbol = "$"

    found = 0
    miss = 0
    need_org = True

    i = 0

    with open(output_path, "w", encoding="utf-8") as out:
        while i <= len(rom) - ptr_size:

            chunk = rom[i:i + ptr_size]
            val = int.from_bytes(chunk, ptr_endian)

            rom_pos = start_offset + i
            cpu_pos = base_offset + rom_pos

            if val in asm_map:

                if need_org:
                    out.write(f"org {offset_symbol}{cpu_pos:08X}\n")
                    need_org = False

                out.write(f"{ptr_directive} {asm_map[val]}\n")

                found += 1

                if slide:
                    i += ptr_size
                else:
                    i += ptr_size

            else:
                hexbytes = " ".join(f"{b:02X}" for b in chunk)
                out.write(
                    f";Position: 0x{rom_pos:08X}, Pointer: {hexbytes} not found.\n"
                )

                miss += 1
                need_org = True

                if slide:
                    i += 1 
                else:
                    i += ptr_size

    return found, miss

def main():
    ps = CustomArgumentParser(add_help=False)

    ps.add_argument('-r', '--rom', required=True)
    ps.add_argument('-f', '--file', required=True)
    ps.add_argument('-o', '--offset', required=True, type=lambda x: int(x, 16))
    ps.add_argument('-s', '--size', required=True, type=lambda x: int(x, 16))
    ps.add_argument('-p', '--pointer-format', required=True, choices=['1b', '2b', '2bb', '3b', '3bb', '4b', '4bb'])
    ps.add_argument('--type', type=int, required=True, choices=[0, 1, 2], default=0)
    ps.add_argument('--base', type=lambda x: int(x, 16), default=0)
    ps.add_argument("--out", default="search.asm")
    ps.add_argument('--force', action='store_true')
    
    args = ps.parse_args()

    # Load Rom
    if args.size == 0:
        rom = read_rom(args.rom, args.offset, None)
    else:
        rom = read_rom(args.rom, args.offset, args.size)

    # Load ASM
    with open(args.file, "r", encoding="utf-8") as f:
        asm_lines = f.readlines()

    asm_ptr_list, ptr_tag = load_asm_file(asm_lines, args.type)

    # Pointer format
    ptr_size, ptr_endian, ptr_directive = pointer_format(
        args.pointer_format, ptr_tag
    )

    # Build ASM lookup map
    asm_map = {}
    for label, offset in asm_ptr_list:
        asm_map[offset] = label

    if args.type == 2:
        offset_symbol = "0x"
    else:
        offset_symbol = "$"

    found = 0
    miss = 0
    need_org = True

    i = 0
    fail_buffer = bytearray()
    fail_start = None

    with open(args.out, "w", encoding="utf-8") as out:

        while i <= len(rom) - ptr_size:

            chunk = rom[i:i + ptr_size]
            val = int.from_bytes(chunk, ptr_endian)

            rom_pos = args.offset + i
            cpu_pos = args.base + rom_pos

            if val in asm_map:

                # 🔥 Si había fallos acumulados, imprimirlos primero
                if fail_buffer:
                    hexbytes = " ".join(f"{b:02X}" for b in fail_buffer)
                    out.write(
                        f";Position: 0x{fail_start:08X}, Bytes: {hexbytes} not have coincidence.\n"
                    )
                    fail_buffer.clear()
                    fail_start = None
                    need_org = True

                if need_org:
                    out.write(f"org {offset_symbol}{cpu_pos:08X}\n")
                    need_org = False

                out.write(f"{ptr_directive} {asm_map[val]}\n")

                found += 1
                i += ptr_size

            else:

                if args.force:
                    # 🔥 Acumular byte fallido
                    if fail_start is None:
                        fail_start = rom_pos

                    fail_buffer.append(rom[i])
                    i += 1
                else:
                    hexbytes = " ".join(f"{b:02X}" for b in chunk)
                    out.write(
                        f";Position: 0x{rom_pos:08X}, Pointer: {hexbytes} not found.\n"
                    )
                    miss += 1
                    need_org = True
                    i += ptr_size

        # 🔥 Si quedaron fallos pendientes al final
        if fail_buffer:
            hexbytes = " ".join(f"{b:02X}" for b in fail_buffer)
            out.write(
                f";Position: 0x{fail_start:08X}, Pointer: {hexbytes} not found.\n"
            )
            
    # Summary
    total = found + miss

    print("\n===== Pointer scan summary =====")
    print(f"Total entries : {total}")
    print(f"Found         : {found}")
    print(f"Not found     : {miss}")

    if total > 0:
        percent = (found / total) * 100
        print(f"Ratio         : {percent:.2f}%\n")
    

if __name__ == "__main__":
    main()
