# Global Azure Bootcamp Switzerland 2017
## Peak Computing using Azure Container Service and MSSQL-DB in a Container

22.April 2017 @ Microsoft Schweiz, Wallisellen

http://bootcamp.azurezurichusergroup.com/

##Start MSSQL dbserver

docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=AM89jkdip98LKMJdkp' -p 1433:1433 --name 'mydb' -d microsoft/mssql-server-linux

#Create supersimple appserver
docker build -t appserver .

#Initiate the database using the appserver
./setDBEnvironment.sh







 
 
