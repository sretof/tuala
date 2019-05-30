#DROP TABLE IF EXISTS `stk_company`;
CREATE TABLE `stk_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(20) NOT NULL COMMENT 'TS代码',
  `exchange` varchar(10) DEFAULT NULL COMMENT '交易所代码',
  `chairman` varchar(50) DEFAULT NULL COMMENT '法人代表',
  `manager` varchar(50) DEFAULT NULL COMMENT '总经理',
  `secretary` varchar(50) DEFAULT NULL COMMENT '董秘',
  `reg_capital` float DEFAULT NULL COMMENT '注册资本',
  `setup_date` varchar(8) DEFAULT NULL COMMENT '注册日期',
  `area` varchar(50) DEFAULT NULL COMMENT '区域',
  `province` varchar(50) DEFAULT NULL COMMENT '所在省份',
  `city` varchar(50) DEFAULT NULL COMMENT '所在城市',
  `website` varchar(100) DEFAULT NULL COMMENT 'website',
  `email` varchar(100) DEFAULT NULL COMMENT 'email',
  `office` varchar(500) DEFAULT NULL COMMENT 'office',
  `employees` int unsigned DEFAULT NULL COMMENT '员工人数',
  `main_business` varchar(5000) DEFAULT NULL COMMENT '主要业务及产品',
  `business_scope` varchar(5000) DEFAULT NULL COMMENT '经营范围',
  PRIMARY KEY (`id`),
  UNIQUE KEY `stk_cpy_ts_code` (`ts_code`)
) ENGINE=InnoDB;