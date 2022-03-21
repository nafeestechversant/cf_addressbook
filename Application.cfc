<!-- Set the value of MyDatabase to be the name you published the database under -->
<cfcomponent output="false">
    <cfset this.name = 'CF 28 Task' />
	<cfset this.applicationTimeout = createtimespan(0,2,0,0) />    
    <cfset this.datasource = 'cf28tasks' /> 
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />  
	

    <!---OnApplicationStart() method--->
	<cffunction name="onApplicationStart" returntype="boolean" >	
	
		<cfset application.utils = createObject("component",'utils') />
		<cfset application.task23 = createObject("component",'task23') />
		<cfset application.myglobalvariable = structNew()>
		<cfreturn true />
	</cffunction>

    <!---onRequestStart() method--->
	<cffunction name="onRequestStart" returntype="boolean" >
		<cfargument name="targetPage" type="string" required="true" />
		<!---handle some special URL parameters--->
		<cfif isDefined('url.restartApp')>
			<cfset this.onApplicationStart() />
		</cfif>		
		<cfreturn true />
	</cffunction>
</cfcomponent>
