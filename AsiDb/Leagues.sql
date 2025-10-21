DECLARE @isLiveFlag		    INT = 0;	DECLARE @isLive INT = 1;	
DECLARE @countryNameFlag    INT = 1;	DECLARE @countryName VARCHAR(100) = 'USA';
DECLARE @sportNameFlag      INT = 1;	DECLARE @sportName Varchar(100) = 'Football'; /*  SELECT TOP(1000) * FROM [asidb].[dbo].[tbSport]  */
DECLARE @sportSubTypeFlag   INT = 1;	DECLARE @sportSubType VARCHAR(100) = 'NFL%';

SELECT TOP (1000) 
      st.[LeagueId]
      ,st.[SportType]
      ,CONCAT('(', st.[SportID], ', ', s.[Name], ')') AS Sport
      ,st.[SportSubType]
      ,st.[ImportSport]
      ,st.[DrawFlag]
      ,st.[SequenceNumber]
      ,st.[IsLive]
      ,st.[HomeTeam]
      ,st.[ShowRotNum]
      ,st.[PrimaryLeagueOrdering]
      ,st.[Active]
      ,st.[ShowScore]
      ,st.[EarlyMarketDefault]
      ,st.[SportSubTypeLongDesc]
      ,st.[MensTennis]
      ,st.[TennisFiveSets]
      ,st.[ListedPitchersOnly]
      ,st.[AllowRoundRobins]
      ,st.[OddsCheck]
      ,st.[AutomaticProfile]
      ,st.[FeaturedLeague]
      ,CONCAT('(', st.[CountryId], ', ', cr.[Name], ')') AS Country
      ,st.[GenderGroupID]
      ,CASE WHEN st.[MasterLeagueID] IS NULL THEN NULL ELSE CONCAT('(', st.[MasterLeagueID], ', ', ml.[SportType], ')') END AS MasterLeague
      ,CASE WHEN st.[ParentLeagueID] IS NULL THEN NULL ELSE CONCAT('(', st.[ParentLeagueID], ', ', pl.[SportType], ')') END AS ParentLeague
      ,st.[LastUpdated]
      ,st.[ParlayRestrictionDefault]
      ,st.[SportsbookDepartmentId]
      ,st.[DefaultHomeFieldTypeId]
      ,st.[SportTierId]
      ,st.[ParticipantAgeGroupId]
      ,st.[LiveCoverage]
      ,st.[LiveCoverageType]
  FROM [asidb].[dbo].[tbSportType] st
    INNER JOIN [asidb].[dbo].[tbSport] s            ON st.SportId = s.SportID
	  INNER JOIN [dbo].[tbFBSCountriesAndRegions] cr  ON st.CountryId = cr.CountryId
      LEFT JOIN [asidb].[dbo].[tbSportType] ml ON st.MasterLeagueID = ml.LeagueId
      LEFT JOIN [asidb].[dbo].[tbSportType] pl ON st.ParentLeagueID = pl.LeagueId
  WHERE 1=1
		--AND st.LeagueId = 11699
		--AND st.SportType LIKE 'Soccer%'					--	'Football'
		--AND st.SportSubType LIKE '%Eng%Premier%'			--	'NFL%'
        AND (@sportNameFlag = 0     OR (@sportNameFlag = 1      AND s.[Name] LIKE @sportName))
		AND (@sportSubTypeFlag = 0  OR (@sportSubTypeFlag = 1   AND st.[SportSubType] LIKE @sportSubType))
		AND (@isLiveFlag = 0		OR (@isLiveFlag = 1         AND st.IsLive = @isLive))
		AND (@countryNameFlag = 0	OR (@countryNameFlag = 1    AND cr.[Name] LIKE @countryName))
