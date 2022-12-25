#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

echo "<<<Your database engine, please select>>>"
select choice in create_database List_databases drop_database connect exit
do
case $choice in
 "create_database" )
while :
do
read -p "enter your database name: " dirname
case $dirname in
+([a-zA-Z]) )

if [[ -d ./databases/$dirname ]]; then
 echo "database already exist"
continue

else
mkdir ./databases/$dirname
echo " your database is created successfully."
echo "========================="
./check.sh
fi
;;
*)
echo "not valid database name"
esac
done 
;;
"List_databases" )
ls -F ./databases
echo "========================="
./check.sh

;;

"drop_database" )
while :
do
read -p "enter the name of database to drop: " x
if [[ -d ./databases/$x ]]; then
rm -r ./databases/$x
echo "database "$x" is removed."

./check.sh
else

echo not found
continue
# rm -r ./databases/$x
# echo "'$x' is dropped successfully"
echo "========================="

fi
done
;;

"connect" )
while :
do
read -p "enter the name of database to connect: " z
if [[ -d ./databases/$z ]]; then
cd ./databases/$z
echo you are connected to $z
echo "========================="

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
