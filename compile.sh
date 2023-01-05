#!/bin/bash
set -e

source_files=( assunit )
archive_command="ar rs libassunit.a"

echo "Compiling source files:"

for source_file in "${source_files[@]}"
do
    echo "  compiling ${source_file}.asm ..."
    nasm -felf64 "${source_file}.asm"
    archive_command="${archive_command} ${source_file}.o"
done

echo ""
echo "Archiving with command:"
echo "  ${archive_command}"
echo ""
$($archive_command)

rm *.o

if [ "$(command -v tokei)" != "" ]; then
    echo "Code stats for AssUnit library:"
    echo ""
    tokei .
fi

echo ""
echo "Output files:"
ls -lh libassunit.a