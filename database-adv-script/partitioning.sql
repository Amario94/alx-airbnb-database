-- Drop the table if it exists
DROP TABLE IF EXISTS bookings;

-- Create a partitioned bookings table using RANGE on start_date
CREATE TABLE bookings (
    id INT NOT NULL,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50),
    PRIMARY KEY (id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026)
);

