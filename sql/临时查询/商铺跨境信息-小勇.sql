select mu.login_id as 商铺帐号,
       sb.boothno as 商位号,
       (select wm.market_name from t_web_market wm where wm.submarket=sb.SUBMARKET)||SUBFLOOR||'楼' as 商铺地址,
       s.contacter as 联系人,
       s.telephone as 联系电话,
       s.mobile as 手机,      
       ao.totalprice / 100 as 跨境收费金额
  from t_shop s, t_mm_user mu, t_ad_operating ao, t_shop_booth sb
 where s.user_id = mu.user_id
   and ao.productid = s.shop_id
   and s.booth_id = sb.id
order by sb.boothno
