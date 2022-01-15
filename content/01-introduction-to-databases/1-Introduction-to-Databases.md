---
title: "Database Overview"
weight: 15
pre: "1. "
---

{{< youtube x3Bx9HQWRa4 >}}

## Overview

Databases are essentially everywhere with modern technology.  We live in a digital age, far more connected online than ever, and utilizing a number of smart devices that generate thousands of data points just for a single person.  Our digital foot print is always growing...even more so for companies that are able to store far more data than they used to about their operation.  Almost every application or smart device we use is connected to *some* form of database to store information it creates/collects.

***The before times...*** Databases allow us to manipulate and store information significantly faster and in much larger volumes than ever before.  But before databases existed, of course we had classic paper filing systems.  Though, even when we started to advance technologies and created digital computers, data still was not readily accessible at our fingertips in large amounts.  A lot of data was stored in single or multiple files like text files on computers for quite some time.  File-based data storage and access is difficult to work with, resulting in a tediously written programs that resulted in a lot of repeated code.  Data integrity, retention, and access also presents a major issue, particularly when more than one device/program/person needs to work the with data at the same time.

The main concept behind a database is a centralized data store that manages data integrity and  allows fast retrieval and manipulation of data.  Initially, when the idea of a data store or database was materialized, they weren't really that much better than a normal file store.  They were typically a static system in the 1960's, which meant that modifications were tedious and hard to complete.  More so, programmers had to know the physical structure of the database in order to utilize the data.

{{% notice info %}}

Most modern databases are quite dynamic and typically require only knowledge of the *logical* structure structure of the data.  There are also numerous programming libraries that make interfacing with a database using your favorite language much easier than doing everything by hand!

{{% /notice %}}

## Edgar F. Codd

In 1970, [Edgar F. Codd](https://en.wikipedia.org/wiki/Edgar_F._Codd), a researcher at IBM published the paper *A Relational Model of Data for Large Shared Data Banks*.  In this paper, he outlines how database systems could utilize mathematical foundations in set theory, predicate logic, and relational algebra.  This work led to the creation of some of the first **relational database**s as well as the language used to work them called the **S**tructured **Q**uery **L**anguage ([SQL](https://en.wikipedia.org/wiki/SQL)).  We will be re-visiting some of Codd's work throughout this course!