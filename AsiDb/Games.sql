/* SELECT * FROM tbGameStatus */

SELECT TOP (1000)
       g.[GameNum]
      ,g.[GameDateTime]
      ,g.[WagerCutoff]
      ,g.[Status]
      ,g.[SportType]
      ,g.[Team1ID]
      ,g.[Team1RotNum]
      ,g.[Team2ID]
      ,g.[Team2RotNum]
      ,g.[Comments]
      ,g.[SportSubType]
      ,g.[OnTV]
      ,g.[Team1FinalScore]
      ,g.[Team2FinalScore]
      ,g.[FinalWinnerID]
      ,g.[ScheduleID]
      ,g.[BroadcastInfo]
      ,g.[ScheduleDate]
      ,g.[Team1Nss]
      ,g.[Team2Nss]
      ,g.[TeamActionLinePos]
      ,g.[CircledMaxWager]
      ,g.[ListedPitcher1]
      ,g.[ListedPitcher2]
      ,g.[Pitcher1StartedFlag]
      ,g.[Pitcher2StartedFlag]
      ,g.[GradeDateTime]
      ,g.[ParlayRestriction]
      ,g.[DrawRotNum]
      ,g.[ScheduleText]
      ,g.[TimeChangeFlag]
      ,g.[CorrelationID]
      ,g.[ChangeDateTime]
      ,g.[IsLive]
      ,g.[LeagueID]
      ,g.[TaiwaneseOddsOffered]
      ,g.[AutoAcceptLiveWagering]
      ,g.[GradingUnitTypeId]
      ,g.[BetAcceptanceTypeId]
      ,g.[ParentGameNum]
      ,g.[LiveCoverageType]
      ,g.[LiveCoverage]
  FROM [asidb].[dbo].[tbGame] g
	WHERE 1=1
		AND g.GameNum = 1040013466 --1037257947


/*
SELECT TOP (1000) 
	* 
	FROM tbGameOutcome "go"
	WHERE 1=1
			AND "go".GameNum = 1037257948 --1037257947
*/