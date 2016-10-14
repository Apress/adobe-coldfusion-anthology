<!--- Calling a Web Service Operation with Java Objects --->

<cfscript>
    intHolder = CreateObject("java","javax.xml.rpc.holders.IntHolder").init();
    stringHolder = CreateObject("java","javax.xml.rpc.holders.StringHolder").init();
    custService = CreateObject("webservice","http://localhost/scribblecf/webservices/WSDLToJava/ExampleWSDL2.wsdl");
    custService.CustomerQuickAdd("First", "Last", intHolder, stringHolder);
</cfscript>