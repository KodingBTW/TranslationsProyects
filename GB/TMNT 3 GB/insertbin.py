import argparse
import os
import sys


# Función para convertir cadenas hexadecimales en enteros
def hex_to_int(value):
    try:
        return int(value, 16)  # Convierte de hexadecimal (base 16) a entero
    except ValueError:
        raise argparse.ArgumentTypeError(f"Invalid hexadecimal value: {value}")


class Sample:
    def __init__(self, patch_name, dst_name, offset=None, tgt_size=None, fill_val=None):
        self.patch_name = patch_name
        self.dst_name = dst_name
        self.offset = offset if offset is not None else 0
        self.tgt_size = tgt_size
        self.fill_val = fill_val if fill_val is not None else 0


def patch(patch_data, dst_data, offset, patch_name, dst_name):
    start = dst_data[:offset]
    end = dst_data[offset + len(patch_data):]
    with open(dst_name, "wb") as f:
        f.write(start + patch_data + end)
    print(f"{patch_name} successfully written at 0x{offset:X}")


def main():
    parser = argparse.ArgumentParser(description="Simple binary patching utility v0.1")
    parser.add_argument("patch_file", metavar="FILE", help="Patch file name")
    parser.add_argument("dst_file", metavar="FILE", help="Destination file name")
    
    # Usamos la función hex_to_int para convertir argumentos hexadecimales
    parser.add_argument("-o", "--offset", type=hex_to_int, default=0, help="Offset to write patch to (default 0)")
    parser.add_argument("-s", "--size", type=hex_to_int, help="Abort if patch size is larger than this size")
    parser.add_argument("-f", "--fill", type=hex_to_int, default=0, help="Align up to target size with this byte (default 0)")

    args = parser.parse_args()

    patch_file_name = args.patch_file
    dst_file_name = args.dst_file
    offset = args.offset
    tgt_size = args.size
    fill = args.fill

    # Read files
    with open(patch_file_name, "rb") as f:
        patch_data = f.read()
    with open(dst_file_name, "rb") as f:
        dst_data = f.read()

    patch_len = len(patch_data)

    if tgt_size is None:
        # If no target size is provided, just apply the patch
        patch(patch_data, dst_data, offset, patch_file_name, dst_file_name)
    else:
        if patch_len > tgt_size:
            print(f"{patch_file_name} size 0x{patch_len:X} > specified 0x{tgt_size:X}. ABORTED!", file=sys.stderr)
            sys.exit(1)
        else:
            # Fill with the specified byte to align the patch to the target size
            dummy_len = tgt_size - patch_len
            dummy = bytes([fill] * dummy_len)
            patch(patch_data + dummy, dst_data, offset, patch_file_name, dst_file_name)
            print(f"0x{dummy_len:X} bytes are free")


if __name__ == "__main__":
    main()

