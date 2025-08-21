DECLARE @maltaPartnerKey VARCHAR(50) = '55DFABFC-D1D8-4E9A-874E-EE2F36A075D3';
DECLARE @asianPartnerKey VARCHAR(50) = '5D54002D-F1D1-450B-A7B7-FCE1907A1B81';
--------------------------------------------------------------------------------------------
DECLARE @integrationStrategyFlag INT = 1; DECLARE @integrationStrategy Varchar(50) = 'PinnacleMalta'; --'PinnacleAsia'; /* SELECT distinct pa.IntegrationStrategy FROM [asidb].[dbo].[tbPartnerAuth] pa */


-------------------------------------------------------------------------------------------------------------------------------
SELECT TOP (1000) 
	   pa.[Id]
      ,pa.[ApiKey]
      ,pa.[Name]
      ,pa.[IntegrationStrategy]
      ,pa.[Description]
      ,pa.[IsActive]
      ,pa.[Created]
      ,pa.[BetListQueryBySourceIdIsEnabled]
      ,pa.[IsTestPartner]
      ,pa.[SoccerLiveBettingType]
      ,pa.[ResubmitApiAddress]
      ,pa.[ResubmitApiRequestUri]
      ,pa.[Type]
      ,pa.[HasAccessToPushAPI]
      ,pa.[HasAccessToLiveContest]
      ,pa.[ApexPartnerId]
      ,pa.[FatteningGroup]
  FROM [asidb].[dbo].[tbPartnerAuth] pa
  WHERE 1=1
		--AND pa.ApiKey = @maltaPartnerKey
		--AND pa.[Name] LIKE '%kpCredit%'
		AND (@integrationStrategyFlag = 0 OR (@integrationStrategyFlag = 1 AND pa.[IntegrationStrategy] LIKE @integrationStrategy))

