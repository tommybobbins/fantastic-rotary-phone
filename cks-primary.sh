#!/bin/bash

USERDATA_FILE=/var/tmp/userdata_ran.txt 

if [ -e ${USERDATA_FILE} ]
then
   USERDATA_DATE=$(cat ${USERDATA_FILE})
   echo "Userdata ran on $USERDATA_DATE"
   exit 2
fi

sudo -i
bash <(curl -s https://raw.githubusercontent.com/killer-sh/cks-course-environment/master/cluster-setup/latest/install_master.sh)

date +%F >${USERDATA_FILE}
