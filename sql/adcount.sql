select so.real_name as sellerName,
       t1.loginName,
       t1.smbSum,
       t2.indSum,
       t11.akSum,
       t3.akpSum,
       t4.operatingSum,
       t5.ywbAoSum,
       t6.licenseSum,
       t7.virtualSum,
       t8.otherSum,
       t9.categorySum,
       t10.wesSum,
       (t1.smbSum + t11.akSum + t2.indSum + t3.akpSum + t4.operatingSum +
       t5.ywbAoSum + t6.licenseSum + t7.virtualSum + t8.otherSum +
       t9.categorySum + t10.wesSum) as totalSum
  from (select so.login_name as loginName, sum(nvl(smb.price, 0)) as smbSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select * from T_SHOP_MARKET_BRAND
         ) smb
            on smb.serviceid = so.login_name
         group by so.login_name) t1,
       (select so.login_name as loginName,
               sum(nvl(ind.totalprice, 0)) as indSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select t.totalprice, t.serviceid
                      from T_AD_INDUSTRY_USERS t, T_WEB_MARKET_INDUSTRY mi
                     where t.subindustry = mi.industry_code
                       and t.market_code = '10'
                       
            ) ind
            on so.login_name = ind.serviceid
         group by so.login_name) t2,
       (select so.login_name as loginName,
               sum(nvl(akp.totalprice, 0)) as akpSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select * from T_AD_KEYWORDS_PICTURE
           ) akp
            on so.login_name = akp.serviceid
         group by so.login_name) t3,
       (select so.login_name as loginName,
               sum(nvl(ao.totalprice,0)) as operatingSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select ao.totalprice, ao.serviceid
                      from t_ad_operating ao
                     where ao.type = 2
         ) ao
            on so.login_name = ao.serviceid
         group by so.login_name) t4,
       (select so.login_name as loginName,
               sum(nvl(ywbao.totalprice, 0)) as ywbAoSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select ao.totalprice, ao.serviceid
                      from t_ad_operating ao
                     where ao.type = 4
                    ) ywbao
            on so.login_name = ywbao.serviceid
         group by so.login_name) t5,
       (select so.login_name as loginName,
               sum(nvl(license.totalprice,0)) as licenseSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select ao.totalprice, ao.serviceid
                      from t_ad_operating ao
                     where ao.type = 3
                   ) license
            on so.login_name = license.serviceid
         group by so.login_name) t6,
       (select so.login_name as loginName,
               sum(nvl(av.totalprice, 0)) as virtualSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select av.totalprice, av.serviceid
                      from t_ad_virtualshop av
                     where av.shoptype = 0
            ) av
            on so.login_name = av.serviceid
         group by so.login_name) t7,
       (select so.login_name as loginName,
               sum(nvl(aio.income, 0)) * 100 as otherSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select * from T_AD_INDUSTRY_OTHER
            ) aio
            on so.login_name = aio.serviceid
         group by so.login_name) t8,
       (select so.login_name as loginName,
               sum(nvl(aic.income, 0)) * 100 as categorySum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select * from T_AD_INDUSTRY_CATEGORY
             )aic
            on so.login_name = aic.serviceid
         group by so.login_name) t9,
       (select so.login_name as loginName, sum(nvl(wes.price, 0)) as wesSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select * from T_WEB_EXHIBITION_SHOP
          ) wes
            on so.login_name = wes.OPERATOR_ID
         group by so.login_name) t10,
       (select so.login_name as loginName,
               sum(nvl(ak.totalprice, 0)) as akSum
          from (select so.login_name
                  from t_sys_operator so
                 where so.department_id = '53') so
          left join (select * from T_AD_KEYWORDS
           ) ak
            on so.login_name = ak.serviceid
         group by so.login_name) t11,
         t_sys_operator so
 where t1.loginName = t2.loginName
   and t1.loginName = t2.loginName
   and t2.loginName = t3.loginName
   and t3.loginName = t4.loginName
   and t4.loginName = t5.loginName
   and t5.loginName = t6.loginName
   and t6.loginName = t7.loginName
   and t7.loginName = t8.loginName
   and t8.loginName = t9.loginName
   and t9.loginName = t10.loginName
   and t10.loginName = t11.loginName
   and t1.loginName=so.login_name
