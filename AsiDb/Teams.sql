SELECT TOP (1000) [TeamID]
      ,[SportType]
      ,[SportSubType]
      ,[ImportTeamID]
  FROM [asidb].[dbo].[tbTeam] t
  WHERE 1=1
		--AND t.TeamID LIKE '%'
		AND t.SportType = 'Soccer'						--	'Football'
		AND SportSubType LIKE '%Eng%Premier%'			--	'NFL%'

