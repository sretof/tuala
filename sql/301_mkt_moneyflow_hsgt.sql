#DROP TABLE IF EXISTS `mkt_moneyflow_hsgt`;
CREATE TABLE `mkt_moneyflow_hsgt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易日期',
  `ggt_ss` varchar(0) DEFAULT NULL COMMENT '港股通（上海）',
  `ggt_sz` varchar(0) DEFAULT NULL COMMENT '港股通（深圳）',
  `hgt` varchar(0) DEFAULT NULL COMMENT '沪股通（百万元）',
  `sgt` varchar(0) DEFAULT NULL COMMENT '深股通（百万元）',
  `north_money` varchar(0) DEFAULT NULL COMMENT '北向资金（百万元）',
  `south_money` varchar(0) DEFAULT NULL COMMENT '南向资金（百万元）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mkt_mfhs_td` (`trade_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;