source global_vars.sh
source misc.sh

if [[ ! -d "$BASHRC_PATH" ]]; then
    touch "$BASHRC_PATH"
fi

copy_lines_src_to_dest "$BASHRC_LINES_FILE" "$BASHRC_PATH"
