select tdate AS TDATE,
       nvl(sum(sum_alipay), 0) as SUM_ALIPAY,
       SUM(case
             when sum_alipay > 0 then
              1
             else
              0
           end) as SUM_ALIPAY_COUNT,
       nvl(sum(sum_telalipay), 0) as SUM_TELALIPAY,
       SUM(case
             when sum_telalipay > 0 then
              1
             else
              0
           end) as SUM_TELALIPAY_COUNT,
       nvl(sum(sum_union), 0) as SUM_YINLIAN,
       SUM(case
             when sum_union > 0 then
              1
             else
              0
           end) as SUM_YINLIAN_COUNT,
       nvl(sum(sum_huanxun), 0) as SUM_HUANXUN,
       SUM(case
             when sum_huanxun > 0 then
              1
             else
              0
           end) as SUM_HUANXUN_COUNT,
       nvl(sum(sum_wxpay), 0) as SUM_WXPAY,
       SUM(case
             when sum_wxpay > 0 then
              1
             else
              0
           end) as SUM_WXPAY_COUNT,
       nvl(sum(sum_yeepay), 0) as SUM_YEEPAY,
       SUM(case
             when sum_yeepay > 0 then
              1
             else
              0
           end) as SUM_YEEPAY_COUNT,
       nvl(sum(sum_liandong), 0) as SUM_LIANDONG,
       SUM(case
             when sum_liandong > 0 then
              1
             else
              0
           end) as SUM_LIANDONG_COUNT,
       round(nvl(sum(0.0025 * sum_alipay + 0.0025 * sum_telalipay +
                     0.0025 * sum_wxpay + 0.0018 * sum_union +
                     0.002 * sum_huanxun + 0.001 * sum_yeepay +
                     0.002 * sum_liandong),
                 0),
             2) as SUM_SHOUXUFEI_ZHICHU,
       nvl(sum(sum_fee), 0) as SUM_SHOUXUFEI,
       nvl(nvl(sum(sum_huanxun), 0) + nvl(sum(sum_telalipay), 0) +
           nvl(sum(sum_union), 0) + nvl(sum(sum_alipay), 0) +
           nvl(sum(sum_wxpay), 0) + nvl(sum(sum_yeepay), 0) +
           nvl(sum(sum_liandong), 0),
           0) as ZONGE,
       nvl(SUM(case
                 when sum_huanxun > 0 then
                  1
                 else
                  0
               end) + SUM(case
                            when sum_telalipay > 0 then
                             1
                            else
                             0
                          end) + SUM(case
                                       when sum_alipay > 0 then
                                        1
                                       else
                                        0
                                     end) +
           SUM(case
                 when sum_union > 0 then
                  1
                 else
                  0
               end) + SUM(case
                            when sum_alipay > 0 then
                             1
                            else
                             0
                          end) + SUM(case
                                       when sum_wxpay > 0 then
                                        1
                                       else
                                        0
                                     end) +
           SUM(case
                 when sum_yeepay > 0 then
                  1
                 else
                  0
               end) + SUM(case
                            when sum_liandong > 0 then
                             1
                            else
                             0
                          end),
           0) as ZONGE_COUNT,
       nvl(sum(sum_tiaozheng), 0) as SUM_TIAOZHENG,
       nvl(sum(sum_koukuan), 0) as SUM_KOUKUAN
  from (select substr(t.trade_time, 0, 8) as tdate,
               case
                 when t.amount_source = 'Áª¶¯Ö§¸¶' then
                  t.trade_amount / 100
                 else
                  0
               end as sum_liandong,
               case
                 when t.uid_out = 'ccbpay' then
                  t.trade_amount / 100
                 else
                  0
               end as sum_huanxun,
               case
                 when t.uid_out in ('wxpay', 'wxweb') then
                  t.trade_amount / 100
                 else
                  0
               end as sum_wxpay,
               
               case
                 when t.uid_out = 'yeepay' then
                  t.trade_amount / 100
                 else
                  0
               end as sum_yeepay,
               case
                 when t.uid_out = 'union' then
                  t.trade_amount / 100
                 else
                  0
               end as sum_union,
               case
                 when t.uid_out in ('alipay', 'webalipay') then
                  t.trade_amount / 100
                 else
                  0
               end as sum_alipay,
               case
                 when t.uid_out = 'telalipay' then
                  t.trade_amount / 100
                 else
                  0
               end as sum_telalipay,
               case
                 when t.trade_code = 109 then
                  t.trade_amount / 100
                 else
                  0
               end as sum_fee,
               case
                 when t.trade_code = 103 and t.uid_out = 'sys' then
                  t.trade_amount / 100
                 else
                  0
               end as sum_tiaozheng,
               (case
                 when t.trade_code = 103 and t.uid_in = 'sys' then
                  t.trade_amount / 100
                 else
                  0
               end) * -1 as sum_koukuan
          from T_FM_TRADE t
        
        )
 group by tdate
 order by tdate desc
