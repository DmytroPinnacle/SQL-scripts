SELECT TOP (1000) 
       [ParticipantId]
      ,[SportId]
      ,[Name]
      ,[ParticipantTypeId]
      ,[ParticipantStatusId]
      ,[RegionId]
      ,[ValidFrom]
      ,[ValidTo]
      ,[UpdatedByUserId]
      ,[IsTest]
  FROM [dbo].[SportParticipants] sp
  WHERE 1=1
        --AND sp.ParticipantId = 19353
        AND sp.SportId = 29
        --AND sp.[Name] LIKE '%TestAutomation%'
