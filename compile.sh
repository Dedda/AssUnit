#!/bin/bash
set -e

source_files=( assunit )
linker_command="ar rs libassunit.a"

for source_file in "${source_files[@]}"
do
    echo "  compiling ${source_file}.asm ..."
    nasm -felf64 "${source_file}.asm"
    linker_command="${linker_command} ${source_file}.o"
done

$($linker_command)

rm *.o

ls -lh libassunit.a