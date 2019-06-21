﻿#DROP TABLE IF EXISTS `stk_fina_indicator`;
CREATE TABLE `stk_fina_indicator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) DEFAULT NULL COMMENT '公告日期',
  `end_date` char(8) DEFAULT NULL COMMENT '报告期',
  `eps` float DEFAULT NULL COMMENT '基本每股收益',
  `dt_eps` float DEFAULT NULL COMMENT '稀释每股收益',
  `total_revenue_ps` float DEFAULT NULL COMMENT '每股营业总收入',
  `revenue_ps` float DEFAULT NULL COMMENT '每股营业收入',
  `capital_rese_ps` float DEFAULT NULL COMMENT '每股资本公积',
  `surplus_rese_ps` float DEFAULT NULL COMMENT '每股盈余公积',
  `undist_profit_ps` float DEFAULT NULL COMMENT '每股未分配利润',
  `extra_item` float DEFAULT NULL COMMENT '非经常性损益',
  `profit_dedt` float DEFAULT NULL COMMENT '扣除非经常性损益后的净利润',
  `gross_margin` float DEFAULT NULL COMMENT '毛利',
  `current_ratio` float DEFAULT NULL COMMENT '流动比率',
  `quick_ratio` float DEFAULT NULL COMMENT '速动比率',
  `cash_ratio` float DEFAULT NULL COMMENT '保守速动比率',
  `invturn_days` float DEFAULT NULL COMMENT '存货周转天数',
  `arturn_days` float DEFAULT NULL COMMENT '应收账款周转天数',
  `inv_turn` float DEFAULT NULL COMMENT '存货周转率',
  `ar_turn` float DEFAULT NULL COMMENT '应收账款周转率',
  `ca_turn` float DEFAULT NULL COMMENT '流动资产周转率',
  `fa_turn` float DEFAULT NULL COMMENT '固定资产周转率',
  `assets_turn` float DEFAULT NULL COMMENT '总资产周转率',
  `op_income` float DEFAULT NULL COMMENT '经营活动净收益',
  `valuechange_income` float DEFAULT NULL COMMENT '价值变动净收益',
  `interst_income` float DEFAULT NULL COMMENT '利息费用',
  `daa` float DEFAULT NULL COMMENT '折旧与摊销',
  `ebit` float DEFAULT NULL COMMENT '息税前利润',
  `ebitda` float DEFAULT NULL COMMENT '息税折旧摊销前利润',
  `fcff` float DEFAULT NULL COMMENT '企业自由现金流量',
  `fcfe` float DEFAULT NULL COMMENT '股权自由现金流量',
  `current_exint` float DEFAULT NULL COMMENT '无息流动负债',
  `noncurrent_exint` float DEFAULT NULL COMMENT '无息非流动负债',
  `interestdebt` float DEFAULT NULL COMMENT '带息债务',
  `netdebt` float DEFAULT NULL COMMENT '净债务',
  `tangible_asset` float DEFAULT NULL COMMENT '有形资产',
  `working_capital` float DEFAULT NULL COMMENT '营运资金',
  `networking_capital` float DEFAULT NULL COMMENT '营运流动资本',
  `invest_capital` float DEFAULT NULL COMMENT '全部投入资本',
  `retained_earnings` float DEFAULT NULL COMMENT '留存收益',
  `diluted2_eps` float DEFAULT NULL COMMENT '期末摊薄每股收益',
  `bps` float DEFAULT NULL COMMENT '每股净资产',
  `ocfps` float DEFAULT NULL COMMENT '每股经营活动产生的现金流量净额',
  `retainedps` float DEFAULT NULL COMMENT '每股留存收益',
  `cfps` float DEFAULT NULL COMMENT '每股现金流量净额',
  `ebit_ps` float DEFAULT NULL COMMENT '每股息税前利润',
  `fcff_ps` float DEFAULT NULL COMMENT '每股企业自由现金流量',
  `fcfe_ps` float DEFAULT NULL COMMENT '每股股东自由现金流量',
  `netprofit_margin` float DEFAULT NULL COMMENT '销售净利率',
  `grossprofit_margin` float DEFAULT NULL COMMENT '销售毛利率',
  `cogs_of_sales` float DEFAULT NULL COMMENT '销售成本率',
  `expense_of_sales` float DEFAULT NULL COMMENT '销售期间费用率',
  `profit_to_gr` float DEFAULT NULL COMMENT '净利润/营业总收入',
  `saleexp_to_gr` float DEFAULT NULL COMMENT '销售费用/营业总收入',
  `adminexp_of_gr` float DEFAULT NULL COMMENT '管理费用/营业总收入',
  `finaexp_of_gr` float DEFAULT NULL COMMENT '财务费用/营业总收入',
  `impai_ttm` float DEFAULT NULL COMMENT '资产减值损失/营业总收入',
  `gc_of_gr` float DEFAULT NULL COMMENT '营业总成本/营业总收入',
  `op_of_gr` float DEFAULT NULL COMMENT '营业利润/营业总收入',
  `ebit_of_gr` float DEFAULT NULL COMMENT '息税前利润/营业总收入',
  `roe` float DEFAULT NULL COMMENT '净资产收益率',
  `roe_waa` float DEFAULT NULL COMMENT '加权平均净资产收益率',
  `roe_dt` float DEFAULT NULL COMMENT '净资产收益率(扣除非经常损益)',
  `roa` float DEFAULT NULL COMMENT '总资产报酬率',
  `npta` float DEFAULT NULL COMMENT '总资产净利润',
  `roic` float DEFAULT NULL COMMENT '投入资本回报率',
  `roe_yearly` float DEFAULT NULL COMMENT '年化净资产收益率',
  `roa2_yearly` float DEFAULT NULL COMMENT '年化总资产报酬率',
  `roe_avg` float DEFAULT NULL COMMENT '平均净资产收益率(增发条件)',
  `opincome_of_ebt` float DEFAULT NULL COMMENT '经营活动净收益/利润总额',
  `investincome_of_ebt` float DEFAULT NULL COMMENT '价值变动净收益/利润总额',
  `n_op_profit_of_ebt` float DEFAULT NULL COMMENT '营业外收支净额/利润总额',
  `tax_to_ebt` float DEFAULT NULL COMMENT '所得税/利润总额',
  `dtprofit_to_profit` float DEFAULT NULL COMMENT '扣除非经常损益后的净利润/净利润',
  `salescash_to_or` float DEFAULT NULL COMMENT '销售商品提供劳务收到的现金/营业收入',
  `ocf_to_or` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额/营业收入',
  `ocf_to_opincome` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额/经营活动净收益',
  `capitalized_to_da` float DEFAULT NULL COMMENT '资本支出/折旧和摊销',
  `debt_to_assets` float DEFAULT NULL COMMENT '资产负债率',
  `assets_to_eqt` float DEFAULT NULL COMMENT '权益乘数',
  `dp_assets_to_eqt` float DEFAULT NULL COMMENT '权益乘数(杜邦分析)',
  `ca_to_assets` float DEFAULT NULL COMMENT '流动资产/总资产',
  `nca_to_assets` float DEFAULT NULL COMMENT '非流动资产/总资产',
  `tbassets_to_totalassets` float DEFAULT NULL COMMENT '有形资产/总资产',
  `int_to_talcap` float DEFAULT NULL COMMENT '带息债务/全部投入资本',
  `eqt_to_talcapital` float DEFAULT NULL COMMENT '归属于母公司的股东权益/全部投入资本',
  `currentdebt_to_debt` float DEFAULT NULL COMMENT '流动负债/负债合计',
  `longdeb_to_debt` float DEFAULT NULL COMMENT '非流动负债/负债合计',
  `ocf_to_shortdebt` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额/流动负债',
  `debt_to_eqt` float DEFAULT NULL COMMENT '产权比率',
  `eqt_to_debt` float DEFAULT NULL COMMENT '归属于母公司的股东权益/负债合计',
  `eqt_to_interestdebt` float DEFAULT NULL COMMENT '归属于母公司的股东权益/带息债务',
  `tangibleasset_to_debt` float DEFAULT NULL COMMENT '有形资产/负债合计',
  `tangasset_to_intdebt` float DEFAULT NULL COMMENT '有形资产/带息债务',
  `tangibleasset_to_netdebt` float DEFAULT NULL COMMENT '有形资产/净债务',
  `ocf_to_debt` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额/负债合计',
  `ocf_to_interestdebt` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额/带息债务',
  `ocf_to_netdebt` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额/净债务',
  `ebit_to_interest` float DEFAULT NULL COMMENT '已获利息倍数(EBIT/利息费用)',
  `longdebt_to_workingcapital` float DEFAULT NULL COMMENT '长期债务与营运资金比率',
  `ebitda_to_debt` float DEFAULT NULL COMMENT '息税折旧摊销前利润/负债合计',
  `turn_days` float DEFAULT NULL COMMENT '营业周期',
  `roa_yearly` float DEFAULT NULL COMMENT '年化总资产净利率',
  `roa_dp` float DEFAULT NULL COMMENT '总资产净利率(杜邦分析)',
  `fixed_assets` float DEFAULT NULL COMMENT '固定资产合计',
  `profit_prefin_exp` float DEFAULT NULL COMMENT '扣除财务费用前营业利润',
  `non_op_profit` float DEFAULT NULL COMMENT '非营业利润',
  `op_to_ebt` float DEFAULT NULL COMMENT '营业利润／利润总额',
  `nop_to_ebt` float DEFAULT NULL COMMENT '非营业利润／利润总额',
  `ocf_to_profit` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额／营业利润',
  `cash_to_liqdebt` float DEFAULT NULL COMMENT '货币资金／流动负债',
  `cash_to_liqdebt_withinterest` float DEFAULT NULL COMMENT '货币资金／带息流动负债',
  `op_to_liqdebt` float DEFAULT NULL COMMENT '营业利润／流动负债',
  `op_to_debt` float DEFAULT NULL COMMENT '营业利润／负债合计',
  `roic_yearly` float DEFAULT NULL COMMENT '年化投入资本回报率',
  `total_fa_trun` float DEFAULT NULL COMMENT '固定资产合计周转率',
  `profit_to_op` float DEFAULT NULL COMMENT '利润总额／营业收入',
  `q_opincome` float DEFAULT NULL COMMENT '经营活动单季度净收益',
  `q_investincome` float DEFAULT NULL COMMENT '价值变动单季度净收益',
  `q_dtprofit` float DEFAULT NULL COMMENT '扣除非经常损益后的单季度净利润',
  `q_eps` float DEFAULT NULL COMMENT '每股收益(单季度)',
  `q_netprofit_margin` float DEFAULT NULL COMMENT '销售净利率(单季度)',
  `q_gsprofit_margin` float DEFAULT NULL COMMENT '销售毛利率(单季度)',
  `q_exp_to_sales` float DEFAULT NULL COMMENT '销售期间费用率(单季度)',
  `q_profit_to_gr` float DEFAULT NULL COMMENT '净利润／营业总收入(单季度)',
  `q_saleexp_to_gr` float DEFAULT NULL COMMENT '销售费用／营业总收入 (单季度)',
  `q_adminexp_to_gr` float DEFAULT NULL COMMENT '管理费用／营业总收入 (单季度)',
  `q_finaexp_to_gr` float DEFAULT NULL COMMENT '财务费用／营业总收入 (单季度)',
  `q_impair_to_gr_ttm` float DEFAULT NULL COMMENT '资产减值损失／营业总收入(单季度)',
  `q_gc_to_gr` float DEFAULT NULL COMMENT '营业总成本／营业总收入 (单季度)',
  `q_op_to_gr` float DEFAULT NULL COMMENT '营业利润／营业总收入(单季度)',
  `q_roe` float DEFAULT NULL COMMENT '净资产收益率(单季度)',
  `q_dt_roe` float DEFAULT NULL COMMENT '净资产单季度收益率(扣除非经常损益)',
  `q_npta` float DEFAULT NULL COMMENT '总资产净利润(单季度)',
  `q_opincome_to_ebt` float DEFAULT NULL COMMENT '经营活动净收益／利润总额(单季度)',
  `q_investincome_to_ebt` float DEFAULT NULL COMMENT '价值变动净收益／利润总额(单季度)',
  `q_dtprofit_to_profit` float DEFAULT NULL COMMENT '扣除非经常损益后的净利润／净利润(单季度)',
  `q_salescash_to_or` float DEFAULT NULL COMMENT '销售商品提供劳务收到的现金／营业收入(单季度)',
  `q_ocf_to_sales` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额／营业收入(单季度)',
  `q_ocf_to_or` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额／经营活动净收益(单季度)',
  `basic_eps_yoy` float DEFAULT NULL COMMENT '基本每股收益同比增长率(%)',
  `dt_eps_yoy` float DEFAULT NULL COMMENT '稀释每股收益同比增长率(%)',
  `cfps_yoy` float DEFAULT NULL COMMENT '每股经营活动产生的现金流量净额同比增长率(%)',
  `op_yoy` float DEFAULT NULL COMMENT '营业利润同比增长率(%)',
  `ebt_yoy` float DEFAULT NULL COMMENT '利润总额同比增长率(%)',
  `netprofit_yoy` float DEFAULT NULL COMMENT '归属母公司股东的净利润同比增长率(%)',
  `dt_netprofit_yoy` float DEFAULT NULL COMMENT '归属母公司股东的净利润-扣除非经常损益同比增长率(%)',
  `ocf_yoy` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额同比增长率(%)',
  `roe_yoy` float DEFAULT NULL COMMENT '净资产收益率(摊薄)同比增长率(%)',
  `bps_yoy` float DEFAULT NULL COMMENT '每股净资产相对年初增长率(%)',
  `assets_yoy` float DEFAULT NULL COMMENT '资产总计相对年初增长率(%)',
  `eqt_yoy` float DEFAULT NULL COMMENT '归属母公司的股东权益相对年初增长率(%)',
  `tr_yoy` float DEFAULT NULL COMMENT '营业总收入同比增长率(%)',
  `or_yoy` float DEFAULT NULL COMMENT '营业收入同比增长率(%)',
  `q_gr_yoy` float DEFAULT NULL COMMENT '营业总收入同比增长率(%)(单季度)',
  `q_gr_qoq` float DEFAULT NULL COMMENT '营业总收入环比增长率(%)(单季度)',
  `q_sales_yoy` float DEFAULT NULL COMMENT '营业收入同比增长率(%)(单季度)',
  `q_sales_qoq` float DEFAULT NULL COMMENT '营业收入环比增长率(%)(单季度)',
  `q_op_yoy` float DEFAULT NULL COMMENT '营业利润同比增长率(%)(单季度)',
  `q_op_qoq` float DEFAULT NULL COMMENT '营业利润环比增长率(%)(单季度)',
  `q_profit_yoy` float DEFAULT NULL COMMENT '净利润同比增长率(%)(单季度)',
  `q_profit_qoq` float DEFAULT NULL COMMENT '净利润环比增长率(%)(单季度)',
  `q_netprofit_yoy` float DEFAULT NULL COMMENT '归属母公司股东的净利润同比增长率(%)(单季度)',
  `q_netprofit_qoq` float DEFAULT NULL COMMENT '归属母公司股东的净利润环比增长率(%)(单季度)',
  `equity_yoy` float DEFAULT NULL COMMENT '净资产同比增长率',
  `rd_exp` float DEFAULT NULL COMMENT '研发费用',
  `update_flag` varchar(10) DEFAULT NULL COMMENT '更新标识',
  PRIMARY KEY (`id`),
  KEY `stk_fir_tc` (`ts_code`)
) ENGINE=InnoDB;
#财务指标

