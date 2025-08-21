DECLARE @wagerType Varchar(50) = 'MoneyLine'; -- MoneyLine, Spread, TeamTotal, Total   --Select distinct wagerType FROM [asidb].[dbo].[tbWager] w

SELECT TOP (1000) 
	   w.[TicketNumber]
      ,w.[WagerNumber]
      ,w.[AmountWagered]
      ,w.[WagerType]
      ,w.[AmountWon]
      ,w.[WagerStatus]
      ,w.[TeaserName]
      ,w.[Description]
      ,w.[ToWinAmount]
      ,w.[ParlayName]
      ,w.[MinimumPicks]
      ,w.[Ties]
      ,w.[GradeNum]
      ,w.[TotalPicks]
      ,w.[RoundRobinLink]
      ,w.[CreditAcctFlag]
      ,w.[ContinueOnPushFlag]
      ,w.[PlayNumber]
      ,w.[AmountRefunded]
      ,w.[AcceptedDateTime]
      ,w.[AmountLost]
      ,w.[GradeDateTime]
      ,w.[DailyFigureDate]
      ,w.[CurrencyCode]
      ,w.[ValueDate]
      ,w.[ArchiveFlag]
      ,w.[LayoffFlag]
      ,w.[MaxPayout]
      ,w.[ParlayPayoutType]
      ,w.[OddsFormat]
      ,w.[UpdateSequence]
	  ,'-----------------------' as "-----------------------"
	  ,t.*
	FROM [asidb].[dbo].[tbWager] w
		INNER JOIN [asidb].[dbo].[tbTicket] t ON t.[TicketNumber] = w.[TicketNumber]
	WHERE 1=1
			--AND w.[WagerNumber] = 23423423423
			AND t.[TicketNumber] = 2152233474
		