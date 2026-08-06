/*Find total sales for each month.

Business Question

Are sales increasing over time?*/

SELECT
     extract(YEAR FROM sales.Delivery_Date) as year,
     extract(MONTH FROM sales.Delivery_Date) as monthy,
     sum(sales.quantity * products.Unit_Price_USD) as monthly_revenue
FROM
     products
JOIN sales on
     products.ProductKey = sales.ProductKey
JOIN exchange_rates ON
     sales.Order_Date = exchange_rates.Date
GROUP BY
     monthy,
     year
HAVING
     monthy is NOT NULL
ORDER BY
     monthy ASC;

     
    




    