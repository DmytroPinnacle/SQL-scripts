SELECT TOP (1000) 
       ct.[ContestNum]
      ,ct.[ContestantNum]
      ,ct.[ContestantName]
      ,ct.[RotNum]
      ,ct.[Outcome]
      ,ct.[GradeNum]
      ,ct.[Scratched]
      ,ct.[ThresholdOutcome]
      ,ct.[ContestLineGroupId]
      ,ct.[LastGraded]
      ,ct.[OutcomePosition]
      ,ct.[EachWayMultiplier]
  FROM [asidb].[dbo].[tbContestant] ct
    INNER JOIN [asidb].[dbo].[tbContest] c ON c.ContestNum = ct.ContestNum
  WHERE 1=1
        AND c.ContestNum = 1037852309
