-- Altering the USERS table

-- Delete the Check Constraint  on the USER_TYPE column

ALTER TABLE USERS DROP CONSTRAINT CK_USER_TYPE;

-- Add a new column USER_TYPE_ID
ALTER TABLE USERS ADD USER_TYPE_ID int;

-- Delete the column USER_TYPE as it is no longer used

ALTER TABLE USERS DROP COLUMN USER_TYPE

