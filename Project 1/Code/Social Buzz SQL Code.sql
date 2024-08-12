SELECT TOP (1000) [column1]
      ,[Content_ID]
      ,[User_ID]
      ,[Type]
      ,[Category]
      ,[URL]
  FROM [Buzz].[dbo].[Content]
  ---CHECKING FOR DATA GENIUETY
  --Removing unnecessary column SUCH AS THE URL AND THE USER ID FROM THE CONTENT DATASET

  ALTER TABLE [CONTENT]
  DROP COLUMN [URL]

   ALTER TABLE [CONTENT]
  DROP COLUMN [USER_ID]

  ----REMOVING THE NULL IN THE DATA SET

  DELETE FROM [Content]
  WHERE Content_ID IS NULL
  OR Type IS NULL
  OR Category IS NULL;

  SELECT  Category FROM Content
  SELECT DISTINCT TRIM(CATEGORY)
  FROM Content

   UPDATE Content
   SET CATEGORY = TRIM(CATEGORY)

   SELECT DISTINCT CATEGORY
   FROM CONTENT

   UPDATE CONTENT
   SET CATEGORY = 'public speaking'
   where category ='"public speaking"'
  
  select * from Content

  ----Reaction dataset cleaning
  select * from Reactions

  ALTER TABLE [REACTIONS]
  DROP COLUMN [USER_ID]

  ---TREATING THR NULL CASE
  DELETE FROM [REACTIONS]
  WHERE column1 IS NULL 
  OR Content_ID IS NULL
  OR TYPE IS NULL
  OR Datetime IS NULL

  SELECT DISTINCT TYPE FROM Reactions

  SELECT *
  FROM ReactionTypes
  
  --COMBINING ALL THE DATA TOGHETHER
  SELECT *
  FROM Content C
  JOIN Reactions r 
  ON C.Content_ID = r.Content_ID
  JOIN ReactionTypes rt 
  ON RT.[Reaction Type] =R.Type
  ;
  --- FOR FURTHER EDA

 WITH CAT AS 
 (
 SELECT C.Content_ID,DATETIME,C.Category,RT.[Reaction Type],Sentiment,Score
  FROM Content C
  JOIN Reactions r 
  ON C.Content_ID = r.Content_ID
  JOIN ReactionTypes rt 
  ON RT.[Reaction Type] =R.Type
  )
  SELECT *
  FROM CAT
  ORDER BY Score;
  
