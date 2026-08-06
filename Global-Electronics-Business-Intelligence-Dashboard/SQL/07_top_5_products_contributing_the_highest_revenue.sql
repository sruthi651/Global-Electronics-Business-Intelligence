--Find the top 5 products contributing the highest revenue

SELECT 
      sales.ProductKey,
      products.Product_Name,
      round(sum(sales.Quantity * products.Unit_Price_USD),0) as cost
FROM
     sales
JOIN products ON
     sales.ProductKey = products.ProductKey
GROUP BY
     sales.ProductKey,
      products.Product_Name
ORDER BY
     cost DESC
LIMIT 5;