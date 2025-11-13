SELECT TOP (1000) 
       wilt.[TicketNumber]
      ,wilt.[WagerNumber]
      ,wilt.[ItemNumber]
      ,wilt.[LineType]
      ,wilt.[Team1IDScore]
      ,wilt.[Team2IDScore]
      ,wilt.[RestOfGameSpread]
      ,wilt.[LiveClearerDateTime]
      ,wilt.[Clearer]
      ,wilt.[MaxWager]
      ,wilt.[TWBallPercent]
      ,wilt.[MaskFactor]
      ,wilt.[MaskReasonId]
      ,wilt.[Gear]
      ,wilt.[Class]
      ,wilt.[LineIndex]
      ,wilt.[ChangeNum]
      ,wilt.[AcceptedBookPrice]
      ,wilt.[Side1Odds]
      ,wilt.[Side2Odds]
      ,wilt.[Side3Odds]
      ,wilt.[FatteningPct]
      ,wilt.[IsGraceApplied]
      ,wilt.[MaxExposure]
      ,'--------------------[Ticket]---------------------' as "----------------------[Ticket]---------------------"
	  ,t.*
      ,'---------------------[Wager]------------------------' as "----------------------[Wager]---------------------"
      ,w.*
      ,'----------------------[Line]-----------------------' as "---------------------[Line]--------------------"
      ,gl.*
  FROM [asidb].[dbo].[tbWagerItemLineType] wilt
        INNER JOIN [asidb].[dbo].[tbTicket] t ON t.[TicketNumber] = wilt.[TicketNumber]
        INNER JOIN [asidb].[dbo].[tbWager] w ON wilt.[TicketNumber] = w.TicketNumber AND wilt.WagerNumber = w.WagerNumber
        INNER JOIN [asidb].[dbo].[tbNewGameLine] gl ON gl.LineIndex = wilt.LineIndex
        INNER JOIN [asidb].[dbo].[tbGame] g ON gl.GameNum = g.GameNum
    WHERE 1=1
            --AND t.[TicketNumber] = 2152833341
            --AND gl.LineIndex = 2319112594
            AND g.GameNum = 1039709002