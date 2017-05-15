select ao.productid as 商铺id,s.shop_name as 商铺名称,to_date(ao.createtime,'yyyy-mm-dd hh24:mi:ss') as 创建时间,
to_date(ao.PUBLISHTIME,'yyyy-mm-dd hh24:mi:ss') as 开始时间,
to_date(ao.maturitytime,'yyyy-mm-dd hh24:mi:ss') as 过期时间,
ao.totalprice/100 as 价格,
so.real_name as 客服
 from t_ad_operating ao,t_shop s,t_sys_operator so
 where type=5 and createuser='sys' and createtime>20160901000000 
 and s.shop_id=ao.productid
 and s.create_user=so.login_name
