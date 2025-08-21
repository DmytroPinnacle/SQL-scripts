/* SELECT * FROM tbGameStatus */

SELECT TOP (1000) [GameIndex]
      ,[GameNum]
      ,[GameDateTime]
      ,[WagerCutoff]
      ,[Status]
      ,[SportType]
      ,[Team1ID]
      ,[Team1RotNum]
      ,[Team2ID]
      ,[Team2RotNum]
      ,[Comments]
      ,[SportSubType]
      ,[OnTV]
      ,[Team1FinalScore]
      ,[Team2FinalScore]
      ,[FinalWinnerID]
      ,[ScheduleID]
      ,[BroadcastInfo]
      ,[ScheduleDate]
      ,[Team1Nss]
      ,[Team2Nss]
      ,[TeamActionLinePos]
      ,[CircledMaxWager]
      ,[ListedPitcher1]
      ,[ListedPitcher2]
      ,[Pitcher1StartedFlag]
      ,[Pitcher2StartedFlag]
      ,[GradeDateTime]
      ,[ParlayRestriction]
      ,[DrawRotNum]
      ,[ScheduleText]
      ,[TimeChangeFlag]
      ,[CorrelationID]
      ,[ChangeDateTime]
      ,[IsLive]
      ,[LeagueID]
      ,[TaiwaneseOddsOffered]
      ,[AutoAcceptLiveWagering]
      ,[GradingUnitTypeId]
      ,[BetAcceptanceTypeId]
      ,[ParentGameNum]
      ,[LiveCoverageType]
      ,[LiveCoverage]
  FROM [asidb].[dbo].[tbNewGame] g
	WHERE 1=1
		AND g.GameNum = 1037257948 --1037257947


/*
SELECT TOP (1000) 
	* 
	FROM tbGameOutcome "go"
	WHERE 1=1
			AND "go".GameNum = 1037257948 --1037257947
*/