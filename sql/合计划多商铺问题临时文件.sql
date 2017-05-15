select count(*) from t_shop_booth where  market_code='49';

select * from 
(select count(boothno) as count ,boothno from t_shop_booth  where market_code='49'  group by boothno)t
where count>1;


delete  from t_shop_booth where ID not in(select min(id)from t_shop_booth where market_code='49' group by boothno)  


SELECT object_name, machine, s.sid, s.serial# 
FROM gv$locked_object l, dba_objects o, gv$session s 
WHERE l.object_id¡¡= o.object_id 
AND l.session_id = s.sid;





