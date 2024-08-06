## Download and install Docker
## Download SSMS (SQL Server Management Studio) and install it

## Download Docker SQL Image
#docker pull mcr.microsoft.com/mssql/server:2022-latest

# docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=p@55w0rd01" `
#    -p 1433:1433 --name sql1 --hostname sql1 `
#    -d `
#    mcr.microsoft.com/mssql/server:2022-latest