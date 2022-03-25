<cfinvoke component="login" method="getContacts" returnvariable="getContactLists"></cfinvoke>
<cfset variables.theSheet = SpreadsheetNew("ContactData")>
<cfset SpreadsheetAddRows(variables.theSheet,variables.getContactLists)>
<cfset variables.theDir=GetDirectoryFromPath(GetCurrentTemplatePath()) >
<cfset variables.theFile=variables.theDir & "Contacts.xls" >
<cfspreadsheet action="write" filename="#theFile#" name="theSheet" sheetname="Contacts" overwrite=true> 