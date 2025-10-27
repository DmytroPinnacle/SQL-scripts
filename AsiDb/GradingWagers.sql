SELECT TOP (1000) 
       gw.[GradingSessionId]
      ,gw.[TicketNumber]
      ,gw.[WagerNumber]
      ,gw.[ItemNumber]
      ,gw.[Created]
      ,gw.[CreatedBy]
      ,gw.[Updated]
      ,gw.[UpdatedBy]
  FROM [asidb].[grading].[tbGradingWagers] gw
  WHERE 1=1
    --AND gw.TicketNumber = 2152833341
    AND gw.GradingSessionId = 417163426
  ORDER BY gw.Created desc
