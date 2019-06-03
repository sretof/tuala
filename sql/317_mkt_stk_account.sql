#DROP TABLE IF EXISTS `mkt_stk_account`;
CREATE TABLE `mkt_stk_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` char(8) NOT NULL COMMENT '统计周期',
  `weekly_new` float DEFAULT NULL COMMENT '本周新增（万）',
  `total` float DEFAULT NULL COMMENT '期末总账户数（万）',
  `weekly_hold` float DEFAULT NULL COMMENT '本周持仓账户数（万）',
  `weekly_trade` float DEFAULT NULL COMMENT '本周参与交易账户数（万）',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mkt_msa_d` (`date`)
) ENGINE=InnoDB;