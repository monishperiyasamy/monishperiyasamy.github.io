use techForAllWithMonish;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT
);
INSERT INTO orders (order_id, order_date, customer_id, product_id) VALUES
(1, '2020-07-31', 1, 1),
(2, '2020-07-30', 2, 2),
(3, '2020-08-29', 3, 3),
(4, '2020-07-29', 4, 1),
(5, '2020-06-10', 1, 2),
(6, '2020-08-01', 2, 1),
(7, '2020-08-01', 3, 3),
(8, '2020-08-03', 1, 2),
(9, '2020-09-07', 2, 3),
(10, '2020-07-15', 1, 2);
-- The Most Frequently Ordered Products for Each Customer--
select customer_id,product_id,Total from
(select customer_id, product_id, count(*) as total ,
dense_rank() over( partition by customer_id order by count(*) desc) as FrequentProduct
FROM orders
GROUP BY customer_id, product_id) as Temp
where FrequentProduct=1
order by  customer_id, product_id;






