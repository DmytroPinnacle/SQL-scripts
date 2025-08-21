SELECT TOP (1000) 
	   a.[Id]
      ,a.[ChangeVersion]
      ,a.[Name]
      ,a.[PartnerId]
      ,a.[DefaultCurrency]
      ,a.[DefaultPriceFormat]
      ,a.[MaxExposureStraightBets]
      ,a.[MaxPayoutParlayBets]
      ,a.[MaxPayoutStraightBets]
      ,a.[Status]
      ,a.[ChangedAt]
      ,a.[ChangedBy]
      ,a.[LimitLadderTableId]
      ,a.[MaxStakeChangePublishingThreshold]
      ,a.[IsBetAssessmentEnabled]
      ,a.[IsTest]
      ,a.[PublishFixturesOnly]
      ,a.[PublishMatchState]
      ,a.[IsCashOutEnabled]
      ,a.[IsBetExclusionFromLegacyExportEnabled]
      ,a.[IsFairProbabilityEnabled]
      ,a.[PercentTrading]
      ,a.[SellBetMode]
      ,a.[SellBetPercentTrading]
  FROM [PartnerMng].[Account] a
  WHERE 1=1
		--AND a.Id = 131
		AND a.[Name] LIKE '%QA%'
