while :
do
read -p "Enter the table name :" table_name
if [[ -f ./$table_name ]];then
rm $table_name
rm meta_$table_name
echo "It is dropped successfully "

../../tables.sh
else
echo "This table doesn't exist"
continue
fi
done

