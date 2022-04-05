<cfobject component="login" name="contactsExcel">
<cfinvoke component="#contactsExcel#" method="getContactsExcel" returnvariable="getContactLists"></cfinvoke>
<cfset variables.theSheet = SpreadsheetNew("ContactData")>
<cfset SpreadsheetAddRow(variables.theSheet, "Name,Email,Phone,Address,Street,Pincode")>
<cfset SpreadsheetAddRows(variables.theSheet,variables.getContactLists)>
<cfheader name="Content-Disposition" value="inline; filename=Contacts.xls">
<cfcontent type="application/vnd.ms-excel" variable="#SpreadSheetReadBinary(variables.theSheet)#">