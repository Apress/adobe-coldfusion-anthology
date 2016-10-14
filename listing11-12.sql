-- The RIGHT Way to Retrieve a New USER_ID

-- Check your documentation for correct function name
INSERT INTO USERS( FIRST_NAME, LAST_NAME )
    VALUES ( 'Adrian', 'Moreno' );
    SELECT SCOPE_IDENTITY() AS NEW_ID;
INSERT INTO USERS_2_USER_TYPES ( USER_ID, USER_TYPE_ID )
    VALUES ( NEW_ID, 1 )

