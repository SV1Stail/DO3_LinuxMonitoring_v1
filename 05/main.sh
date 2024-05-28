#!/bin/bash

start_time=$(date +%s)
if [[ -z "$1" ]]; then
    echo path does not entered
    exit 1
fi
if [[ ! -d $1 ]]; then
    echo path does not exist
    exit 1
fi

path_file="$1"
if [[ ${path_file: -1} != '/' ]]; then
    path_file="$path_file/"
fi
# path_file="/home/svs/work/"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
folders_biggest=(`du -h -d 1 "$path_file" | sort -n -r | head -n 5`)

if [[ ! -z "${folders_biggest[0]}" ]]; then
echo -e "1 - ${folders_biggest[1]}, ${folders_biggest[0]}"
fi
if [[ ! -z "${folders_biggest[2]}" ]]; then
echo -e "2 - ${folders_biggest[3]}, ${folders_biggest[2]}"
fi
if [[ ! -z "${folders_biggest[4]}" ]]; then
echo -e "3 - ${folders_biggest[5]}, ${folders_biggest[4]}"
fi
if [[ ! -z "${folders_biggest[6]}" ]]; then
echo -e "4 - ${folders_biggest[7]}, ${folders_biggest[6]}"
fi
if [[ ! -z "${folders_biggest[8]}" ]]; then
echo -e "5 - ${folders_biggest[9]}, ${folders_biggest[8]}"
fi
# Общее число папок, включая вложенные
kolvo_folders=$(find "$path_file" -type d | wc -l )
echo -e "Total number of folders (including all nested ones) = $kolvo_folders"

# Общее число файлов
kolvo_files=$(find "$path_file" -type f | wc -l)

echo -e "Total number of files = $kolvo_files"

# посчитать количество файлов определенного типа
kolvo_conf_files=$(find "$path_file" -type f -iname "*.conf" | wc -l)
kolvo_txt_files=$(find  "$path_file" -type f -iname "*.txt" | wc -l)
kolvo_executable_files=$(find "$path_file" -type f -perm /u=x -or -perm /g=x -or -perm /o=x | wc -l)
kolvo_log_files=$(find "$path_file" -type f -iname "*.log" | wc -l)
kolvo_archives=$(find "$path_file" -type f -iname "*.tar" -or -iname "*.zip" -or -iname "*.gz" -or -iname "*.shar" -or -iname "*.cpio" | wc -l)
kolvo_symbolic_links=$(find "$path_file" -type l | wc -l)
echo Number of: 
if [[ ! -z "$kolvo_conf_files" ]]; then
echo -e "Configuration files (with the .conf extension) = $kolvo_conf_files"
else
echo -e "Configuration files (with the .conf extension) = 0"
fi
if [[ ! -z "$kolvo_txt_files" ]]; then
echo -e "Text files = $kolvo_txt_files"
else
echo -e "Text files = 0"
fi
if [[ ! -z "$kolvo_executable_files" ]]; then
echo -e "Executable files = $kolvo_executable_files"
else
echo -e "Executable files = 0"
fi
if [[ ! -z "$kolvo_log_files" ]]; then
echo -e "Log files (with the extension .log) = $kolvo_log_files"
else
echo -e "Log files (with the extension .log) = 0"
fi
if [[ ! -z "$kolvo_archives" ]]; then
echo -e "Archive files = $kolvo_archives"
else
echo -e "Archive files = 0"
fi
if [[ ! -z "$kolvo_symbolic_links" ]]; then
echo -e "Symbolic links = $kolvo_symbolic_links"
else
echo -e "Symbolic links = 0"
fi

# Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
file_biggest=$(find "$path_file" -type f -exec du -Sh {} + -printf '%s %p\n' | sort -rh | head -n 10)

count=1
while read -r line; do
    size=$(echo "$line" | awk '{print $1}')
    path=$(echo "$line" | awk '{print $2}')
    ext=$(echo "$path" | awk -F . '{if (NF>1) {print $NF}}')
    echo "$count - $path, $size, $ext"
    count=$(( $count + 1 ))
done <<< "$file_biggest"

# Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file) " 
file_biggest_executable=$(find "$path_file" -type f -executable -exec du -Sh {} + -printf '%s %p\n' | sort -rh | head -n 10)
count=1
while read -r line; do
    size=$(echo "$line" | awk '{print $1}')
    path=$(echo "$line" | awk '{print $2}')
    if [[ -e path ]]; then
    hesh=$(echo `md5sum "$path"` | awk '{print $1}')
    else
        hesh="error, maybe space in file/folder name"
    fi
    echo "$count - $path, $size, $hesh"
    count=$(( $count + 1 ))
done <<< "$file_biggest_executable"

# время выполнения
end_time=$(date +%s.%1N)
difference=$(echo "$end_time - $start_time" | bc)
echo -e "Script execution time (in seconds) = $difference"





