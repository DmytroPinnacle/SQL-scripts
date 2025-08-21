DECLARE @selectionTypeFlag INT = 0; DECLARE @selectionType Varchar(50) = 'LastParticipant'; /* SELECT * FROM SelectionTypes */

SELECT TOP (1000) 
	   s.[SelectionId]
      ,s.[SelectionTypeId]
      ,s.[SelectionStatusId]
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
  FROM [TradingBackendDb].[dbo].[Selections] s
		INNER JOIN [TradingBackendDb].[dbo].[Markets] m ON m.MarketId = s.MarketId
		INNER JOIN [TradingBackendDb].[dbo].[Fixtures] f ON f.FixtureId = m.FixtureId
		INNER JOIN [TradingBackendDb].[dbo].[SelectionTypes] st ON s.SelectionTypeId = st.Id 
  WHERE 1=1
		--AND s.SelectionId = 103292980
		--AND m.MarketId = 48916809
		AND f.FixtureId = 1036439028
		AND (@selectionTypeFlag = 0 OR (@selectionTypeFlag = 1 AND st.[Name] LIKE @selectionType))
