/* JOINS ARE Incorrect apparently!!! */

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
  FROM [asidb].[dbo].[tbWagerItemLineType] wilt
	INNER JOIN [asidb].[dbo].[tbWagerGameItem] wgi ON wgi.ItemNumber = wilt.ItemNumber
	INNER JOIN [asidb].[dbo].[tbTicket] t ON t.[TicketNumber] = wgi.[TicketNumber]
   WHERE 1=1
		AND t.[TicketNumber] = 2152182758

