SELECT TOP (1000) 
	   bs.[BetSelectionId]
      ,bs.[SelectionId]
      ,bs.[BetId]
      ,bs.[SortOrder]
      ,bs.[MarketId]
      ,bs.[MarketSequenceId]
      ,bs.[FixtureId]
      ,bs.[SportId]
      ,bs.[BetSelectionStatus]
      ,bs.[Price]
      ,bs.[TradingPrice]
      ,bs.[TradingMaxVolume]
      ,bs.[DelayInterval]
      ,bs.[IsManuallyResulted]
      ,bs.[ValidFrom]
      ,bs.[ValidTo]
      ,bs.[IsLive]
  FROM [dbo].[BetSelection] bs
  INNER JOIN [q-sqldb-betmng].[dbo].[Bet] b ON b.BetId = bs.BetId

  WHERE 1=1
		AND b.PartnerBetId LIKE '2152233474%'