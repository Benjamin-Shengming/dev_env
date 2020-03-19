#!/usr/bin/env python

import argparse
import os



def generate_ccls_file(args):
    ccls_str= '''gcc
%compile_commands.json
%c -std=c11
%cpp -std=c++2a
'''
    all_I = generate_I(args)
    all_I.insert(0, ccls_str)
    with open(os.path.join(args.directory, ".ccls"), "w") as f:
        f.writelines(all_I)

def generate_header_include(args):
    pass

def generate_I(args):
    folder_root = args.directory
    assert os.path.exists(folder_root)
    tmp = "-I./{}\n"
    ret = []
    for root, dirs, _ in os.walk(folder_root):
        for d in dirs:
            dir_path = os.path.join(root, d)
            rel_p = os.path.relpath(dir_path, folder_root)
            ret.append(tmp.format(rel_p))
    return ret

def parse_args():
    parser = argparse.ArgumentParser(prog='Gen ccls')
    parser.add_argument('-d', '--directory',
                        required=True,
                        help='Directory to generate ccls file')
    return parser.parse_args()

def main():
    args = parse_args()
    generate_ccls_file(args)

if __name__ == "__main__":
    main()




