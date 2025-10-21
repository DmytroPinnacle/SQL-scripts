SELECT TOP (1000) 
       r.[Id]
      ,r.[Name]
  FROM [dbo].[Regions] r
  WHERE 1=1
        AND r.[Name] LIKE '%USA%'
