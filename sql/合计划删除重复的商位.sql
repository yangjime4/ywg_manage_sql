select * from(
select boothno,count(id) as count  from t_shop_booth where market_code=77 group by boothno)t
where count>1;


delete from t_shop_booth where boothno 
in(select boothno from t_shop_booth where market_code=77 group by boothno having count(id)>1)
and id not in(select min(id)from t_shop_booth where market_code=77 group by boothno having count(*)>1)
