/* 
		author:xhy
		date:2017.11.20
		description:
			电子客票占窗口售票比例统计存储过程（查询统计）
			输入参数：start_date(查询统计开始时间) end_date(查询统计截至时间)
			输出：电子客票占窗口售票比例
 */

DROP PROCEDURE IF EXISTS ZB_ETICKET_CHARTS;

CREATE PROCEDURE ZB_ETICKET_CHARTS(IN start_date DATETIME,IN end_date DATETIME)
BEGIN
		SELECT
			'CK' AS Flag,/* 窗口数据 */
			COUNT(sf.moneynum) AS M_COUNT,/* 统计记录数目 */
			SUM(sf.moneynum) AS M_NUM,/* 金额 */
			COUNT(sf.ticketnum) AS T_COUNT,/* 统计记录数目 */
			SUM(sf.ticketnum) AS T_NUM /* 票数目 */
		FROM 
			sales_flow AS sf
		LEFT JOIN station AS s 
			ON sf.stationcode=s.`code`
		LEFT JOIN channel AS c ON sf.channelcode=c.`code`
		WHERE
				sf.flowdate>=start_date
			AND
				sf.flowdate<=end_date
			AND
				sf.channelcode LIKE "10%" /* 窗口数据 */
			AND
				sf.isdel =0
			AND
				s.isdel=0
			AND 
				s.iseffective=0
			AND
				c.isdel=0
			AND
				c.iseffective=0
		UNION ALL
		SELECT
			'ET' AS Flag,/* 窗口数据 */
			COUNT(sf.moneynum) AS M_COUNT,/* 统计记录数目 */
			SUM(sf.moneynum) AS M_NUM,/* 金额 */
			COUNT(sf.ticketnum) AS T_COUNT,/* 统计记录数目 */
			SUM(sf.ticketnum) AS T_NUM /* 票数目 */
		FROM 
			sales_flow AS sf
		LEFT JOIN station AS s 
			ON sf.stationcode=s.`code`
		LEFT JOIN channel AS c ON sf.channelcode=c.`code`
		WHERE
				sf.flowdate>=start_date
			AND
				sf.flowdate<=end_date
			AND
				sf.channelcode LIKE "20%"  /* 电子客票数据 */
			AND
				sf.isdel =0
			AND
				s.isdel=0
			AND 
				s.iseffective=0
			AND
				c.isdel=0
			AND 
				c.iseffective=0
		;
END;

CALL ZB_ETICKET_CHARTS("2017-10-22 00:00:00","2017-11-21 00:00:00");