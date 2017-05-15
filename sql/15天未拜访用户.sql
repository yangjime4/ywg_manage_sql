select shopid,0 as visittime,''as memo from(
  select shopid from(
  select shopid from T_SHOP_MARKET_BRAND where serviceid=#serviceId# and shopid is not null
  union
  select to_char(s.shop_id) as shopid from T_AD_INDUSTRY_USERS aiu,t_shop s where aiu.userid=s.user_id and serviceid=#serviceId# 
  union
  select to_char(s.shop_id)as shopid from T_AD_KEYWORDS ak,t_shop s where ak.user_id=s.user_id and serviceid=#serviceId#
  union
  select shopid from t_ad_keywords_picture where serviceid=#serviceId# and shopid is not null
  union
  select productid as shopip from t_ad_operating where serviceid=#serviceId#
  union
  select productid as shopip from t_ad_virtualshop where serviceid=#serviceId#
  union
  select shopid from T_AD_INDUSTRY_OTHER  where serviceid=#serviceId# and shopid is not null
  union
  select shopid from T_AD_INDUSTRY_CATEGORY where serviceid=#serviceId# and shopid is not null
  union
  select  to_char(s.shop_id)as shopid from T_WEB_EXHIBITION_SHOP wes,t_shop s where wes.user_id=s.user_id and operator_id=#serviceId#)t
  Minus 
  select to_char(shopid) from t_shop_visitlog
  )

union

select t.shopid, t.visittime,(select memo from t_shop_visitlog sv where sv.visittime=t.visittime) as memo 
  from (select to_char(shopid)as shopid, max(visittime) as visittime
          from t_shop_visitlog
         where userid = #serviceId#
         group by shopid) t
 where t.visittime < to_char(sysdate - 15, 'yyyymmddhh24miss')
