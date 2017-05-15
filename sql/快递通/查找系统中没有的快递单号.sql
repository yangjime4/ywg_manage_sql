--各个状态条数

select count(t.id),t.status from onccc.t_express_address t where t.tracking_no is not null
and t.tracking_no like '160102082%' and length(t.tracking_no)=13  group by t.status;


--没有的快递单号
select '160102082'||replace(lpad(t.rn,4),' ','0') 
  from(with t as
  (select rownum rn from dual connect by rownum<=10000 )
-- select * from t where ((rn between 6001 and 7000) or (rn between 8001 and 9000) ) and rn not in(
 select * from t where (rn between 8001 and 9000)and rn not in(


  select to_number(substr(t.tracking_no,-4,4)) from onccc.t_express_address t where t.tracking_no is not null
  and t.tracking_no like '160102082%'  and length(t.tracking_no)=13

  ))t order by t.rn
  ;
--重复单号及重复个数
select * from(
select t.tracking_no , count(t.id) count from onccc.t_express_address t where t.tracking_no is not null
and t.tracking_no like '160102082%' and length(t.tracking_no)=13  group by t.tracking_no)t
where t.count>1
