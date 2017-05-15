
select s.shop_id,
       t1.createtime as createtime1,
       t2.paytime    as createtime2,
       t3.createtime as createtime3,
       t4.createtime as createtime4,
       t5.createtime as createtime5,
       t6.createtime as createtime6,
       t7.createtime as createtime7,
       t8.createtime as createtime8,
       t9.createtime as createtime9,
       t9.createtime as createtime10,
       t9.createtime as createtime11
       
  from t_shop s,
       (select shopid, max(smb.createtime) as createtime
          from T_SHOP_MARKET_BRAND smb
         where smb.shopid is not null
           and status = '2'
           and shopid is not null
           and serviceid = '8230'
         group by smb.shopid
        
        ) t1

  full join (select (select s.shop_id
                       from t_shop s
                      where s.user_id = au.USERID) as shopid,
                    max(au.paytime) as paytime
               from T_AD_INDUSTRY_USERS au
              where ispay = '1'
                and au.userid is not null
                and serviceid = '8230'
              group by au.userid) t2
    on t1.shopid = t2.shopid
  full join (select (select s.shop_id
                       from t_shop s
                      where s.user_id = ak.USER_ID) as shopid,
                    max(ak.createtime) as createtime
               from T_AD_KEYWORDS ak
              where ak.user_id is not null
                and status = '2'
                and serviceid = '8230'
              group by ak.user_id) t3
    on t2.shopid = t3.shopid
  full join (select akp.shopid, max(akp.createdate) as createtime
               from T_AD_KEYWORDS_PICTURE akp
              where akp.shopid is not null
                and status = '1'
              group by akp.shopid) t4
    on t3.shopid = t4.shopid
  full join (select (select s.shop_id
                       from t_shop s
                      where s.user_id = ao.USER_ID) as shopid,
                    max(ao.createtime) as createtime
               from t_ad_operating ao
              where ao.type = 2
                and ao.status = '1'
                and serviceid = '8230'
              group by ao.user_id) t5
    on t4.shopid = t5.shopid
  full join (select (select s.shop_id
                       from t_shop s
                      where s.user_id = ao.USER_ID) as shopid,
                    max(ao.createtime) as createtime
               from t_ad_operating ao
              where ao.type = 3
                and ao.status = '1'
                and serviceid = '8230'
              group by ao.user_id) t6
    on t5.shopid = t6.shopid
  full join (select (select s.shop_id
                       from t_shop s
                      where s.user_id = ao.USER_ID) as shopid,
                    max(ao.createtime) as createtime
               from t_ad_operating ao
              where ao.type = 4
                and ao.status = '1'
                and serviceid = '8230'
              group by ao.user_id) t7
    on t6.shopid = t7.shopid
   full join(select (select s.shop_id
                       from t_shop s
                      where s.user_id = av.USER_ID) as shopid,
                      max(av.createtime) as createtime
                       from t_ad_virtualshop av
        where  av.status=1
        and serviceid='8230'
        group by av.user_id)t8
        on t7.shopid=t8.shopid
   full join(select aio.shopid,
                      max(aio.createtime) as createtime
                       from T_AD_INDUSTRY_OTHER   aio
        where   serviceid='8230'
        group by aio.shopid)t9
        on t8.shopid=t9.shopid 
   full join(select aic.shopid,
                      max(aic.createtime) as createtime
                       from T_AD_INDUSTRY_CATEGORY    aic
        where   serviceid='8230'
        group by aic.shopid)t10
        on t9	.shopid=t10.shopid  
   full join(select (select s.shop_id
                       from t_shop s
                      where s.user_id = wes.USER_ID) as shopid,
                      max(wes.create_time) as createtime
                       from T_WEB_EXHIBITION_SHOP wes
        where   wes.operator_id='8230'
        group by wes.user_id)t11
        on t10.shopid=t11.shopid    
 where s.shop_id = t1.shopid
    or s.shop_id = t2.shopid
    or s.shop_id = t3.shopid
    or s.shop_id = t4.shopid
    or s.shop_id = t5.shopid
    or s.shop_id = t6.shopid
    or s.shop_id = t7.shopid
    or s.shop_id = t8.shopid
    or s.shop_id = t9.shopid
    or s.shop_id = t10.shopid
    or s.shop_id = t11.shopid
