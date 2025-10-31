#!/usr/bin/python3

import sys
import os

def decode_certificate_file(file_path):
    """
    Reads an encoded certificate file and decode it into a well-formated pem file.
    """
    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()
    decoded = content.strip().encode().decode('unicode_escape')
    return decoded

if len(sys.argv) < 2:
    print("Usage: python encode_cert.py <certificate_file>")
    sys.exit(1)

input_file = sys.argv[1]

if not os.path.isfile(input_file):
    print(f"Error: File '{input_file}' not found.")
    sys.exit(1)

print(decode_certificate_file(input_file))
