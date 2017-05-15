select t.SHOP_ID     as shopId,
       t.USER_ID     as userId,
       t.BOOTH_ID    as boothId,
       t.SHOP_NAME   as shopName,
       t.STATUS,
       t.CREATE_TIME as createTime,
       t.UPDATE_TIME as updateTime,
       t.signstatus,
       sb.boothno    as boothno,
       sb.boothmodel,
       


       t.GENERATEDATE,
       t.boothids,
       t.INTEGRITYSTATUS,
       t.translatestatus as translateStatus,

       t.shop_url_id as shopurlid,
       sb.subfloor as floor,

       t.slogan,



  from T_SHOP t, T_SHOP_BOOTH sb, T_SHOP_BACKMATTER back
 where t.booth_id = sb.id
   and t.shop_id = back.shopid
   and t.market_code is not null
   and (t.market_code like '1%' or t.market_code like '2%')
    
