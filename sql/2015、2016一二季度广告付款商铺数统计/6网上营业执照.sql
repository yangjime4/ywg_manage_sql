
select count(distinct USER_ID) from t_ad_operating     where createtime>20150101000000 and createtime<20150401000000 and market_code='10' and type='3';

select count(distinct USER_ID) from t_ad_operating     where createtime>20150401000000 and createtime<20150701000000 and market_code='10' and type='3';

select count(distinct USER_ID) from t_ad_operating     where createtime>20160101000000 and createtime<20160401000000 and market_code='10' and type='3';

select count(distinct USER_ID) from t_ad_operating     where createtime>20160401000000 and createtime<20160701000000 and market_code='10' and type='3';
