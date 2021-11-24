create or replace view POCASI_VIEW as 
SELECT
     "year" as ROK
    ,"month" as MESIC
    ,"day" as DEN
    ,"precipitation" as PRECIPITATION
    ,"temperature" as TEMPERATURE
FROM "weather-list-1";

create or replace TABLE POCASI as 
SELECT
    DATE_FROM_PARTS(ROK, MESIC, DEN) AS DATUM
    , PRECIPITATION
    ,TEMPERATURE
FROM POCASI_VIEW ;