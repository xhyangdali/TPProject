/* 
		author:xhy
		date:2017.10.26
		description:
			关区（分公司）客运站窗口窗口售票金额同比 统计存储过程（查询统计）
			输入参数：
				station_fix(客运站编码前缀) channel_fix(客票渠道前缀) start_date(查询统计开始时间)
				end_date(查询统计截至时间) start_date_next(查询统计开始时间) end_date_next (查询统计截至时间)
			输出：各客运站窗口售票同比数据（票数）集合
 */
DROP PROCEDURE IF EXISTS TB_CHARTS;

CREATE PROCEDURE TB_CHARTS(IN station_fix VARCHAR(20),IN channel_fix VARCHAR(20),IN start_date DATETIME,IN end_date DATETIME,IN start_date_next DATETIME,IN end_date_next DATETIME)
BEGIN
		SELECT
			'Now' as flag,
			sf.stationcode,/* 车站编码 */
			s.`name` AS stationName,/* 车站名称 */
			COUNT(sf.moneynum) AS M_COUNT,/* 统计记录数目 */
			SUM(sf.moneynum) AS M_NUM,/* 金额 */
			COUNT(sf.ticketnum) AS T_COUNT,/* 统计记录数目 */
			SUM(sf.ticketnum) AS T_NUM /* 电子票数目 */
		FROM 
			sales_flow AS sf
		LEFT JOIN station AS s 
			ON sf.stationcode=s.`code`
		WHERE
				sf.flowdate>=start_date
			AND
				sf.flowdate<=end_date
			AND
				sf.stationcode LIKE station_fix
			AND
				sf.channelcode LIKE channel_fix
			AND
				sf.isdel =0
			AND
				s.isdel=0
			AND 
				s.iseffective=0
			GROUP BY 
				sf.stationcode
			UNION ALL
			SELECT
				'Next' as flag,
				sf.stationcode,/* 车站编码 */
				s.`name` AS stationName,/* 车站名称 */
				COUNT(sf.moneynum) AS M_COUNT,/* 统计记录数目 */
				SUM(sf.moneynum) AS M_NUM,/* 金额 */
				COUNT(sf.ticketnum) AS T_COUNT,/* 统计记录数目 */
				SUM(sf.ticketnum) AS T_NUM /* 电子票数目 */
			FROM 
				sales_flow AS sf
			LEFT JOIN station AS s 
				ON sf.stationcode=s.`code`
			WHERE
					sf.flowdate>=start_date_next
				AND
					sf.flowdate<=end_date_next
				AND
					sf.stationcode LIKE station_fix
				AND
					sf.channelcode LIKE channel_fix
				AND
					sf.isdel =0
				AND
					s.isdel=0
				AND 
					s.iseffective=0
				GROUP BY 
					sf.stationcode
		;
END;

CALL TB_CHARTS("20%","20%","2017-10-20 13:57:14","2017-10-26 09:20:37","2017-10-20 13:57:14","2017-10-26 09:20:37");