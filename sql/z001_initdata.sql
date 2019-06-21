#update idx_basic ut set ut.del=0;

update idx_basic t set t.symbol=substring_index(t.ts_code,'.',1) where t.symbol is null;

update idx_basic ut set ut.del=1 where ut.market='SW';

update idx_basic ut set ut.del=1 where ut.ts_code in(
select tmp.tc from
(select t1.ts_code as tc from idx_basic t1 where t1.symbol in (
select t2.symbol as tc  from idx_basic t2 where t2.del<>1 group by t2.symbol having count(t2.symbol)>1
) and t1.symbol in (
select t3.symbol from idx_basic t3 where t3.market='SZSE'
)
and t1.market<>'SZSE') tmp
);

update idx_basic ut set ut.del=1 where ut.ts_code in(
select tmp.tc from
(select t1.ts_code as tc from idx_basic t1 where t1.symbol in (
select t2.symbol as tc  from idx_basic t2 where t2.del<>1 group by t2.symbol having count(t2.symbol)>1
) and t1.symbol in (
select t3.symbol from idx_basic t3 where t3.market='SSE'
)
and t1.market<>'SSE') tmp
);

update idx_basic ut set ut.del=1 where ut.ts_code in(
select tmp.tc from
(select t1.ts_code as tc from idx_basic t1 where t1.`name` in (
select t2.`name` as tc  from idx_basic t2 where t2.del<>1 group by t2.name having count(t2.name)>1
) and t1.`name` in (
select t3.`name` from idx_basic t3 where t3.market='SZSE'
)
and t1.market<>'SZSE') tmp
);

update idx_basic ut set ut.del=1 where ut.ts_code in(
select tmp.tc from
(select t1.ts_code as tc from idx_basic t1 where t1.`name` in (
select t2.`name` as tc  from idx_basic t2 where t2.del<>1 group by t2.name having count(t2.name)>1
) and t1.`name` in (
select t3.`name` from idx_basic t3 where t3.market='SSE'
)
and t1.market<>'SSE') tmp
);

update idx_basic t set t.del=1 where t.ts_code='h11044.CSI';
update idx_basic t set t.del=1 where t.ts_code='h30033.CSI';
update idx_basic t set t.del=1 where t.ts_code='h30066.CSI';
update idx_basic t set t.del=1 where t.ts_code='000801.SH';
update idx_basic t set t.del=1 where t.ts_code='000803.SH';
update idx_basic t set t.del=1 where t.ts_code='000804.SH';
update idx_basic t set t.del=1 where t.ts_code='000809.SH';
update idx_basic t set t.del=1 where t.ts_code='000810.SH';
update idx_basic t set t.del=1 where t.ts_code='000811.SH';
update idx_basic t set t.del=1 where t.ts_code='000812.SH';
update idx_basic t set t.del=1 where t.ts_code='000813.SH';
update idx_basic t set t.del=1 where t.ts_code='000815.SH';
update idx_basic t set t.del=1 where t.ts_code='000818.SH';
update idx_basic t set t.del=1 where t.ts_code='000822.SH';
update idx_basic t set t.del=1 where t.ts_code='000824.SH';
update idx_basic t set t.del=1 where t.ts_code='000825.SH';
update idx_basic t set t.del=1 where t.ts_code='000826.SH';
update idx_basic t set t.del=1 where t.ts_code='000829.SH';
update idx_basic t set t.del=1 where t.ts_code='000830.SH';
update idx_basic t set t.del=1 where t.ts_code='000831.SH';
update idx_basic t set t.del=1 where t.ts_code='000838.SH';
update idx_basic t set t.del=1 where t.ts_code='000839.SH';
update idx_basic t set t.del=1 where t.ts_code='000840.SH';
update idx_basic t set t.del=1 where t.ts_code='000843.SH';
update idx_basic t set t.del=1 where t.ts_code='000844.SH';
update idx_basic t set t.del=1 where t.ts_code='000902.SH';
update idx_basic t set t.del=1 where t.ts_code='000907.SH';
update idx_basic t set t.del=1 where t.ts_code='000915.SH';
update idx_basic t set t.del=1 where t.ts_code='000916.SH';
update idx_basic t set t.del=1 where t.ts_code='000920.SH';
update idx_basic t set t.del=1 where t.ts_code='000921.SH';
update idx_basic t set t.del=1 where t.ts_code='000923.SH';
update idx_basic t set t.del=1 where t.ts_code='000926.SH';
update idx_basic t set t.del=1 where t.ts_code='000927.SH';
update idx_basic t set t.del=1 where t.ts_code='000929.SH';
update idx_basic t set t.del=1 where t.ts_code='000930.SH';
update idx_basic t set t.del=1 where t.ts_code='000936.SH';
update idx_basic t set t.del=1 where t.ts_code='000937.SH';
update idx_basic t set t.del=1 where t.ts_code='000938.SH';
update idx_basic t set t.del=1 where t.ts_code='000941.SH';
update idx_basic t set t.del=1 where t.ts_code='000942.SH';
update idx_basic t set t.del=1 where t.ts_code='000943.SH';
update idx_basic t set t.del=1 where t.ts_code='000945.SH';
update idx_basic t set t.del=1 where t.ts_code='000946.SH';
update idx_basic t set t.del=1 where t.ts_code='000947.SH';
update idx_basic t set t.del=1 where t.ts_code='000948.SH';
update idx_basic t set t.del=1 where t.ts_code='000949.SH';
update idx_basic t set t.del=1 where t.ts_code='000953.SH';
update idx_basic t set t.del=1 where t.ts_code='000954.SH';
update idx_basic t set t.del=1 where t.ts_code='000955.SH';
update idx_basic t set t.del=1 where t.ts_code='000956.SH';
update idx_basic t set t.del=1 where t.ts_code='000960.SH';
update idx_basic t set t.del=1 where t.ts_code='000962.SH';
update idx_basic t set t.del=1 where t.ts_code='000965.SH';
update idx_basic t set t.del=1 where t.ts_code='000967.SH';
update idx_basic t set t.del=1 where t.ts_code='000968.SH';
update idx_basic t set t.del=1 where t.ts_code='000970.SH';
update idx_basic t set t.del=1 where t.ts_code='000972.SH';
update idx_basic t set t.del=1 where t.ts_code='000980.SH';
update idx_basic t set t.del=1 where t.ts_code='000981.SH';
update idx_basic t set t.del=1 where t.ts_code='000985.SH';
update idx_basic t set t.del=1 where t.ts_code='000988.SH';
update idx_basic t set t.del=1 where t.ts_code='000994.SH';
update idx_basic t set t.del=1 where t.ts_code='000995.SH';