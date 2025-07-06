# Index Performance Report

## Identified High-Usage Columns

- users.id (used in WHERE and JOIN conditions)
- bookings.user_id (used in JOINs and WHERE)
- bookings.property_id (used in JOINs and GROUP BY)
- properties.id (used in JOINs)

## Indexes Created

```sql
CREATE INDEX idx_user_id ON users(id);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_property_id ON properties(id);
