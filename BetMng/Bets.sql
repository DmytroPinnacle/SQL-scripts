/* SELECT * FROM BetStatus */

SELECT TOP (1000) 
	   b.[BetId]
      ,b.[GlobalSequenceNumber]
      ,b.[LegacyGlobalSequenceNumber]
      ,b.[AccountId]
      ,b.[TicketId]
      ,b.[PartnerBetId]
      ,b.[SortOrder]
      ,b.[BetStatus]
      ,b.[BetType]
      ,b.[Stake]
      ,b.[PotentialWin]
      ,b.[WinLoss]
      ,b.[BetPrice]
      ,b.[BettorMinStake]
      ,b.[BettorMaxStake]
      ,b.[CreatedAtUtc]
      ,b.[UpdatedAtUtc]
      ,b.[SettledAtUtc]
      ,b.[CashOutStake]
      ,b.[CashOutPayout]
      ,b.[ValidFrom]
      ,b.[ValidTo]
      ,b.[BettorPercentTrading]
  FROM [q-sqldb-betmng].[dbo].[Bet] b
			INNER JOIN [q-sqldb-betmng].[dbo].[Ticket] t ON t.TicketId = b.TicketId
	WHERE 1=1
		  --AND b.TicketId = 475032
		  --AND b.BetId = 146452
		  AND b.PartnerBetId LIKE '2153017241%'
		  --AND t.Channel = 6
		  AND b.CreatedAtUtc >= DATEADD(DAY, -7, GETDATE())
