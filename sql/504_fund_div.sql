#DROP TABLE IF EXISTS `fund_div`;
CREATE TABLE `fund_div` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告日期',
  `imp_anndate` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分红实施公告日',
  `base_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '分配收益基准日',
  `div_proc` varchar(50)  CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '方案进度',
  `record_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '权益登记日',
  `ex_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '除息日',
  `pay_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '派息日',
  `earpay_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '收益支付日',
  `net_ex_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '净值除权日',
  `base_unit` float DEFAULT NULL COMMENT '基准基金份额(万份)',
  `ear_distr` float DEFAULT NULL COMMENT '可分配收益(元)',
  `ear_amount` float DEFAULT NULL COMMENT '收益分配金额(元)',
  `account_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '红利再投资到账日',
  `base_year` varchar(10)  CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '份额基准年度',
  PRIMARY KEY (`id`),
  KEY `f_fdv_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;