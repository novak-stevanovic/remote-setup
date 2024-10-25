source global_vars.sh
source misc.sh
source extr_info.sh

extract_info

if [[ $(is_installed "xsel") -eq 0 ]]; then
    "Xsel not installed. Exiting."
    exit 1
fi

readonly clipboard_content=`xsel -b`

ssh -p "$port_n" "$hostname_n@$ip_n" "echo '$clipboard_content' > /home/novak/.recho"
