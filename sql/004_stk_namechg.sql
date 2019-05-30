#DROP TABLE IF EXISTS `stk_namechg`;
CREATE TABLE `stk_namechg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `name` varchar(50) DEFAULT NULL COMMENT '证券名称',
  `start_date` varchar(8) DEFAULT NULL COMMENT '开始日期',
  `end_date` varchar(8) DEFAULT NULL COMMENT '结束日期',
  `ann_date` varchar(8) DEFAULT NULL COMMENT '公告日期',
  `change_reason` varchar(4000) DEFAULT NULL COMMENT '变更原因',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stk_nchg_ts_code` (`ts_code`)
) ENGINE=InnoDB;
#历史名称变更记录