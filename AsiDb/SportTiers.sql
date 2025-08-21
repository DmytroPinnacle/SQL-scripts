DECLARE @sportNameFlag INT = 1;	DECLARE @sportName Varchar(100) = 'Soccer'; /*  SELECT TOP(1000) * FROM [asidb].[dbo].[tbSport]  */

SELECT TOP (1000) 
       st.[SportTierId]
      ,st.[SportId]
      ,st.[Description]
      ,st.[IsSportDefault]
      ,st.[LastUpdated]
      ,st.[ChangedBy]
      ,st.[LeaguePreFix]
      ,st.[DisplayTierId]
      ,st.[IsEnabled]
  FROM [asidb].[dbo].[tbSportTier] st
		INNER JOIN [asidb].[dbo].[tbSport] s ON st.SportId = s.SportID
	WHERE 1=1
			AND (@sportNameFlag = 0 OR (@sportNameFlag = 1 AND s.[Name] LIKE @sportName))
