DROP TABLE IF EXISTS `stk_enum`;
CREATE TABLE `stk_enum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enum_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `enum_key` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'KEY',
  `enum_val` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'VAL',
  `comments` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `stk_eu_et` (`enum_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

