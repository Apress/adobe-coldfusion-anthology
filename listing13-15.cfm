<!--- generateStubs.cfm --->

<cfscript>
    wsargs = {savejava="yes"};
    custService = CreateObject("webservice","http://localhost/ExampleWSDL.wsdl",wsargs);
</cfscript>