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
       t.INTEGRITYSTATUS,
       t.translatestatus as translateStatus,
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
       (select back.viplevel
          from T_SHOP_BACKMATTER back
         where t.shop_id = back.shopid) as viplevel,
       t.market_code as marketCode,
       (select ac.balance from T_FM_ACCOUNT ac where ac.USER_ID = t.USER_ID) as balance
  from T_SHOP t, T_SHOP_BOOTH sb
 where t.booth_id = sb.id
      
   and t.market_code is not null
   and (t.market_code like '1%' or t.market_code like '2%')
