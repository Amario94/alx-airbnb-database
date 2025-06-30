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

-- Create the "users" table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100),
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the "properties" table
CREATE TABLE properties (
  id SERIAL PRIMARY KEY,
  owner_id INTEGER NOT NULL,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  location VARCHAR(255) NOT NULL,
  price_per_night NUMERIC(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (owner_id) REFERENCES users(id)
);

-- Create the "bookings" table
CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  property_id INTEGER NOT NULL,
  check_in_date DATE NOT NULL,
  check_out_date DATE NOT NULL,
  total_price NUMERIC(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (property_id) REFERENCES properties(id)
);

-- Create the "reviews" table
CREATE TABLE reviews (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL,
  property_id INTEGER NOT NULL,
  rating INTEGER CHECK (rating BETWEEN 1 AND 5),
  comment TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (property_id) REFERENCES properties(id)
);

-- Indexes for performance

-- Quickly look up users by email
CREATE INDEX idx_users_email ON users(email);

-- Speed up property search by location
CREATE INDEX idx_properties_location ON properties(location);

-- Optimize lookup of bookings by user
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Optimize lookup of bookings by property
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Speed up review lookup by property
CREATE INDEX idx_reviews_property_id ON reviews(property_id);



