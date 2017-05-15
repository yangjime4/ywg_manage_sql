select sb.boothno as 店面号,s.shop_name as 商铺名称,to_date(firstTime,'yyyymmddhh24miss')首次使用时间
  from (select ea.sender_userid as userId, min(ea.create_time) as firstTime
          from t_express_address ea
         group by (ea.sender_userid))t,t_shop s,t_shop_booth sb,t_mm_user mu
 where  s.user_id=t.userid
 and s.booth_id=sb.id
 and t.userid= mu.user_id
 order by firstTime asc
