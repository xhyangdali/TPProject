/* 
		author:xhy
		date:2017.10.26
		description:
			电子客票销售张数统计存储过程（查询统计）
			输入参数：station_fix_a(GQ公司客运站编码前缀) station_fix_b (XF公司客运站编码前缀) channel_fix(客票渠道前缀) start_date(查询统计开始时间) end_date(查询统计截至时间)
			输出：分公司各客运站窗口售票金额集合
 */

DROP PROCEDURE IF EXISTS GQXF_ETICKET_CHARTS;

CREATE PROCEDURE GQXF_ETICKET_CHARTS(IN station_fix_a VARCHAR(20),IN station_fix_b VARCHAR(20),IN channel_fix VARCHAR(20),IN start_date DATETIME,IN end_date DATETIME)
BEGIN
		SELECT
			sf.stationcode,/* 车站编码 */
			sf.channelcode,/* 渠道编码 */
			s.`name` AS stationName,/* 车站名称 */
			c.`name` AS ChannelName,/* 渠道名称 */
			COUNT(sf.moneynum) AS M_COUNT,/* 统计记录数目 */
			SUM(sf.moneynum) AS M_NUM,/* 金额 */
			COUNT(sf.ticketnum) AS T_COUNT,/* 统计记录数目 */
			SUM(sf.ticketnum) AS T_NUM /* 电子票数目 */
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
				sf.stationcode LIKE station_fix_a
			AND
				sf.channelcode LIKE channel_fix
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
			GROUP BY 
				sf.stationcode,left(sf.channelcode,4)
		UNION ALL
		SELECT
			left(sf.stationcode,2),
			sf.channelcode,
			'县分公司' AS stationName,
			c.`name` AS ChannelName,
			COUNT(sf.moneynum) AS M_COUNT,
			SUM(sf.moneynum) AS M_NUM,
			COUNT(sf.ticketnum) AS T_COUNT,
			SUM(sf.ticketnum) AS T_NUM
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
				sf.stationcode LIKE station_fix_b
			AND
				left(sf.channelcode,4) LIKE channel_fix
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
			GROUP BY 
				left(sf.channelcode,4)
		;
END;

CALL GQXF_ETICKET_CHARTS("10%","20%","20%","2017-10-25 00:00:00","2017-10-26 00:00:00");