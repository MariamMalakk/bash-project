#!/bin/bash

select choice in create_table List_table drop_table Insert_in_table  Select_from_table update_table Delete_table 
do
case $choice in
List_table )
ls -a 
;;
drop_table )
read -p "Enter the table name :" table_name
if [[ -f ./$table_name ]];then
rm $table_name
echo "It is dropped successfully "
else
echo "This table doesn't exist"
continue
fi
;;
create_table )
read -p "Enter the table name :" table
if [[ -f ./$table ]];then
echo "This table already exists"
continue
else
touch ./meta_$table
touch ./$table
fi
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
;;
Insert_in_table ) 
read -p "please enter the table name :" table
awk -v table=$table ' BEGIN { FS=":" }
{
    printf"please enter your "$1
    getline response < "-"
    printf "%s : ",response >> table
    }
END { } ' ./meta_$table
echo "" >> $table
esac
done