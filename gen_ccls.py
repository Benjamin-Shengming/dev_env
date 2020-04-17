#!/usr/bin/env python

import argparse
import os



def generate_ccls_file(args):
    ccls_str= '''gcc
%compile_commands.json
%c -std=c11
%cpp -std=c++2a
'''
    all_I = generate_ccls_I(args)
    all_I.insert(0, ccls_str)
    with open(os.path.join(args.folder, ".ccls"), "w") as f:
        f.writelines(all_I)

def generate_header_include(args):
    pass

def is_ignore_path(rel_p):
    if (rel_p.startswith(".")
            and not rel_p.startswith("..")
            and not rel_p.startswith("./")
            ):
        return True

    ignore_keywords = [".git", "/out", ".ccls-cache", "doxygen",
                        "gitlab", "valgrind", "/test-out" , "/test-obj"]
    for item in ignore_keywords:
        if item in rel_p:
            return True
    return False

def generate_I(folder_root, relative_folder=None):
    assert os.path.exists(folder_root)
    folder_root = os.path.abspath(folder_root)
    if (relative_folder is None):
        relative_folder = folder_root
    assert os.path.exists(relative_folder)
    relative_folder = os.path.abspath(relative_folder)

    print("checking ", folder_root,  relative_folder);

    ret = []
    for root, dirs, _ in os.walk(folder_root):
        for d in dirs:
            dir_path = os.path.abspath(os.path.join(root, d))
            rel_p = os.path.relpath(dir_path, relative_folder)
            if is_ignore_path(rel_p):
                continue
            if rel_p.startswith("../") or rel_p.startswith("./"):
                tmp = "-I{}\n"
            else:
                tmp = "-I./{}\n"
            ret.append(tmp.format(rel_p))
    return ret

def generate_ccls_I(args):
    ret = []
    ret.extend(generate_I(args.folder, args.folder))
    for d in args.dependency:
        ret.extend(generate_I(d, args.folder))
    return ret

def parse_args():
    parser = argparse.ArgumentParser(prog='Gen ccls')
    parser.add_argument('-f', '--folder',
                        required=True,
                        help='Directory to generate ccls file')
    parser.add_argument('-d','--dependency', nargs='*', help='dependency folder')
    return parser.parse_args()

def main():
    args = parse_args()
    generate_ccls_file(args)

if __name__ == "__main__":
    main()




