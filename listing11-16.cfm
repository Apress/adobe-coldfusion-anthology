<!--- The Right Way to create related records using a CFTRANSACTION --->

<cftransaction action="begin">
    <cftry>
        <cfquery name="qCreateUser" datasource="#variables.DSN#">
            INSERT INTO USERS( FIRST_NAME, LAST_NAME )
            VALUES ( 'Adrian', 'Moreno' );
            INSERT INTO USERS_2_USER_TYPES ( USER_ID, USER_TYPE_ID )
            SELECT SCOPE_IDENTITY(), 6
        </cfquery>
        <cfcatch type="database">
            <!--- An insert failed, rollback any successful insert --->
            <cftransaction action="rollback" />
        </cfcatch>
    </cftry>
        
    <!--- All inserts were successful, commit the data --->    
    <cftransaction action="commit" />
</cftransaction>
