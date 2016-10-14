-- The Wrong Way to Create Related Records

INSERT INTO USERS( FIRST_NAME, LAST_NAME )
    VALUES ( 'Adrian', 'Moreno' );

INSERT INTO USERS_2_USER_TYPES ( USER_ID, USER_TYPE_ID )
    SELECT SCOPE_IDENTITY(), 6
    -- USER_TYPES.USER_TYPE_ID = 6 does not exist

