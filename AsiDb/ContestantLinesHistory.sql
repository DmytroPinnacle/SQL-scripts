SELECT TOP (1000) 
       clh.[LineIndex]
      ,clh.[ContestNum]
      ,clh.[ContestantNum]
      ,clh.[Store]
      ,clh.[CustProfile]
      ,clh.[ContestantName]
      ,clh.[MoneyLine]
      ,clh.[ThresholdLine]
      ,clh.[LastLineChange]
      ,clh.[ChangedBy]
      ,clh.[ContestLineGroupId]
      ,clh.[FairProb]
      ,clh.[FairProbAdjustment]
      ,clh.[MarginInput]
      ,clh.[MaxExposure]
      ,clh.[LineSeq]
      ,clh.[ToBase]
      ,clh.[PlaceToBase]
      ,clh.[ShowToBase]
      ,clh.[ShowMoneyline]
      ,clh.[PlaceMoneyline]
      ,clh.[TargetMarketPercentage]
  FROM [asidb].[dbo].[tbContestantLineHistory] clh
        INNER JOIN [asidb].[dbo].[tbContestant] ct ON ct.ContestantNum = clh.ContestantNum
        INNER JOIN [asidb].[dbo].[tbContest] c ON c.ContestNum = ct.ContestNum
    WHERE 1=1
        AND c.ContestNum = 1037855884
        AND clh.ContestLineGroupId = (select top(1) cl2.ContestLineGroupId from [asidb].[dbo].[tbContestantLine] cl2 where cl2.ContestNum = c.ContestNum)


/* ------ INFO ------------*/
/*
To see actual active line ids (indexes) you need to use the current ContestLineGroupId from [tbContestantLine] for your contest.

*/