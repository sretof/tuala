DROP TABLE IF EXISTS `stk_namechg`;
CREATE TABLE `stk_namechg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '证券名称',
  `start_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '开始日期',
  `end_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '结束日期',
  `ann_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告日期',
  `change_reason` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '变更原因',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stknchg_ts_code` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;