#DROP TABLE IF EXISTS `sia_flw`;
CREATE TABLE `sia_flw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `flw_code` char(12) NOT NULL COMMENT '',
  `flw_date` char(8) NOT NULL COMMENT '',
  `flw_time` char(4) NULL COMMENT '',
  `unflw_date` char(8) NULL COMMENT '',
  `from` varchar(10) NULL COMMENT '',
  `from_uid` varchar(50) NULL COMMENT '',
  `from_name` varchar(100) NULL COMMENT '',
  `from_url` varchar(200) NULL COMMENT '',
  `from_comment` varchar(1000) NULL COMMENT '',
  `from_reson` varchar(1000) NULL COMMENT '',
  `arts` varchar(200) NULL COMMENT '',
  `pics` varchar(200) NULL COMMENT '',
  `ts_type` varchar(20) NULL COMMENT '',
  `ts_code` varchar(20) NULL COMMENT '',
  `ts_name` varchar(100) NULL COMMENT '',
  `ts_uop` varchar(20) NULL COMMENT '',
  `ts_uop_t` varchar(20) NULL COMMENT '',
  `flwc` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `si_flw_fc` (`flw_code`)
) ENGINE=InnoDB;

