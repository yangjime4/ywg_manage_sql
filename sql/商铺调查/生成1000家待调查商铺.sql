--删除原有的调查，商铺表中的状态仍保留，以区别是否经过调查
delete from t_shop_investigation t where t.type='1'

--随机筛选未调查的1000家商铺加入调查
insert into t_shop_investigation
  (shopid, generatedate, TYPE)
  select *
    from (select s2.shop_id as shopid,
                 to_char(sysdate, 'yyyymmddhh24miss') as generatedate,
                 1 as type
          
            from (select mu.user_id as user_id, s.shop_id as shop_id
                    from t_mm_user mu, t_shop s, t_shop_booth sb
                   where mu.user_type = 1
                     and mu.status = 1
                     and s.status = 1
                     and s.market_code != 17
                     and mu.user_id = s.user_id
                     and s.booth_id = sb.id
                     and sb.submarket in ('1001',
                                          '1003',
                                          '1004',
                                          '1006',
                                          '1007',
                                          '1008',
                                          '10011')
                           and s.status=1
                     and s.shop_id  in
                         (select s.shop_id from t_shop s where s.investigation is null)) s2
          
           order by dbms_random.random)
   where rownum < 1001;

--更新shop表
update t_shop s set s.investigation=1 where   s.shop_id in (select shopid from t_shop_investigation where type=1) and s.investigation is null;
