
select count(distinct USERID) from T_AD_INDUSTRY_USERS  where PAYTIME>20150101000000 and PAYTIME<20150401000000 and market_code='10';

select count(distinct USERID) from T_AD_INDUSTRY_USERS  where PAYTIME>20150401000000 and PAYTIME<20150701000000 and market_code='10';

select count(distinct USERID) from T_AD_INDUSTRY_USERS  where PAYTIME>20160101000000 and PAYTIME<20160401000000 and market_code='10';

select count(distinct USERID) from T_AD_INDUSTRY_USERS  where PAYTIME>20160401000000 and PAYTIME<20160701000000 and market_code='10';

