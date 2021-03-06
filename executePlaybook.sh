#!/bin/bash

begin=$(date +"%s")

VERSION="version=1.0.0.12"

retry=0
until [ $retry -ge 5 ]
 do
  ansible-playbook devopspoc.yml --extra-vars $VERSION -vv && break  # substitute your command here
  retry=$[$retry+1]
  sleep 5
  echo -e " ################################ RETRY COUNT : $retry "
done

termin=$(date +"%s")
difftimelps=$(($termin-$begin))
echo " ###############  [ $(($difftimelps / 60)) ] minutes and [ $(($difftimelps % 60)) ] seconds elapsed for Script Execution."

