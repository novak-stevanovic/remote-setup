source global_vars.sh

source extr_info.sh

extract_info

echo "Enter source path(REMOTE)"
read local_path
echo "Enter destination path(LOCAL)"
read remote_path

scp -P $port_n -r "$hostname_n@ip_n:$remote_path" "$local_path" 
