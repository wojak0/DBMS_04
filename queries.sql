-- Query 5a: List all work items for 'Berger, Franz'
SELECT 
    o.order_no, 
    o.date, 
    v.plate, 
    wi.description, 
    wi.hours
FROM customer c
JOIN "order" o    ON c.cust_no = o.cust_no
JOIN vehicle v    ON o.plate = v.plate
JOIN work_item wi ON o.order_no = wi.order_no
WHERE c.cust_name = 'Berger, Franz'
ORDER BY o.date ASC, wi.item_no ASC;
-- Query 5b: Total Hours per Mechanic in March 2026
SELECT 
    m.mech_name, 
    ROUND(SUM(wi.hours), 1) AS total_hours, 
    COUNT(DISTINCT wi.order_no) AS orders
FROM mechanic m
JOIN work_item wi ON m.mech_id = wi.mech_id
JOIN "order" o     ON wi.order_no = o.order_no
WHERE o.date BETWEEN '2026-03-01' AND '2026-03-31'
GROUP BY m.mech_id
ORDER BY total_hours DESC;
-- Query 5c-1: Using EXCEPT (Set Difference)
SELECT plate, model FROM vehicle
EXCEPT
SELECT v.plate, v.model 
FROM vehicle v 
JOIN "order" o ON v.plate = o.plate;

-- Query 5c-2: Using NOT EXISTS (Correlated Subquery)
SELECT v.plate, v.model 
FROM vehicle v
WHERE NOT EXISTS (
    SELECT 1 
    FROM "order" o 
    WHERE o.plate = v.plate
);
