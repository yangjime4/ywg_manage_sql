select mu.login_id as �����ʺ�,
       sb.boothno as ��λ��,
       (select wm.market_name from t_web_market wm where wm.submarket=sb.SUBMARKET)||SUBFLOOR||'¥' as ���̵�ַ,
       s.contacter as ��ϵ��,
       s.telephone as ��ϵ�绰,
       s.mobile as �ֻ�,      
       ao.totalprice / 100 as �羳�շѽ��
  from t_shop s, t_mm_user mu, t_ad_operating ao, t_shop_booth sb
 where s.user_id = mu.user_id
   and ao.productid = s.shop_id
   and s.booth_id = sb.id
order by sb.boothno
