-- An Even Better Way to Retrieve a New USER_ID

INSERT INTO USERS( FIRST_NAME, LAST_NAME )
    VALUES ( 'Adrian', 'Moreno' );
INSERT INTO USERS_2_USER_TYPES ( USER_ID, USER_TYPE_ID )
    SELECT SCOPE_IDENTITY(), 1


