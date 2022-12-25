#!/bin/bash
export LC_COLLATE=C
shopt -s extglob

echo ">>>>>>>>>create new table<<<<<<<<<<"
while :
do

read -p "Enter the table name :" table
case $table in
+([a-zA-Z]) )

if [[ -f ./$table ]]; then
echo "This table already exists"
continue

else
touch ./meta_$table
touch ./$table
fi
;;
*)
echo "not valid name"
esac
done

read -p "Enter the number of columns :" columns
for (( c=1; c<=$columns; c++ ))
do
read -p "please enter column name :" column_name
echo "Is the data type int or string ?"
select data_type in int string  
do
case $data_type in 
int )
echo $data_type
break

;;
string)
echo $data_type
break
esac
done
echo "Is this your primary key?"
select is_pk in yes no  
do
case $is_pk in 
yes )
echo "$column_name:$data_type:"pk"" >> ./meta_$table
break
;;
no )
echo "$column_name:$data_type:" "" >>./meta_$table
 break

esac
done
done

awk -F : ' { printf "%s : ",$1} ' ./meta_$table >> $table
echo " " >>$table
 ../../tables.sh