<!-- Set the value of MyDatabase to be the name you published the database under -->
<cfcomponent output="false">
    <cfset this.name = 'Address Book' />
	<cfset this.applicationTimeout = createtimespan(0,2,0,0) />    
	<cfset this.ormenabled = "true">
	<cfset this.ormsettings = {datasource="cf_addressbook"}> 
    <cfset this.datasource = 'cf_addressbook' /> 
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />  
	

    <!---OnApplicationStart() method--->
	<cffunction name="onApplicationStart" returntype="boolean" >	
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
