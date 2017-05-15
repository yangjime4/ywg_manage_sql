select s.shop_id as shopId,
       s.shop_name as shopName,
       (select sb.boothno from t_shop_booth sb where s.booth_id = sb.id) as boothNO,
       (select wm.market_name from t_shop_booth sb,T_WEB_MARKET wm where s.booth_id = sb.id and sb.submarket = wm.submarket) as boothNO,
       ao.createtime as createTime,
       ao.publishtime as starttime,
       ao.maturitytime as endtime,
       so.real_name as sellerName,
       ao.product_num as opProNum,
       nvl(ao.pu_op_pro_num,0) as puOpProNum
  from t_shop s, t_ad_operating ao, t_sys_operator so, t_operating_user ou
 where s.user_id = ao.user_id
   and ao.user_id = s.user_id
   and ao.serviceid = so.login_name(+)
   and ao.operate_userid = ou.user_id(+)
   and ao.createtime >= '20160101000000'
   and ao.createtime < '20170503000000'
   and ao.status = '1'
   and ao.type = '2'
   and ao.is_finish=0
