DECLARE @offeredLiveFlag INT = 0; DECLARE @offeredLive Varchar(50) = 'No'; /* SELECT * FROM [dbo].[OfferedLives] */

SELECT TOP (1000) 
	   f.[FixtureId]
      ,f.[CompetitionId]
      ,f.[FixtureTypeId]
      ,f.[Name]
      ,f.[ScheduleTime]
      ,f.[OfferedLiveId]
	   ,CONCAT('(', f.[OfferedLiveId], ', ', ol.[Name], ')') AS MarketStatus
      ,f.[FixtureStatusId]
      ,f.[VisibilityId]
      ,f.[Ordering]
      ,f.[UpdatedByUserId]
      ,f.[FixtureSequenceId]
      ,f.[TradingSequenceId]
      ,f.[ValidFrom]
      ,f.[ValidTo]
      ,f.[UpdatedByProductTypeId]
      ,f.[UpdatedByProductId]
      ,f.[BatchSequenceId]
      ,f.[IsArchived]
      ,f.[CommittedAt]
      ,f.[SportStageId]
  FROM [q-sqldb-tradingbackend].[dbo].[Fixtures] f
		INNER JOIN [q-sqldb-tradingbackend].[dbo].[OfferedLives] ol ON f.OfferedLiveId = ol.OfferedLiveId
  WHERE 1=1
		AND f.FixtureId = 1036444147
		AND (@offeredLiveFlag = 0 OR (@offeredLiveFlag = 1 AND ol.[Name] LIKE @offeredLive))
