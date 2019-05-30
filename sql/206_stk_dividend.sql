#DROP TABLE IF EXISTS `stk_dividend`;
CREATE TABLE `stk_dividend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) DEFAULT NULL COMMENT '预案公告日',
  `end_date` char(8) DEFAULT NULL COMMENT '分红年度',
  `div_proc` float DEFAULT NULL COMMENT '实施进度',
  `stk_div` float DEFAULT NULL COMMENT '每股送转',
  `stk_bo_rate` float DEFAULT NULL COMMENT '每股送股比例',
  `stk_co_rate` float DEFAULT NULL COMMENT '每股转增比例',
  `cash_div` float DEFAULT NULL COMMENT '每股分红（税后）',
  `cash_div_tax` float DEFAULT NULL COMMENT '每股分红（税前）',
  `record_date` char(8) DEFAULT NULL COMMENT '股权登记日',
  `ex_date` char(8) DEFAULT NULL COMMENT '除权除息日',
  `pay_date` char(8) DEFAULT NULL COMMENT '派息日',
  `div_listdate` char(8) DEFAULT NULL COMMENT '红股上市日',
  `imp_ann_date` char(8) DEFAULT NULL COMMENT '实施公告日',
  `base_date` char(8) DEFAULT NULL COMMENT '基准日',
  `base_share` float DEFAULT NULL COMMENT '基准股本（万）',
  PRIMARY KEY (`id`),
  KEY `stk_did_tc` (`ts_code`)
) ENGINE=InnoDB;

