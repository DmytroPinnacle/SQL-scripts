DECLARE @sportTypeFlag      INT = 1;	DECLARE @sportType VARCHAR(100) = 'E Sports';
DECLARE @sportSubTypeFlag   INT = 0;	DECLARE @sportSubType VARCHAR(100) = 'NFL%';

SELECT TOP (1000) [TeamID]
      ,[SportType]
      ,[SportSubType]
      ,[ImportTeamID]
  FROM [asidb].[dbo].[tbTeam] t
  WHERE 1=1
		--AND t.TeamID LIKE '%5 Public - LiveDela-1-ignore_sam_pmt_tag%'
		AND (@sportTypeFlag		= 0     OR (@sportTypeFlag		= 1 AND t.SportType LIKE @sportType))
		AND (@sportSubTypeFlag	= 0		OR (@sportSubTypeFlag	= 1 AND t.SportSubType LIKE @sportSubType))
		AND t.TeamID not like '%Home%'
		AND t.TeamID not like '%Away%'
		AND t.TeamID not like '%Saturday%'
		AND t.TeamID not like '%Sunday%'
		AND t.TeamID not like '%Test%'
		AND t.TeamID not like '%tier%'
