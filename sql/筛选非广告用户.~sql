--建临时表
create table vipmanage_temp (user_id varchar2(20));
--临时数据插入表
insert into  vipmanage_temp
select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (SELECT 1
                      FROM T_SHOP_MARKET_BRAND smb
                     WHERE s.shop_id = smb.shopid)
            union
            select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (SELECT 1
                      FROM T_AD_KEYWORDS ak
                     WHERE s.user_id = ak.user_iD)
            union
            select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (SELECT 1
                      FROM ONCCC.T_AD_KEYWORDS_PICTURE akp
                     WHERE s.shop_id = akp.shopid)
            union
            select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (SELECT 1
                      FROM T_AD_OPERATING ao
                     WHERE s.shop_id = ao.productid)
            union
            select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (SELECT 1
                      FROM t_ad_virtualshop av
                     WHERE s.shop_id = av.productid)
            union
            select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (SELECT 1
                      FROM T_AD_INDUSTRY_CATEGORY aic
                     WHERE s.shop_id = aic.shopid)
            union
            select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (SELECT 1
                      FROM T_WEB_EXHIBITION_SHOP wes
                     WHERE s.user_id = wes.user_id)
            union
            select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (SELECT 1
                      FROM T_AD_INDUSTRY_OTHER aio
                     WHERE s.shop_id = aio.shopid)
            union
            select mu.user_id
              from t_mm_user mu, t_shop s
             where mu.user_type = 1
               and mu.status = 1
               and s.status = 1
               and s.market_code != 17
               and mu.user_id = s.user_id
               and (mu.credit_integrea is null or
                   mu.credit_integrea not like '%vip%')
               AND EXISTS (select 1
                      from T_AD_INDUSTRY_USERS aiu, t_product p
                     where aiu.productid = p.id
                       AND p.user_id = s.user_id)
                       and not exists(select 1 from t_shop_investigation si where s.shop_id = si.shopid);
--生成待处理商铺
insert into t_shop_investigation
  (shopid, generatedate, TYPE, SERVICEHANDLINGTIME)
  select *
    from (select s2.shop_id as shopid,
                 to_char(sysdate, 'yyyymmddhh24miss') as generatedate,
                 3 as type,
                 20161031120000 as SERVICEHANDLINGTIME
            from (select /*+index(mu,PK_T_MM_USERS)index(s,INDEX_SHOP_UID)index(sb,PK_T_SHOP_BOOTH)*/
                   mu.user_id as user_id, s.shop_id as shop_id
                    from t_mm_user mu, t_shop s, t_shop_booth sb
                   where mu.user_type = 1
                     and mu.status = 1
                     and s.status = 1
                     and s.market_code != 17
                     and mu.user_id = s.user_id
                     and s.booth_id = sb.id
                     and sb.boothno!='70289'
                     and sb.submarket in ('1001',
                                          '1003',
                                          '1004',
                                          '1006',
                                          '1007',
                                          '1008',
                                          '10011')
                     and (mu.credit_integrea is null or
                         mu.credit_integrea not like '%vip%')
                  and s.shop_id not in  (select shopid from t_shop_investigation)
                  ) s2
           where
          
           s2.user_id not in (select user_id from vipmanage_temp)
           order by dbms_random.random)
   where rownum < 2001;
           
--清理临时表
delete from  vipmanage_temp;
drop table vipmanage_temp;
