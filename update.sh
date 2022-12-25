read -p "please enter the table name " table
read -p "please enter your old data " old
read -p "please enter your new data " change
read -p " please enter your 
`awk ' BEGIN { FS=":" }
{
   if ($3 == "pk")
   print $1
    }
END { } ' ./meta_$table `" pk
grep "$pk" $table | sed -i "s/$old/$change/" $table 
