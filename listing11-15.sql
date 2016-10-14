-- The Right Way to Create Related Records Using a Transaction in plain SQL

BEGIN TRY
    BEGIN TRANSACTION
        -- Create the new User
        INSERT INTO USERS( FIRST_NAME, LAST_NAME )
        VALUES ( 'Adrian', 'Moreno' );
        -- Create the association record
        INSERT INTO USERS_2_USER_TYPES ( USER_ID, USER_TYPE_ID )
        SELECT SCOPE_IDENTITY(), 6;
        -- If both inserts run, then commit the data to the database
    COMMIT
END TRY
BEGIN CATCH
    -- USER_TYPES.USER_TYPE_ID = 6 does not exist
    -- An error was thrown, meaning at least one insert failed.
    -- The data from any successful insert must be removed
    ROLLBACK
    -- Everything looks the way it was before the insert was attempted
END CATCH
