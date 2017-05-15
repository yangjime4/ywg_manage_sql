select s.shop_id as 商铺id,s.shop_name as 商铺名称,to_date(operate_time,'yyyymmddhh24miss') as 操作时间
  from t_sys_log_new sln, t_shop s, t_shop_booth sb

 where operate_type = '/shop/manage/stopshopanduser'
   and operate_time > to_char(sysdate - 1, 'yyyymmddhh24miss')
   and operate_time < to_char(sysdate, 'yyyymmddhh24miss')
   and sln.object_id = s.shop_id
   and s.status != 1
   and s.booth_id = sb.id
   and sb.submarket in
       ('1001', '1003', '1004', '1006', '1007', '1008', '10011');


/*select * from log_shop_admin where describe like 'update shop set Status:1 to 7 where shopid =%'
   and time > to_char(sysdate - 1, 'yyyymmddhh24miss')
   and time < to_char(sysdate, 'yyyymmddhh24miss')*/
   
   

select so.real_name as 操作人,
       s.shop_name as 商铺名称,
       s.shop_id 商铺id,
       to_date(sln.operate_time, 'yymmddhh24miss') as 操作时间
  from t_sys_log_new sln, t_sys_operator so, t_shop s
 where operate_type = '/system/vipmanage'
   and operate_time > to_char(sysdate - 1, 'yyyymmddhh24miss')
   and operate_time < to_char(sysdate, 'yyyymmddhh24miss')
   and description like '%普通会员%'
   and so.login_name(+) = sln.operator_account
   and s.shop_id(+) = sln.object_id
