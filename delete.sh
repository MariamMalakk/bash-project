read -p "please enter the table name " table
select del in delete_record delete_all
do
case $del in
delete_record )
read -p " please enter your 
`awk ' BEGIN { FS=":" }
{
   if ($3 == "pk")
   print $1
    }
END { } ' ./meta_$table `" pk
result=`grep "$pk" $table`
sed -i "/$result/d" $table 
break
;;
delete_all )
sed -i '2,$d' $table
break
esac
done
../../tables.sh