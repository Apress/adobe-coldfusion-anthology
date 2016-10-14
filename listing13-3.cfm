<!--- Calling the UpdateCustomer Operation via ColdFusion --->

<cfscript>
    stCust = StructNew();
    stCust.fname = "John";
    stCust.lname = "Doe";
    stCust.active = true;
    custService = CreateObject("webservice","http://some.site.com/customerService.asmx?wsdl");
    custService.UpdateCustomer(stCust);
</cfscript>