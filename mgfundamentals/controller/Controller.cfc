<cfcomponent output="false" hint="I am a Model-Glue controller." extends="ModelGlue.gesture.controller.Controller">

	<cffunction name="init" access="public" output="false" hint="Constructor">
		<cfargument name="framework" />
		
		<cfset super.init(framework) />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="UpperCasePhrase" output="false">
		<cfargument name="event" required="true" />
		
		<!--- Get the "phrase" value from the form --->
		<cfset var phrase = arguments.event.getValue("phrase") />
	
		<!--- Upper case the phrase --->
		<cfset var upperCasedPhrase = uCase(phrase) />
	
		<!--- Validate the form --->
		<cfif not len(trim(phrase))>
			<cfset arguments.event.setValue("ValidationError", "Please enter a phrase.") />
			<cfset arguments.event.addResult("validationError") />
		</cfif>
		
		<!--- Set the upper-cased phrase into the event --->
		<cfset arguments.event.setValue("upperCasedPhrase", upperCasedPhrase) />
		
		<!--- Add a line to the debugging trace, showing that is worked --->
		<cfset arguments.event.addTraceStatement("User", "Phrase is: " & upperCasedPhrase, "UpperCasePhrase") />
	</cffunction>

</cfcomponent>