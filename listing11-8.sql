-- Adding a FOREIGN KEY Constraint

ALTER TABLE USERS WITH CHECK
    ADD CONSTRAINT FK_USERS_USER_TYPES FOREIGN KEY( USER_TYPE_ID )
    REFERENCES USER_TYPES ( USER_TYPE_ID );
ALTER TABLE USERS CHECK CONSTRAINT FK_USERS_USER_TYPES;

