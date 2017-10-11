#!/bin/bash
PASSWD="/home/vagrant/aula02/passwd"
incorreto(){ sleep 3 ; echo ; echo "Login incorrect" ; }
while : ; do
	clear
	echo
	echo "Debian GNU/Linux 8 jessie tty1"
	echo
	contar=0
	while : ; do
		read -p "jessie login: " LOGIN
		read -s  -p "Password: " PASSW
		echo
		if [[ -z $LOGIN || -z $PASSW || ! $(grep $LOGIN $PASSWD) ]]
		then
			incorreto
		else
			PASSW=$(echo $PASSW | sha256sum | cut -d" " -f1)
			Senha=$(grep $LOGIN $PASSWD | cut -d";" -f2)
			[[ $PASSW == $SENHA ]] && break 2 || incorreto
		fi
		contar=$(($contar+1))
		[[ $contar == "5" ]] && break
	done
done
echo "Terminou"
