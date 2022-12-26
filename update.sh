while :
do
read -p "please enter the table name :" table
if [[ ! -f ./$table ]]; then
echo "table doesn't exist"
continue
else
read -p "please enter your old data :" old
fi
break
done
read -p "please enter your new data :" change
read -p " please enter your 
`awk ' BEGIN { FS=":" }
{
   if ($3 == "pk")
   print $1
    }
END { } ' ./meta_$table `" pk
grep "$pk" $table | sed -i "s/$old/$change/" $table 
../../tables.sh
