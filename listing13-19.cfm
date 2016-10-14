<!--- Calling the UpdateCustomer Operation via ColdFusion --->

<cfscript>
    stCust = StructNew();
    stCust.fname = "John";
    stCust.lname = "Doe";
    stCust.active = true;
    stCust.order = ArrayNew(1);
    stCust.order[1] = StructNew();
    stCust.order[1]._value = "123-45";
    stCust.address = ArrayNew(1);
    stCust.address[1] = StructNew();
    stCust.address[1].type= "home";
    stCust.address[1].address1 = "123 Main Street";
    stCust.address[1].address2 = "Apt 1A";
    stCust.address[1].city = "Brooklyn";
    stCust.address[1].state = "NY";
    stCust.address[1].zip = "12345";
    stCust.address[2] = StructNew();
    stCust.address[2].type= "work";
    stCust.address[2].address1 = "456 Main Street";
    stCust.address[2].address2 = "14th Floor";
    stCust.address[2].city = "New York";
    stCust.address[2].state = "NY";
    stCust.address[2].zip = "13579";
    custService = CreateObject("webservice","http://localhost/scribblecf/webservices/WSDLToJava/ExampleWSDL.wsdl");
    custService.UpdateCustomer(stCust);
</cfscript>
