/* 
		author:xhy
		date:2017.10.26
		description:
			关区（分公司）客运站窗口售票金额(票数)统计存储过程（查询统计）
			输入参数：station_fix(客运站编码前缀) channel_fix(客票渠道前缀) start_date(查询统计开始时间) end_date(查询统计截至时间)
			输出：各客运站窗口售票金额（票数）集合
 */

DROP PROCEDURE IF EXISTS GQ_CHARTS;

CREATE PROCEDURE GQ_CHARTS(IN station_fix VARCHAR(20),IN channel_fix VARCHAR(20),IN start_date DATETIME,IN end_date DATETIME)
BEGIN
		SELECT
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
		;
END;

CALL GQ_CHARTS("%","10%","2017-10-20 13:57:14","2017-10-26 09:20:37");
