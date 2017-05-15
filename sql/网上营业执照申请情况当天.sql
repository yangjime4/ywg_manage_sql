select (select  max(wm.market_name)
          from t_web_market wm
         where market_code = s.market_code
           and wm.market_name is not null) as ����,
           mul.id,
        (select so.real_name from t_sys_operator so where to_char(so.login_name)=s.create_user)as �ͷ�,
       s.shop_id as ����Id,
       (select sb.boothno from t_shop_booth sb where sb.id = s.booth_id) as ��λ��,
       s.shop_name as ��������,
       mul.createtime as ����ʱ��
  from t_mm_user_lessee mul, t_shop s
 where mul.user_id = s.user_id
   and mul.status = 1
   and mul.createtime > 20160629000000 and mul.createtime<20160630000000
   order by s.market_code,createtime
   
   
   
   

