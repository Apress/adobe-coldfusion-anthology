<cfcomponent>
    <cffunction access="public" name="onIncomingMessage" output="false">
        <cfargument name="CFEvent" type="struct" required="yes">
        <cftry>
            <cfquery name="qryInsertRec" datasource="#CFEvent.Data.dsn#" dbtype="ODBC">
                insert into TestTable
                (txt_groupid, txt_code, txt_description, inserttime, testtype)
                values (
                    <cfqueryparam value="#listfirst(CFEvent.Data.theData)#"
                        cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#listgetat(CFEvent.Data.theData,2)#"
                        cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#listlast(CFEvent.Data.theData)#"
                        cfsqltype="cf_sql_varchar">,
                    <cfqueryparam value="#now()#" cfsqltype= "cf_sql_timestamp">,
                    <cfqueryparam value="2" cfsqltype="cf_sql_tinyint">)
            </cfquery>
            <cfcatch>
                <cfmail to="dougboude@gmail.com" from="gateway test" 
                    subject="Candygram for Mongo">
                    #cfcatch.error#<br>#cfcatch.message#<br>#cfcatch.detail#
                </cfmail>
            </cfcatch>
        </cftry>
    </cffunction>
</cfcomponent>
