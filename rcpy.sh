source global_vars.sh
source misc.sh

if [[ $(is_installed "xsel") -eq 0 ]]; then
    "Xsel not installed. Exiting."
    exit 1
fi

ssh -p "$port_n" "$hostname_n"@"$ip_n" 'cat $REMOTE_CLIPBOARD_PATH | xsel -b'
