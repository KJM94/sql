SELECT
 	c.fd_datetime as fd_datetime,
     c.fd_p_u as fd_p_u,
     c.fd_revenue as fd_revenue,
     d.fd_total as fd_total,
     ROUND(c.fd_p_u / d.fd_total, 4) as fd_p_u_r,
     ROUND(c.fd_revenue / d.fd_total, 2) as fd_a_r_p_u,
     ROUND(c.fd_revenue / c.fd_p_u, 2) as fd_a_r_p_p_u
 FROM
 (
 	SELECT
 		fd_datetime,
 		COUNT(*) as fd_p_u,
 		SUM(fd_price) as fd_revenue
 	FROM
     (
 		SELECT
 		fd_datetime,
         fd_member_i_d,
 		SUM(fd_price) as fd_price
 		FROM
 		ghostwar_bigquery.log_user_in_app_purchases
 		GROUP BY fd_datetime, fd_member_i_d
 	) as e
     GROUP BY fd_datetime
 ) as c
 INNER JOIN
 (SELECT fd_datetime, SUM(fd_total) as fd_total FROM ghostwar_bigquery.agg_user_sessions GROUP BY fd_datetime) as d
 ON c.fd_datetime = d.fd_datetime
