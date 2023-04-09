#!/bin/bash
## Scritp accepts a subnet, scan the subnet for live host, and for each live host prints out its port scanning result. Assuming it is class C subnet
# Exit codes:
#       0: Success
#       1: Invalid IPv4 ip
source checker.sh
source ping.sh
function open_print_ports
 {
   HOST=${1}
   PORT=$(nmap ${HOST} | grep open)
   echo "open ports for host ${HOST}"
   echo "----------------------------"
   echo "${PORT}"| awk ' { print $3 "\t" $1 } END { print "There are " NR " open ports"}'
 }
LIVEHOST=()
SUBNET=${1}
vaild_ip ${SUBNET}
[ ${?} -eq 0 ] && echo "this is not vaild ip " && exit 1
ping_subnet ${SUBNET}
for i in ${LIVEHOST}
do
        echo  "${i}"
        printOpenPorts ${i}
done

exit 0
