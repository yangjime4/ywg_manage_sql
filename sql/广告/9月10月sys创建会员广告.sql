select ao.productid as ����id,s.shop_name as ��������,to_date(ao.createtime,'yyyy-mm-dd hh24:mi:ss') as ����ʱ��,
to_date(ao.PUBLISHTIME,'yyyy-mm-dd hh24:mi:ss') as ��ʼʱ��,
to_date(ao.maturitytime,'yyyy-mm-dd hh24:mi:ss') as ����ʱ��,
ao.totalprice/100 as �۸�,
so.real_name as �ͷ�
 from t_ad_operating ao,t_shop s,t_sys_operator so
 where type=5 and createuser='sys' and createtime>20160901000000 
 and s.shop_id=ao.productid
 and s.create_user=so.login_name
