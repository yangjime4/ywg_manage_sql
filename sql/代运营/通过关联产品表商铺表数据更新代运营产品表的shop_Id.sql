update t_operate_product op
   set shop_id =
       (select shop_id
          from (select *
                  from t_product_0
                union all
                select *
                  from t_product_1
                union all
                select *
                  from t_product_2
                union all
                select *
                  from t_product_3
                union all
                select *
                  from t_product_4
                union all
                select *
                  from t_product_5
                union all
                select *
                  from t_product_6
                union all
                select *
                  from t_product_7
                union all
                select *
                  from t_product_8
                union all
                select *
                  from t_product_9
                
                ) p,
               
               t_shop s
         where op.product_id = p.id
           and s.user_id = p.user_id)
 where op.shop_id is null
