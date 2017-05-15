select *
  from (select (case
                 when t1.marketcode = '10061' then
                  '�����г�1'
                 when t1.marketcode = '10062' then
                  '�����г�2'
                 else
                  (select wm.market_name
                     from t_web_market wm
                    where wm.submarket = t1.marketcode)
               end) as ����,
               nvl(t1.count, 0) as ��ͨ����,
               nvl(t2.count, 0) as ��ʵ����֤,
               nvl(t3.count, 0) as Ӫҵִ����֤,
               case
                 when nvl(t1.count, 0) = 0 then
                  0.00 || '%'
                 else
                  round(nvl(t3.count, 0) / nvl(t1.count, 0) * 100, 2) || '%'
               end as ��֤��,
               nvl(t4.count, 0) as ���̺��,
               nvl(t5.count, 0) as ��ͨ��Ա,
               nvl(t6.count, 0) as �߼���Ա,
               nvl(t6c.count, 0) as ������Ա,
               nvl(t6a.count, 0) as �𿨻�Ա,
               nvl(t6b.count, 0) as ��ʯ��Ա,
               case
                 when nvl(t1.count, 0) = 0 then
                  0.00 || '%'
                 else
                  round(nvl(t5.count, 0) / nvl(t1.count, 0) * 100, 2) || '%'
               end as ��ͨ��Ա��,
               case
                 when nvl(t1.count, 0) = 0 then
                  0.00 || '%'
                 else
                  round((nvl(t6.count, 0) + nvl(t6a.count, 0) +
                        nvl(t6c.count, 0) + nvl(t6b.count, 0)) /
                        nvl(t1.count, 0) * 100,
                        2) || '%'
               end as �߼����ϻ�Ա��,
               nvl(t7.count, 0) as ΢����,
               nvl(t8.count, 0) as ����ͣҵ��������,
               nvl(t9.count, 0) as ����������������,
               nvl(t10.count, 0) as ���հ�Ǩ��������
          from (select count(*) as count, t.submarket as marketcode
                  from (SELECT S.SHOP_ID,
                               SB.ID,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          from t_shop s, t_shop_booth sb
                         where s.status = '1'
                           and s.booth_id = sb.id
                           and sb.submarket in ('1001',
                                                '1003',
                                                '1004',
                                                '1006',
                                                '1007',
                                                '1008',
                                                '2011',
                                                '10011')
                        
                        ) t
                 group by submarket) t1,
               
               (select count(shop_id) as count, t.marketcode as marketcode
                  from (SELECT Y.shop_id,
                               (case
                                 when Y.marketcode = '1006' and
                                      Y.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when Y.marketcode = '1006' and
                                      Y.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  Y.marketcode
                               end) as marketcode
                          FROM (select shop_id,
                                       max(sb.submarket) as marketcode,
                                       max(sb.subfloor) as subfloor
                                  from t_mm_user_lessee mul,
                                       t_shop           s,
                                       t_shop_booth     sb
                                 where mul.user_id = s.user_id
                                   and s.status = '1'
                                   and mul.status = '1'
                                   and s.booth_id = sb.id
                                 group by s.shop_id) Y) t
                 group by t.marketcode) t2,
               
               (select count(shop_id) as count, t.marketcode as marketcode
                  from (SELECT Y.shop_id,
                               (case
                                 when Y.marketcode = '1006' and
                                      Y.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when Y.marketcode = '1006' and
                                      Y.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  Y.marketcode
                               end) as marketcode
                          from (select shop_id,
                                       max(sb.submarket) as marketcode,
                                       max(sb.subfloor) as subfloor
                                  from t_mm_user_lessee mul,
                                       t_shop           s,
                                       t_shop_booth     sb
                                 where mul.license_no is not null
                                   and mul.user_id = s.user_id
                                   and s.status = '1'
                                   and mul.status = '1'
                                   and s.booth_id = sb.id
                                 group by s.shop_id) Y
                        
                        ) t
                 group by t.marketcode) t3,
               (select count(shop_id) as count, t.marketcode as marketcode
                  from (SELECT y.shop_id,
                               (case
                                 when Y.marketcode = '1006' and
                                      Y.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when Y.marketcode = '1006' and
                                      Y.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  Y.marketcode
                               end) as marketcode
                          from (select shop_id,
                                       max(sb.submarket) as marketcode,
                                       max(sb.subfloor) as subfloor
                                  from t_mm_user_lessee mul,
                                       t_shop           s,
                                       t_shop_booth     sb
                                 where mul.commercialid is not null
                                   and mul.user_id = s.user_id
                                   and s.status = '1'
                                   and mul.status = '1'
                                   and s.booth_id = sb.id
                                 group by s.shop_id) y
                        
                        ) t
                 group by t.marketcode) t4,
               (select count(*) as count, t.submarket as marketcode
                  from (SELECT s.shop_id,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          FROM (select *
                                  from onccc.t_mm_user mu
                                 where mu.user_type = '1'
                                   and mu.status = '1'
                                   and mu.CREDIT_INTEGREA like '%"vip":"0%') mu,
                               t_shop s,
                               t_shop_booth sb
                         where s.user_id = mu.user_id
                           and s.booth_id = sb.id
                           and s.status = '1') t
                 group by t.submarket) t5,
               (select count(*) as count, t.submarket as marketcode
                  from (select s.shop_id,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          from (select *
                                  from onccc.t_mm_user mu
                                
                                 where mu.user_type = '1'
                                   and mu.status = '1'
                                   and mu.CREDIT_INTEGREA like '%"vip":"1%') mu,
                               t_shop s,
                               t_shop_booth sb
                         where s.user_id = mu.user_id
                           and s.booth_id = sb.id
                           and s.status = '1') t
                 group by t.submarket) t6,
               (select count(*) as count, t.submarket as marketcode
                  from (select s.shop_id,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          from (select *
                                  from onccc.t_mm_user mu
                                 where mu.user_type = '1'
                                   and mu.status = '1'
                                   and mu.CREDIT_INTEGREA like '%"vip":"2%') mu,
                               t_shop s,
                               t_shop_booth sb
                         where s.user_id = mu.user_id
                           and s.booth_id = sb.id
                           and s.status = '1') t
                 group by t.submarket) t6a,
               (select count(*) as count, t.submarket as marketcode
                  from (select s.shop_id,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          from (select *
                                  from onccc.t_mm_user mu
                                
                                 where mu.user_type = '1'
                                   and mu.status = '1'
                                   and mu.CREDIT_INTEGREA like '%"vip":"3%') mu,
                               t_shop s,
                               t_shop_booth sb
                         where s.user_id = mu.user_id
                           and s.booth_id = sb.id
                           and s.status = '1') t
                 group by t.submarket) t6b,
               (select count(*) as count, t.submarket as marketcode
                  from (select s.shop_id,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          from (select *
                                  from onccc.t_mm_user mu
                                
                                 where mu.user_type = '1'
                                   and mu.status = '1'
                                   and mu.CREDIT_INTEGREA like '%"vip":"4%') mu,
                               t_shop s,
                               t_shop_booth sb
                         where s.user_id = mu.user_id
                           and s.booth_id = sb.id
                           and s.status = '1') t
                 group by t.submarket) t6c,
               (select count(*) as count, t.submarket as marketcode
                  from (select s.shop_id,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          from T_AD_INDUSTRY_CATEGORY aic,
                               t_shop                 s,
                               t_shop_booth           sb
                         where aic.shopid = s.shop_id
                           and s.booth_id = sb.id
                           and aic.adname = '΢����') t
                 group by t.submarket) t7,
               (select count(t.shop_id) as count, t.submarket as marketcode
                  from (select s.shop_id,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          from LOG_SHOP_ADMIN t, t_shop s, t_shop_booth sb
                         where t.shopid = s.shop_id
                           and s.booth_id = sb.id
                           and t.describe like '%Status:1 to 7 %'
                           and t.time >
                               To_char(Trunc(SYSDATE - 1), 'yyyymmddhh24miss')
                           and t.time <
                               To_char(Trunc(SYSDATE), 'yyyymmddhh24miss')) t
                 group by t.submarket) t8,
               (select sum(count) as count, marketcode
                  from (
                        
                        select count(t.shop_id) as count,
                                t.submarket as marketcode
                          from (select s.shop_id,
                                        (case
                                          when sb.submarket = '1006' and
                                               sb.subfloor in ('1', '2', '5') then
                                           '10061'
                                          when sb.submarket = '1006' and
                                               sb.subfloor in ('3', '4') then
                                           '10062'
                                          else
                                           sb.submarket
                                        end) as submarket
                                   from LOG_SHOP_ADMIN t,
                                        t_shop         s,
                                        t_shop_booth   sb
                                  where t.shopid = s.shop_id
                                    and s.booth_id = sb.id
                                       
                                    and t.describe like '%insert shop%'
                                    and t.time >
                                        To_char(Trunc(SYSDATE - 1),
                                                'yyyymmddhh24miss')
                                    and t.time <
                                        To_char(Trunc(SYSDATE),
                                                'yyyymmddhh24miss')) t
                         group by t.submarket
                        
                        union
                        
                        select count(t.object_id) as count,
                                t.submarket as marketcode
                          from (select sln.object_id,
                                        (case
                                          when sb.submarket = '1006' and
                                               sb.subfloor in ('1', '2', '5') then
                                           '10061'
                                          when sb.submarket = '1006' and
                                               sb.subfloor in ('3', '4') then
                                           '10062'
                                          else
                                           sb.submarket
                                        end) as submarket
                                   from t_sys_log_new sln, t_shop_booth sb
                                  where sln.OBJECT_ID = sb.id
                                    and sln.operate_type =
                                        '/shop/manage/shopinserttwo'
                                       
                                    and sln.operate_time >
                                        To_char(Trunc(SYSDATE - 1),
                                                'yyyymmddhh24miss')
                                    and sln.operate_time <
                                        To_char(Trunc(SYSDATE),
                                                'yyyymmddhh24miss')) t
                         group by t.submarket)
                 group by marketcode) t9,
               (select count(*) as count, t.submarket as marketcode
                  from (select s.shop_id,
                               (case
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('1', '2', '5') then
                                  '10061'
                                 when sb.submarket = '1006' and
                                      sb.subfloor in ('3', '4') then
                                  '10062'
                                 else
                                  sb.submarket
                               end) as submarket
                          from t_sys_log_new sln, t_shop s, t_shop_booth sb
                         where sln.operate_type = 'shop/relocateapplyagree'
                           and sln.object_id = s.shop_id
                           and s.booth_id = sb.id
                           and sln.operate_time >
                               To_char(Trunc(SYSDATE - 1), 'yyyymmddhh24miss')
                           and sln.operate_time <
                               To_char(Trunc(SYSDATE), 'yyyymmddhh24miss')) t
                 group by t.submarket) t10
         where t1.marketcode = t2.marketcode(+)
           and t1.marketcode = t3.marketcode(+)
           and t1.marketcode = t4.marketcode(+)
           and t1.marketcode = t5.marketcode(+)
           and t1.marketcode = t6.marketcode(+)
           and t1.marketcode = t6a.marketcode(+)
           and t1.marketcode = t6b.marketcode(+)
           and t1.marketcode = t6c.marketcode(+)
           and t1.marketcode = t7.marketcode(+)
           and t1.marketcode = t8.marketcode(+)
           and t1.marketcode = t9.marketcode(+)
           and t1.marketcode = t10.marketcode(+)
         order by t1.marketcode) a

union all
select *
  from (select '�ܼ�' as ����,
               nvl(sum(t1.count), 0) as ��ͨ����,
               nvl(sum(t2.count), 0) as ��ʵ����֤,
               nvl(sum(t3.count), 0) as Ӫҵִ����֤,
               case
                 when nvl(sum(t1.count), 0) = 0 then
                  0.00 || '%'
                 else
                  round(nvl(sum(t3.count), 0) / nvl(sum(t1.count), 0) * 100,
                        2) || '%'
               end as ��֤��,
               nvl(sum(t4.count), 0) as ���̺��,
               nvl(sum(t5.count), 0) as ��ͨ��Ա,
               
               nvl(sum(t6.count), 0) as �߼���Ա,
               nvl(sum(t6c.count), 0) as ������Ա,
               nvl(sum(t6a.count), 0) as �𿨻�Ա,
               nvl(sum(t6b.count), 0) as ��ʯ��Ա,
               case
                 when nvl(sum(t1.count), 0) = 0 then
                  0.00 || '%'
                 else
                  round(nvl(sum(t5.count), 0) / nvl(sum(t1.count), 0) * 100,
                        2) || '%'
               end as ��ͨ��Ա��,
               case
                 when nvl(sum(t1.count), 0) = 0 then
                  0.00 || '%'
                 else
                  round((nvl(sum(t6.count), 0) + nvl(sum(t6a.count), 0) +
                        nvl(sum(t6c.count), 0) + nvl(sum(t6b.count), 0)) /
                        nvl(sum(t1.count), 0) * 100,
                        2) || '%'
               end as �߼����ϻ�Ա��,
               nvl(sum(t7.count), 0) as ΢����,
               nvl(sum(t8.count), 0) as ����ͣҵ��������,
               nvl(sum(t9.count), 0) as ����������������,
               nvl(sum(t10.count), 0) as �����Ǩ��������
          from (select count(*) as count, sb.submarket as marketcode
                  from t_shop s, t_shop_booth sb
                 where s.status = '1'
                   and s.booth_id = sb.id
                   and sb.submarket in ('1001',
                                        '1003',
                                        '1004',
                                        '1006',
                                        '1007',
                                        '1008',
                                        '2011',
                                        '10011')
                 group by sb.submarket) t1,
               
               (
                
                select count(shop_id) as count, t.marketcode as marketcode
                  from (select shop_id, max(sb.submarket) as marketcode
                           from t_mm_user_lessee mul, t_shop s, t_shop_booth sb
                          where mul.user_id = s.user_id
                            and s.status = '1'
                            and mul.status = '1'
                            and s.booth_id = sb.id
                         
                          group by s.shop_id) t
                 group by t.marketcode
                
                ) t2,
               
               (select count(shop_id) as count, t.marketcode as marketcode
                  from (select shop_id, max(sb.submarket) as marketcode
                          from t_mm_user_lessee mul, t_shop s, t_shop_booth sb
                         where mul.license_no is not null
                           and mul.user_id = s.user_id
                           and s.status = '1'
                           and mul.status = '1'
                           and s.booth_id = sb.id
                         group by s.shop_id) t
                 group by t.marketcode) t3,
               (select count(shop_id) as count, t.marketcode as marketcode
                  from (select shop_id, max(sb.submarket) as marketcode
                          from t_mm_user_lessee mul, t_shop s, t_shop_booth sb
                         where mul.commercialid is not null
                           and mul.user_id = s.user_id
                           and s.status = '1'
                           and mul.status = '1'
                           and s.booth_id = sb.id
                         group by s.shop_id) t
                 group by t.marketcode) t4,
               (select count(*) as count, sb.submarket as marketcode
                  from (select *
                          from onccc.t_mm_user mu
                        
                         where mu.user_type = '1'
                           and mu.status = '1'
                           and mu.CREDIT_INTEGREA like '%"vip":"0%') mu,
                       t_shop s,
                       t_shop_booth sb
                 where s.user_id = mu.user_id
                   and s.booth_id = sb.id
                   and s.status = '1'
                 group by sb.submarket) t5,
               (select count(*) as count, sb.submarket as marketcode
                  from (select *
                          from onccc.t_mm_user mu
                        
                         where mu.user_type = '1'
                           and mu.status = '1'
                           and mu.CREDIT_INTEGREA like '%"vip":"1%') mu,
                       t_shop s,
                       t_shop_booth sb
                 where s.user_id = mu.user_id
                   and s.booth_id = sb.id
                   and s.status = '1'
                 group by sb.submarket) t6,
               (select count(*) as count, sb.submarket as marketcode
                  from (select *
                          from onccc.t_mm_user mu
                        
                         where mu.user_type = '1'
                           and mu.status = '1'
                           and mu.CREDIT_INTEGREA like '%"vip":"2%') mu,
                       t_shop s,
                       t_shop_booth sb
                 where s.user_id = mu.user_id
                   and s.booth_id = sb.id
                   and s.status = '1'
                 group by sb.submarket) t6a,
               (select count(*) as count, sb.submarket as marketcode
                  from (select *
                          from onccc.t_mm_user mu
                        
                         where mu.user_type = '1'
                           and mu.status = '1'
                           and mu.CREDIT_INTEGREA like '%"vip":"4%') mu,
                       t_shop s,
                       t_shop_booth sb
                 where s.user_id = mu.user_id
                   and s.booth_id = sb.id
                   and s.status = '1'
                 group by sb.submarket) t6c,
               (select count(*) as count, sb.submarket as marketcode
                  from (select *
                          from onccc.t_mm_user mu
                        
                         where mu.user_type = '1'
                           and mu.status = '1'
                           and mu.CREDIT_INTEGREA like '%"vip":"3%') mu,
                       t_shop s,
                       t_shop_booth sb
                 where s.user_id = mu.user_id
                   and s.booth_id = sb.id
                   and s.status = '1'
                 group by sb.submarket) t6b,
               (select count(*) as count, sb.submarket as marketcode
                  from T_AD_INDUSTRY_CATEGORY aic, t_shop s, t_shop_booth sb
                 where aic.shopid = s.shop_id
                   and s.booth_id = sb.id
                   and aic.adname = '΢����'
                 group by sb.submarket) t7,
               (select count(s.shop_id) as count, sb.submarket as marketcode
                  from LOG_SHOP_ADMIN t, t_shop s, t_shop_booth sb
                 where t.shopid = s.shop_id
                   and s.booth_id = sb.id
                      
                   and t.describe like '%Status:1 to 7 %'
                   and t.time >
                       To_char(Trunc(SYSDATE - 1), 'yyyymmddhh24miss')
                   and t.time < To_char(Trunc(SYSDATE), 'yyyymmddhh24miss')
                 group by sb.submarket) t8,
               (select sum(count) as count, marketcode
                  from (select count(s.shop_id) as count,
                               sb.submarket as marketcode
                          from LOG_SHOP_ADMIN t, t_shop s, t_shop_booth sb
                         where t.shopid = s.shop_id
                           and s.booth_id = sb.id
                              
                           and t.describe like '%insert shop%'
                           and t.time >
                               To_char(Trunc(SYSDATE - 1), 'yyyymmddhh24miss')
                           and t.time <
                               To_char(Trunc(SYSDATE), 'yyyymmddhh24miss')
                         group by sb.submarket
                        
                        union
                        
                        select count(sln.object_id) as count,
                               sb.submarket as marketcode
                          from t_sys_log_new sln, t_shop_booth sb
                         where sln.OBJECT_ID = sb.id
                           and sln.operate_type = '/shop/manage/shopinserttwo'
                              
                           and sln.operate_time >
                               To_char(Trunc(SYSDATE - 1), 'yyyymmddhh24miss')
                           and sln.operate_time <
                               To_char(Trunc(SYSDATE), 'yyyymmddhh24miss')
                         group by sb.submarket)
                 group by marketcode) t9,
               (select count(*) as count, sb.submarket as marketcode
                  from t_sys_log_new sln, t_shop s, t_shop_booth sb
                 where sln.operate_type = 'shop/relocateapplyagree'
                   and sln.object_id = s.shop_id
                   and s.booth_id = sb.id
                   and sln.operate_time >
                       To_char(Trunc(SYSDATE - 1), 'yyyymmddhh24miss')
                   and sln.operate_time <
                       To_char(Trunc(SYSDATE), 'yyyymmddhh24miss')
                 group by sb.submarket) t10
         where t1.marketcode = t2.marketcode(+)
           and t1.marketcode = t3.marketcode(+)
           and t1.marketcode = t4.marketcode(+)
           and t1.marketcode = t5.marketcode(+)
           and t1.marketcode = t6.marketcode(+)
           and t1.marketcode = t6a.marketcode(+)
           and t1.marketcode = t6b.marketcode(+)
           and t1.marketcode = t6c.marketcode(+)
           and t1.marketcode = t7.marketcode(+)
           and t1.marketcode = t8.marketcode(+)
           and t1.marketcode = t9.marketcode(+)
           and t1.marketcode = t10.marketcode(+)) b
