<cfoutput>
    <div class="table-responsive" id="print-data" style="display: none;" border="2">                                   
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
                        <td>#getContactLists.firstname#</td>
                        <td>#getContactLists.contact_email#</td>
                        <td>#getContactLists.contact_phone#</td>
                        <td>#variables.getContactLists.address# #variables.getContactLists.street# #variables.getContactLists.pincode#</td>                                                                       
                    </tr>
                </cfloop>
            </tbody>                                                                                                      
        </table>                                     
    </div>
</cfoutput>