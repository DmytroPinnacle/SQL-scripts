SELECT TOP (1000) 
       cl.[ContestNum]
      ,cl.[ContestantNum]
      ,cl.[ContestLineGroupId]
      ,cl.[Store]
      ,cl.[CustProfile]
      ,cl.[ContestantName]
      ,cl.[MoneyLine]
      ,cl.[ThresholdLine]
      ,cl.[LastLineChange]
      ,cl.[ChangedBy]
      ,cl.[FairProb]
      ,cl.[FairProbAdjustment]
      ,cl.[MarginInput]
      ,cl.[MaxExposure]
      ,cl.[LineSeq]
      ,cl.[PlaceToBase]
      ,cl.[PlaceMoneyLine]
      ,cl.[ShowMoneyLine]
      ,cl.[ShowToBase]
      ,cl.[ToBase]
      ,cl.[TargetMarketPercentage]
  FROM [asidb].[dbo].[tbContestantLine] cl
        INNER JOIN [asidb].[dbo].[tbContestant] ct ON ct.ContestantNum = cl.ContestantNum
        INNER JOIN [asidb].[dbo].[tbContest] c ON c.ContestNum = ct.ContestNum
  WHERE 1=1
        AND c.ContestNum = 1037855884
