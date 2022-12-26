#!/bin/bash
echo ">>>>>>>>>>choose an option<<<<<<<<<<<<"
select choice in create_table List_table drop_table Insert_in_table  Select_from_table update_table Delete_table exit
do
case $choice in
List_table )

../../listtb.sh
;;
drop_table )

../../droptb.sh

;;
create_table )
../../createtb.sh

;;
Insert_in_table ) 

../../insert.sh

;;
Delete_table )

../../delete.sh
;;
update_table )

../../update.sh
;;

Select_from_table )

../../select.sh
;;
exit )
../../check.sh
esac
done