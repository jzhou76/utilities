#!/usr/bin/env python3

import sys

FILE_PATH = sys.argv[1]

def trim_whitespaces():
    for file_path in sys.argv[1:]:
        print(file_path)
        src = open(file_path)
        result = []
        for line in src.readlines():
            result += (line.rstrip() + "\n")
        src.close()

        output = open(file_path, "w")
        for line in result:
            output.write(line)

trim_whitespaces()

