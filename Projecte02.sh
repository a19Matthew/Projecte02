#!/bin/bash
#Aquest es el segon projecte de ASO

if [[ $EUID -ne 0  ]]; then
        echo "Has d'obrir aquest script com a sudo"
        exit 1
fi

function usage(){
  echo "Utilització: ./Projecte02 nomusuari [comentari] "
  exit 1
}

if [ -z "$1" ];then

  usage

fi
if [ -z "$2" ];then

  PASSWORD=`date +%s | sha256sum | base64 | head -c 32 ; echo`

  useradd -p $PASSWORD $1

  echo "Usuari: "$1 "Contrassenya: "$PASSWORD"Host: "$HOSTNAME


else

  PASSWORD=`date +%s | sha256sum | base64 | head -c 32 ; echo`
     
  useradd -c $2 -p $PASSWORD $1

  echo "Usuari: "$1 "Contrassenya: "$PASSWORD"Host: "$HOSTNAME

fi
