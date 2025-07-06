-- Get users who have made more than 2 bookings
SELECT *
FROM users
WHERE id IN (
    SELECT user_id
    FROM bookings
    GROUP BY user_id
    HAVING COUNT(*) > 2
);
