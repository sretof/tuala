#DROP TABLE IF EXISTS `fund_company`;
CREATE TABLE `fund_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基金公司名称',
  `shortname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '简称',
  `short_enname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '英文缩写',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '城市',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '注册地址',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '电话',
  `office` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '办公地址',
  `website` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司网址',
  `chairman` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '法人代表',
  `manager` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '总经理',
  `reg_capital` float DEFAULT NULL COMMENT '注册资本',
  `setup_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '成立日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司终止日期',
  `employees` float DEFAULT NULL COMMENT '员工总数',
  `main_business` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '主要产品及业务',
  `org_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '组织机构代码',
  `credit_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '统一社会信用代码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `f_fc_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;