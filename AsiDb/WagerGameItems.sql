SELECT TOP (1000) 
	   wgi.[TicketNumber]
      ,wgi.[WagerNumber]
      ,wgi.[ItemNumber]
      ,wgi.[GameNum]
      ,wgi.[GameDateTime]
      ,wgi.[SportType]
      ,wgi.[SportSubType]
      ,wgi.[WagerType] --,CONCAT('(', wgi.[WagerType], ', ', wt.WagerType, ')') AS WagerType      
      ,wgi.[AdjSpread]
      ,wgi.[AdjTotalPoints]
      ,wgi.[TotalPointsOU]
      ,wgi.[FinalMoney]
      ,wgi.[ChosenTeamID]
      ,wgi.[Outcome]
      ,wgi.[AmountWagered]
      ,wgi.[ToWinAmount]
      ,wgi.[TeaserPoints]
      ,wgi.[GradeNum]
      ,wgi.[Store]
      ,wgi.[CustProfile]
      ,wgi.[PeriodNumber]
      ,wgi.[PeriodDescription]
      ,wgi.[FinalAmountWagered]
      ,wgi.[FinalAmountWon]
      ,wgi.[OriginatingTicketNumber]
      ,wgi.[AdjustableOddsFlag]
      ,wgi.[ListedPitcher1]
      ,wgi.[ListedPitcher2]
      ,wgi.[Pitcher1ReqFlag]
      ,wgi.[Pitcher2ReqFlag]
      ,wgi.[GradeMoney]
      ,wgi.[GradeToWinAmount]
      ,wgi.[PercentBook]
      ,wgi.[VolumeAmount]
      ,wgi.[DailyFigureDate]
      ,wgi.[CurrencyCode]
      ,wgi.[ValueDate]
      ,wgi.[ArchiveFlag]
      ,wgi.[LayoffFlag]
      ,'----------[Ticket]-------------' as "-------------[Ticket]-------------"
	  ,t.*
      ,'----------[Wager]-------------' as "-------------[Wager]-------------"
      ,w.*
  FROM [asidb].[dbo].[tbWagerGameItem] wgi
	INNER JOIN [asidb].[dbo].[tbTicket] t ON t.[TicketNumber] = wgi.[TicketNumber]
    INNER JOIN [asidb].[dbo].[tbWager] w ON wgi.[TicketNumber] = w.TicketNumber AND wgi.WagerNumber = w.WagerNumber
	INNER JOIN [asidb].[dbo].[tbGame] g ON wgi.GameNum = g.GameNum
    --LEFT JOIN [asidb].[dbo].[tbWagerTypes] wt ON wt.WagerType = wgi.WagerType --Not mapping directly. Mapped somewhere in BL
   WHERE 1=1
	AND t.[TicketNumber] = 2152833341
	--AND g.GameNum = 1037257948 --1037257947
