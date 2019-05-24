#DROP TABLE IF EXISTS `stk_hs_const`;
CREATE TABLE `stk_hs_const` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `hs_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '沪深港通类型SH沪SZ深',
  `in_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '纳入日期',
  `out_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '剔除日期',
  `new`  tinyint(3) DEFAULT NULL COMMENT '是否最新 1是 0否',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stk_hsc_ts_code` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;