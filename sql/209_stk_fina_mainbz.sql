#DROP TABLE IF EXISTS `stk_fina_mainbz`;
CREATE TABLE `stk_fina_mainbz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告期',
  `bz_item` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主营业务来源',
  `bz_sales` float DEFAULT NULL COMMENT '基本每股收益',
  `bz_profit` float DEFAULT NULL COMMENT '稀释每股收益',
  `bz_cost` float DEFAULT NULL COMMENT '每股营业总收入',
  `curr_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '货币代码',
  `update_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '是否更新',
  PRIMARY KEY (`id`),
  KEY `stk_fmz_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

