#DROP TABLE IF EXISTS `mkt_pledge_stat`;
CREATE TABLE `mkt_pledge_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `end_date` char(8) NOT NULL COMMENT '截至日期',
  `pledge_count` int DEFAULT NULL COMMENT '质押次数',
  `unrest_pledge` float DEFAULT NULL COMMENT '无限售股质押数量（万）',
  `rest_pledge` float DEFAULT NULL COMMENT '限售股份质押数量（万）',
  `total_share` float DEFAULT NULL COMMENT '总股本',
  `pledge_ratio` float DEFAULT NULL COMMENT '质押比例',
  PRIMARY KEY (`id`),
  KEY `mkt_pgs_tc` (`ts_code`)
) ENGINE=InnoDB;