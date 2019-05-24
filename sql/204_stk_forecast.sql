#DROP TABLE IF EXISTS `stk_forecast`;
CREATE TABLE `stk_forecast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告期',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业绩预告类型(预增/预减/扭亏/首亏/续亏/续盈/略增/略减)',
  `p_change_min` float DEFAULT NULL COMMENT '净利润',
  `p_change_max` float DEFAULT NULL COMMENT '财务费用',
  `net_profit_min` float DEFAULT NULL COMMENT '销售商品、提供劳务收到的现金',
  `net_profit_max` float DEFAULT NULL COMMENT '收到的税费返还',
  `last_parent_net` float DEFAULT NULL COMMENT '客户存款和同业存放款项净增加额',
  `first_ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '首次公告日',
  `summary` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业绩预告摘要',
  `change_reason` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业绩变动原因',
  `pdf_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'pdf文件路径',
  PRIMARY KEY (`id`),
  KEY `stk_foct_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

