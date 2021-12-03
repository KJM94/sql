select fd_datetime, fd_product_name, fd_top_name, fd_price
from log_user_in_app_purchases, tbl_product_name
group by fd_datetime, fd_product_name, fd_top_name, fd_price
having fd_product_name like '%패키지' and fd_top_name like '%패키지'
      or fd_product_name like '%확정권' and fd_top_name like '%확정권'
