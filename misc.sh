source global_vars.sh

is_installed() {
    if command -v "$1" &> /dev/null
    then
        echo 1
    else
        echo 0
    fi
}

expand_path_with() {
    echo "export PATH=$1:\$PATH"
}

check_if_line_exists_in_file() {
    line=$1
    file=$2

    if [[ ! -f $file ]]; then 
        echo "File doesn't exist. Exiting"
        exit 1
    fi

    if grep -q "$line" "$file"; then
        echo 1
    else
        echo 0
    fi
}

append_to_bashrc() {
    if [[ ! -f "$BASHRC_PATH" ]]; then
        touch "$BASHRC_PATH"
    fi

    line_to_append="$1"

    if [[ $(check_if_line_exists_in_file "line_to_append" "$BASHRC_PATH") -eq 0 ]]; then
        echo "$line_to_append" >> "$BASHRC_PATH"
    fi

}

add_to_path() {
    line_to_append="`expand_path_with $1`"
    append_to_bashrc "$line_to_append"
}

copy_lines_src_to_dest() {
    src="$1"
    dest="$2"

    while read -r line; do
        if [[ $(check_if_line_exists_in_file "$line" "$dest") -eq 0 ]]; then
            echo "$line" >> "$2"
        fi
    done < "$1"
}
