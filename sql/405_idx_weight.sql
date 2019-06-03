#DROP TABLE IF EXISTS `idx_weight`;
CREATE TABLE `idx_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_date` char(8) NOT NULL COMMENT '交易日期',
  `index_code` varchar(20) NOT NULL COMMENT '指数代码',
  `con_code` varchar(20) NOT NULL COMMENT '成分代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idwt_tdiccc` (`trade_date`,`index_code`,`con_code`) USING BTREE,
  KEY `idwt_tdicc_n` (`trade_date`,`index_code`),
  KEY `idx_wht_ic` (`index_code`)
) ENGINE=InnoDB;