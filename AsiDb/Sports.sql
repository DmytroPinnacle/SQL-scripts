DECLARE @nameFlag INT = 0;	DECLARE @name Varchar(100) = 'Badminton'; 

SELECT TOP (1000) 
	   s.[SportID]
      ,s.[Name]
      ,s.[SortOrder]
      ,s.[Active]
      ,s.[UsesLiveWagering]
      ,s.[TraderClientSupport]
  FROM [asidb].[dbo].[tbSport] s
  WHERE 1=1
		--AND s.SportID = 1
		AND (@nameFlag = 0 OR (@nameFlag = 1 AND s.[Name] LIKE @name))
