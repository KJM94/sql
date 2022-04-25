SELECT
a.*,
b.fd_total as fd_total
FROM
(SELECT * FROM ghostwar_bigquery.agg_in_app_purchases) as a INNER JOIN
(SELECT * FROM ghostwar_bigquery.agg_user_sessions) as b ON a.fd_date = b.fd_date AND a.fd_country = b.fd_country
