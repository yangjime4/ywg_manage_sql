select 
(select mu.login_id from t_mm_user mu where mu.user_id=ea.customer_userid) as 收件员,
ea.tracking_no as 快递单号,
(case ea.status when '2' then '取件' when '4' then '付款' end )as 状态,
ea.fee/100 as 商户运费,
to_date(ea.receive_time,'yyyymmddhh24miss') as 取件时间
 from onccc.t_express_address ea
 where ea.receive_time>20161001000000 and ea.receive_time<20161101000000
 
 and（ ea.status=2 or ea.status=4）
 order by ea.customer_userid,ea.receive_time desc
