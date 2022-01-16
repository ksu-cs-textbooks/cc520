---
title: "MS SQL Server Access"
weight: 10
pre: "0. "
---

In order to complete homework assignments and practice on your own,  you will need access to SQL Server. Your access requires a client tool and a server.

## Client Tools

For this course, you will need to use a SQL client tool to access a SQL Server instance.

- All resources are available via remote access on **remote.cs.ksu.edu**.  See [https://support.cs.ksu.edu/CISDocs/wiki/Remote_Access](https://support.cs.ksu.edu/CISDocs/wiki/Remote_Access) for more information on how to utilize the remote resources.
- We will be using two client tools throughout the semester. It is highly encouraged to also install a client on your own computer.
  - **Azure Data Studio** - Windows, macOS, or Linux: [https://docs.microsoft.com/en-us/sql/azure-data-studio/download](https://docs.microsoft.com/en-us/sql/azure-data-studio/download)
  - **SQL Server Management Studio** *(aka SSMS)* - Windows Only: [https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
- Windows Computer Labs: All Windows workstations in the Computer Science department have these client tools available.

## Database Server

A database server is needed to host a database. In this course, we will use Microsoft SQL Server.

### Option 1: Provided Database Server

Using the following information, you connect to our SQL Server instance from one of the aforementioned client tools. *Depending on the tool, not all of this information may be requested.* If you are accessing from your own computer, you will need to connect to the [campus network via VPN](https://www.k-state.edu/it/security/secure-data/vpn/) first.

{{% notice info %}}

If you are connecting to the remote MS SQL Server instance for the first time, you will need to use SQL Server Management Studio once to reset your password.  After you have set your password, you can then use Azure Data Studio to connect.

{{% /notice %}}

- Server Type: **Database Engine**

- Server Name: **mssql.cs.ksu.edu**

- Authentication Type: 

  SQL Server Authentication

  - Login: *Your eID*
  - Password: *Instructor will provide your initial password, then you will be prompted to change it.*

- Once connected, we will most often use the database **WideWorldImporters**.  You should also have a database named after your EID that you can utilize to explore other examples.  

  {{% notice info %}}

  Your access to the WideWorldImporters database on the remote server is read only.  If you would like to modify tables, insert, or delete data, you will need to use your own personal installation (see option 2).

  {{% /notice %}}

### Option 2: Install Your Own

Installing your own copy of Microsoft SQL Server is *highly* encouraged. Most versions of SQL Server will work for this  course...but I recommend the one below for a lightweight option (the full version of MS SQL Server is not needed for this course and can take up quite a bit of resources when installed).  

- **MS SQL Server Express**: A light-weight server that is often used for local development. It is an installation option of SQL Server Express Edition. 

  1. You can install SQL Server Express here: [SQL Server Express 2019](https://go.microsoft.com/fwlink/?LinkID=866658).  The "Basic" installation option is sufficient.

     1. Alternatively, you can install LocalDB. For more information, see [https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/sql-server-express-localdb](https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/sql-server-express-localdb).  This runs with even a smaller footprint than Express.  If you go with this option, you will use a different server name to connect below in step 2: *(localdb)\MSSQLLocalDb*

  2. Now you can run one of the above client tools to connect to your local instance of SQL Server. You need to use the following  information to connect in a query window:

     **
     **Server Type: **Database Engine
     **Server Name: **localhost\SQLEXPRESS
     **Authentication Type: **Windows Authentication

     **

  3. Install the **WideWorldImporters** database. It it is hosted on [github.com](https://github.com/Microsoft/sql-server-samples/tree/master/samples/databases/wide-world-importers). For for our use, you can download the [WideWorldImporters-Standard.bak](https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Standard.bak) copy of the database. Once the backup file is downloaded, move it to  your user directory and issue the following SQL to restore the backup:

     ```
     RESTORE DATABASE [WideWorldImporters]
     FROM DISK = N'THEPATH\WideWorldImporters-Standard.bak'
     WITH FILE = 1,
     MOVE N'WWI_Primary' TO N'THEPATH\WideWorldImporters.mdf',
     MOVE N'WWI_UserData' TO N'THEPATH\WideWorldImporters_UserData.ndf',
     MOVE N'WWI_Log' TO N'THEPATH\WideWorldImporters.ldf';
     ```

     {{% notice info %}}

     Note that since SQL Server Express typically runs under its own user in Windows, you may run into some file permission issues (Access Denied errors) when trying to run the above commands.  If this is the case, move the **.bak** file to the Data folder inside your SQL Server install location.  In most cases, this would be where that folder is located: `C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA`.  Try running the commands above again, but now with the **.bak** file at this location.

     {{% /notice %}}

- **Docker Container Option:** A full-featured database engine running in a Linux container.
  To build your own image, the container and the sample database are both  installed by following the steps of the online Microsoft article [Restore a SQL Server database in a Linux Docker container](https://docs.microsoft.com/en-us/sql/linux/tutorial-restore-backup-in-sql-server-container?view=sql-server-2017). Walk through the steps described until you complete the section of the online article named [*Verify the restored database*](https://docs.microsoft.com/en-us/sql/linux/tutorial-restore-backup-in-sql-server-container?view=sql-server-2017#verify-the-restored-database).