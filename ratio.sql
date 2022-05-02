SELECT
a.fd_product_name as fd_product_name, ROUND(a.sales / b.total, 4) * 100 as fd_percent
FROM
(SELECT fd_product_name, SUM(fd_price) as sales 
FROM ghostwar_bigquery.log_user_in_app_purchases
GROUP BY fd_product_name) as a,
(SELECT SUM(fd_price) as total
FROM ghostwar_bigquery.log_user_in_app_purchases) as b;
