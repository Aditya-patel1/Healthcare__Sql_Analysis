# 🏥 Healthcare Database Analysis (SQL)

## 📌 Project Overview

The **Healthcare Database Analysis** project is designed to analyze healthcare data using SQL. It demonstrates how relational databases can be used to manage information about doctors, patients, departments, and appointments while generating meaningful insights through SQL queries.

This project focuses on data retrieval, filtering, aggregation, joins, subqueries, and window functions.

## 🎯 Project Objectives

- Design and create a relational healthcare database.
- Manage doctor, patient, department, and appointment records.
- Analyze doctor salaries and professional experience.
- Calculate patient statistics by city and gender.
- Generate appointment reports using SQL joins.
- Practice advanced SQL concepts for data analysis.

## 🛠️ Technologies Used

- **SQL** — Database querying and analysis
- **MySQL 8.0+** — Database management
- **Relational Database Concepts** — Tables, primary keys, and foreign keys

## 🗂️ Database Structure

The project contains four main tables:

| Table | Description |
|---|---|
| `Departments` | Stores department names and floor numbers. |
| `Doctors` | Stores doctor details, experience, department IDs, and salaries. |
| `Patients` | Stores patient information, age, gender, city, and phone number. |
| `Appointments` | Stores appointment dates, doctor IDs, patient IDs, and appointment statuses. |

### Database Relationships

- Each doctor belongs to a department.
- Each appointment is associated with a doctor.
- Each appointment is associated with a patient.
- Primary and foreign keys maintain relationships between tables.

## 📚 SQL Concepts Covered

### 1. Database and Table Creation
- `CREATE DATABASE`
- `CREATE TABLE`
- Primary keys and foreign keys

### 2. Data Manipulation
- `INSERT INTO`
- Inserting sample healthcare records

### 3. Data Retrieval and Filtering
- `SELECT`
- `WHERE`
- `ORDER BY`

### 4. Aggregate Functions
- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`

### 5. Grouping and Filtering Groups
- `GROUP BY`
- `HAVING`

### 6. SQL Joins
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- Full outer join simulation using `UNION`

### 7. Subqueries
- Finding doctors with the highest salary
- Identifying doctors earning above the average salary
- Calculating the average number of appointments per doctor

### 8. Window Functions
- `RANK()`
- `DENSE_RANK()`
- `ROW_NUMBER()`

## 💡 Key Analysis Examples

This project demonstrates how to:

- Find doctors earning above a specified salary.
- Identify doctors with more than 10 years of experience.
- Calculate the average salary by department.
- Count patients by city and gender.
- Identify departments with multiple doctors.
- Analyze appointment counts by status.
- Generate doctor-wise appointment reports.
- Rank doctors according to their salaries.
- Identify the highest-paid doctor.

## ⚙️ How to Run the Project

### Prerequisites

Install MySQL 8.0 or later and use a SQL client such as MySQL Workbench.

### Steps

**1. Clone the repository**

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

**2. Navigate to the project folder**

```bash
cd healthcare-database-analysis
```

**3. Open your SQL script**

Open the project SQL file in MySQL Workbench.

**4. Execute the script**

Run the SQL statements in order to:

1. Create the database.
2. Create the four tables.
3. Insert sample data.
4. Execute the analysis queries.

**5. Explore the results**

Run individual queries to explore healthcare records and practice SQL data analysis.

## 📁 Project Structure

```text
healthcare-database-analysis/
│
├── README.md
└── healthcare_analysis.sql
```

*Note: Rename `healthcare_analysis.sql` in this example to match your actual SQL filename.*

## 🎓 Learning Outcomes

Through this project, I explored:

- Relational database design
- SQL query writing and optimization fundamentals
- Data aggregation and grouping
- Joining multiple tables
- Subqueries and analytical queries
- Window functions and ranking
- Extracting insights from structured data

## 🚀 Future Enhancements

- Create interactive healthcare dashboards using Power BI.
- Connect the database to Python for further analysis.
- Perform appointment trend analysis.
- Develop reports on department-wise performance.
- Add more advanced analytical queries.

