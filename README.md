# Entity-Relationship Diagram (ERD) for ALX Airbnb Database

## Entities and Attributes

### 1. User
- id (PK)
- first_name
- last_name
- email
- password
- created_at
- updated_at

### 2. Property
- id (PK)
- owner_id (FK → User)
- name
- description
- location
- price_per_night
- created_at
- updated_at

### 3. Booking
- id (PK)
- user_id (FK → User)
- property_id (FK → Property)
- check_in_date
- check_out_date
- total_price
- created_at
- updated_at

### 4. Review
- id (PK)
- user_id (FK → User)
- property_id (FK → Property)
- rating
- comment
- created_at

## Relationships

- User 1:N Property (One user can list multiple properties)
- User 1:N Booking (One user can make many bookings)
- Property 1:N Booking (One property can be booked many times)
- User 1:N Review (One user can review many properties)
- Property 1:N Review (One property can have many reviews)

## ER Diagram

_See the attached ERD diagram image in this folder (![image](https://github.com/user-attachments/assets/f4096fa2-374f-4877-8718-b297aef2d199)
)_

# Database Normalization to 3NF

This document explains how the database design for the ALX Airbnb project satisfies the requirements of Third Normal Form (3NF).

## First Normal Form (1NF)

- Each table contains atomic values (no repeating groups).
- Every field holds only a single value.
- Example: In the `User` table, names and emails are stored as individual values.

## Second Normal Form (2NF)

- The design meets 1NF.
- All non-primary key attributes are fully dependent on the entire primary key.
- Each table has a single-column primary key, so full dependency is maintained.
- Example: In the `Booking` table, fields like `check_in_date` and `total_price` depend entirely on the `id`.

## Third Normal Form (3NF)

- The design meets 2NF.
- There are no transitive dependencies.
- All non-key fields depend only on the primary key and not on other non-key fields.
- Example: In the `Property` table, `location` and `price_per_night` depend directly on `id` and not on another field like `name`.

## Conclusion

After analysis, the database schema satisfies all conditions for 3NF. Each entity is properly normalized to reduce redundancy and improve data integrity.

No redesign was required as the schema was modeled using best practices from the start.


