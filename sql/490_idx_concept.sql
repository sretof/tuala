#DROP TABLE IF EXISTS `idx_concept`;
CREATE TABLE `idx_concept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL COMMENT '概念分类ID',
  `name` varchar(50) DEFAULT NULL COMMENT '概念分类名称',
  `src` varchar(30) DEFAULT NULL COMMENT '来源',
  `del` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idc_cd` (`code`)
) ENGINE=InnoDB;