select sum(puProNum) from(select ao.id as id,
           s.shop_id as shopId,
           s.shop_url_id as shopUrlId,
           s.shop_name as shopName,
           (select sb.boothno from t_shop_booth sb where s.booth_id = sb.id) as boothNO,
           ao.user_id as userId,
           ao.createtime as createTime,
           ao.createuser as createUser,
           ao.publishtime as publishTime,
           ao.maturitytime as maturityTime,
           ao.totalprice as totalPrice,
           ao.serviceid as sellerid,
           so.real_name as sellerName,
           ou.name as operatorName,
           ao.type as type,
           ao.status as status,
           nvl(ao.pu_pro_num,0) as puProNum,
           ao.product_num as opProNum,
           nvl(ao.pu_op_pro_num,0) as puOpProNum,
           ao.operate_type as operateType,
           (select mu.credit_integrea
              from t_mm_user mu
             where mu.user_id = ao.user_id) as maxpronum,
           (select count(*) from T_SHOP_VISITLOG sv where sv.shopid=s.shop_id) as visitCount,
           ao.PAYER_USERID as payerUserid
      from t_shop s, t_ad_operating ao,t_sys_operator so,t_operating_user ou    
     where s.user_id = ao.user_id          
       and ao.user_id = s.user_id
       and ao.serviceid = so.login_name(+)
       and ao.operate_userid = ou.user_id(+)  
       and ao.type=4)t
