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
				<cfset session.stLoggedInUser = {'userFullName' = local.checkLogin.fullname, 'userID' = local.checkLogin.userid} > 
			<cfelse>
				<cfset arrayAppend(errorMessage, 'Invalid User Login')>
			</cfif>
		</cfif>
		<cfreturn variables.errorMessage />
	</cffunction>

	<cffunction name="createContact" access="public" output="false">
		<cfset variables.errorMessage= arrayNew(1) />
		<cfset variables.cont_title = form.cont_title/>
		<cfset variables.cont_firstname = form.cont_firstname/>	
		<cfset variables.cont_lastname = form.cont_lastname/>
		<cfset variables.cont_gender = form.cont_gender/>	
		<cfset variables.cont_dob = form.cont_dob/>
		<cfset variables.cont_photo = form.cont_photo/>
		<cfset variables.cont_addr = form.cont_addr/>
		<cfset variables.cont_street = form.cont_street/>
		<cfset variables.cont_pin = form.cont_pin/>
		<cfset variables.cont_email = form.cont_email/>
		<cfset variables.cont_phone = form.cont_phone/>
		<cfset variables.user_id = form.user_id/>
		<cfif variables.cont_title EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Title')>
		</cfif>		
		<cfif variables.cont_firstname EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter FirstName')>
		</cfif>
		<cfif variables.cont_lastname EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter LastName')>
		</cfif>
		<cfif variables.cont_gender EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Gender')>
		</cfif>
		<cfif variables.cont_dob EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Date of Birth')>
		</cfif>
		<cfif variables.cont_addr EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Address')>
		</cfif>
		<cfif variables.cont_street EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Street')>
		</cfif>
		<cfif variables.cont_pin EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Pin')>
		</cfif>
		<cfif variables.cont_email EQ '' OR NOT isValid("eMail", variables.cont_email)>
			<cfset arrayAppend(errorMessage, 'Please Enter valid Email')>
		</cfif>		
		<cfif variables.cont_phone EQ ''>
			<cfset arrayAppend(errorMessage, 'Please Enter Phone')>
		</cfif>

		<cfif structKeyExists(form,"cont_photo") and len(trim(form.cont_photo))>
			<cfset variables.thisDir = expandPath(".")>
			<cffile action="upload" fileField="form.cont_photo" destination="#variables.thisDir#/img/contact-img" result="fileUpload" nameconflict="overwrite">
		</cfif>
		<cfif arrayIsEmpty(errorMessage)>
			<cfquery>INSERT INTO contact (user_id,title,firstname,lastname,gender,dateof_birth,contact_image,address,street,pincode,contact_email,contact_phone)
				VALUES ('#variables.user_id#','#variables.cont_title#','#variables.cont_firstname#','#variables.cont_lastname#','#variables.cont_gender#','#variables.cont_dob#','#fileUpload.serverFile#','#variables.cont_addr#','#variables.cont_street#','#variables.cont_pin#','#variables.cont_email#','#variables.cont_phone#')
			</cfquery>			
		</cfif>
		<cfreturn variables.errorMessage />						
	</cffunction>

	<cffunction name="deleteContact" returntype="void" >			
			<cfquery>
				DELETE FROM contact WHERE contact_id = <cfqueryparam value="#URL.ID#" cfsqltype="cf_sql_integer" /> AND user_id = <cfqueryparam value="#session.stLoggedInUser.userID#" cfsqltype="cf_sql_integer" />
			</cfquery>
	</cffunction>

	 <cffunction name="getContacts" access="public" output="false" returntype="query">		
		<cfquery name="local.rs_getContacts">
			SELECT * FROM contact WHERE user_id = <cfqueryparam value="#session.stLoggedInUser.userID#" cfsqltype="cf_sql_integer" /> ORDER BY contact_id
		</cfquery>
		<cfreturn local.rs_getContacts />
	</cffunction>

	<cffunction name="getContactById" access="public" output="false" returntype="query">		
		<cfquery name="local.rs_getContactById">
			SELECT * FROM contact  WHERE contact_id = <cfqueryparam value="#URL.ID#" cfsqltype="cf_sql_integer" /> AND user_id = <cfqueryparam value="#session.stLoggedInUser.userID#" cfsqltype="cf_sql_integer" />
		</cfquery>
		<cfdump  var="#local.rs_getContactById#">
		<cfreturn local.rs_getContactById />
	</cffunction>

	<cffunction name="updatePageById" access="public" output="false" >		
		<cfquery>
			UPDATE task28_1 SET pagename = '#form.pagename#',pagedescs = '#form.pagedescs#' WHERE pageid = #URL.ID#
		</cfquery>		
	</cffunction>		 
</cfcomponent>

