
select choice in create_database List_databases drop_database connect exit
do

case $choice in
"create_database" )
read -p "enter your database name: " dirname
if [[ -d ./databases/$dirname ]]; then
echo "database already exist"
#read -p "enter new database name :" dirname
else
mkdir ./databases/$dirname
echo " your database is created successfully."
break
fi


;;
"List_databases" )

ls ./databases 
;;

"drop_database" )
read -p "enter the name of database to drop: " x
rm -r ./databases/$x
echo "'$x' is dropped successfully"
 
;;

"connect" )
read -p "enter the name of database to connect: " z
if [[ -d ./databases/$z ]]; then
cd ./databases/$z
echo you are connected to $z
else
echo not found
break
fi
;;

"exit" )

exit

esac

done
