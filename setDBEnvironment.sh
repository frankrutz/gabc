#!/usr/bin/sh
#set up the DB
#create User and database including passwd
export MY_DB_SERVER=localhost
export MY_DB_PASSWD=AM89jkdip98LKMJdkp
export MY_USER_PASSWD=HodiPok8492mjkop
export MY_DB_USER=tmpMyDbUser
export MY_DB=tmpMyDb
export MY_TEST_TARGET=my_test_goes_here


docker run -it --rm --net=container:mydb -e MY_DB=${MY_DB} -e MY_DB_SERVER=${MY_DB_SERVER} -e MY_DB_PASSWD=${MY_DB_PASSWD} -e MY_USER_PASSWD=${MY_USER_PASSWD} -e MY_DB_USER=${MY_DB_USER} -e MY_TEST_TARGET=${MY_TEST_TARGET} appserver

#for Debugging
#docker run -it --rm --net=container:mydb -e MY_DB=${MY_DB} -e MY_DB_SERVER=${MY_DB_SERVER} -e MY_DB_PASSWD=${MY_DB_PASSWD} -e MY_USER_PASSWD=${MY_USER_PASSWD} -eMY_DB_USER=${MY_DB_USER} -e MY_TEST_TARGET=${MY_TEST_TARGET} appserver bash
#sqlcmd -S mydb -U SA -P AM89jkdip98LKMJdkp -Q "select getDate()";
