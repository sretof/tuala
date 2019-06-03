update idx_basic t set t.symbol=substring_index(t.ts_code,'.',1);
select t.symbol  from idx_basic t group by t.symbol having count(t.symbol)>1;

select t.* from idx_basic t where t.symbol in (
select t.symbol  from idx_basic t group by t.symbol having count(t.symbol)>1
) order by t.symbol;

update idx_basic ut set ut.del=1 where ut.ts_code in(
select tmp.tc from
(select t.ts_code as tc from idx_basic t where t.symbol in (
select t.symbol as tc  from idx_basic t group by t.symbol having count(t.symbol)>1
) and (t.`name` like '%(SH)' or t.`name` like '%(CSI)')) tmp);