#DROP TABLE IF EXISTS `mkt_stk_holdertrade`;
CREATE TABLE `mkt_stk_holdertrade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告日期',
  `holder_name` varchar(200) DEFAULT NULL COMMENT '股东名称',	
  `holder_type` varchar(10) DEFAULT NULL COMMENT '股东类型G高管P个人C公司',	
  `in_de` varchar(10) DEFAULT NULL COMMENT '类型IN增持DE减持',	
  `change_vol` float DEFAULT NULL COMMENT '变动数量',
  `change_ratio` float DEFAULT NULL COMMENT '占流通比例（%）',
  `after_share` float DEFAULT NULL COMMENT '变动后持股',
  `after_ratio` float DEFAULT NULL COMMENT '变动后占流通比例（%）',
  `avg_price` float DEFAULT NULL COMMENT '平均价格',
  `begin_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告日期',
  `close_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告日期',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mkt_shtr_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;