#DROP TABLE IF EXISTS `mkt_top_list`;
CREATE TABLE `mkt_top_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `close` float DEFAULT NULL COMMENT '收盘价',
  `pct_change` float DEFAULT NULL COMMENT '涨跌幅',
  `turnover_rate` float DEFAULT NULL COMMENT '换手率',
  `amount` float DEFAULT NULL COMMENT '总成交额',
  `l_sell` float DEFAULT NULL COMMENT '龙虎榜卖出额',
  `l_buy` float DEFAULT NULL COMMENT '龙虎榜买入额',
  `l_amount` float DEFAULT NULL COMMENT '龙虎榜成交额',
  `net_amount` float DEFAULT NULL COMMENT '龙虎榜净买入额',
  `net_rate` float DEFAULT NULL COMMENT '龙虎榜净买额占比',
  `amount_rate` float DEFAULT NULL COMMENT '龙虎榜成交额占比',
  `float_values` float DEFAULT NULL COMMENT '当日流通市值',
  `reason` varchar(0) DEFAULT NULL COMMENT '上榜理由',
  PRIMARY KEY (`id`),
  KEY `mkt_tl_tc` (`ts_code`),
  KEY `mkt_tl_td` (`trade_date`)
) ENGINE=InnoDB;