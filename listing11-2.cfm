<!--- User Access in the Application Code  --->

<cfif (session.first_name eq "John") and (session.last_name) eq "Doe")>
    <!--- run restricted functionality --->
</cfif>
