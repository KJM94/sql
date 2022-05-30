SELECT
  ghostwar_bigquery.log_nur_npu.pri_id,
  ghostwar_bigquery.log_nur_npu.fd_first_buy,
  ghostwar_bigquery.log_nur_npu.fd_first_login,
  DATEDIFF(fd_first_buy, fd_first_login) AS date_difference,
  DATEDIFF(fd_first_buy, fd_first_login) + 1 AS days_inclusive
FROM ghostwar_bigquery.log_nur_npu;
