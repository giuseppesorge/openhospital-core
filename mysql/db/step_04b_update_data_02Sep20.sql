--
-- Populate random data for OPD
--
UPDATE OPD SET OPD_REFERRAL_FROM = 'R' WHERE MOD(OPD_ID, 5) = 0;
UPDATE OPD SET OPD_REFERRAL_TO = 'R' WHERE MOD(OPD_ID, 4) = 0;