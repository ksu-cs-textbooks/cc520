---
title: "MS SQL Server Access"
weight: 15
pre: "1. "
---

{{% notice info %}}

With the new policies regarding the K-State VPN, I am working on an alternative for those of you who cannot install MS SQL Server on your own machine. I will post updates as soon as possible!

{{% /notice %}}

In order to complete homework assignments and practice on your own,  you will need access to SQL Server. Your access requires a client tool and a server.

## Client Tools

For this course, you will need to use a SQL client tool to access a SQL Server instance. Here are a few client tools that are available for use; however, we will be focusing our use on VS Code this semester:

- <u>Preferred: **VS Code**</u> - Windows, macOS, or Linux: [https://code.visualstudio.com/](https://code.visualstudio.com/)
  - Install the **SQL Server (mssql)** extension from the VS Code marketplace: [https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql)
    - *Note:* I will also provide a pre-configured VS Code setup via GitHub. The link is available in Canvas.
- **SQL Server Management Studio** *(aka SSMS)* - Windows Only: [https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
- **DataGrip** - Windows, macOS, or Linux. Available for free if you sign up for Jetbrains using your K-State email and get verified as a student. This tool is able to handle more than just SQL Server databases. [https://www.jetbrains.com/datagrip/](https://www.jetbrains.com/datagrip/)
- Archived: **Azure Data Studio** - Windows, macOS, or Linux. This tool is shown frequently in my videos; however, I do not recommend it anymore as Microsoft is retiring the product end of February in favor of VS Code with extensions. [https://docs.microsoft.com/en-us/sql/azure-data-studio/download](https://docs.microsoft.com/en-us/sql/azure-data-studio/download)
- Windows Computer Labs: All Windows workstations in the Computer Science department have at least one of these client tools available.

## Database Server

A database server is needed to host a database in addition to client tools which are used to access the database and run queries. In this course, we will use Microsoft SQL Server.

### Option 1: Docker/Github Codespace
If you are unable to install SQL Server on your own machine, you can use a GitHub Codespace or Docker that has SQL Server already installed. This is provided via a GitHub classroom link in Canvas, along with instructions.

### Option 2: Install Your Own

Installing your own copy of Microsoft SQL Server is *highly* encouraged. Most versions of SQL Server will work for this  course...but I recommend the one below for a lightweight option (the full version of MS SQL Server is not needed for this course and can take up quite a bit of resources when installed).  

- **MS SQL Server Express**: A light-weight server that is often used for local development. It is an installation option of SQL Server Express Edition. 

  1. You can install SQL Server Express here: [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads).  The "Basic" installation option is sufficient.

     1. Alternatively, you can install LocalDB. For more information, see [https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/sql-server-express-localdb](https://docs.microsoft.com/en-us/sql/database-engine/configure-windows/sql-server-express-localdb).  This runs with even a smaller footprint than Express.  If you go with this option, you will use a different server name to connect below in step 2: *(localdb)\MSSQLLocalDb*

  2. Now you can run one of the above client tools to connect to your local instance of SQL Server. You need to use the following  information to connect in a query window:

        - **Server Type:** Database Engine
        - **Server Name:** localhost\SQLEXPRESS
        - **Authentication Type:** Windows Authentication
  
  3. Install the **WideWorldImporters** database. It it is hosted on [github.com](https://github.com/Microsoft/sql-server-samples/tree/master/samples/databases/wide-world-importers). For for our use, you can download the [WideWorldImporters-Standard.bak](https://github.com/Microsoft/sql-server-samples/releases/download/wide-world-importers-v1.0/WideWorldImporters-Standard.bak) copy of the database. Once the backup file is downloaded, move it to  your user directory and issue the following SQL to restore the backup:

    ```sql
    RESTORE DATABASE [WideWorldImporters]
    FROM DISK = N'THEPATH\WideWorldImporters-Standard.bak'
    WITH FILE = 1,
    MOVE N'WWI_Primary' TO N'THEPATH\WideWorldImporters.mdf',
    MOVE N'WWI_UserData' TO N'THEPATH\WideWorldImporters_UserData.ndf',
    MOVE N'WWI_Log' TO N'THEPATH\WideWorldImporters.ldf';
    ```
  
{{% notice info %}}
Note that since SQL Server Express typically runs under its own user in Windows, you may run into some file permission issues (Access Denied errors) when trying to run the above commands.  If this is the case, move the **.bak** file to the Data folder inside your SQL Server install location.  In most cases, this would be where that folder is located (version might be different): `C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA`.  Try running the commands above again, but now with the **.bak** file at this location.
{{% /notice %}}
