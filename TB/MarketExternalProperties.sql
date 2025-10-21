DECLARE @extPropTypeFlag INT = 0; DECLARE @extPropType Varchar(50) = 'SelectionsWithHighExposure'; /* SELECT * FROM [q-sqldb-tradingbackend].[dbo].[ExternalPropertyTypes] */

SELECT TOP (1000) 
	   extProps.[PropertyId]
      ,extProps.[MarketId]
      ,extProps.[ExternalPropertyTypeId]
      ,extProps.[Property]
      ,extProps.[UpdatedByUserId]
      ,extProps.[ValidFrom]
      ,extProps.[ValidTo]
      ,extProps.[UpdatedByProductTypeId]
      ,extProps.[UpdatedByProductId]
      ,extProps.[CommittedAt]
  FROM [q-sqldb-tradingbackend].[dbo].[MarketExternalProperties] extProps
		INNER JOIN [q-sqldb-tradingbackend].[dbo].[ExternalPropertyTypes] extPropsType ON extProps.[ExternalPropertyTypeId] = extPropsType.[ExternalPropertyTypeId]
  WHERE 1=1
		AND extProps.[MarketId] = 49064460
		AND (@extPropTypeFlag = 0 OR (@extPropTypeFlag = 1 AND extPropsType.[Name] LIKE @extPropType))
