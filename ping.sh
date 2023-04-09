###### Accept an IP, and return 0 if live, 1 otherwise
function ping 
 { IP=${1}
   ping -c 3  ${IP} > /dev/null 2>&1
   return ${?}

 }
####ping on all device in subbnet
function ping_subnet 
 {
   IP=${1}
   OC1=$(echo ${IP} | awk ' BEGIN { FS="." } { print $1 } ')
   OC2=$(echo ${IP} | awk ' BEGIN { FS="." } { print $2 } ')
   OC3=$(echo ${IP} | awk ' BEGIN { FS="." } { print $3 } ')
   OC4=$(echo ${IP} | awk ' BEGIN { FS="." } { print $4 } ')
   for i  in $(seq 1 254)
     do
     IP=${OC1}.${OC2}.${OC3}.${i}
     echo "ping on host ${IP}" 
     ping ${IP}
     if [ ${?} -eq 0 ]
         then
           LIVEHOST+=(${IP})

     fi
     echo "done......"
     done
 }
