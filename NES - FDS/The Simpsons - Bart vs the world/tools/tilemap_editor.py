## Imagineering NES - Tilemap editor
## RLE
## 01-7F RLE N times
## 80-BF LITERAL copy, low nybles times
## C0-FF Incremental Copy, low nybbles times

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
        print("| Imagineering NES - Tilemap editor by koda v0.1")
        print("+----------------------------------------------")
        print("| Usage:")
        print("|   extract      Extract from ROM")
        print("|   insert       Insert to ROM")
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

def decompress_tilemap(data):
    src = 0
    out = bytearray()

    while src < len(data):

        cmd = data[src]
        src += 1

        if cmd == 0x00:
            break
        
        if cmd < 0x80:
            if src >= len(data):
                raise ValueError("Unexpected end of input (RLE).")

            value = data[src]
            src += 1

            out.extend([value] * cmd)

        elif cmd >= 0xC0:

            count = cmd & 0x3F

            if src >= len(data):
                raise ValueError("Unexpected end of input (INC).")

            value = data[src]
            src += 1

            for _ in range(count):
                out.append(value & 0xFF)
                value = (value + 1) & 0xFF

        else:

            count = cmd & 0x3F

            if src + count > len(data):
                raise ValueError("Unexpected end of input (Literal).")

            out.extend(data[src:src + count])
            src += count

    return bytes(out)

def compress_tilemap(data):
    n = len(data)
    dp = [0] * (n + 1)
    choice = [None] * (n + 1)

    dp[n] = 1

    for i in range(n - 1, -1, -1):

        best_cost = 1 << 30
        best = None

        rle = 1
        while (
            i + rle < n
            and data[i + rle] == data[i]
            and rle < 0x7F
        ):
            rle += 1

        for length in range(1, rle + 1):

            cost = 2 + dp[i + length]

            if cost < best_cost:
                best_cost = cost
                best = ("rle", length)

        inc = 1
        while (
            i + inc < n
            and data[i + inc] == ((data[i] + inc) & 0xFF)
            and inc < 0x3F
        ):
            inc += 1

        for length in range(1, inc + 1):

            cost = 2 + dp[i + length]

            if cost < best_cost:
                best_cost = cost
                best = ("inc", length)

        max_literal = min(0x3F, n - i)

        for length in range(1, max_literal + 1):

            cost = 1 + length + dp[i + length]

            if cost < best_cost:
                best_cost = cost
                best = ("lit", length)

        dp[i] = best_cost
        choice[i] = best

    out = bytearray()

    i = 0

    while i < n:

        mode, length = choice[i]

        if mode == "rle":

            out.append(length)
            out.append(data[i])

        elif mode == "inc":

            out.append(0xC0 | length)
            out.append(data[i])

        else:

            out.append(0x80 | length)
            out.extend(data[i:i + length])

        i += length

    out.append(0)

    return bytes(out)

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
        tilemap = decompress_tilemap(data)
        tilemap_length = len(tilemap)
        # DEBUG
        #hexdump(decompress_nametable, "Tilemap")
        # Export
        tileset_data_length = export_data(args.out_file, tilemap)
        print(f"Extracted {tilemap_length} bytes from {args.rom}\n")

    elif args.command == 'compress':
        if not os.path.exists(args.in_file):
            print(f"Error: Input file '{args.in_file}' not found.\n")
            sys.exit(1)
        # Read Bin
        data_tilemap = import_data(args.in_file)
        decompressed_data_length = len(data_tilemap)
        # Compress
        compressed_tilemap = compress_tilemap(data_tilemap)
        compressed_tilemap_length = len(compressed_tilemap)
        #DEBBUG
        #hexdump(compress_nametable, "Compress Data")
        # Write ROM
        compressed_data_length = export_data(args.compress_file, compressed_tilemap)
        ratio = compressed_tilemap_length / decompressed_data_length
        print(f"Decompress: {decompressed_data_length} bytes, Compress: {compressed_tilemap_length} bytes, Ratio: {ratio:.8f}.")
        
    else:
        show_help()
        
if __name__ == "__main__":
    main()
    
