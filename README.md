# Global Azure Bootcamp Switzerland 2017
## Peak Computing using Azure Container Service and MSSQL-DB in a Container

22.April 2017 @ Microsoft Schweiz, Wallisellen

Swiss Life has an IT strategy towards the hybrid cloud. Here, a presentation of our first experiences with “peak computing” for an actuarial regression test are given.

We use the Azure Container Service in the Microsoft Public Cloud in conjunction with Kubernetes.

http://bootcamp.azurezurichusergroup.com/

##Start MSSQL dbserver

docker run 	-e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=AM89jkdip98LKMJdkp' -p 1433:1433 --name 'mydb' -d microsoft/mssql-server-linux

##Create supersimple appserver

docker build -t appserver .

##Start supersimple appserver

docker run -it --net=container:mydb appserver bash







 
 
