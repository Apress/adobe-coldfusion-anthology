-- Migrating data from USERS to USERS_2_USER_TYPES

INSERT INTO USERS_2_USER_TYPES
    ( USER_ID, USER_TYPE_ID )
SELECT USER_ID, USER_TYPE_ID
FROM USERS;
// Verify data before continuing

ALTER TABLE USERS DROP CONSTRAINT FK_USERS_USER_TYPES;
ALTER TABLE USERS DROP COLUMN USER_TYPE_ID;