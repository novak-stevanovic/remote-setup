source global_vars.sh

hostname_n=$(awk '{ print $1 }' $INFO_FILE)
ip_n=$(awk '{ print $2 }' $INFO_FILE)
port_n=$(awk '{ print $3 }' $INFO_FILE)

