#DROP TABLE IF EXISTS `idx_basic`;
CREATE TABLE `idx_basic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简称',
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '全称',
  `market` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '市场',
  `publisher` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布方',
  `index_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '指数风格',
  `category` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '指数类别',
  `base_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '基期',
  `base_point` float DEFAULT NULL COMMENT '基点',
  `list_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '发布日期',
  `weight_rule` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '加权方式',
  `desc` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `exp_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '终止日期',
  `fav` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `tts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'TRIM_TS代码',
  `del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idb_ts_code` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
--update idx_basic t set t.tts_code=substring_index(t.ts_code,'.',1);
--ALTER TABLE `stock`.`idx_basic` 
ADD COLUMN `tts_code` VARCHAR(20) NULL DEFAULT NULL COMMENT 'TRIM_TS代码' AFTER `fav`,
ADD COLUMN `del` TINYINT(3) NOT NULL DEFAULT 0 AFTER `tts_code`;


select t.tts_code  from idx_basic t group by t.tts_code having count(t.tts_code)>1;

select t.* from idx_basic t where t.tts_code in (
select t.tts_code  from idx_basic t group by t.tts_code having count(t.tts_code)>1
) order by t.tts_code;

update idx_basic ut set ut.del=1 where ut.ts_code in(
select tmp.tc from
(select t.ts_code as tc from idx_basic t where t.tts_code in (
select t.tts_code as tc  from idx_basic t group by t.tts_code having count(t.tts_code)>1
) and (t.`name` like '%(SH)' or t.`name` like '%(CSI)')) tmp);
*/