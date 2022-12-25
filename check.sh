#!/bin/bash
echo "<<<Your database engine, please select>>>"
select choice in create_database List_databases drop_database connect exit
do
case $choice in
"create_database" )
while :
do
read -p "enter your database name: " dirname
if [[ -d ./databases/$dirname ]]; then
echo "database already exist"
fi

if [[ $dirname == ^[.=,$/@!~*+]$ && [0--9] ]]; then
echo "no special charachters allowed"
fi

if [[ $dirname == " " ]]; then
echo "not valid"
continue

else
mkdir ./databases/$dirname
echo " your database is created successfully."
./check.sh
fi
done


;;
"List_databases" )
ls -F ./databases

./check.sh

;;

"drop_database" )
read -p "enter the name of database to drop: " x
rm -r ./databases/$x
echo "'$x' is dropped successfully"

./check.sh

;;

"connect" )
while :
do
read -p "enter the name of database to connect: " z
if [[ -d ./databases/$z ]]; then
cd ./databases/$z
echo you are connected to $z

../../tables.sh
else
echo not found
continue
fi
done
;;

"exit" )

exit

esac

done
