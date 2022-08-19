#!/usr/bin/env python

import sys


def load_file(filepath):
    with open(filepath, "r") as f:
        return f.read().rstrip()


def insert_files(filepath):
    with open(filepath, "r") as f:
        buf = []
        for line in f:
            line = line.rstrip()
            if len(line) > 3 and line[:3] == "<<<":
                buf.append(load_file(line[3:].strip()))
            else:
                buf.append(line)
    return "\n".join(buf)


if __name__ == "__main__":
    if len(sys.argv) < 2:
        sys.exit("usage: convert.py FILE")
    fp = sys.argv[1]

    print(insert_files(fp))
