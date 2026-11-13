# Loads the required packages
library(DBI)
library(RPostgres)

# Loads database credentials
source("credentials.R")

# Connects to the PostgreSQL database
dbcon <- dbConnect(
  RPostgres::Postgres(),
  dbname = Sys.getenv("PGDATABASE"),
  host = Sys.getenv("PGHOST"),
  port = as.integer(Sys.getenv("PGPORT")),
  user = Sys.getenv("PGUSER"),
  password = Sys.getenv("PGPASSWORD")
)

# Retrieves and displays all students
getAllStudents <- function() {
  students <- dbGetQuery(dbcon, "SELECT * FROM students")
  
  return(students)
}

# Adds a new student to the database
addStudent <- function(first_name, last_name, email, enrollment_date) {
  
  # Inserts new student into the students table
  result <- dbExecute(
    dbcon,
    "INSERT INTO students (first_name, last_name, email, enrollment_date)
     VALUES ($1, $2, $3, $4)",
    params = list(first_name, last_name, email, enrollment_date)
  )
  
  # Confirmation message
  print("Student successfully added.")
}

# Updates the email address of a student
updateStudentEmail <- function(student_id, new_email) {
  
  # Updates the student's email using their ID
  result <- dbExecute(
    dbcon,
    "UPDATE students
     SET email = $1
     WHERE student_id = $2",
    params = list(new_email, student_id)
  )
  
  # Checks whether a student was updated
  if (result > 0) {
    print("Student email successfully updated.")
  } else {
    print("No student found with that ID.")
  }
}

# Deletes a student from database
deleteStudent <- function(student_id) {
  
  # Deletes the student using their ID
  result <- dbExecute(
    dbcon,
    "DELETE FROM students
     WHERE student_id = $1",
    params = list(student_id)
  )
  
  # Checks whether a student was deleted
  if (result > 0) {
    print("Student successfully deleted.")
  } else {
    print("No student found with that ID.")
  }
}