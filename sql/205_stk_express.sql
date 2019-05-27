﻿#DROP TABLE IF EXISTS `stk_express`;
CREATE TABLE `stk_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '报告期',
  `revenue` float DEFAULT NULL COMMENT '净利润',
  `operate_profit` float DEFAULT NULL COMMENT '财务费用',
  `total_profit` float DEFAULT NULL COMMENT '销售商品、提供劳务收到的现金',
  `n_income` float DEFAULT NULL COMMENT '收到的税费返还',
  `total_assets` float DEFAULT NULL COMMENT '客户存款和同业存放款项净增加额',
  `total_hldr_eqy_exc_min_int` float DEFAULT NULL COMMENT '向中央银行借款净增加额',
  `diluted_eps` float DEFAULT NULL COMMENT '向其他金融机构拆入资金净增加额',
  `diluted_roe` float DEFAULT NULL COMMENT '收到原保险合同保费取得的现金',
  `yoy_net_profit` float DEFAULT NULL COMMENT '保户储金净增加额',
  `bps` float DEFAULT NULL COMMENT '收到再保业务现金净额',
  `yoy_sales` float DEFAULT NULL COMMENT '处置交易性金融资产净增加额',
  `yoy_op` float DEFAULT NULL COMMENT '收取利息和手续费净增加额',
  `yoy_tp` float DEFAULT NULL COMMENT '处置可供出售金融资产净增加额',
  `yoy_dedu_np` float DEFAULT NULL COMMENT '拆入资金净增加额',
  `yoy_eps` float DEFAULT NULL COMMENT '回购业务资金净增加额',
  `yoy_roe` float DEFAULT NULL COMMENT '收到其他与经营活动有关的现金',
  `growth_assets` float DEFAULT NULL COMMENT '经营活动现金流入小计',
  `yoy_equity` float DEFAULT NULL COMMENT '购买商品、接受劳务支付的现金',
  `growth_bps` float DEFAULT NULL COMMENT '支付给职工以及为职工支付的现金',
  `or_last_year` float DEFAULT NULL COMMENT '支付的各项税费',
  `op_last_year` float DEFAULT NULL COMMENT '客户贷款及垫款净增加额',
  `tp_last_year` float DEFAULT NULL COMMENT '存放央行和同业款项净增加额',
  `np_last_year` float DEFAULT NULL COMMENT '支付原保险合同赔付款项的现金',
  `eps_last_year` float DEFAULT NULL COMMENT '支付手续费的现金',
  `open_net_assets` float DEFAULT NULL COMMENT '支付保单红利的现金',
  `open_bps` float DEFAULT NULL COMMENT '支付其他与经营活动有关的现金',
  `pref_summary` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '业绩简要说明',
  `audit` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否审计： 1是 0否',
  `remark` varchar(0) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `pdf_path` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'pdf文件路径',
  PRIMARY KEY (`id`),
  KEY `stk_eps_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
