SELECT TOP (1000) 
	   p.[Id]
      ,p.[ChangeVersion]
      ,p.[Name]
      ,p.[ChangedAt]
      ,p.[ChangedBy]
  FROM [PartnerMng].[Partner] p
  WHERE 1=1
		--AND p.Id = 27
		AND p.[Name] LIKE 'Pinnacle'
