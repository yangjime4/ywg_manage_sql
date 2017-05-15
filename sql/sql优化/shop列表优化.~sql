select t.SHOP_ID as shopId,
       t.USER_ID as userId,
       t.BOOTH_ID as boothId,
       t.SHOP_NAME as shopName,
       t.STATUS,
       t.CREATE_TIME as createTime,
       t.UPDATE_TIME as updateTime,
       t.signstatus,
       sb.boothno as boothno,
       sb.boothmodel,
       sb.submarket,
       (select tso.real_name
          from T_SYS_OPERATOR tso
         where tso.login_name = t.CREATE_USER) as createUser,
       (select tso.real_name
          from T_SYS_OPERATOR tso
         where tso.login_name = t.marketmanagerid) as marketAdministrator,
       (select tso.login_name
          from T_SYS_OPERATOR tso
         where tso.login_name = t.CREATE_USER) as createUserId,
       t.GENERATEDATE,
       t.boothids,
       (select wm.market_name
          from T_WEB_MARKET wm
         where wm.market_code = sb.submarket) as market,
       t.shop_url_id as shopurlid,
       sb.subfloor as floor,
       (select tu.login_id from T_MM_USER tu where tu.USER_ID = t.USER_ID) as loginId,
       t.slogan,
       (select twms.industry_name
          from t_web_market_industry twms
         where twms.industry_code = sb.subindustry) as industry,
       t.market_code as marketCode,
       (select ac.balance from T_FM_ACCOUNT ac where ac.USER_ID = t.USER_ID) as balance,
       (select tmp.license_no || '|' || tmp.commercialid
          from (select distinct tt.user_id as user_id,
                                tt.license_no,
                                tt.commercialid,
                                tt.updatetime as updatetime,
                                rank() over(partition by tt.user_id order by tt.updatetime desc) as rank
                  from t_mm_user_lessee tt
                 where tt.status = 1
                   and tt.user_type = 1) tmp
         where tmp.rank = 1
           and tmp.user_id = t.user_id) as licenseno,
       mu.credit_integrea as permission,
       swa.type as wechatShopStatus
  from T_SHOP t,
       T_SHOP_BOOTH sb,
       t_mm_user mu,
       (select * from t_shop_weixin_apply where type = 2) swa
 where t.booth_id = sb.id
   and t.market_code is not null
   and (t.market_code like '1%' or t.market_code like '2%')
   and mu.user_id(+) = t.user_id
   and swa.shop_id(+) = t.shop_id
   and t.shop_id in
      
       (select shop_Id
          from (select t.create_time, t.shop_id, rownum as ro
                  from t_shop t
                 where
                 not exists(select shop_id from t_shop_weixin_apply where type=2 and shop_id=t.shop_id)
                 
                 
                )
         where ro > 0
           and ro < 20
        
        )
 order by t.create_time desc
