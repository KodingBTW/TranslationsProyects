import argparse
import os
import sys


def expand_rom(filename: str, target_mib: float) -> None:
    """
    Expand a ROM by appending 0x00 bytes until it reaches the specified size.

    Parameters
    ----------
    filename : str
        Path to the ROM.
    target_mib : float
        Desired ROM size in MiB.
    """

    target_size = int(target_mib * 1024 * 1024)

    current_size = os.path.getsize(filename)

    if current_size >= target_size:
        print("ROM is already equal to or larger than the requested size.")
        print(f"Current size : {current_size:,} bytes")
        print(f"Requested    : {target_size:,} bytes")
        return

    bytes_to_add = target_size - current_size

    with open(filename, "ab") as rom:
        rom.write(b"\xFF" * bytes_to_add)

    print("Expansion completed.")
    print(f"Original size : {current_size:,} bytes")
    print(f"New size      : {target_size:,} bytes")
    print(f"Bytes added   : {bytes_to_add:,}")


def main():
    parser = argparse.ArgumentParser(
        description="Expand a ROM by appending 0x00 bytes."
    )

    parser.add_argument(
        "-r",
        "--rom",
        required=True,
        help="ROM filename"
    )

    parser.add_argument(
        "-e",
        "--expand",
        required=True,
        type=float,
        help="Target ROM size in MiB (e.g. 1.5)"
    )

    args = parser.parse_args()

    if not os.path.isfile(args.rom):
        print(f'Error: "{args.rom}" not found.')
        sys.exit(1)

    if args.expand <= 0:
        print("Error: target size must be greater than zero.")
        sys.exit(1)

    expand_rom(args.rom, args.expand)


if __name__ == "__main__":
    main()
