SELECT product_name, year, price
FROM product p
JOIN sales s ON p.product_id = s.product_id
