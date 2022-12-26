echo "select:"
select selection in all row column exit
do
case $selection in
all )
while :
do
read -p "please enter the table name :" table
if [[ ! -f ./$table ]]; then
echo "table doesn't exist"
continue
else
cat $table

../../select.sh
fi
done

;;

row )
while :
do
read -p "please enter the table name :" table
if [[ ! -f ./$table ]]; then
echo "table doesn't exist"
continue
else

read -p " please enter your 
`awk ' BEGIN { FS=":" }
{
   if ($3 == "pk")
   print $1
    }
END { } ' ./meta_$table `" pk
grep "$pk" $table

../../select.sh

fi
done
;;

column )
while :
do
read -p "please enter table name :" table
if [[ ! -f ./$table ]]; then
echo "table doesn't exist"
continue
else
awk -F : '{print $1}' ./meta_$table
read -p "please enter column name from the list : " column
result=`awk -v column=$column ' BEGIN { FS=":" }
{
    if ($1==column)
    {
        print NR
    }
    }
END { } ' ./meta_$table`

cut -d : -f${result} ./$table
fi
done

../../select.sh

;;

exit )

../../tables.sh




esac
done