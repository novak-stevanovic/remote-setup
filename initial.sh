source global_vars.sh

echo "Enter hostname:"
read hostname_n
echo "Enter IP:"
read ip_n
echo "Enter port:"
read port_n

if [[ -f "INFO_FILE" ]]; then
    rm -rf "INFO_FILE"
fi

touch "$INFO_FILE"

INFO="$hostname_n $ip_n $port_n" 

echo $INFO > $INFO_FILE
