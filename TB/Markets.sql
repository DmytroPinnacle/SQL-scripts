DECLARE @marketStatusFlag INT = 0; DECLARE @marketStatus Varchar(50) = 'Opened'; /* SELECT * FROM [q-sqldb-tradingbackend].[dbo].[MarketStatus] ms */


SELECT TOP (1000) 
	   m.[MarketId]
      ,m.[FixtureId]
      ,m.[Expiration]
      ,m.[ParlayRestrictionTypeId]
      ,m.[ParticipantId]
      ,m.[SubParticipantId]
      ,m.[VisibilityId]
      ,CONCAT('(', m.MarketStatusId, ', ', ms.[Name], ')') AS MarketStatus
      ,m.[Points]
      ,m.[MarketSequenceId]
      ,m.[MarketBatchSequenceId]
      ,m.[MaxMarketExposure]
      ,m.[BettingProductId]
      ,m.[IsMain]
      ,m.[UpdatedByUserId]
      ,m.[TradingSequenceId]
      ,m.[ValidFrom]
      ,m.[ValidTo]
      ,m.[UpdatedByProductTypeId]
      ,m.[UpdatedByProductId]
      ,m.[Ordering]
      ,m.[MaxToWin]
      ,m.[MarginStrategyId]
      ,m.[MarginInput]
      ,m.[CompositionTypeId]
      ,m.[TotalMargin]
      ,m.[CommittedAt]
      ,m.[ExtendedPropertiesId]
      ,m.[ParticipantMatchupGroupId]
      ,m.[AllowDuplicates]
      ,m.[MaxBetAmount]
  FROM [q-sqldb-tradingbackend].[dbo].[Markets] m
			INNER JOIN [q-sqldb-tradingbackend].[dbo].[Fixtures] f ON f.FixtureId = m.FixtureId
			INNER JOIN [q-sqldb-tradingbackend].[dbo].[MarketStatus] ms ON m.MarketStatusId = ms.MarketStatusId
  WHERE 1=1
		--AND m.MarketId = 47722874
		--AND m.IsMain = 1
		AND f.FixtureId = 1036444310
		AND (@marketStatusFlag = 0 OR (@marketStatusFlag = 1 AND ms.[Name] LIKE @marketStatus))
