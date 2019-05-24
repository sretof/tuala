#DROP TABLE IF EXISTS `stk_new_share`;
CREATE TABLE `stk_new_share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `sub_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申购代码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `ipo_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上网发行日期',
  `issue_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上市日期',
  `amount` float DEFAULT NULL COMMENT '发行总量（万股）',
  `market_amount` float DEFAULT NULL COMMENT '上网发行总量（万股）',
  `price` float DEFAULT NULL COMMENT '发行价格',
  `pe` float DEFAULT NULL COMMENT '市盈率',
  `limit_amount` float DEFAULT NULL COMMENT '个人申购上限（万股）',
  `funds` float DEFAULT NULL COMMENT '募集资金（亿元）',
  `ballot` float DEFAULT NULL COMMENT '中签率',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stk_ns_ts_code` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;