SELECT TOP (1000) 
       [GradingSessionId]
      ,[GradingTypeId]
      ,[GradingActionId]
      ,[Provider]
      ,[Comments]
      ,[GradingSessionStatusId]
      ,[Created]
      ,[Updated]
      ,[ReasonCode]
  FROM [asidb].[grading].[tbgradingSessions] gs
  WHERE 1=1
        AND gs.GradingSessionId = 417163426
  ORDER BY gs.[GradingSessionId] desc
