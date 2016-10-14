<!--- Calling the UpdateCustomer Operation via ColdFusion --->

<cfscript>
    stCust = StructNew();
    stCust.fname = "John";
    stCust.lname = "Doe";
    stCust.active = true;
    stCust.address = StructNew();
    stCust.address.address1 = "123 Main Street";
    stCust.address.address2 = "Apt 1A";
    stCust.address.city = "Brooklyn";
    stCust.address.state = "NY";
    stCust.address.zip = "12345";
    custService = CreateObject("webservice","http://some.site.com/customerService.asmx?wsdl");
    custService.UpdateCustomer(stCust);
</cfscript>