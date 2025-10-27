SELECT TOP (1000) 
       br.[BetId]
      ,br.[WinLoss]
      ,br.[BetResultingStatus]
      ,br.[ResultingSessionId]
      ,br.[ResultedAtUtc]
      ,br.[ResultingAction]
      ,br.[ResultingReasonId]
      ,br.[ValidFrom]
      ,br.[ValidTo]
      ,br.[GlobalSequenceNumber]
  FROM [q-sqldb-betmng].[dbo].[BetResulting] br
    INNER JOIN [q-sqldb-betmng].[dbo].[Bet] b ON br.BetId = b.BetId

    WHERE b.BetId = 922934
