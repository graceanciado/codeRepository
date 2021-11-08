use database demo_db;
Use role accountadmin;
select DEMO_DB.PUBLIC.GRADER_GRACE(step, (actual = expected), actual, expected, description) as 
graded_results from
(
SELECT 'grace.anciado@qrious.co.nz=Mary Grace=Dy=Anciado' as step
,(select 1) as actual
,1 as expected
,'badge info - email=first=middle=last' as description
UNION ALL
SELECT 'ESS_FD_GROUP_INGEST_TABLE' as step
,(SELECT row_count FROM USDA_NUTRIENT_STDREF.INFORMATION_SCHEMA.TABLES where 
table_name = 'FD_GROUP_INGEST') as actual
,25 as expected
,'Check number of rows' as description
UNION All
SELECT 'ESS_WEIGHT_TABLE' as step
,(SELECT row_count FROM USDA_NUTRIENT_STDREF.INFORMATION_SCHEMA.TABLES where 
table_name ='WEIGHT') as actual
,14449 as expected
,'Check number of rows' as description
UNION All
SELECT 'ESS_WEIGHT_INGEST_TABLE' as step
,(SELECT row_count FROM USDA_NUTRIENT_STDREF.INFORMATION_SCHEMA.TABLES where 
table_name = 'WEIGHT_INGEST') as actual
,14449 as expected
,'Check number of rows' as description
UNION All
SELECT 'ESS_LCC_BOOK_TABLE' as step
,(SELECT row_count FROM LIBRARY_CARD_CATALOG.INFORMATION_SCHEMA.TABLES where 
table_name ='BOOK') as actual
,5 as expected
,'Check number of rows' as description
UNION All
SELECT 'ESS_LCC_AUTHOR_TABLE' as step
,(select row_count FROM LIBRARY_CARD_CATALOG.INFORMATION_SCHEMA.TABLES where 
table_name = 'AUTHOR') as actual
,6 as expected
,'Check number of rows' as description
UNION All
SELECT 'ESS_LCC_B2A_TABLE' as step
,(select row_count FROM LIBRARY_CARD_CATALOG.INFORMATION_SCHEMA.TABLES where 
table_name = 'BOOK_TO_AUTHOR') as actual
,6 as expected
,'Check number of rows' as description
 UNION All
SELECT 'ESS_LCC_JSON_TABLE' as step
,(select row_count FROM LIBRARY_CARD_CATALOG.INFORMATION_SCHEMA.TABLES where 
table_name = 'AUTHOR_INGEST_JSON') as actual
,6 as expected
,'Check number of rows' as description
 UNION All
SELECT 'ESS_LCC_NESTED_JSON_TABLE' as step
,(select row_count FROM LIBRARY_CARD_CATALOG.INFORMATION_SCHEMA.TABLES where 
table_name = 'NESTED_INGEST_JSON') as actual
,5 as expected
,'Check number of rows' as description
UNION All
SELECT 'ESS_TWEET_TABLE' as step
,(select row_count FROM SOCIAL_MEDIA_FLOODGATES.INFORMATION_SCHEMA.TABLES where 
table_name = 'TWEET_INGEST') as actual
,9 as expected
,'Check number of rows' as description
 UNION All
 SELECT 'ESS_HASHTAGS_TABLE' as step
,(select count(*) FROM SOCIAL_MEDIA_FLOODGATES.INFORMATION_SCHEMA.VIEWS where 
table_name = 'HASHTAGS_NORMALIZED') as actual
,1 as expected
,'Check number of rows' as description
  );