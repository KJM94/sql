select fd_datetime, fd_product_name, fd_top_name, sum(fd_price) as 'fd_price'
from log_user_in_app_purchases, tbl_product_name
group by fd_datetime, fd_product_name, fd_top_name
having fd_product_name like '%패키지%' and fd_top_name like '%패키지' 
      or fd_product_name like '%확정권' and fd_top_name like '%확정권' 
      or fd_product_name like '%쥬얼' and fd_top_name like '%쥬얼'
      or fd_product_name like '%패스%' and fd_top_name like '%패스' 
      or fd_product_name like '%코인' and fd_top_name like '%코인'
      or fd_product_name like '%캡슐' and fd_top_name like '%캡슐' 
      order by sum(fd_price) desc;
