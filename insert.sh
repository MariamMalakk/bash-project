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
    printf "%s : ",response >> table
    }
END { } ' ./meta_$table
echo " " >> $table
../../tables.sh
done