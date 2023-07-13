#!/bin/bash

create_user(){

	if [ $# -lt 1 ]; then
		echo "Usage: $0 <username>"
		exit 1
	elif getent passwd "$1"; then
		echo "The user $1 already exists"
		exit2
	fi

	sudo useradd -m "$1"
	getent passwd "$1"
}

set_password(){

	while ! [ -n "$USER_PASSWORD" ]
	do
		read -s -p "Enter a password for the new user $1: " USER_PASSWORD
	done

	echo "$1:$USER_PASSWORD" | sudo chpasswd
}


for u in "$@"
do
	create_user "$u"
	set_password "$u"
done
