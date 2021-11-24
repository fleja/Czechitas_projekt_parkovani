CREATE TABLE PARKOMATY_SPOJ_DATUM AS
SELECT TO_DATE ("ticket_bought") AS DATUM
, TO_TIMESTAMP_LTZ ("ticket_bought", 'YYYY-MM-DD HH24:MI:SS') AS DATUM_CAS
, "channel" AS CHANNEL
, "validity_from" AS VALIDITY_FROM
, "validity_to" AS VALIDITY_TO
, "parking_zone" AS PARKING_ZONE
, "transaction_id" AS TRANSACTION_ID
, "price" AS PRICE
, "ticket_bought" AS TICKET_BOUGHT
FROM "parkomaty_spoj";

