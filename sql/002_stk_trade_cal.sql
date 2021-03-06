﻿#DROP TABLE IF EXISTS `stk_trade_cal`;
CREATE TABLE `stk_trade_cal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exchange` varchar(50) DEFAULT NULL COMMENT '交易所代码',
  `cal_date` char(8) NOT NULL COMMENT '日历日期',
  `open` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否交易 0休市 1交易',
  `pretrade_date` char(8) NOT NULL COMMENT '上一个交易日',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stktc_cal_date` (`cal_date`)
) ENGINE=InnoDB;
#交易所交易日历