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

