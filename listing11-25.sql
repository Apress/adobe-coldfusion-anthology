-- Adding a Clustered Index to the USERS_2_USER_TYPES_V2 Table

DROP INDEX IDX_U2UT2_USER_TYPE_ID ON USERS_2_USER_TYPES_V2;
CREATE CLUSTERED INDEX IDX_CL_U2UT2_USER_TYPE_ID 
    ON USERS_2_USER_TYPES_V2 ( USER_TYPE_ID );


