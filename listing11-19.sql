-- The WRONG Way to Search on a char Column, but the RIGHT Way to Search on a varchar Column.

SELECT USER_ID, FIRST_NAME, LAST_NAME FROM USERS WHERE LAST_NAME = 'Smith'