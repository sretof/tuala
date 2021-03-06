﻿#DROP TABLE IF EXISTS `stk_balancesheet`;
CREATE TABLE `stk_balancesheet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ts_code` varchar(9) NOT NULL COMMENT 'TS代码',
  `ann_date` char(8) DEFAULT NULL COMMENT '公告日期',
  `f_ann_date` char(8) DEFAULT NULL COMMENT '实际公告日期，即发生过数据变更的最终日期',
  `end_date` char(8) DEFAULT NULL COMMENT '报告期',
  `report_type` char(2) DEFAULT NULL COMMENT '报告类型stk_enum.report_type',
  `comp_type` char(1) DEFAULT NULL COMMENT '公司类型stk_enum.comp_type',
  `total_share` float DEFAULT NULL COMMENT '期末总股本',
  `cap_rese` float DEFAULT NULL COMMENT '资本公积金',
  `undistr_porfit` float DEFAULT NULL COMMENT '未分配利润',
  `surplus_rese` float DEFAULT NULL COMMENT '盈余公积金',
  `special_rese` float DEFAULT NULL COMMENT '专项储备',
  `money_cap` float DEFAULT NULL COMMENT '货币资金',
  `trad_asset` float DEFAULT NULL COMMENT '交易性金融资产',
  `notes_receiv` float DEFAULT NULL COMMENT '应收票据',
  `accounts_receiv` float DEFAULT NULL COMMENT '应收账款',
  `oth_receiv` float DEFAULT NULL COMMENT '其他应收款',
  `prepayment` float DEFAULT NULL COMMENT '预付款项',
  `div_receiv` float DEFAULT NULL COMMENT '应收股利',
  `int_receiv` float DEFAULT NULL COMMENT '应收利息',
  `inventories` float DEFAULT NULL COMMENT '存货',
  `amor_exp` float DEFAULT NULL COMMENT '长期待摊费用',
  `nca_within_1y` float DEFAULT NULL COMMENT '一年内到期的非流动资产',
  `sett_rsrv` float DEFAULT NULL COMMENT '结算备付金',
  `loanto_oth_bank_fi` float DEFAULT NULL COMMENT '拆出资金',
  `premium_receiv` float DEFAULT NULL COMMENT '应收保费',
  `reinsur_receiv` float DEFAULT NULL COMMENT '应收分保账款',
  `reinsur_res_receiv` float DEFAULT NULL COMMENT '应收分保合同准备金',
  `pur_resale_fa` float DEFAULT NULL COMMENT '买入返售金融资产',
  `oth_cur_assets` float DEFAULT NULL COMMENT '其他流动资产',
  `total_cur_assets` float DEFAULT NULL COMMENT '流动资产合计',
  `fa_avail_for_sale` float DEFAULT NULL COMMENT '可供出售金融资产',
  `htm_invest` float DEFAULT NULL COMMENT '持有至到期投资',
  `lt_eqt_invest` float DEFAULT NULL COMMENT '长期股权投资',
  `invest_real_estate` float DEFAULT NULL COMMENT '投资性房地产',
  `time_deposits` float DEFAULT NULL COMMENT '定期存款',
  `oth_assets` float DEFAULT NULL COMMENT '其他资产',
  `lt_rec` float DEFAULT NULL COMMENT '长期应收款',
  `fix_assets` float DEFAULT NULL COMMENT '固定资产',
  `cip` float DEFAULT NULL COMMENT '在建工程',
  `const_materials` float DEFAULT NULL COMMENT '工程物资',
  `fixed_assets_disp` float DEFAULT NULL COMMENT '固定资产清理',
  `produc_bio_assets` float DEFAULT NULL COMMENT '生产性生物资产',
  `oil_and_gas_assets` float DEFAULT NULL COMMENT '油气资产',
  `intan_assets` float DEFAULT NULL COMMENT '无形资产',
  `r_and_d` float DEFAULT NULL COMMENT '研发支出',
  `goodwill` float DEFAULT NULL COMMENT '商誉',
  `lt_amor_exp` float DEFAULT NULL COMMENT '长期待摊费用',
  `defer_tax_assets` float DEFAULT NULL COMMENT '递延所得税资产',
  `decr_in_disbur` float DEFAULT NULL COMMENT '发放贷款及垫款',
  `oth_nca` float DEFAULT NULL COMMENT '其他非流动资产',
  `total_nca` float DEFAULT NULL COMMENT '非流动资产合计',
  `cash_reser_cb` float DEFAULT NULL COMMENT '现金及存放中央银行款项',
  `depos_in_oth_bfi` float DEFAULT NULL COMMENT '存放同业和其它金融机构款项',
  `prec_metals` float DEFAULT NULL COMMENT '贵金属',
  `deriv_assets` float DEFAULT NULL COMMENT '衍生金融资产',
  `rr_reins_une_prem` float DEFAULT NULL COMMENT '应收分保未到期责任准备金',
  `rr_reins_outstd_cla` float DEFAULT NULL COMMENT '应收分保未决赔款准备金',
  `rr_reins_lins_liab` float DEFAULT NULL COMMENT '应收分保寿险责任准备金',
  `rr_reins_lthins_liab` float DEFAULT NULL COMMENT '应收分保长期健康险责任准备金',
  `refund_depos` float DEFAULT NULL COMMENT '存出保证金',
  `ph_pledge_loans` float DEFAULT NULL COMMENT '保户质押贷款',
  `refund_cap_depos` float DEFAULT NULL COMMENT '存出资本保证金',
  `indep_acct_assets` float DEFAULT NULL COMMENT '独立账户资产',
  `client_depos` float DEFAULT NULL COMMENT '其中：客户资金存款',
  `client_prov` float DEFAULT NULL COMMENT '其中：客户备付金',
  `transac_seat_fee` float DEFAULT NULL COMMENT '其中:交易席位费',
  `invest_as_receiv` float DEFAULT NULL COMMENT '应收款项类投资',
  `total_assets` float DEFAULT NULL COMMENT '资产总计',
  `lt_borr` float DEFAULT NULL COMMENT '长期借款',
  `st_borr` float DEFAULT NULL COMMENT '短期借款',
  `cb_borr` float DEFAULT NULL COMMENT '向中央银行借款',
  `depos_ib_deposits` float DEFAULT NULL COMMENT '吸收存款及同业存放',
  `loan_oth_bank` float DEFAULT NULL COMMENT '拆入资金',
  `trading_fl` float DEFAULT NULL COMMENT '交易性金融负债',
  `notes_payable` float DEFAULT NULL COMMENT '应付票据',
  `acct_payable` float DEFAULT NULL COMMENT '应付账款',
  `adv_receipts` float DEFAULT NULL COMMENT '预收款项',
  `sold_for_repur_fa` float DEFAULT NULL COMMENT '卖出回购金融资产款',
  `comm_payable` float DEFAULT NULL COMMENT '应付手续费及佣金',
  `payroll_payable` float DEFAULT NULL COMMENT '应付职工薪酬',
  `taxes_payable` float DEFAULT NULL COMMENT '应交税费',
  `int_payable` float DEFAULT NULL COMMENT '应付利息',
  `div_payable` float DEFAULT NULL COMMENT '应付股利',
  `oth_payable` float DEFAULT NULL COMMENT '其他应付款',
  `acc_exp` float DEFAULT NULL COMMENT '预提费用',
  `deferred_inc` float DEFAULT NULL COMMENT '递延收益',
  `st_bonds_payable` float DEFAULT NULL COMMENT '应付短期债券',
  `payable_to_reinsurer` float DEFAULT NULL COMMENT '应付分保账款',
  `rsrv_insur_cont` float DEFAULT NULL COMMENT '保险合同准备金',
  `acting_trading_sec` float DEFAULT NULL COMMENT '代理买卖证券款',
  `acting_uw_sec` float DEFAULT NULL COMMENT '代理承销证券款',
  `non_cur_liab_due_1y` float DEFAULT NULL COMMENT '一年内到期的非流动负债',
  `oth_cur_liab` float DEFAULT NULL COMMENT '其他流动负债',
  `total_cur_liab` float DEFAULT NULL COMMENT '流动负债合计',
  `bond_payable` float DEFAULT NULL COMMENT '应付债券',
  `lt_payable` float DEFAULT NULL COMMENT '长期应付款',
  `specific_payables` float DEFAULT NULL COMMENT '专项应付款',
  `estimated_liab` float DEFAULT NULL COMMENT '预计负债',
  `defer_tax_liab` float DEFAULT NULL COMMENT '递延所得税负债',
  `defer_inc_non_cur_liab` float DEFAULT NULL COMMENT '递延收益-非流动负债',
  `oth_ncl` float DEFAULT NULL COMMENT '其他非流动负债',
  `total_ncl` float DEFAULT NULL COMMENT '非流动负债合计',
  `depos_oth_bfi` float DEFAULT NULL COMMENT '同业和其它金融机构存放款项',
  `deriv_liab` float DEFAULT NULL COMMENT '衍生金融负债',
  `depos` float DEFAULT NULL COMMENT '吸收存款',
  `agency_bus_liab` float DEFAULT NULL COMMENT '代理业务负债',
  `oth_liab` float DEFAULT NULL COMMENT '其他负债',
  `prem_receiv_adva` float DEFAULT NULL COMMENT '预收保费',
  `depos_received` float DEFAULT NULL COMMENT '存入保证金',
  `ph_invest` float DEFAULT NULL COMMENT '保户储金及投资款',
  `reser_une_prem` float DEFAULT NULL COMMENT '未到期责任准备金',
  `reser_outstd_claims` float DEFAULT NULL COMMENT '未决赔款准备金',
  `reser_lins_liab` float DEFAULT NULL COMMENT '寿险责任准备金',
  `reser_lthins_liab` float DEFAULT NULL COMMENT '长期健康险责任准备金',
  `indept_acc_liab` float DEFAULT NULL COMMENT '独立账户负债',
  `pledge_borr` float DEFAULT NULL COMMENT '其中:质押借款',
  `indem_payable` float DEFAULT NULL COMMENT '应付赔付款',
  `policy_div_payable` float DEFAULT NULL COMMENT '应付保单红利',
  `total_liab` float DEFAULT NULL COMMENT '负债合计',
  `treasury_share` float DEFAULT NULL COMMENT '减:库存股',
  `ordin_risk_reser` float DEFAULT NULL COMMENT '一般风险准备',
  `forex_differ` float DEFAULT NULL COMMENT '外币报表折算差额',
  `invest_loss_unconf` float DEFAULT NULL COMMENT '未确认的投资损失',
  `minority_int` float DEFAULT NULL COMMENT '少数股东权益',
  `total_hldr_eqy_exc_min_int` float DEFAULT NULL COMMENT '股东权益合计(不含少数股东权益)',
  `total_hldr_eqy_inc_min_int` float DEFAULT NULL COMMENT '股东权益合计(含少数股东权益)',
  `total_liab_hldr_eqy` float DEFAULT NULL COMMENT '负债及股东权益总计',
  `lt_payroll_payable` float DEFAULT NULL COMMENT '长期应付职工薪酬',
  `oth_comp_income` float DEFAULT NULL COMMENT '其他综合收益',
  `oth_eqt_tools` float DEFAULT NULL COMMENT '其他权益工具',
  `oth_eqt_tools_p_shr` float DEFAULT NULL COMMENT '其他权益工具(优先股)',
  `lending_funds` float DEFAULT NULL COMMENT '融出资金',
  `acc_receivable` float DEFAULT NULL COMMENT '应收款项',
  `st_fin_payable` float DEFAULT NULL COMMENT '应付短期融资款',
  `payables` float DEFAULT NULL COMMENT '应付款项',
  `hfs_assets` float DEFAULT NULL COMMENT '持有待售的资产',
  `hfs_sales` float DEFAULT NULL COMMENT '持有待售的负债',
  `update_flag` varchar(10) DEFAULT NULL COMMENT '更新标识',
  PRIMARY KEY (`id`),
  KEY `stk_bs_tc` (`ts_code`)
) ENGINE=InnoDB;

