select sb.boothno as 摊位号,s.shop_name as 商铺名称,

'高级会员' as 会员,
t.商品数,
so.real_name as 客服姓名
from(
select count(t1.user_id)as 商品数,t2.user_id as user_id from (
select * from onccc.t_product_0 union all
select * from onccc.t_product_1 union all
select * from onccc.t_product_2 union all
select * from onccc.t_product_3 union all
select * from onccc.t_product_4 union all
select * from onccc.t_product_5 union all
select * from onccc.t_product_6 union all
select * from onccc.t_product_7 union all
select * from onccc.t_product_8 union all
select * from onccc.t_product_9 
)t1,

(

select * from t_mm_user mu where  mu.credit_integrea like '%vip":"1%'

)t2
where t1.user_id(+)=t2.user_id
group by t2.user_id)t,

t_shop_booth sb,
t_shop s,
t_sys_operator so
where t.商品数<20 
and s.user_id=t.user_id
and s.booth_id=sb.id
and so.login_name=s.create_user
and s.status=1
