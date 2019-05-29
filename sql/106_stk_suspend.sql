#DROP TABLE IF EXISTS `stk_suspend`;
CREATE TABLE `stk_suspend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `suspend_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '停牌日期',
  `resume_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '复牌日期',
  `ann_date` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告日期',
  `suspend_reason` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '停牌原因',
  `reason_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '原因类型',
  PRIMARY KEY (`id`),
  KEY `stk_spd_ts_code` (`ts_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;