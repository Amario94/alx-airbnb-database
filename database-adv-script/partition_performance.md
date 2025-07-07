# Partition Performance Report

## Goal
To improve query speed by splitting the `bookings` table into smaller partitions based on the `start_date` year.

## What I Did
- Created a partitioned `bookings` table using `RANGE` on the `start_date` column.
- Created partitions for 2022 to 2025.

## Expected Result
When querying by date range (e.g. March 2024), the database should only search in the 2024 partition, making it faster.

## Challenge
I couldn't test the query locally because MySQL/PostgreSQL is not installed. But the SQL has been written and saved correctly.

## Recommendation
Partitioning is helpful when working with very large tables to improve performance.
