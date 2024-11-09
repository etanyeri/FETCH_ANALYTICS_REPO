# FETCH_ANALYTICS_REPO
Fetch Rewards coding exercise, focusing on using Snowflake, dbt, terraform and SQL

## Overview
This project creates a **Data Mart** with a focus on transactional data (receipts, users, products) for business intelligence and reporting. It includes transforming raw transactional data into structured tables suitable for analysis. The goal is to provide a solid foundation for reporting by organizing transactional data into **fact** and **dimension** tables, with a key focus on **Receipts** and **Receipt Items**.

## Features

- **Receipts Table**: Stores information about each receipt.
- **Receipt Items Table**: Stores details about each purchased item in the receipt.
- **User Table**: Information related to the user who made the purchase.
- **Brand Table**: Information related to products purchased.

## Project Structure

- `factReceiptItems.sql`: The SQL file responsible for generating the **Receipt Items** table with surrogate keys and transformed data from nested structures.
- `factReceipts.sql`: Contains SQL to generate the **Receipts** table by aggregating receipt-level information.
- `dimBrand.sql and dimUser.sql`: Contains SQL to generate the **brands and users** tables by aggregating relevant information.

