select *
  from onccc.t_express_address t
 where t.weight is not null
   and t.id not in
       (select id
          from onccc.t_express_address
         where regexp_like(weight, '(^[+-]?\d{0,}\.?\d{0,}$)'))
union
select *
  from onccc.t_express_address t
 where weight like '%.'
union
select *
  from onccc.t_express_address t
 where weight like '.%'
