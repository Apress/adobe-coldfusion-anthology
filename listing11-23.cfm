<!--- The RIGHT Way to Get USERS Sorted by User Type --->

<cfquery name="users" datasource="#dsn#">
    SELECT
        a.USER_ID, a.FIRST_NAME, a.LAST_NAME,
        b.USER_TYPE_ID, b.USER_TYPE
    FROM
        USERS a
    LEFT JOIN
        USER_TYPES b
    ON
        b.USER_TYPE_ID = a.USER_TYPE_ID
    ORDER BY
        b.USER_TYPE, a.LAST_NAME, a.FIRST_NAME
</cfquery>

<ul>
    <!--- The "group" attribute allows us to display data 
        grouped by one column --->
    <cfoutput query="users" group="USER_TYPE">
        <li>#users.USER_TYPE#
            <ul>
            <!--- A nested CFOUTPUT displays data within grouped records --->
            <cfoutput>
                <li>#users.FIRST_NAME# #users.LAST_NAME#</li>
            </cfoutput>
            </ul>
        </li>
    </cfoutput>
</ul>
