-- Create index on user.id (frequent JOIN/WHERE)
CREATE INDEX idx_user_id ON users(id);

-- Create index on bookings.user_id (frequent JOIN)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on bookings.property_id (frequent JOIN + aggregation)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on properties.id (frequent JOIN)
CREATE INDEX idx_property_id ON properties(id);
