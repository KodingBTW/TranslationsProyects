## BBD & BBD:FS
## NYBBLES 2 BYTES
import argparse
import sys
import os

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
        print("| BBD & BDD:FR - NYBBLES by koda v0.1")
        print("+----------------------------------------------")
        print("| Usage:")
        print("|   decompress   Decompress from ROM")
        print("|   compress     Compress in bin file")
        print("|   help         Show this message.")
        print("+----------------------------------------------")
        print("| decompress:")
        print("|  -r <path>     Path to the ROM file")
        print("|  -f <path>     Output file")
        print("|  -o <hex>      Start offset")
        print("|  -s <hex>      Block size")
        print("|")
        print("| compress:")
        print("|  -f <path>     File to compress")
        print("|  -c <path>     Compressed file")
        print("+---------------------------------------------")
        sys.exit(1)

##descomprimir
def decode_byte(b):
    return (
        (((b >> 4) & 0x03) << 4) | ((b >> 6) & 0x03),
        (((b >> 0) & 0x03) << 4) | ((b >> 2) & 0x03),
    )


def decompress_tile(block):
    out = bytearray()

    for b in block:
        a, c = decode_byte(b)
        out.extend((a, c))

    filtered = bytearray()

    for i in range(0, 32, 8):
        filtered.extend(out[i:i+4])

    return filtered


def decompress_tileset(data):
    out = bytearray()

    for i in range(0, len(data), 16):
        block = data[i:i + 16]

        if len(block) < 16:
            break

        out.extend(decompress_tile(block))

    return out


## comprimir
def encode_byte(a, c):
    b = 0

    # reconstrucción de los 2 bits altos de 'a'
    b |= ((a >> 4) & 0x03) << 4
    b |= ((a >> 0) & 0x03) << 6

    # reconstrucción de los bits de 'c'
    b |= ((c >> 4) & 0x03) << 0
    b |= ((c >> 0) & 0x03) << 2

    return b

def compress_tile(block):
    """
    16 bytes → 16 bytes compressed
    """

    out = bytearray()

    # 1. reconstruir bytes originales con decode inverso
    expanded = []

    for i in range(0, 16, 2):
        a = block[i]
        c = block[i + 1]

        b = encode_byte(a, c)
        expanded.append(b)

    # 2. ahora empaquetar por grupos de 4 (NO 8)
    for i in range(0, 4):
        chunk = expanded[i*2:(i*2)+2]

        # cada chunk produce 4 bytes finales
        # (aquí está tu estructura real)
        out.append(chunk[0])
        out.append(chunk[1])
        out.append(0)
        out.append(0)

    return out

def compress_tileset(data):
    out = bytearray()

    for i in range(0, len(data), 16):
        block = data[i:i+16]

        if len(block) < 16:
            break

        out.extend(compress_tile(block))

    return out



def hexdump(data, label, width=16):
    print(f"\n[{label}] ({len(data)} bytes)")
    for i in range(0, len(data), width):
        chunk = data[i:i + width]
        hex_part = " ".join(f"{b:02X}" for b in chunk)
        print(f"{i:04X}: {hex_part}")
     
def read_rom(rom_file, addr, size):
    with open(rom_file, 'rb') as f:
        f.seek(addr)
        data = f.read(size)
        return data

def export_data(out_file, data):
    with open(out_file, 'wb') as f:
        f.write(data)
        return len(data)

def import_data(file):
    with open(file, "rb") as f:
        data = f.read()
    return data

def main():
    parser = CustomArgumentParser(add_help=False)
    subparsers = parser.add_subparsers(dest='command', required=True)

    # Extract command
    extract_parser = subparsers.add_parser('decompress')
    extract_parser.add_argument('-r', '--rom', required=True)
    extract_parser.add_argument('-f', '--out-file', required=True)
    extract_parser.add_argument('-o', '--start-offset', required=True, type=lambda x: int(x, 16))
    extract_parser.add_argument('-s', '--size', required=True, type=lambda x: int(x, 16))

    # Insert command
    insert_parser = subparsers.add_parser('compress')
    insert_parser.add_argument('-f', '--in-file', required=True)
    insert_parser.add_argument('-c', '--compress-file', required=True)

    help_parser = subparsers.add_parser('help')
    
    args = parser.parse_args()
    
    if args.command == 'decompress':
        if not os.path.exists(args.rom):
            print(f"Error: ROM file '{args.rom}' not found.\n")
            sys.exit(1)
        # Read Data
        data = read_rom(args.rom, args.start_offset, args.size)
        # Decompress
        decompressed_tileset = decompress_tileset(data)
        tileset_length = len(decompressed_tileset)
        # DEBUG
        #hexdump(decompress_tileset, "Tileset")
        # Export
        tileset_data_length = export_data(args.out_file, decompressed_tileset)
        print(f"Extracted {tileset_length} bytes from {args.rom}\n")

    elif args.command == 'compress':
        if not os.path.exists(args.in_file):
            print(f"Error: Input file '{args.in_file}' not found.\n")
            sys.exit(1)
        # Read Bin
        data_tileset = import_data(args.in_file)
        decompressed_data_length = len(data_tileset)
        # Compress
        compressed_tileset = compress_tileset(data_tileset)
        compressed_tileset_length = len(compressed_tileset)
        #DEBBUG
        #hexdump(compress_nametable, "Compress Data")
        # Write ROM
        compressed_data_length = export_data(args.compress_file, compressed_tileset)
        ratio = compressed_tileset_length / decompressed_data_length
        print(f"Decompress: {decompressed_data_length} bytes, Compress: {compressed_tileset_length} bytes, Ratio: {ratio:.8f}.")
        
    else:
        show_help()
        
if __name__ == "__main__":
    main()
    
