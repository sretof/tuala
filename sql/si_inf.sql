DROP TABLE IF EXISTS `si_flw`;
CREATE TABLE `si_flw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flw_code` char(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '',
  `flw_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '',
  `flw_time` char(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `unflw_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `from` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `from_uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `from_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `from_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `from_comment` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `from_reson` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `arts` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `pics` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `ts_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `ts_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `ts_uop` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `ts_uop_t` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '',
  `flwc` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `si_flw_fc` (`flw_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

