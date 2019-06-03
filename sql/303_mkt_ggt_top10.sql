#DROP TABLE IF EXISTS `mkt_ggt_top10`;
CREATE TABLE `mkt_ggt_top10` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `close` decimal(12,4) DEFAULT NULL COMMENT 'fqf收盘点位',
  `p_change` float DEFAULT NULL COMMENT '涨跌点',
  `rank` tinyint(3) unsigned NULL COMMENT '资金排名',
  `market_type` char(1) DEFAULT NULL COMMENT '市场类型 2：港股通（沪） 4：港股通（深）',
  `amount` float DEFAULT NULL COMMENT '成交金额（元）',
  `net_amount` float DEFAULT NULL COMMENT '净成交金额（元）',
  `sh_amount` float DEFAULT NULL COMMENT '沪市成交金额（元）',
  `sh_net_amount` float DEFAULT NULL COMMENT '沪市净买入金额（元）',
  `sh_buy` float DEFAULT NULL COMMENT '沪市买入金额（元）',
  `sh_sell` float DEFAULT NULL COMMENT '沪市卖出金额',
  `sz_amount` float DEFAULT NULL COMMENT '深市成交金额（元）',
  `sz_net_amount` float DEFAULT NULL COMMENT '深市净买入金额（元）',
  `sz_buy` float DEFAULT NULL COMMENT '深市买入金额（元）',
  `sz_sell` float DEFAULT NULL COMMENT '深市卖出金额（元）',
  PRIMARY KEY (`id`),
  KEY `mkt_ggt_td` (`trade_date`),
  KEY `mkt_ggt_tc` (`ts_code`)
) ENGINE=InnoDB;