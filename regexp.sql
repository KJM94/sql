select fd_datetime, fd_product_name, fd_top_name, sum(fd_price) as 'fd_price'
from log_user_in_app_purchases, tbl_product_name
group by fd_datetime, fd_product_name, fd_top_name
having fd_product_name regexp '패키지|번들' and fd_top_name like '%패키지' and fd_product_name not regexp '장비| 무기|크라운|스타터'
      or fd_product_name regexp '쥬얼' and fd_top_name like '%쥬얼' and fd_product_name not regexp '패키지|번들'
      or fd_product_name like '%스페셜패스%' and fd_top_name like '%스페셜패스' 
      or fd_product_name like '%스타터%' and fd_top_name like '%스타터'
      or fd_product_name REGEXP '장비|크라운| 무기' and fd_top_name like '%장비'
      or fd_product_name not regexp '패키지|쥬얼|스페셜패스|스타터|장비|크라운| 무기' and fd_top_name like '%기타'
      order by sum(fd_price) desc;
