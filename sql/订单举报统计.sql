select count1/100 as ��ͨͶ��,count2/100 as �����ʽ�,count3/100 as  �˿����� from
(select sum(refund_fee)as count1 from t_om_order_complaint where complaint_time>20160401000000 and complaint_time<20160622595959 and COMPLAINT_TYPE='1' )t1,
(select sum(refund_fee)as count2 from t_om_order_complaint where complaint_time>20160401000000 and complaint_time<20160622595959 and COMPLAINT_TYPE='2' )t2,
(select sum(refund_fee)as count3 from t_om_order_complaint where complaint_time>20160401000000 and complaint_time<20160622595959 and COMPLAINT_TYPE='3' )t3

