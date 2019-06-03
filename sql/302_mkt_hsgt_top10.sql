#DROP TABLE IF EXISTS `mkt_hsgt_top10`;
CREATE TABLE `mkt_hsgt_top10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `close` decimal(12,4) DEFAULT NULL COMMENT 'fqf收盘点位',
  `change` float DEFAULT NULL COMMENT '涨跌点',
  `rank` tinyint(3) unsigned NULL COMMENT '资金排名',
  `market_type` char(1) DEFAULT NULL COMMENT '市场类型（1：沪市 3：深市）',
  `amount` float DEFAULT NULL COMMENT '成交金额（元）',
  `net_amount` float DEFAULT NULL COMMENT '净成交金额（元）',
  `buy` float DEFAULT NULL COMMENT '买入金额（元）',
  `sell` float DEFAULT NULL COMMENT '卖出金额（元）',
  PRIMARY KEY (`id`),
  KEY `mkt_hstt_td` (`trade_date`),
  KEY `mkt_hstt_tc` (`ts_code`)
) ENGINE=InnoDB;