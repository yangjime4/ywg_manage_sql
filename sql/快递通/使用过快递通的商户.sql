select sb.boothno as �����,s.shop_name as ��������,to_date(firstTime,'yyyymmddhh24miss')�״�ʹ��ʱ��
  from (select ea.sender_userid as userId, min(ea.create_time) as firstTime
          from t_express_address ea
         group by (ea.sender_userid))t,t_shop s,t_shop_booth sb,t_mm_user mu
 where  s.user_id=t.userid
 and s.booth_id=sb.id
 and t.userid= mu.user_id
 order by firstTime asc
