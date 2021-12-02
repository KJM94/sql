# sql

create temporary table tbl_product_name(
    fd_top_name varchar(255)
);

superset sql lab error - why??????????

이런 짧은 구문에서 실수가 있을리 없는데 검색해봐도 오류가 안나옴 구문 오류는 절대 아님 data grip에선 작동하기 때문

의심1 - superset의 mysql 버전?? (어떻게 확인해야 할까)

- version 8.0 버전의 문제는 아니라 판단. 

??????

Only `SELECT` statements are allowed against this database

You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'create temporary table tbl_product_name( fd_top_name varchar(255) ) LIMIT 10' at line 3

This may be triggered by:
Issue 1002 - The database returned an unexpected error.

데이터베이스에 오류가 있거나 쿼리 버그 등 이유가 있을 수 있다고 하는 내용

원인 - superset에서 temporary 쿼리를 지원하지 않거나 버그가 발생한 것이 아니라 select 쿼리만 지원되는 것 때문

Only `SELECT` statements are allowed against this database - 이 데이터베이스에는 `SELECT` 문만 허용됩니다.

superset 계정의 권한이 없다고 판단하였으나 해당 계정은 admin 권한을 갖고 있음.

??????????????????????
