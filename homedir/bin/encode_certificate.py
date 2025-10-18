#!/usr/bin/python3

import sys
import os

def encode_certificate_file(file_path):
    """
    Reads a certificate file and converts its newlines to literal '\n' sequences
    so it can be safely stored as a single-line string.
    """
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    encoded = content.replace("\n", "\\n")
    return encoded

if len(sys.argv) < 2:
        print("Usage: python encode_cert.py <certificate_file>")
        sys.exit(1)

input_file = sys.argv[1]

if not os.path.isfile(input_file):
    print(f"Error: File '{input_file}' not found.")
    sys.exit(1)

print(encode_certificate_file(input_file))
