<cfif event.isArgDefined("firstName")>
	<cfset firstName = event.getArg("firstName") />
<cfelse>
	<cfset firstName = "Stranger" />
</cfif>

<html>
	<head>
		<title>Hello <cfoutput>#firstName#</cfoutput></title>
	</head>
	
	<body>
		<cfoutput>
			<p>Hello #firstName#! The current date/time is #event.getArg("currentDateTime")#.</p>
		</cfoutput>
		
		<form action="index.cfm?event=showPersonalGreeting" method="post">
			Enter your first name: 
			<input type="text" name="firstName" size="30" />
			<input type="submit" value="Say Hello" />
		</form>
	</body>
</html>