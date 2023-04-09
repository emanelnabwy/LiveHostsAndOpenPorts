##function if number is int return 1 otherwise 0;
function check_int 
 { NUM=${1}
   CHECK=$(echo ${NUM} |grep -c "^[0-9]*$")
   if [ ${CHECK} -eq 1 ]
      then
        return 1
      else
         return 0
  fi
  }
##function accepts an octet, and return 1 if valid octet, 0 otherwise
function check_oct
 { OCT=${1}
   check_int ${OCT}
   [ ${?} -eq 0 ] && return 0
   [ -z ${OCT} ] && return 0
   if [ ${OCT} -ge 0 ] && [ ${OCT} -le  255 ]
       then
           return 1
       else
           return 0
   fi
}
###function check on vaild ip 
function vaild_ip
 { IP=${1}
   OCT1=$(echo ${IP} | awk 'BEGIN {FS="."} {print $1 } ')
   OCT2=$(echo ${IP} | awk 'BEGIN {FS="."} {print $2 } ')
   OCT3=$(echo ${IP} | awk 'BEGIN {FS="."} {print $3 } ')
   OCT4=$(echo ${IP} | awk 'BEGIN {FS="."} {print $4 } ')
   check_oct ${OCT1} && return 0
   check_oct ${OCT2} && return 0
   check_oct ${OCT3} && return 0
   check_oct ${OCT4} && return 0
   return 1
 }
