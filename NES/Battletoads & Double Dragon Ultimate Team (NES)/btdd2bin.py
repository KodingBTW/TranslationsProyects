import sys
import os

def decompress_rle(data, byte_flag_00, byte_flag_ff):
    decompressed_data = bytearray()
    i = 0
    while i < len(data):
        byte = data[i]
        i += 1
        if byte == byte_flag_00:  
            if i < len(data):
                repeat_count = data[i] 
                decompressed_data.extend([0x00] * repeat_count)
                i += 1
        elif byte == byte_flag_ff:  
            if i < len(data):
                repeat_count = data[i] 
                decompressed_data.extend([0xFF] * repeat_count)
                i += 1
        else:
            decompressed_data.append(byte)

    return decompressed_data

def compress_rle(data, byte_flag_00, byte_flag_ff):
    compressed_data = bytearray()
    i = 0
    while i < len(data):
        byte = data[i]
        if byte == 0x00:
            count = 1  
            while i + 1 < len(data) and data[i + 1] == 0x00:
                count += 1
                i += 1  
            if count > 2:
                compressed_data.append(byte_flag_00)  
                compressed_data.append(count) 
            else:
                compressed_data.append(byte)
        
        elif byte == 0xFF:
            count = 1  
            while i + 1 < len(data) and data[i + 1] == 0xFF:
                count += 1
                i += 1  
            if count > 2:
                compressed_data.append(byte_flag_ff) 
                compressed_data.append(count) 
            else:
                compressed_data.append(byte)
        
        else:
            compressed_data.append(byte)  
        
        i += 1

    return compressed_data

def decompress_fonts(data):
    decompressed_data = bytearray()
       
    for i in range(0, len(data), 8):
        block = data[i:i+8]
        decompressed_data.extend(block)
    
    return decompressed_data

def compress_fonts(data):   
    compressed_data = bytearray()
    
    for i in range(0, len(data), 16):
        block = data[i:i+16]
        compressed_data.extend(block)
    
    return compressed_data
    
def read_rom(rom_file, addr, size):
    with open(rom_file, 'rb') as f:
        f.seek(addr)
        data = f.read(size)
        return data

def export_data(out_file, data):
    with open(out_file, 'wb') as f:
        f.write(data)
        print(f"Decompressed {len(data)} bytes at file {out_file}.")

def import_data(file):
    with open(file, "rb") as f:
        data = f.read()
    return data

def write_rom(rom_file, data, addr, bank_size, file_name):
    if len(data) > bank_size:
        excess = len(data) - bank_size
        print(f"Error: file {file_name}, {excess} bytes exceed bank size.")
    else:
        free_space = bank_size - len(data)
        
        filled_data = data + b'\xFF' * free_space

        with open(rom_file, "r+b") as f:
            f.seek(addr)
            f.write(filled_data)
            print(f"File {file_name} inserted at {rom_file}.")
            print(f"Free space: {free_space} bytes filled with 0xFF.")

def main():
    if len(sys.argv) < 2:
        print("Usage: -d -decompress graphics")
        print("       -c -compress graphics")
        sys.exit(1)

    option = sys.argv[1]
    # Define the ROM PATCH
    rom_file = "Battletoads & Double Dragon - The Ultimate Team.nes"
    # Player select
    player_select_output = "DecompressSelectCharacter.bin"
    player_select_bank = 0x026916
    player_select_bank_size = 0x5DD
    # Lvl hud (uncompressed)
    lvl_hud_output = "DecompressLvlHUD.bin"
    lvl_hud_bank = 0x18340
    lvl_hud_bank_size = 0x50
    # Fonts graphics
    fonts_output = "DecompressFonts.bin"
    fonts_bank = 0x83ce
    fonts_bank_size = 0x178
    # Fonts 16x16 graphics
    fonts_16_output= "DecompressFonts16.bin"
    fonts_16_bank = 0x39a9b
    fonts_16_bank_size = 0x65a
    # Test (ignore)
    test_output= "DecompressGraphics.bin"
    test_bank = 0xa2f8
    test_bank_size = 0xBFF
    
    
    if option == "-d":

        player_select_compress = read_rom(rom_file, player_select_bank, player_select_bank_size)
        lvl_hud_compress = read_rom(rom_file, lvl_hud_bank, lvl_hud_bank_size)
        fonts_compress = read_rom(rom_file, fonts_bank, fonts_bank_size)
        fonts_16_compress = read_rom(rom_file, fonts_16_bank, fonts_16_bank_size)
        #test_compress = read_rom(rom_file, test_bank, test_bank_size)

        player_select_decompress = decompress_rle(player_select_compress, 0x02, 0x04)
        fonts_decompress = decompress_fonts(fonts_compress)
        fonts_16_decompress = decompress_rle(fonts_16_compress, 0x05, 0x09)
        #test_decompress = decompress_rle(test_compress, 0x0A, 0x12)
        
        export_data(player_select_output, player_select_decompress)
        export_data(lvl_hud_output, lvl_hud_compress)
        export_data(fonts_output, fonts_decompress)
        export_data(fonts_16_output, fonts_16_decompress)
        #export_data(test_output, test_decompress)
        
    elif option == "-c":

        player_select_decompress = import_data(player_select_output)
        lvl_hud_decompress = import_data(lvl_hud_output)
        fonts_decompress = import_data(fonts_output)
        font_16_decompress = import_data(fonts_16_output)

        player_select_compress = compress_rle(player_select_decompress, 0x02, 0x04)
        fonts_compress = compress_fonts(fonts_decompress)
        fonts_16_compress = compress_rle(font_16_decompress, 0x05, 0x09)
        
        write_rom(rom_file, player_select_compress, player_select_bank, player_select_bank_size, player_select_output)
        write_rom(rom_file, lvl_hud_decompress, lvl_hud_bank, lvl_hud_bank_size, lvl_hud_output)
        write_rom(rom_file, fonts_compress, fonts_bank, fonts_bank_size, fonts_output)
        write_rom(rom_file, fonts_16_compress, fonts_16_bank, fonts_16_bank_size, fonts_16_output)
         
    else:
        print("Usage: -d -decompress graphics")
        print("       -c -compress graphics")
        sys.exit(1)

if __name__ == "__main__":
    main()
