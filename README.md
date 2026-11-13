# Student Management Application
**COMP 3005 Assignment 3 Question 1**

**Matteo Piomelli**

## Overview

This project is a student management application developed in R that connects to a PostgreSQL database which performs the four CRUD operations (Create, Read, Update, Delete) on a ***students*** table.

## Requirements

The following software and packages are required to run this application:

- **R**\
	Used to run the application.
- **RStudio**\
	Environment for running the R code.
- **PostgreSQL**\
	Database management system.
- **pgAdmin 4**\
	To create and manage the database.
- **DBI**\
	R package used for database interaction.
- **RPostgres**\
	R package used to connect R to PostgreSQL.

## Installation instructions

### 1. Install R and RStudio

Download and install:

- R: https://cran.r-project.org/
- RStudio Desktop: https://docs.posit.co/ide/user/download.html

### 2. Create and Populate the PostgreSQL Database

- Open pgAdmin 4.
- Connect to your local PostgreSQL server using the password created during installation.
- In the ***Object*** tab, create a new database and take note of its name.
- Copy the contents of the file ***database/create_database.sql*** from this repository into the ***Query Tool***.
- Execute the SQL script.

### 3. Install the Required R Packages

Open RStudio and execute the following commands in the console:

`install.packages("DBI")`

`install.packages("RPostgres")`

### 4. Configure the Database Credentials

The application reads its database connection settings from a file named ***credentials.R***. You must create this file locally for security reasons.

- Download the repository to your computer.
- Open the project folder in RStudio.
- Create a new R script named ***credentials.R*** in the root directory of the project.
- Add the following code, replacing ***PASSWORD*** with the password for your local PostgreSQL installation and ***DB*** with your database name:
```
Sys.setenv(
  PGHOST = "localhost",
  PGPORT = "5432",
  PGDATABASE = "DB",
  PGUSER = "postgres",
  PGPASSWORD = "PASSWORD"
)
```
### 5. Run the Application

- Open the project folder in RStudio.
- Set the RStudio working directory to the root of the project folder.
- Open ***application/main.R***.
- Run the entire script using the ***Source*** button.

The database connection has been established.

### 6. Using Application Functions

The following functions can now be called directly from the Rstudio console:

- `addStudent(first_name, last_name, email, enrollment_date)`\
  Adds a new student record.
- `getAllStudents()`\
	Retrieves and displays all student records.
- `updateStudentEmail(student_id, new_email)`\
	Updates the email address of an existing student.
- `deleteStudent(student_id)`\
	Deletes a student record using their student ID.

### 7. Disconnect from the Database

When finished using the application, close the database connection by executing:

`dbDisconnect(dbcon)`

## [Demonstration Video](https://vimeo.com/1246742027)
