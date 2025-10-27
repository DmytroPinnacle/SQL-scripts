DECLARE @useChannel INTEGER  = 0; Declare @channel Varchar(50) = 'Internal'; -- select * from [q-sqldb-betmng].[dbo].[Channel]

SELECT TOP (1000) 
	   t.[TicketId]
      ,t.[PartnerId]
      ,t.[AccountId]
      ,t.[IsTest]
      ,t.[PartnerTicketId]
      ,t.[PartnerBettorId]
      ,t.[BettorSourceId]
      ,t.[Channel]
      ,t.[PriceFormat]
      ,t.[CurrencyCode]
      ,t.[CurrencyRate]
      ,t.[CreatedAtUtc]
      ,t.[PlacedAtUtc]
      ,t.[RequestId]
      ,t.[BetFlow]
      ,t.[BettorProfileId]
      ,t.[BettorSettlementMode]
      ,t.[ValidFrom]
      ,t.[ValidTo]
  FROM [q-sqldb-betmng].[dbo].[Ticket] t
		INNER JOIN [q-sqldb-betmng].[dbo].[Bet] b ON b.TicketId = t.TicketId
		INNER JOIN [q-sqldb-betmng].[dbo].[Channel] c ON t.Channel = c.ID
  WHERE 1=1
		--AND t.TicketId = 2151917761
		AND b.BetId = 922934
        --AND b.PartnerBetId LIKE '2152749137%'
		--AND (@useChannel = 0 OR (@useChannel = 1 AND c.Channel LIKE @channel)) 

