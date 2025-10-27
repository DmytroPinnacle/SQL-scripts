SELECT TOP (1000) 
       ge.[GradingSessionId]
      ,ge.[EventId]
      ,ge.[EventPartId]
      ,CONCAT('(', ge.EventTypeId, ', ', "get".[Description], ')') AS EventType
      ,ge.[ScopeId]
      ,ge.[Created]
      ,ge.[CreatedBy]
      ,ge.[Updated]
      ,ge.[UpdatedBy]
  FROM [asidb].[grading].[tbgradingEvents] ge
        INNER JOIN [asidb].[grading].[tbgradingEventType] "get" ON ge.EventTypeId = "get".EventTypeId
        --LEFT JOIN [asidb].[grading].[tbgradingEventPart] gep ON ge.EventPartId = gep.EventPartId
  WHERE 1=1
        AND ge.EventId = 1039583555
