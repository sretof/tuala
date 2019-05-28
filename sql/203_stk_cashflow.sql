﻿#DROP TABLE IF EXISTS `stk_cashflow`;
CREATE TABLE `stk_cashflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公告日期',
  `f_ann_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '实际公告日期，即发生过数据变更的最终日期',
  `end_date` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '报告期',
  `report_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '报告类型stk_enum.report_type',
  `comp_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司类型stk_enum.comp_type',
  `net_profit` float DEFAULT NULL COMMENT '净利润',
  `finan_exp` float DEFAULT NULL COMMENT '财务费用',
  `c_fr_sale_sg` float DEFAULT NULL COMMENT '销售商品、提供劳务收到的现金',
  `recp_tax_rends` float DEFAULT NULL COMMENT '收到的税费返还',
  `n_depos_incr_fi` float DEFAULT NULL COMMENT '客户存款和同业存放款项净增加额',
  `n_incr_loans_cb` float DEFAULT NULL COMMENT '向中央银行借款净增加额',
  `n_inc_borr_oth_fi` float DEFAULT NULL COMMENT '向其他金融机构拆入资金净增加额',
  `prem_fr_orig_contr` float DEFAULT NULL COMMENT '收到原保险合同保费取得的现金',
  `n_incr_insured_dep` float DEFAULT NULL COMMENT '保户储金净增加额',
  `n_reinsur_prem` float DEFAULT NULL COMMENT '收到再保业务现金净额',
  `n_incr_disp_tfa` float DEFAULT NULL COMMENT '处置交易性金融资产净增加额',
  `ifc_cash_incr` float DEFAULT NULL COMMENT '收取利息和手续费净增加额',
  `n_incr_disp_faas` float DEFAULT NULL COMMENT '处置可供出售金融资产净增加额',
  `n_incr_loans_oth_bank` float DEFAULT NULL COMMENT '拆入资金净增加额',
  `n_cap_incr_repur` float DEFAULT NULL COMMENT '回购业务资金净增加额',
  `c_fr_oth_operate_a` float DEFAULT NULL COMMENT '收到其他与经营活动有关的现金',
  `c_inf_fr_operate_a` float DEFAULT NULL COMMENT '经营活动现金流入小计',
  `c_paid_goods_s` float DEFAULT NULL COMMENT '购买商品、接受劳务支付的现金',
  `c_paid_to_for_empl` float DEFAULT NULL COMMENT '支付给职工以及为职工支付的现金',
  `c_paid_for_taxes` float DEFAULT NULL COMMENT '支付的各项税费',
  `n_incr_clt_loan_adv` float DEFAULT NULL COMMENT '客户贷款及垫款净增加额',
  `n_incr_dep_cbob` float DEFAULT NULL COMMENT '存放央行和同业款项净增加额',
  `c_pay_claims_orig_inco` float DEFAULT NULL COMMENT '支付原保险合同赔付款项的现金',
  `pay_handling_chrg` float DEFAULT NULL COMMENT '支付手续费的现金',
  `pay_comm_insur_plcy` float DEFAULT NULL COMMENT '支付保单红利的现金',
  `oth_cash_pay_oper_act` float DEFAULT NULL COMMENT '支付其他与经营活动有关的现金',
  `st_cash_out_act` float DEFAULT NULL COMMENT '经营活动现金流出小计',
  `n_cashflow_act` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额',
  `oth_recp_ral_inv_act` float DEFAULT NULL COMMENT '收到其他与投资活动有关的现金',
  `c_disp_withdrwl_invest` float DEFAULT NULL COMMENT '收回投资收到的现金',
  `c_recp_return_invest` float DEFAULT NULL COMMENT '取得投资收益收到的现金',
  `n_recp_disp_fiolta` float DEFAULT NULL COMMENT '处置固定资产、无形资产和其他长期资产收回的现金净额',
  `n_recp_disp_sobu` float DEFAULT NULL COMMENT '处置子公司及其他营业单位收到的现金净额',
  `stot_inflows_inv_act` float DEFAULT NULL COMMENT '投资活动现金流入小计',
  `c_pay_acq_const_fiolta` float DEFAULT NULL COMMENT '购建固定资产、无形资产和其他长期资产支付的现金',
  `c_paid_invest` float DEFAULT NULL COMMENT '投资支付的现金',
  `n_disp_subs_oth_biz` float DEFAULT NULL COMMENT '取得子公司及其他营业单位支付的现金净额',
  `oth_pay_ral_inv_act` float DEFAULT NULL COMMENT '支付其他与投资活动有关的现金',
  `n_incr_pledge_loan` float DEFAULT NULL COMMENT '质押贷款净增加额',
  `stot_out_inv_act` float DEFAULT NULL COMMENT '投资活动现金流出小计',
  `n_cashflow_inv_act` float DEFAULT NULL COMMENT '投资活动产生的现金流量净额',
  `c_recp_borrow` float DEFAULT NULL COMMENT '取得借款收到的现金',
  `proc_issue_bonds` float DEFAULT NULL COMMENT '发行债券收到的现金',
  `oth_cash_recp_ral_fnc_act` float DEFAULT NULL COMMENT '收到其他与筹资活动有关的现金',
  `stot_cash_in_fnc_act` float DEFAULT NULL COMMENT '筹资活动现金流入小计',
  `free_cashflow` float DEFAULT NULL COMMENT '企业自由现金流量',
  `c_prepay_amt_borr` float DEFAULT NULL COMMENT '偿还债务支付的现金',
  `c_pay_dist_dpcp_int_exp` float DEFAULT NULL COMMENT '分配股利、利润或偿付利息支付的现金',
  `incl_dvd_profit_paid_sc_ms` float DEFAULT NULL COMMENT '其中:子公司支付给少数股东的股利、利润',
  `oth_cashpay_ral_fnc_act` float DEFAULT NULL COMMENT '支付其他与筹资活动有关的现金',
  `stot_cashout_fnc_act` float DEFAULT NULL COMMENT '筹资活动现金流出小计',
  `n_cash_flows_fnc_act` float DEFAULT NULL COMMENT '筹资活动产生的现金流量净额',
  `eff_fx_flu_cash` float DEFAULT NULL COMMENT '汇率变动对现金的影响',
  `n_incr_cash_cash_equ` float DEFAULT NULL COMMENT '现金及现金等价物净增加额',
  `c_cash_equ_beg_period` float DEFAULT NULL COMMENT '期初现金及现金等价物余额',
  `c_cash_equ_end_period` float DEFAULT NULL COMMENT '期末现金及现金等价物余额',
  `c_recp_cap_contrib` float DEFAULT NULL COMMENT '吸收投资收到的现金',
  `incl_cash_rec_saims` float DEFAULT NULL COMMENT '其中:子公司吸收少数股东投资收到的现金',
  `uncon_invest_loss` float DEFAULT NULL COMMENT '未确认投资损失',
  `prov_depr_assets` float DEFAULT NULL COMMENT '加:资产减值准备',
  `depr_fa_coga_dpba` float DEFAULT NULL COMMENT '固定资产折旧、油气资产折耗、生产性生物资产折旧',
  `amort_intang_assets` float DEFAULT NULL COMMENT '无形资产摊销',
  `lt_amort_deferred_exp` float DEFAULT NULL COMMENT '长期待摊费用摊销',
  `decr_deferred_exp` float DEFAULT NULL COMMENT '待摊费用减少',
  `incr_acc_exp` float DEFAULT NULL COMMENT '预提费用增加',
  `loss_disp_fiolta` float DEFAULT NULL COMMENT '处置固定、无形资产和其他长期资产的损失',
  `loss_scr_fa` float DEFAULT NULL COMMENT '固定资产报废损失',
  `loss_fv_chg` float DEFAULT NULL COMMENT '公允价值变动损失',
  `invest_loss` float DEFAULT NULL COMMENT '投资损失',
  `decr_def_inc_tax_assets` float DEFAULT NULL COMMENT '递延所得税资产减少',
  `incr_def_inc_tax_liab` float DEFAULT NULL COMMENT '递延所得税负债增加',
  `decr_inventories` float DEFAULT NULL COMMENT '存货的减少',
  `decr_oper_payable` float DEFAULT NULL COMMENT '经营性应收项目的减少',
  `incr_oper_payable` float DEFAULT NULL COMMENT '经营性应付项目的增加',
  `others` float DEFAULT NULL COMMENT '其他',
  `im_net_cashflow_oper_act` float DEFAULT NULL COMMENT '经营活动产生的现金流量净额(间接法)',
  `conv_debt_into_cap` float DEFAULT NULL COMMENT '债务转为资本',
  `conv_copbonds_due_within_1y` float DEFAULT NULL COMMENT '一年内到期的可转换公司债券',
  `fa_fnc_leases` float DEFAULT NULL COMMENT '融资租入固定资产',
  `end_bal_cash` float DEFAULT NULL COMMENT '现金的期末余额',
  `beg_bal_cash` float DEFAULT NULL COMMENT '减:现金的期初余额',
  `end_bal_cash_equ` float DEFAULT NULL COMMENT '加:现金等价物的期末余额',
  `beg_bal_cash_equ` float DEFAULT NULL COMMENT '减:现金等价物的期初余额',
  `im_n_incr_cash_equ` float DEFAULT NULL COMMENT '现金及现金等价物净增加额(间接法)',
  `update_flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '更新标识',
  PRIMARY KEY (`id`),
  KEY `stk_cf_tc` (`ts_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

