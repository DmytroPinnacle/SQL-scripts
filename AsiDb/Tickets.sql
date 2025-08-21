SELECT TOP (1000) 
       [TicketNumber]
      ,[CustomerID]
      ,[StartDateTime]
      ,[PostedDateTime]
      ,[AgentID]
      ,[TicketWriter]
      ,[Store]
      ,[PlayCount]
      ,[ArchiveFlag]
      ,[IPAddress]
      ,[UniqueRequestId]
  FROM [asidb].[dbo].[tbTicket]
  WHERE TicketNumber = 2152233474



/*
  SELECT 
      distinct [Store], [TicketWriter]
  FROM [asidb].[dbo].[tbTicket]
*/