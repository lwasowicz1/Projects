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
### Key Formula Used
Below is the main formula used for data calculation in the dashboard:
```excel
=SUMIFS(C2:C100, A2:A100, "Data Analyst", B2:B100, "Senior")



