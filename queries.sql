--select * from combined_big_mac_table
--select * from combined_macro_economic_indicators_table_daily
--select * from aggregated_macro_economic_indicators_table_monthly
--select count(*) from combined_macro_economic_indicators_table_daily
--select count(*) from aggregated_macro_economic_indicators_table_monthly
--select count(*) from combined_big_mac_table;
--select * from combined_big_mac_table;

--select bigmac_eurusd from combined_big_mac_table;
-- select m.date, m.inrusd, bm.date, bm.bigmac_inrusd from aggregated_macro_economic_indicators_table_monthly m, combined_big_mac_table bm 
-- where m.date = bm.date;

drop view India;

create table India as 
	select m.date, m.inrusd, bm.bigmac_inrusd from aggregated_macro_economic_indicators_table_monthly m, combined_big_mac_table bm 
	where m.date = bm.date;


alter table India add column over_under_valued1 varchar(30);

insert into India.over_under_valued as (select inrusd, bigmac_inrusd 
										from India if inrusd>=bigmac_inrusd then over_under_valued = 'over' else India.over_under_valued = 'under');

select * from India;

-- select m.date, m.chyusd, bm.date, bm.bigmac_chyusd from aggregated_macro_economic_indicators_table_monthly m, combined_big_mac_table bm 
-- where m.date = bm.date;

