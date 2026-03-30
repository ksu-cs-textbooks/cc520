---
title: "Applications & DB Example"
weight: 10
pre: "2. "
---

{{< youtube 7dhSJoB-tTk >}}

## Video Transcription

Hello everyone, and welcome back to another video for CC520 Database Essentials. This is a casual walkthrough of an example using Flask and Microsoft SQL Server. Much of what we've covered in this class focuses on writing SQL queries, running them against a database, and viewing the results. But in practice, databases are rarely used on their own. They are almost always paired with an application - often a web-based one.

For this example I'm using Flask, a lightweight Python web framework, but you could adapt this to Django, React, Vue, or other frameworks. My goal is to keep things simple and highlight the essential steps needed to get a database running and display its data in a web app.

## Project Structure Overview

Let's start by looking at the project structure. Much of it comes from the core template used in the class. The dev container includes everything needed to get your Flask server running, along with all database connection support.

For the Python example, I'm using the CC520 database. The WideWorldImporters database is also included if you want to experiment with larger queries. You can ignore the SQL Server admin database unless you need deeper configuration work.

---

## Source Folder Components

### data_access

The `data_access` folder contains the core functionality for running SQL queries. The main class is `SQLCommandExecutor`, which uses the `msql` Python library and pulls connection information from an environment file unless overridden.

It includes:

- Connection-building helpers
- Transaction support
- String conversion of parameters
- Methods to execute stored procedures
- Methods to execute raw SQL queries
- Methods for retrieving all rows from a cursor

This class should work as-is for your project.

### db Folder (Database Seeding)

The `db` folder contains an example of how to seed your database. During development, schemas and data often change, so it's useful to reset your database quickly.

The script runs:

- Schema SQL files
- Table creation SQL files
- Stored procedures
- Seed data files

To rebuild, run:

```
poetry run python -m source rebuild_db
```

There is also a "seed only" option to reload data without recreating tables.

The sample data lives in `garden/sql/data`. This data was generated using AI, and I encourage you to generate your own fake data this way as well - just cite the AI model used.

### models Folder

The `models` folder contains classes that represent each table. Each class corresponds to a row in the table and lists all fields as properties. You'll duplicate and adapt these models for your own project tables.


## Repository Pattern Structure

### Repository and Interface Layers

Inside the `garden` folder, you'll see repository classes:

- `sql_gardener_repository`
- `sql_plot_assignment_repository`

These follow the repository pattern discussed in lecture. The project contains three layers:

1. Web Layer (Flask)
2. Repository Layer (business logic)
3. Data Access Layer (SQL execution)

Repositories inherit from interfaces that define required methods. This isn't strictly required for the course, but it encourages good object-oriented design and improves code reusability.

You'll implement the actual SQL calls inside these repository classes.

## Web Application Layer

### Flask App

The `web` folder contains a simple Flask application. Some HTML and CSS - like `index.html` and `gardeners.html` - were generated using AI to help with styling. You will write the logic that interacts with the database.

The web layer includes:

- API endpoints returning JSON
- Template-rendering endpoints
- Helper methods to access repositories

### Test Cases

At the bottom of the project, there are test cases. Some were generated using AI. AI can quickly produce useful test cases, though you may need to correct or supplement them.


## Running the Web Application

To run the app:

```
poetry run python -m source
```

You'll see:

```
Running on 127.0.0.1
```

This means Flask is active.

### Front-End Behavior

The web application uses:

- HTML/CSS (partially AI-generated)
- The DataTables library for interactive tables

DataTables provides pagination, searching, and sorting. For example:

- The gardeners page shows 30 gardeners across three pages.
- Searching "Tim" returns "Tim Berners-Lee."
- Clicking a row triggers an API call to fetch plot assignments (only the first time; subsequent clicks use cached data).

Editing, creation, and update features are not included yet - you will add these in the assignment.

## Exploring the Database in the SQL Server Extension

The SQL Server extension includes tools to view:

- Tables and their contents
- The table designer
- A schema visualization preview (still in preview, may have bugs)

The schema view shows tables like:

- Garden plots
- Plot assignments
- Gardeners
- Plot status

It also shows foreign keys, though not every constraint (like unique constraints).


## Conclusion

That wraps up this video. If you have questions or run into issues with setup or running the web app, please contact me. Everything should run inside a dev container, whether in GitHub Codespaces or locally using Docker.