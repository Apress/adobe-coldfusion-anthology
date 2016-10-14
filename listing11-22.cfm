<!--- The WRONG way to get USERS sorted by user type --->

<cfquery name="userTypes" datasource="#dsn#">
    SELECT USER_TYPE_ID, USER_TYPE FROM USER_TYPES
</cfquery>

<ul>
    <cfoutput query="userTypes">
        <li>#userTypes.USER_TYPE#
            <cfquery name="users" datasource="#dsn#">
                SELECT USER_ID, FIRST_NAME, LAST_NAME
                FROM USERS
                WHERE USER_TYPE_ID = #userTypes.USER_TYPE_ID#
            </cfquery>
            
            <ul>
            <cfloop query="users">
                <li>#users.FIRST_NAME# #users.LAST_NAME#</li>
            </cfloop>
            </ul>
        </li>
    </cfoutput>
</ul>
