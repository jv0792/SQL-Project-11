# SQL-Project-11
### *SQL Project - Pizza Data Analysis*

**Overview:**
Pizza is a popular choice for meals, especially after a long week of work. This interest prompted me to explore the most in-demand or popular pizzas. This SQL project demonstrates my data analysis skills using Microsoft SQL Server to analyze pizza order data and identify trends in pizza preferences.

Dataset Source:
The dataset used for this project was obtained from Kaggle. Here is the link to access the dataset: Pizza Sales Dataset (https://www.kaggle.com/datasets/nextmillionaire/pizza-sales-dataset)


**Description of Business Problem:**
The primary objective of this project was to gain insights into pizza sales and operations, aiming to optimize performance by analyzing data related to orders, revenue, popular pizza categories, and best-selling pizzas.


**What I Did:**

Initially, the dataset was a single flat file downloaded from Kaggle. To prepare the data for analysis, I conducted several data wrangling steps:

1.  Splitting the dataset into two separate CSV files using indexing techniques.
2.  Importing the split files into Microsoft SQL Server for further analysis.
3.  Performing data type transformations within SQL Server to ensure data consistency.
4.  Conducting checks for NULL values and setting primary keys for the two main tables used in the analysis, linked by the common column "pizza_id".

For the data analysis phase, I focused on understanding key performance indicators (KPIs) within the dataset, including total revenue, average order value, and total number of pizzas sold. These insights were essential for evaluating pizza sales trends and making informed business decisions based on data-driven analysis.


**​What I Learned:**

1.  Based on the top 5, first 3 Pizzas were - Chicken, followed by Classic and Supreme for the year of 2015.
2.  Total number of Pizzas sold were mostly on Sundays.
3.  On hourly basis it could be most number of orders of pizza happens during hours 12:00 to 13:00 hr, which is mostly the lunch time, and the next highest is seen after          office hours or mainly evening from 17:00 to 19:00 hrs
​
