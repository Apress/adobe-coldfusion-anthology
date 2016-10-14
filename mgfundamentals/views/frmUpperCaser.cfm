<form action="index.cfm?event=uppercaser.action" method="post">
	<input type="text" name="phrase">
	<input type="submit" value="Go">
</form>

<cfif event.exists("validationError")>
	<cfoutput>
		<p style="color:red">#event.getValue("validationError")#</p>
	</cfoutput>
</cfif>