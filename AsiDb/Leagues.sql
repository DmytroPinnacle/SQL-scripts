DECLARE @isLiveFlag		 INT = 0;	DECLARE @isLive INT = 1;	
DECLARE @countryNameFlag INT = 1;	DECLARE @countryName VARCHAR(100) = 'USA';

SELECT TOP (1000) 
       st.[SportType]
      ,st.[SportSubType]
      ,st.[ImportSport]
      ,st.[DrawFlag]
      ,st.[SequenceNumber]
      ,st.[IsLive]
      ,st.[HomeTeam]
      ,st.[ShowRotNum]
      ,st.[SportID]
      ,st.[MasterLeagueID]
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
      ,st.[ParentLeagueID]
      ,st.[LastUpdated]
      ,st.[ParlayRestrictionDefault]
      ,st.[SportsbookDepartmentId]
      ,st.[DefaultHomeFieldTypeId]
      ,st.[SportTierId]
      ,st.[ParticipantAgeGroupId]
      ,st.[LiveCoverage]
      ,st.[LiveCoverageType]
      ,st.[LeagueId]
  FROM [asidb].[dbo].[tbSportType] st
	INNER JOIN [dbo].[tbFBSCountriesAndRegions] cr ON st.CountryId = cr.CountryId
  WHERE 1=1
		--AND st.LeagueId = 11699
		--AND st.SportType LIKE 'Soccer%'					--	'Football'
		--AND st.SportSubType LIKE '%Eng%Premier%'			--	'NFL%'
		AND (@IsLiveFlag = 0		OR (@isLiveFlag = 1 AND st.IsLive = @isLive))
		AND (@countryNameFlag = 0	OR (@countryNameFlag = 1 AND cr.[Name] LIKE @countryName))
