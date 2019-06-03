#DROP TABLE IF EXISTS `mkt_block_trade`;
CREATE TABLE `mkt_block_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `trade_date` char(8) NOT NULL COMMENT '交易日历',
  `price` float DEFAULT NULL COMMENT '成交价',
  `vol` float DEFAULT NULL COMMENT '成交量（万股）',
  `amount` float DEFAULT NULL COMMENT '成交金额',
  `buyer` varchar(300) DEFAULT NULL COMMENT '买方营业部',
  `seller` varchar(300) DEFAULT NULL COMMENT '卖方营业部',
  PRIMARY KEY (`id`),
  KEY `mkt_bkr_tc` (`ts_code`),
  KEY `mkt_bkr_by` (`buyer`),
  KEY `mkt_bkr_sr` (`seller`)
) ENGINE=InnoDB;