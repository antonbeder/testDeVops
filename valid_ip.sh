#!/bin/bash


function valid_ip()
{
    local  ip=$1
    local  stat=1

    if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
     OIFS=$IFS
     IFS='.'
    ip=($ip)
   IFS=$OIFS
          [[ ${ip[0]} -le 255 && ${ip[1]} -le 255 \
         && ${ip[2]} -le 255 && ${ip[3]} -le 255 ]]
                        stat=$?
    fi
    return $stat
 }




       if [[ "$(basename $0 .sh)" == 'valid_ip' ]]; then
               ips=$(awk -F"=" /ip_to_check/'{print $2}' /home/ubuntu/info.txt)
               #echo $ips
               ip1=$(echo $ips | awk -F" " '{print $1}')
               #echo $ip1
               ip1="${ip1#\"}"
         #      echo $ip1
               ip2=$(echo $ips | awk -F" " '{print $2}')
               ip2="${ip2%\"}"
          #     echo $ip2
      ips1=$ip1
        ips2=$ip2

          for ip in $ips1
           do
           if valid_ip $ip; then stat='good'; else stat='is not a valid IP address'; fi
           printf "%-20s: %s\n" "$ip" "$stat"
           done

           for ip in $ips2
            do
            if valid_ip $ip; then stat='good'; else stat='is not a valid IP address'; fi
            printf "%-20s: %s\n" "$ip" "$stat"
            done
            fi

           var=$(awk -F"=" /server_port/'{print $2}' /home/ubuntu/info.txt)
           port="${var%\"}"
           port="${port#\"}"
          # echo $port


           if (( $port < 1 || $port > 65535 )) ; then
                           echo "*** ${port} is not a valid port" 1>&2
                                   return
                                       fi

                                           echo $port:'port is ok'





                                           python3 testscript.py $ip1 $ip2 $port
