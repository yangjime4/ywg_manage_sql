select 


wm.market_name,
sb.boothno,
sb.boothmodel,
so.real_name
 from t_shop_booth sb,
 t_web_market wm,
 t_shop s,
 t_sys_operator so
 
  where (MARKET_DOOR is null or market_street is null) and sb.submarket in('1001',
                                          '1003',
                                          '1004',
                                          '1006',
                                          '1007',
                                          '1008',
                                          '10011')
  and sb.submarket=wm.submarket
  and s.booth_id(+)=sb.id
  and so.login_name(+)=s.create_user
  
  

