#!/usr/bin/env python
# -*- coding: utf-8 -*-
from folder_utils import FolderHelper
import os
import argparse


def parse_args():
    parser = argparse.ArgumentParser(description='clang file generator')
    parser.add_argument('-p', '--project',
                        required=True,
                        help='project folder path')

    parser.add_argument('-i', '--include',
                        nargs='*',
                        help='other path need to analyze')
    parser.add_argument('-e', '--exclude',
                        nargs='*',
                        help='keywords to exclude in folder path')

    args = parser.parse_args()
    print(args)
    args.project = os.path.abspath(args.project)
    print(args.project)
    if args.include:
        abs_i = []
        for x in args.include:
            abs_i.append(os.path.abspath(x))
        args.include = abs_i
    else:
        args.include = []
    print(args.include)
    return args


def is_cpp_file(f):
    if (".h" in f
            or ".hpp" in f
            or ".cpp" in f
            or ".cc" in f
            or ".c" in f
            or ".cxx" in f):

        return True
    return False


def is_hidden(f):
    return f.split("/")[-1].startswith(".")


def is_ignore(args, f):
    exclude = args.exclude
    if not exclude:
        return False
    f_ls = f.split("/")
    for x in exclude:
        if x in f_ls:
            return True
    return False


def scan_folder(args, top_f):
    dirs_need_include = set()
    if is_hidden(top_f):
        print("hidden: ", top_f)
        return dirs_need_include
    folder_include = FolderHelper(top_f)
    for f in folder_include.list_file():
        if is_ignore(args, f):
            print("ignored: ", f)
            continue
        if not is_cpp_file(f):
            continue
        folder = os.path.dirname(f)
        if is_hidden(folder):
            print("hidden: ", folder)
            continue
        dirs_need_include.add(folder)
    return dirs_need_include


def gen_clang_file(args):
    dirs_need_include = set()
    # analyze include
    for x in args.include:
        dirs_need_include = dirs_need_include.union(scan_folder(args, x))
    # analyze project
    dirs_need_include = dirs_need_include.union(
        scan_folder(args, args.project))

    # generate -I
    lines = set()
    line_f = "-I{}\n"
    for x in dirs_need_include:
        lines.add(line_f.format(x))

    lines = list(lines)
    lines.sort()
    # add some fix path
    lines += ["-I./\n",
              "-I/usr/lib/x86_64-linux-gnu\n"]

    lines = [
        "-Wall\n",
        "-fPIC\n",
        "-std=c++11\n",
        "-Iinclude\n",
        "-Wfatal-errors\n",
        "-unresolved-symbols=ignore-in-shared-libs\n",
        "-O3\n",
        "-pthread\n",
        "-g\n",
        "-DDEBUG\n",
        "-DENABLE_PROFILE\n",
    ] + lines
    for x in lines:
        print(x)

    project_clang_file = os.path.join(args.project, "compile_flags.txt")
    with open(project_clang_file, "w") as pf:
        pf.writelines(lines)


def main():
    args = parse_args()
    gen_clang_file(args)


if __name__ == "__main__":
    main()
