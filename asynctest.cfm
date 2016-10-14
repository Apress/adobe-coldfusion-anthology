<!--- Read in our data file --->
<cffile ACTION="read" FILE="#expandpath(".")#/testfile.txt"
    VARIABLE="incoming">

<!--- Treating the file like a list, use the following
 (line feed/carriage return) characters as delimiters --->
<cfset mydelim = chr(10) & chr(13)>

<!--- Grab number of lines in file and display for informational
    purposes --->
<cfset filelen = listlen(incoming, mydelim)>
<cfoutput> lines: #filelen# </cfoutput>

<!--- Put the data file into an array --->
<cfset thisdata = ListToArray(incoming, mydelim)>


<!--- Data put into array. Start the test (testtype value of 1
    indicates synchronous processing, 2 indicates asynchronous). --->
    <cfswitch expression="#url.test#">
        <cfcase value="batch">
            <!--- Perform insertions the old-fashioned way --->
            <!--- First purge existing records --->
            <cfquery name="qryDelete" datasource="#dsn#">
                delete from TestTable where testtype = 1
            </cfquery>
            <!--- Loop over the data array and perform an insert for each
            item --->
            <cfloop from="1" to="#arraylen(thisdata)#" index="j">
                <cfquery name="qryInsertRec" datasource="#dsn#">
                    insert into TestTable (txt_groupid, txt_code,
                    txt_description, inserttime, testtype)
                    VALUES (
                    <cfqueryparam value="#listfirst(thisdata[j])#" 
                        CFSQLTYPE="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#listgetat(thisdata[j],2)#"
                        CFSQLTYPE="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#listlast(thisdata[j])#"
                        CFSQLTYPE="CF_SQL_VARCHAR">,
                    <cfqueryparam value="#now()#"
                        CFSQLTYPE="CF_SQL_TIMESTAMP">,
                    <cfqueryparam value="1" CFSQLTYPE="CF_SQL_TINYINT">)
                </cfquery>
            </cfloop>
            <!--- Rretrieve the max and min times so we can calculate total
                insertion time --->
            <cfquery name="qryGetMaxMin" datasource="#dsn#">
                select max(inserttime) as maxtime, min(inserttime) as mintime
                from TestTable where testtype=1
            </cfquery>
            <cfoutput>total time for linear insertions: 
#datediff("s", qryGetMaxMin.mintime, qryGetMaxMin.maxtime)# seconds</cfoutput>
        </cfcase>

        <cfcase value="async"><!--- Perform inserts via gateways --->
            <!--- Purge out existing data --->
            <cfquery name="qryDelete" datasource="#dsn#">
                delete from TestTable where testtype = 2
            </cfquery>
            <!--- Loop over data array and call the gateway for each item,
               passing in the data --->
            <!--- Set up the structure we'll be handing over to the gateway --->
            <cfloop from="1" to="#arraylen(thisdata)#" index="j">
                <cfscript>
                    stData = structnew();
                    stData.dsn = dsn;
                    stData.theData=thisdata[j];
                    sendGatewayMessage(gateway, stData);
                </cfscript>
                <!--- To give the gateways time to complete their work, call
                this page with a separate request where test=checkAsyncTime
                to see the total insertion time for the gateways --->
            </cfloop>
        </cfcase>

        <cfcase value="checkAsyncTime">
        <!--- Go back and see how long it took to perform all inserts
        via gateway --->
            <cfquery name="qryGetMaxMin" datasource="#dsn#">
                select max(inserttime) as maxtime, min(inserttime) as mintime
                from TestTable where testtype=2
            </cfquery>
            <cfoutput>total time for asynchronous insertions:
                #datediff("s", qryGetMaxMin.mintime, qryGetMaxMin.maxtime)# seconds</cfoutput>
        </cfcase>
    </cfswitch>

