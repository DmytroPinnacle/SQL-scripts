SELECT TOP (1000) 
	   bs.[BetSelectionId]
      ,bs.[SelectionId]
      ,bs.[BetId]
      ,bs.[SortOrder]
      ,bs.[MarketId]
      ,bs.[MarketSequenceId]
      ,bs.[FixtureId]
      ,bs.[SportId]
      ,CONCAT('(', bs.BetSelectionStatus, ', ', bss.BetSelectionStatus, ')') AS BetSelectionStatus
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
    INNER JOIN [q-sqldb-betmng].[dbo].[BetSelectionStatus] bss ON bs.BetSelectionStatus = bss.ID

  WHERE 1=1
		AND b.BetId = 922934
		--AND b.PartnerBetId LIKE '2152233474%'