<cfcomponent 
	displayname="TimeListener" 
	output="false" 
	extends="MachII.framework.Listener" 
	hint="TimeListener for Hello Mach-II app">

	<cffunction name="configure" access="public" output="false" returntype="void" 
				hint="Configures this listener as part of the application">
		<!--- don't need to do anything here for now --->
	</cffunction>

	<cffunction name="getCurrentDateTime" access="public" output="false" returntype="date" 
			hint="Returns the current date/time">
		<cfreturn Now() />
	</cffunction>

</cfcomponent>