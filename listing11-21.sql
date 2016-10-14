-- The WRONG Way to Search on a char Column Without a Wildcard.

-- Check your documentation for the proper trim() SQL function for your database
SELECT USER_ID, FIRST_NAME, trim(LAST_NAME) 
    AS LAST_NAME FROM USERS WHERE LAST_NAME = 'Smith'
