-- Creating the USER_TYPES table

CREATE TABLE USER_TYPES (
    USER_TYPE_ID int IDENTITY(1,1) NOT NULL,
    USER_TYPE_DESC varchar(20) NOT NULL,
    CONSTRAINT PK_USER_TYPES_USER_TYPE_ID PRIMARY KEY CLUSTERED 
        ( USER_TYPE_ID ASC )
)