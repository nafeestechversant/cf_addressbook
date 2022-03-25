<cfinvoke component="login" method="getContacts" returnvariable="getContactLists"></cfinvoke>
<cfheader name="Content-Disposition" value="attachment; filename=myDoc.pdf">
    <cfcontent type="application/pdf">
    <cfdocument format="PDF">
        <cfoutput>        
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" border="2"> 
                <thead>
                    <tr>                    
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>                                              
                    </tr>
                </thead>                                                                                       
                <tbody>
                    <cfloop query="variables.getContactLists"> 
                        <tr>
                            <td>#variables.getContactLists.firstname#</td>                                                    
                            <td>#variables.getContactLists.contact_email#</td>
                            <td>#variables.getContactLists.contact_phone#</td>    
                            <td>#variables.getContactLists.address# #variables.getContactLists.street# #variables.getContactLists.pincode#</td>                                                    
                        </tr>
                    </cfloop>
                </tbody>                                                                                                      
            </table>
        </cfoutput>
    </cfdocument>