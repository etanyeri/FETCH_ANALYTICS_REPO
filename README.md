# FETCH_ANALYTICS_REPO
Fetch Rewards coding exercise, focusing on using Snowflake, dbt, and SQL

## Overview
This project creates a **Data Mart** with a focus on transactional data (receipts, users, products) for business intelligence and reporting. It includes transforming raw transactional data into structured tables suitable for analysis. The goal is to provide a solid foundation for reporting by organizing transactional data into **fact** and **dimension** tables, with a key focus on **Receipts** and **Receipt Items**.

## Features

- **Receipts Table**: Stores information about each receipt.
- **Receipt Items Table**: Stores details about each purchased item in the receipt.
- **User Table**: Information related to the user who made the purchase.
- **Product Table**: Information related to products purchased.

## Project Structure

- `fact_receipt_items.sql`: The SQL file responsible for generating the **Receipt Items** table with surrogate keys and transformed data from nested structures.
- `fact_receipts.sql`: Contains SQL to generate the **Receipts** table by aggregating receipt-level information.
- `models/`: Directory for all SQL transformation models.
- `sources/`: Contains source files linking to raw input data, such as the `receipts` data.
