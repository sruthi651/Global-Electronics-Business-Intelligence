/*Find customers who haven't purchased anything in the last 6 months.

Business Question

Which customers should receive a re-engagement campaign?
*/
SELECT
    customers.CustomerKey,
    customers.Name AS customer_name,
    MAX(sales.Order_Date) AS last_purchase_date
FROM customers 
JOIN sales 
    ON customers.CustomerKey = sales.CustomerKey
GROUP BY
    customers.CustomerKey,
    customers.Name
HAVING
    last_purchase_date < DATE_SUB(
        (SELECT MAX(Order_Date) FROM sales),
        INTERVAL 6 MONTH
    )
ORDER BY
    last_purchase_date;