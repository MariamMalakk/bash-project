while :
do
read -p "please enter the table name :" table
if [[ ! -f ./$table ]]; then
echo "table doesn't exist"
continue
fi
awk -v table=$table ' BEGIN { FS=":" }
{
    printf"please enter your "$1 ":"
    getline response < "-"
    if ($3=="pk"){
        if (response==""){
            print "invalid primary key" 
            exit }
    }
    printf "%s : ",response >> table
    }
END { } ' ./meta_$table
echo " " >> $table
../../tables.sh
done