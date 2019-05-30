#DROP TABLE IF EXISTS `stk_disclosure_date`;
CREATE TABLE `stk_disclosure_date` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) NOT NULL COMMENT '最新披露公告日',
  `end_date` char(8) NOT NULL COMMENT '报告期',
  `pre_date` char(8) NULL COMMENT '预计披露日期',
  `actual_date` char(8) NULL COMMENT '实际披露日期',
  `modify_date` char(8) NULL COMMENT '披露日期修正记录',
  PRIMARY KEY (`id`),
  KEY `stk_discd_tc` (`ts_code`)
) ENGINE=InnoDB;

