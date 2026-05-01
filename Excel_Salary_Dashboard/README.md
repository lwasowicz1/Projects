# Excel_Salary_Dashboard

<img width="1541" height="674" alt="Screenshot" src="https://github.com/user-attachments/assets/c1a55eb2-69a5-4130-9c6f-5ff4b358d832" />

## Project Overview 
This Data Salary Dashboard was created to empower job seekers with market insights, helping them evaluate compensation trends and ensure they are being adequately compensated for their target roles. 

The data used in this project is from an Excel course, which focuses on building a solid foundation for data analysis using this powerful tool. The data contains detailed information on job titles, locations, and essential skills that are presented here. 

## Dashboard File 
My final dashboard is located in [Data_Science_Salary_Dashboard](https://github.com/lwasowicz1/Projects/blob/main/Excel_Salary_Dashboard/Data_Science_Salary_Dashboard.xlsx)

## Excel Skills Used 
To build this interactive dashboard, I utilized several core Excel functionalities: 

* 📉 **Charts**
* 🧮 **Formulas and Functions**
* ❎ **Data Validation**

## About the Dataset 
This project is built upon a 2023 real-world data science job dataset. It includes detailed information on: 

* 🧍 **Job Titles**
* 💵 **Salaries**
* 🏙️ **Location**
* 🛠️ **Skills**

## Dashboard build
### 📉 Charts
📊 **Data Science Job Salaries - Bar Chart**

<img width="906" height="554" alt="Zapisz" src="https://github.com/user-attachments/assets/db3d2981-6088-433e-9285-d3660ec42d8a" />

* 🛠️ **Excel Features** – Integrated custom-formatted bar charts and streamlined layout to maximize visual clarity.
* 🎨 **Design Choice** – Implemented horizontal bar charts to faciliate a direct and intuitive comparison of median salaries.
* 📉 **Data Organization** – Applied sorting to job titles in descending order for improved readability.
* 💡 **Insights Gained** – This enables quick identification of salary trends, noting that Senior roles and Engineers are higher-paying than Analyst roles.

### 🌍 Country Median Salaries - Map Chart 
<img width="732" height="417" alt="Zapisz 2" src="https://github.com/user-attachments/assets/6b4600fc-b13d-454e-b31a-04830ad7c812" />

* 🛠️ **Excel Features** –  Utilized Excel's map chart feature to plot median salaries globally.
* 🎨 **Design Choice** –  Color-coded map for visual differrentation of salary levels across regions.
* 📊 **Data Representation** – Plotted median salary for each country with available data.
* 💡 **Insights Gained** –  Enables quick grasp of global salary disparities and highlights high/low salary regions.

## 🧮 Formulas and Functions 
### 💵 Median Salary by Job Titles
```
=MEDIAN(
IF(
    (jobs[job_title_short]=A2)*
    (jobs[job_country]=country)*
    (ISNUMBER(SEARCH(type,jobs[job_schedule_type])))*
    (jobs[salary_year_avg]<>0),
    jobs[salary_year_avg]
)
)
```
* 🔍 **Multi-Criteria Filtering** – Checks job title, country, schedule type, and excludes blank salaries.
* 📊 **Array Formula** – Utilizes MEDIAN() function with nested IF() statement to analyze an array.
* 🎯 **Tailored Insights** – Provides specific salary information for job titles, regions, and schedule types.
* 🔢 **Formula Purpose** – This formula populates the table below, returning the median salary based on job title, country, and type specified.

🍽️ Background Table
<img width="539" height="452" alt="Zapisz 3" src="https://github.com/user-attachments/assets/ee1072b4-e0b5-4ebd-a2a7-bfc8021809a0" />

📉 Dashboard Implementation
<img width="633" height="729" alt="Zapisz 4" src="https://github.com/user-attachments/assets/24773383-bd09-4e9e-a202-21504dd65ef7" />

## ⏰ Count of Job Schedule Type
```
=FILTER(J2#,(NOT(ISNUMBER(SEARCH("and",J2#))+ISNUMBER(SEARCH(",",J2#))))*(J2#<>0))
```
* 🔍 **Unique List Generation** – This Excel formula below employs the FILTER() function to exclude entries containing "and" or commas, and omit zero values.
* 🔢 **Formula Purpose** – This formula populates the table below, which gives us a list of unique job schedule types.

🍽️ Background Table
<img width="356" height="227" alt="Zapisz 5" src="https://github.com/user-attachments/assets/28ba4782-e34c-41bd-8cf7-e784090b05db" />

📉 Dashboard Implementation
<img width="617" height="767" alt="Zapisz 6" src="https://github.com/user-attachments/assets/9a23402a-7fb5-4610-a1c0-073777069a75" />

## ❎ Data Validation
### 🔍 Filtered List
* 🔒 **Enhanced Data Validation** –  Implementing the filtered list as a data validation rule under the Job Title, Country, and Type option in the Data tab ensures:
  * 🎯 User input is restricted to predefined, validated schedule types
  * 🚫 Incorrect or inconsistent entries are prevented
  * 👥 Overall usability of the dashboard is enhanced

# Conclusion 
I created this dashboard to showcase insights into salary trends across various data-related job titles. Utilizing data from an Excel course, this dashboard allows users to make informed decisions about their career paths. Exploring the functionalities to understand how location and job type influence salaries.










