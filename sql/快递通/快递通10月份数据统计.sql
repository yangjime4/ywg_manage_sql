select 
(select mu.login_id from t_mm_user mu where mu.user_id=ea.customer_userid) as �ռ�Ա,
ea.tracking_no as ��ݵ���,
(case ea.status when '2' then 'ȡ��' when '4' then '����' end )as ״̬,
ea.fee/100 as �̻��˷�,
to_date(ea.receive_time,'yyyymmddhh24miss') as ȡ��ʱ��
 from onccc.t_express_address ea
 where ea.receive_time>20161001000000 and ea.receive_time<20161101000000
 
 and�� ea.status=2 or ea.status=4��
 order by ea.customer_userid,ea.receive_time desc
