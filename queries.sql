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
