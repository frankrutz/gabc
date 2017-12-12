#!/usr/bin/bash

echo start
date
echo "MY_DB_SERVER   ::${MY_DB_SERVER}::"
echo "MY_DB_PASSWD   ::${MY_DB_PASSWD}::"
echo "MY_USER_PASSWD ::${MY_USER_PASSWD}::"
echo "MY_DB_USER     ::${MY_DB_USER}::"
echo "MY_TEST_TARGET ::${MY_TEST_TARGET}::"
echo "MY_DB          ::${MY_DB}::"

sleep 1

for COUNTER in {1..2}
do
date
sqlcmd -S ${MY_DB_SERVER} -U SA -P ${MY_DB_PASSWD} -Q "select getDate()";
echo "MY_TEST_TARGET ::${MY_TEST_TARGET}::loop ${COUNTER}"
sleep 1
done
#Todo break loop when OK

sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d master   -Q "select getDate()"
sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d master   -Q "create database ${MY_DB}"
sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d ${MY_DB} -Q "select getDate()"

sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d ${MY_DB} -Q "CREATE LOGIN ${MY_DB_USER} with PASSWORD='${MY_USER_PASSWD}'"
sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d ${MY_DB} -Q "CREATE USER ${MY_DB_USER} for LOGIN ${MY_DB_USER}"

sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d ${MY_DB} -Q "EXEC sp_addrolemember 'db_datareader', '${MY_DB_USER}'"
sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d ${MY_DB} -Q "EXEC sp_addrolemember 'db_datawriter', '${MY_DB_USER}'"

sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d ${MY_DB} -Q "Grant Execute on Schema :: dbo TO ${MY_DB_USER}"
sqlcmd -U sa -P ${MY_DB_PASSWD}  -S ${MY_DB_SERVER} -d ${MY_DB} -Q "GRANT ALTER TO ${MY_DB_USER}"

sqlcmd -U ${MY_DB_USER} -P ${MY_USER_PASSWD} -S ${MY_DB_SERVER} -d ${MY_DB} -Q "select getDate()"

echo end
