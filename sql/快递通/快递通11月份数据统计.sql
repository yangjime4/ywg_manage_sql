select (select mu.login_id
          from t_mm_user mu
         where mu.user_id = ea.customer_userid) as 专员,
        ea.tracking_no as 快递单号, 
         (case ea.status when '4' then '付款'
           when '2' then '取件' end)as 状态,
         ea.fee/100 as 商户运费,
         ea.real_fee/100 as 实际运费,
         (case  when ea.real_fee is null then '无'
          else to_char((ea.forecast_price-ea.real_fee)/100) end)as 误差,
         ea.weight as 预估重量,
         ea.real_weight as 快递公司重量,
         to_date(ea.create_time,'yyyymmddhh24miss') as 时间
         
         
  from onccc.t_express_address ea
  where (ea.status=2 or ea.status=4) and (ea.create_time>20161101000000 and ea.create_time<20161201000000)
  order by 专员,ea.create_time desc
