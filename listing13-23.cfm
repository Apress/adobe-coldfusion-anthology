<!--- Accessing Complex Type Return Elements --->
<cfoutput>
    First Name: #custResult.fname#<br>
    Last Name: #custResult.lname#<br>
    Active: #custResult.active#<br>
    Address Line 1: #custResult.address.address1#<br>
    Address Line 2: #custResult.address.address2#<br>
    City: #custResult.address.city#<br>
    State: #custResult.address.state#<br>
    Zip: #custResult.address.zip#<br>
</cfoutput>
