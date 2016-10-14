-- The WRONG way: Adding a CHECK constraint to the USERS table

ALTER TABLE USERS ADD CONSTRAINT CK_USER_TYPE CHECK ( USER_TYPE IN ('A','M','S','E') );
