#!/bin/bash

#Checking input and if the username is exists
if [ $# -lt 1 ]; then
	echo "usage: $0 <username>"
	exit 1
elif getent passwd "$1"; then
	echo "The user $1 already exists"
	exit 2
fi

#User creation part
read -s -p "Enter a password for the new user $1: " USER_PASSWORD
sudo useradd -m  "$1"
echo "$1:$USER_PASSWORD" | sudo chpasswd

echo "User $1 is succesfuly created!"
getent passwd "$1"
