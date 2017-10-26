/* 
		author:xhy
		date:2017.10.26
		description:
			保险 统计存储过程（查询统计）
			输入参数：
				start_date(查询统计开始时间)
				end_date(查询统计截至时间) 
				@
				start_date_next(查询统计开始时间)
				end_date_next (查询统计截至时间) 
			输出：保险统计 集合
 */
DROP PROCEDURE IF EXISTS TBTJ_BX;

CREATE PROCEDURE TBTJ_BX(IN start_date DATETIME,IN end_date DATETIME,IN start_date_next DATETIME,IN end_date_next DATETIME)
BEGIN
		SELECT
			'Now' AS Flag,
			COUNT(Num) AS I_COUNT,/* 统计记录数目 */
			SUM(num) AS I_NUM
		FROM 
			insurance 
		WHERE 
				indate >= start_date
			AND 
				indate <= end_date
			AND
				isdel=0 
		UNION ALL
		SELECT
			'Next' AS Flag,
			COUNT(Num) AS I_COUNT,/* 统计记录数目 */
			SUM(num) AS I_NUM
		FROM 
			insurance 
		WHERE 
				indate >= start_date_next
			AND 
				indate <= end_date_next
			AND
				isdel=0 
		;
END;

CALL TBTJ_BX("2017-10-20 13:57:14","2017-10-26 09:20:37","2017-10-20 13:57:14","2017-10-26 09:20:37");