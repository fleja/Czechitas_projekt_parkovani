SELECT
  BASE.DISTRICT
, BASE.LAT
, BASE.LNG
, BASE.CAPACITY
, BASE.OBYVATELE
, BASE.POCET_TRANS
, BASE.PLATBY
, OBYVMISTO.OBYVMISTO

FROM (

-- VYPOCET BASE
SELECT PARKING_ZONE
, DISTRICT
, LAT
, LNG
, CAPACITY
,  OBYVATELE
, COUNT(TRANSACTION_ID) AS POCET_TRANS
, SUM(PRICE) AS PLATBY
FROM PPZO
GROUP BY PARKING_ZONE, DISTRICT, LAT, LNG, CAPACITY, OBYVATELE

  ) AS BASE
  
LEFT JOIN 
(
-- VYPOCET OBYVMISTO
  SELECT A.DISTRICT 
, (SUM(A.CAPACITY) / AVG(B.POCET_OB)) AS OBYVMISTO
FROM ZONES AS A
LEFT JOIN OBYVATELE AS B
ON A.DISTRICT = B.DISTRICT
GROUP BY A.DISTRICT
 ) AS OBYVMISTO
 ON BASE.DISTRICT = OBYVMISTO.DISTRICT
;