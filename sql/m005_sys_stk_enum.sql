DROP TABLE IF EXISTS `sys_stk_enum`;
CREATE TABLE `sys_stk_enum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enum_type` varchar(30) NOT NULL COMMENT '类型',
  `enum_key` varchar(20) NOT NULL COMMENT 'KEY',
  `enum_val` varchar(100) NULL COMMENT 'VAL',
  `comments` varchar(4000) NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `stk_eu_et` (`enum_type`)
) ENGINE=InnoDB;

