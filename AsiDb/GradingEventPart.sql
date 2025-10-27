SELECT TOP (1000) 
       gep.[EventId]
      ,gep.[EventPartId]
      ,CONCAT('(', gep.[EventPartStatusId], ', ', geps.[Description], ')') AS EventPartStatus
      ,gep.[Created]
      ,gep.[CreatedBy]
      ,gep.[Updated]
      ,gep.[UpdatedBy]
      ,CONCAT('(', gep.EventTypeId, ', ', "get".[Description], ')') AS EventType
      ,gep.[GradingSessionId]
  FROM [asidb].[grading].[tbgradingEventPart] gep
        INNER JOIN [asidb].[grading].[tbgradingEventType] "get" ON gep.EventTypeId = "get".EventTypeId
        INNER JOIN [asidb].[grading].[tbgradingEventPartStatus] geps ON geps.EventPartStatusId = gep.EventPartStatusId
  WHERE 1=1
        AND gep.EventId = 1039583555
        AND gep.GradingSessionId = 417163426
