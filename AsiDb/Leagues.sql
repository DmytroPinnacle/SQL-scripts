DECLARE @isLiveFlag		    INT = 0;	DECLARE @isLive INT = 1;	
DECLARE @countryNameFlag    INT = 0;	DECLARE @countryName VARCHAR(100) = 'USA';
DECLARE @sportNameFlag      INT = 1;	DECLARE @sportName Varchar(100) = 'Basketball          '; /*  SELECT TOP(1000) * FROM [asidb].[dbo].[tbSport]  */
DECLARE @sportSubTypeFlag   INT = 1;	DECLARE @sportSubType VARCHAR(100) = 'NBA' --'NFL%';
DECLARE @ageGroupFlag       INT = 1;	DECLARE @ageGroup VARCHAR(100) = 'Open';       /* SELECT * FROM [tbParticipantAgeGroup] */

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
      ,CONCAT('(', st.[ParticipantAgeGroupId], ', ', ag.Description, ')') AS ParticipantAgeGroupId
      ,st.[LiveCoverage]
      ,st.[LiveCoverageType]
  FROM [asidb].[dbo].[tbSportType] st
      INNER JOIN [asidb].[dbo].[tbSport] s            ON st.SportId = s.SportID
	  INNER JOIN [dbo].[tbFBSCountriesAndRegions] cr  ON st.CountryId = cr.CountryId
      LEFT JOIN [asidb].[dbo].[tbSportType] ml ON st.MasterLeagueID = ml.LeagueId
      LEFT JOIN [asidb].[dbo].[tbSportType] pl ON st.ParentLeagueID = pl.LeagueId
      LEFT JOIN [asidb].[dbo].[tbParticipantAgeGroup] ag ON st.ParticipantAgeGroupId = ag.ParticipantAgeGroupId
  WHERE 1=1
		--AND st.LeagueId = 297 --1980
        AND st.Active = 1
        -----------------------------------------
		--AND st.SportType LIKE 'Soccer%'					--	'Football'
		--AND st.SportSubType LIKE '%Eng%Premier%'			--	'NFL%'
        AND (@sportNameFlag = 0     OR (@sportNameFlag = 1      AND s.[Name] LIKE @sportName))
        AND (@sportSubTypeFlag = 0  OR (@sportSubTypeFlag = 1   AND st.[SportSubType] LIKE @sportSubType))
        AND (@isLiveFlag = 0		OR (@isLiveFlag = 1         AND st.IsLive = @isLive))
        AND (@countryNameFlag = 0	OR (@countryNameFlag = 1    AND cr.[Name] LIKE @countryName))
        AND (@ageGroupFlag = 0      OR (@ageGroupFlag = 1       AND ag.[Description] LIKE @ageGroup))
        -----------------------------------------
        AND st.ParentLeagueID is null
        AND st.IsLive = 0





-------------/* Find live leagues */----------------------------------------
----------------------------------------------------------------------------------
 
 /*

DECLARE @isLiveFlag		    INT = 0;	DECLARE @isLive INT = 1;	
DECLARE @countryNameFlag    INT = 0;	DECLARE @countryName VARCHAR(100) = 'USA';
DECLARE @sportNameFlag      INT = 0;	DECLARE @sportName Varchar(100) = 'Soccer'; /*  SELECT TOP(1000) * FROM [asidb].[dbo].[tbSport]  */
DECLARE @sportSubTypeFlag   INT = 0;	DECLARE @sportSubType VARCHAR(100) = '%MLB%' --'NFL%';
DECLARE @ageGroupFlag       INT = 0;	DECLARE @ageGroup VARCHAR(100) = 'Open';       /* SELECT * FROM [tbParticipantAgeGroup] */

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
      ,CONCAT('(', st.[ParticipantAgeGroupId], ', ', ag.Description, ')') AS ParticipantAgeGroupId
      ,st.[LiveCoverage]
      ,st.[LiveCoverageType]
      , '-----------------------' "-----------",
      childST.*
  FROM [asidb].[dbo].[tbSportType] st
      LEFT JOIN [asidb].[dbo].[tbSportType] childST ON childST.MasterLeagueID = st.LeagueId AND childST.Active = 1 AND childST.IsLive = 1
      INNER JOIN [asidb].[dbo].[tbSport] s            ON st.SportId = s.SportID
	  INNER JOIN [dbo].[tbFBSCountriesAndRegions] cr  ON st.CountryId = cr.CountryId
      LEFT JOIN [asidb].[dbo].[tbSportType] ml ON st.MasterLeagueID = ml.LeagueId
      LEFT JOIN [asidb].[dbo].[tbSportType] pl ON st.ParentLeagueID = pl.LeagueId
      LEFT JOIN [asidb].[dbo].[tbParticipantAgeGroup] ag ON st.ParticipantAgeGroupId = ag.ParticipantAgeGroupId
  WHERE 1=1
		AND st.LeagueId = 72440
        AND st.Active = 1
        -----------------------------------------
		--AND st.SportType LIKE 'Soccer%'					--	'Football'
		--AND st.SportSubType LIKE '%Eng%Premier%'			--	'NFL%'
        AND (@sportNameFlag = 0     OR (@sportNameFlag = 1      AND s.[Name] LIKE @sportName))
        AND (@sportSubTypeFlag = 0  OR (@sportSubTypeFlag = 1   AND st.[SportSubType] LIKE @sportSubType))
        AND (@isLiveFlag = 0		OR (@isLiveFlag = 1         AND st.IsLive = @isLive))
        AND (@countryNameFlag = 0	OR (@countryNameFlag = 1    AND cr.[Name] LIKE @countryName))
        AND (@ageGroupFlag = 0      OR (@ageGroupFlag = 1       AND ag.[Description] LIKE @ageGroup))
        -----------------------------------------
        AND st.ParentLeagueID is null
        AND st.IsLive = 0
 
 */