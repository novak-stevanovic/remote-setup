source global_vars.sh
source extr_info.sh

extract_info

echo "Enter source path(LOCAL)"
read local_path
echo "Enter destination path(REMOTE)"
read remote_path

scp -P $port_n -r "$local_path" "$hostname_n@ip_n:$remote_path"
