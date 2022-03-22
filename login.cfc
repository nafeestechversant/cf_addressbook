<cfcomponent>
   <cffunction name="createUser" access="public" output="false">
		<cfset variables.errorMessage= arrayNew(1) />
		<cfset variables.fld_fullName = form.fld_fullName/>	
		<cfset variables.fld_userEmail = form.fld_userEmail/>
		<cfset variables.fld_userName = form.fld_userName/>
		<cfset variables.fld_userPwd = form.fld_userPwd/>
		<cfset variables.fld_userCnfPwd = form.fld_userCnfPwd/>		
		<cfif variables.fld_fullName EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter FullName')>
		</cfif>
		<cfif variables.fld_userEmail EQ '' OR NOT isValid("eMail", variables.fld_userEmail)>
			<cfset arrayAppend(errorMessage, 'Please Enter valid Email')>
		</cfif>
		<cfif variables.fld_userName EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter UserName')>
		</cfif>
		<cfif variables.fld_userPwd EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Password')>
		</cfif>
		<cfif variables.fld_userCnfPwd EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Confirm Password')>
		</cfif>
		<cfif  variables.fld_userCnfPwd NOT EQUAL '' AND variables.fld_userPwd NOT EQUAL variables.fld_userCnfPwd>
			<cfset arrayAppend(errorMessage, 'Confirm Password Mismatch')>
		</cfif>
		<cfif arrayIsEmpty(errorMessage)>
			<cfquery>INSERT INTO users (fullname,email_id,username, pwd)
				VALUES ('#variables.fld_fullName#','#form.fld_userEmail#','#form.fld_userName#', '#hash(form.fld_userPwd,'SHA')#')
			</cfquery>			
		</cfif>
		<cfreturn variables.errorMessage />						
	</cffunction>
	
   <cffunction name="getLoginQuery" access="public" output="false">
		<cfset variables.errorMessage= arrayNew(1) />
		<cfset variables.fld_userName = form.fld_userName/>
		<cfset variables.fld_userPwd = form.fld_userPwd/>
		<cfif variables.fld_userName EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter UserName')>
		</cfif>
		<cfif variables.fld_userPwd EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Password')>
		</cfif>
		<cfif arrayIsEmpty(errorMessage)>
			<cfquery name="local.checkLogin">
				SELECT * FROM users 
					WHERE username = <cfqueryparam value="#variables.fld_userName#" cfsqltype="cf_sql_varchar" /> AND pwd = <cfqueryparam value="#hash(variables.fld_userPwd,'SHA')#" cfsqltype="cf_sql_varchar" />
			</cfquery>
			<cfif local.checkLogin.recordcount EQ 1>
				<cfset session.stLoggedInUser = {'userUserName' = local.checkLogin.username, 'userID' = local.checkLogin.userid} > 
			<cfelse>
				<cfset arrayAppend(errorMessage, 'Invalid User Login')>
			</cfif>
		</cfif>
		<cfreturn variables.errorMessage />
	</cffunction>

	<cffunction name="deletePage" returntype="void" >			
			<cfquery>
				DELETE FROM task28_1 WHERE pageid = <cfqueryparam value="#URL.ID#" cfsqltype="cf_sql_integer" />
			</cfquery>
	</cffunction>

	 <cffunction name="getPages" access="public" output="false" returntype="query">		
		<cfquery name="rs_getPage">
			SELECT * FROM task28_1 ORDER BY pageid
		</cfquery>
		<cfreturn rs_getPage />
	</cffunction>

	<cffunction name="getPagesById" access="public" output="false" returntype="query">		
		<cfquery name="rs_getPageId">
			SELECT * FROM task28_1  WHERE pageid = #URL.ID#
		</cfquery>
		<cfreturn rs_getPageId />
	</cffunction>

	<cffunction name="updatePageById" access="public" output="false" >		
		<cfquery>
			UPDATE task28_1 SET pagename = '#form.pagename#',pagedescs = '#form.pagedescs#' WHERE pageid = #URL.ID#
		</cfquery>		
	</cffunction>		 
</cfcomponent>

