#DROP TABLE IF EXISTS `stk_fina_audit`;
CREATE TABLE `stk_fina_audit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告期',
  `audit_result` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审计结果',
  `audit_fees` float DEFAULT NULL COMMENT '审计总费用（元）',
  `audit_agency` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '会计事务所',
  `audit_sign` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '签字会计师',
  PRIMARY KEY (`id`),
  KEY `stk_fiat_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

