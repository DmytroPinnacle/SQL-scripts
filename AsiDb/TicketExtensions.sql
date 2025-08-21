SELECT TOP (1000) 
	   te.[TicketNumber]
      ,te.[ExternalRef]
      ,te.[SourceId]
      ,te.[PartnerId]
      ,te.[ArchiveFlag]
      ,te.[BettorId]
      ,te.[GroupingA]
      ,te.[GroupingB]
      ,te.[GroupingC]
      ,te.[GroupingD]
	  ,'-----------------------' as "-----------------------"
	  ,t.*
	FROM [asidb].[dbo].[tbTicketExtension] te
		INNER JOIN [asidb].[dbo].[tbTicket] t ON t.[TicketNumber] = te.[TicketNumber]
	WHERE 1=1
			AND t.[TicketNumber] = 2151655983

