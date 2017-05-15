select 
           s.shop_name as shopName,
           (select sb.boothno from t_shop_booth sb where s.booth_id = sb.id) as boothNO,
           ao.user_id as userId,
           ao.createtime as createTime,
           ao.publishtime as publishTime,
           ao.maturitytime as maturityTime,
           ao.totalprice/100 as totalPrice,
           so.real_name as sellerName,
           ao.product_num as 代运营产品数,
           nvl(ao.pu_op_pro_num,0) as 已发代运营产品数
      from t_shop s, t_ad_operating ao,t_sys_operator so,t_operating_user ou    
     where s.user_id = ao.user_id          
       and ao.user_id = s.user_id
       and ao.serviceid = so.login_name(+)
       and ao.operate_userid = ou.user_id(+)
       
       
       and ao.type=2
       and ao.createtime>20160100000000
