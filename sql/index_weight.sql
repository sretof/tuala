DROP TABLE IF EXISTS `index_weight`;
CREATE TABLE `index_weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trade_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '交易日期',
  `index_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '指数代码',
  `con_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '成分代码',
  `weight` float DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idwt_tdiccc` (`trade_date`,`index_code`,`con_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;