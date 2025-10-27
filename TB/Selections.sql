DECLARE @selectionTypeFlag INT = 0; DECLARE @selectionType Varchar(50) = 'LastParticipant'; /* SELECT * FROM SelectionTypes */

SELECT TOP (1000) 
	   s.[SelectionId]
      ,CONCAT('(', s.[SelectionTypeId], ', ', st.[Name], ')') AS SelectionType
      ,CONCAT('(', s.[SelectionStatusId], ', ', ss.[Name], ')') AS SelectionStatus
      ,s.[ParticipantId]
      ,s.[SubParticipantId]
      ,s.[Points]
      ,s.[Price]
      ,s.[PriceAdjustment]
      ,s.[MaxBetAmount]
      ,s.[MarketId]
      ,s.[UpdatedByUserId]
      ,s.[ValidFrom]
      ,s.[ValidTo]
      ,s.[UpdatedByProductTypeId]
      ,s.[UpdatedByProductId]
      ,s.[Ordering]
      ,s.[Name]
      ,s.[MarketSequenceId]
      ,s.[AltPoints]
      ,s.[CompositionTypeId]
      ,s.[Margin]
      ,s.[CommittedAt]
      ,s.[ModelAdjustment]
      ,s.[MarketAdjustment]
      ,s.[MaxToWin]
  FROM [q-sqldb-tradingbackend].[dbo].[Selections] s
		INNER JOIN [q-sqldb-tradingbackend].[dbo].[Markets] m ON m.MarketId = s.MarketId
		INNER JOIN [q-sqldb-tradingbackend].[dbo].[Fixtures] f ON f.FixtureId = m.FixtureId
		INNER JOIN [q-sqldb-tradingbackend].[dbo].[SelectionTypes] st ON s.SelectionTypeId = st.Id
        INNER JOIN [q-sqldb-tradingbackend].[dbo].SelectionStatus ss ON s.SelectionStatusId = ss.SelectionStatusId
  WHERE 1=1
		--AND s.SelectionId = 103292980
		--AND m.MarketId = 48916809
		AND f.FixtureId = 1039579378
		AND (@selectionTypeFlag = 0 OR (@selectionTypeFlag = 1 AND st.[Name] LIKE @selectionType))
