-- Get users who have made more than 2 bookings
SELECT *
FROM users
WHERE id IN (
    SELECT user_id
    FROM bookings
    GROUP BY user_id
    HAVING COUNT(*) > 2
);
-- Find users who have made more than 3 bookings (correlated subquery)
SELECT *
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
