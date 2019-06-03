#DROP TABLE IF EXISTS `idx_concept_detail`;
CREATE TABLE `idx_concept_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `concept_code` varchar(20) NOT NULL COMMENT '概念分类ID',
  `concept_name` varchar(50) DEFAULT NULL COMMENT '概念分类名称',
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `name` varchar(50) DEFAULT NULL COMMENT '简称',
  `in_date` char(8) DEFAULT NULL COMMENT '交易日期',
  `out_date` char(8) DEFAULT NULL COMMENT '交易日期',
  PRIMARY KEY (`id`),
  KEY `icd_cc` (`concept_code`),
  KEY `icd_tc` (`ts_code`)
) ENGINE=InnoDB;