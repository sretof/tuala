#DROP TABLE IF EXISTS `fund_portfolio`;
CREATE TABLE `fund_portfolio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '截止日期',
  `symbol` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '代码',
  `mkv` float DEFAULT NULL COMMENT '持有股票市值(元)',
  `amount` float DEFAULT NULL COMMENT '持有股票数量（股）',
  `stk_mkv_ratio` float DEFAULT NULL COMMENT '占股票市值比',
  `stk_float_ratio` float DEFAULT NULL COMMENT '占流通股本比例',
  PRIMARY KEY (`id`),
  KEY `f_fpo_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;