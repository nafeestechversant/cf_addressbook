<cfif NOT structKeyExists(session,'stLoggedInUser')>
    <cflocation url = "login.cfm">
</cfif>
<cfif structKeyExists(URL,'From')>
    <cfif URL.From IS "Delete">
    <cfinvoke component="login" method="deleteContact"></cfinvoke>         
    </cfif>
</cfif>     
<cfif structKeyExists(form,'submit_crteCon')>
    <cfinvoke component="login" method="createContact" returnvariable="errorMessage"></cfinvoke>        
</cfif>
<cfinvoke component="login" method="getContacts" returnvariable="getContactLists"></cfinvoke>
<cfinvoke component="login" method="getUserImage" returnvariable="getUsrImage"></cfinvoke>
<cfinvoke component="login" method="getOrmContacts" returnvariable="ContactLists"></cfinvoke>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Address Book - List</title>    
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">    
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/gray.css" rel="stylesheet" />
        <link href="css/style.css" rel="stylesheet">
    </head>
<body class="bg-gradient-primary">
    <cfoutput>    
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-9">                          
                    <nav class="navbar navbar-expand navbar-light bg-blue topbar mb-4 static-top shadow">                        
                        <img class="logo-img" src="img/logo.png" alt="...">                       
                        <h3 class="text-white-600">Address Book</h3>                                                                          
                        <ul class="navbar-nav ml-auto">                                                                                          
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="##" id="userDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-white-600 small">
                                        <cfif structKeyExists(session,'stLoggedInUser')>
                                            #session.stLoggedInUser.userFullName#
                                        </cfif>                                    
                                    </span>                               
                                </a>                            
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                    aria-labelledby="userDropdown">                                                                                          
                                    <a class="dropdown-item" href="##" data-toggle="modal" data-target="##logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-white-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>              
        <div class="container">
            <div class="row bg-white mb-sm-4">
                <div class="col-xl-12 col-lg-12 col-md-9">
                    <cfif isDefined('errorMessage') AND arrayIsEmpty(errorMessage)>
                        <p  class="green no-img3">Contact created successfully</p> 
                    </cfif>  
                    <div class="print-sec">
                        <a href="contact_pdf.cfm">
                            <i class="far fa-file-pdf fa-sm fa-fw mr-2 text-white-400 pdf-icon"></i>
                        </a>
                        <a href="contact_excel.cfm">
                            <i class="far fa-file-excel fa-sm fa-fw mr-2 text-white-400 excel-icon"></i>
                        </a>
                        <i class="fas fa-print fa-sm fa-fw mr-2 text-white-400 print-icon" onclick="PrintElem()"></i>                                                                                                                
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-lg-3 pl-lg-0">
                    <div class="contact-sec bg-white">
                        <form method="post" id="fileinfo" name="fileinfo">
                            <cfif variables.getUsrImage.image_name EQ ''>
                                 <input type="image" id="no-img" class="no-img" src="img/RAY.jpg" width="50%"/>
                            <cfelse>  
                                <input type="image" class="no-img" id="no-img" src="img/profile-img/#variables.getUsrImage.image_name#" width="50%" alt="...">                                     
                            </cfif>                             
                            <input type="file" id="my_file" name="upload" class="no-display"/>                            
                        </form> 
                        <h6 class="m-0 font-weight-bold text-primary">
                            <cfif structKeyExists(session,'stLoggedInUser')>
                                #session.stLoggedInUser.userFullName#
                            </cfif>
                        </h6> 
                        <a class="btn btn-primary btn-create-cnt" id="id-create-contact" data-toggle="modal" data-target="##CreateModal">                                   
                            CREATE CONTACT
                        </a>                                                                                                                                                  
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 pr-lg-0">
                    <cfinclude template="contact_print.cfm">                     
                    <div class="contact-list bg-white">
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">Contact Lists</h6>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">                                   
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>Image</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th colspan="3">Action</th>                                                
                                            </tr>
                                        </thead>                                              
                                        <tbody>
                                            <cfloop array="#ContactLists#" item="ContactLists"> 
                                                <tr>
                                                    <td class="image-td">
                                                        <cfif #ContactLists.getContact_image()# EQ ''>
                                                            <img class="no-img2" src="img/RAY.jpg" width="25%" alt="...">
                                                        <cfelse>  
                                                            <img class="no-img2" src="img/contact-img/#ContactLists.getContact_image()#" width="25%" alt="...">                                     
                                                        </cfif> 
                                                    </td>
                                                    <td>#ContactLists.getFirstname()#</td>
                                                    <td>#ContactLists.getContact_email()#</td>
                                                    <td>#ContactLists.getContact_phone()#</td>
                                                    <td>
                                                        <a class="btn btn-primary btn-action-cnt btn-action-edit" data-id="#ContactLists.getContact_id()#" data-toggle="modal" data-target="##CreateModal">                                   
                                                            Edit
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-primary btn-action-cnt " href="javascript:confirmDelete(#ContactLists.getContact_id()#);">                                   
                                                            Delete
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a class="btn btn-primary btn-action-cnt" href="javascript:viewContact(#ContactLists.getContact_id()#);">                                   
                                                            View
                                                        </a>
                                                    </td>
                                                </tr>
                                            </cfloop>
                                        </tbody>                                                                                                      
                                    </table>                                     
                                </div>
                            </div>
                        </div>                                                                                                            
                    </div>
                </div>
            </div>
        </div>
        
        <div class="modal fade" id="CreateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="contact_head">Create Contact</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">X</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-9 col-lg-9 pl-lg-0 pr-lg-0">
                                    <h5 class="font-weight-bold text-primary">Personal Contact</h5>
                                    <cfif isDefined('errorMessage') AND NOT arrayIsEmpty(errorMessage)>            
                                        <cfloop array="#errorMessage#" index="message">
                                            <p  class="red">#message#</p>
                                        </cfloop>

                                    </cfif>                                    
                                    <cfparam name="form.cont_id" default=""  type="string">
                                    <cfparam name="form.cont_title" default=""  type="string">
                                    <cfparam name="form.cont_firstname" default=""  type="string">
                                    <cfparam name="form.cont_lastname" default=""  type="string">
                                    <cfparam name="form.cont_gender" default=""  type="string">
                                    <cfparam name="form.cont_dob" default=""  type="string">
                                    <cfparam name="form.cont_photo" default=""  type="string">
                                    <cfparam name="form.cont_image" default=""  type="string">
                                    <cfparam name="form.cont_addr" default=""  type="string">
                                    <cfparam name="form.cont_street" default=""  type="string">
                                    <cfparam name="form.cont_pin" default=""  type="string">
                                    <cfparam name="form.cont_email" default=""  type="string">
                                    <cfparam name="form.cont_phone" default=""  type="string">
                                    <form class="user" id="cre_contact" method="post" action="" enctype="multipart/form-data">                                            
                                            <input type="hidden" name="cont_id" id="cont_id" value="">
                                            <input type="hidden" name="cont_image" id="cont_image" value="">
                                            <div class="form-group row">
                                                <div class="col-sm-3 mb-3 mb-sm-0">
                                                    <label>Title</label>
                                                    <select class="form-control form-select" name="cont_title" id="cont_title" data-bvalidator="required">                                           
                                                        <option value=""></option>
                                                        <option value="Mr">Mr</option>
                                                        <option value="Mrs">Mrs</option>
                                                        <option value="Ms">Ms</option>
                                                    </select>
                                                </div>
                                                <div class="col-sm-5 mb-3 mb-sm-0">
                                                    <label>First Name</label>
                                                    <input type="text" class="form-control form-control-user" name="cont_firstname" id="cont_firstname"
                                                        placeholder="First Name" data-bvalidator="required">
                                                </div>
                                                <div class="col-sm-4">
                                                    <label>Last Name</label>
                                                    <input type="text" class="form-control form-control-user" name="cont_lastname" id="cont_lastname"
                                                        placeholder="Last Name" data-bvalidator="required">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <label>Gender</label>
                                                    <select class="form-control form-select" name="cont_gender" id="cont_gender" data-bvalidator="required">                                            
                                                        <option value=""></option>
                                                        <option value="male">Male</option>
                                                        <option value="female">Female</option>                                            
                                                    </select>
                                                </div>
                                                <div class="col-sm-6">
                                                    <label>Date of Birth</label>
                                                    <input type="date" class="form-control form-control-user" id="cont_dob" name="cont_dob" placeholder="" data-bvalidator="required">
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <label>Upload Photo</label>
                                                    <input type="file" name="cont_photo" class="form-control form-control-user"
                                                        id="cont_photo" placeholder="" onchange="readURL(this);">
                                                </div>                            
                                            </div>
                                            <h5 class="font-weight-bold text-primary">Contact Details</h5>                               
                                            <div class="form-group row">                                    
                                                <div class="col-sm-5 mb-3 mb-sm-0">
                                                    <label>Address</label>
                                                    <input type="text" class="form-control form-control-user"
                                                        id="cont_addr" name="cont_addr" placeholder="Address" data-bvalidator="required">
                                                </div>
                                                <div class="col-sm-4">
                                                    <label>Street</label>
                                                    <input type="text" name="cont_street" class="form-control form-control-user"
                                                        id="cont_street" placeholder="Street" data-bvalidator="required">
                                                </div>
                                                <div class="col-sm-3">
                                                    <label>Pincode</label>
                                                    <input type="text" name="cont_pin" class="form-control form-control-user"
                                                        id="cont_pin" placeholder="Pincode" data-bvalidator="number,required">
                                                </div>
                                            </div>
                                            <div class="form-group  row">
                                                <div class="col-sm-6 mb-3 mb-sm-0">
                                                    <label>Email</label>
                                                    <input type="text" name="cont_email" id="cont_email" class="form-control form-control-user" id="exampleInputEmail"
                                                        placeholder="Email Address" data-bvalidator="required,email">
                                                </div>
                                                <div class="col-sm-6">
                                                    <label>Phone</label>
                                                    <input type="text" name="cont_phone" id="cont_phone" class="form-control form-control-user" id="exampleInputEmail"
                                                        placeholder="Phone" data-bvalidator="number,required">
                                                </div>                                  
                                            </div>
                                            <input type="submit" class="btn btn-primary btn-user btn-block" id="submit_crteCon" name="submit_crteCon" value="Create Contact">                               
                                            <hr>                               
                                    </form>
                                </div>
                                <div class="col-xl-3 col-lg-3 pr-lg-0 no-img3">
                                    <img class="no-img" id="cnt-img" src="img/RAY.jpg" width="75%" alt="...">
                                </div>
                            </div>
                        </div>
                    </div>                   
                </div>
            </div>
        </div>
        <!-- View Contact Modal-->
        <div class="modal fade" id="ViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Contact Details</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">X</span>
                        </button>
                    </div>
                   <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <cfif structKeyExists(URL,'From')>
                                    <cfif URL.From IS "View">
                                        <cfinvoke component="login" method="getContactById" returnvariable="getContactId"></cfinvoke> 
                                            <div class="col-xl-9 col-lg-9 pl-lg-0 pr-lg-0">                       
                                                <div class="table-responsive">                                                                                        
                                                    <table class="table bor-none" id="dataTable" width="100%" cellspacing="0">                                                                                        
                                                        <tbody>
                                                            <tr><td><label>Title</label></td>                                                    
                                                                <td>#variables.getContactId.title#</td>                                                
                                                            </tr>
                                                            <tr><td><label>First Name</label></td>                                                                                               
                                                                <td>#variables.getContactId.firstname#</td>                                                
                                                            </tr>
                                                            <tr><td><label>Last Name</label></td>                                                                                                                
                                                                <td>#variables.getContactId.lastname#</td>                                                
                                                            </tr>
                                                            <tr><td><label>Gender</label></td>
                                                                <td>#variables.getContactId.gender#</td>                                                
                                                            </tr>
                                                            <tr><td><label>Date of Birth</label></td>                                                                                                                
                                                                <td>#variables.getContactId.dateof_birth#</td>                                                
                                                            </tr>
                                                            <tr><td><label>Address</label></td>                                                                                                                
                                                                <td>#variables.getContactId.address#</td>                                                
                                                            </tr>
                                                            <tr><td><label>Street</label></td>                                                                                                                
                                                                <td>#variables.getContactId.street#</td>                                                
                                                            </tr>
                                                            <tr><td><label>Pincode</label></td>                                                                                                                
                                                                <td>#variables.getContactId.pincode#</td>                                                
                                                            </tr>
                                                            <tr><td><label>Email</label></td>                                                                                                                
                                                                <td>#variables.getContactId.contact_email#</td>                                                
                                                            </tr>
                                                            <tr><td><label>Phone</label></td>                                                                                                            
                                                                <td>#variables.getContactId.contact_phone#</td>                                                
                                                            </tr>
                                                        </tbody>                                                                                                      
                                                    </table>                                                                                                        
                                                </div>                                                                                                                                                                           
                                            </div>
                                            <div class="col-xl-3 col-lg-3 pr-lg-0 no-img3">
                                                <cfif variables.getContactId.contact_image EQ ''>
                                                    <img class="no-img" src="img/RAY.jpg" width="75%" alt="...">
                                                <cfelse>  
                                                    <img class="no-img" src="img/contact-img/#variables.getContactId.contact_image#" width="100%" height="50%" alt="...">                                     
                                                </cfif>                                    
                                            </div>
                                    </cfif>
                                </cfif>    
                            </div>
                         </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Close</button>                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Delete Contact Modal-->
        <div class="modal fade" id="DeleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Confirm Delete?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">X</span>
                        </button>
                    </div>
                    <div class="modal-body">Are you sure want to delete.</div>
                    <div class="modal-footer">
                        <input type="hidden" name="cntId" id="cntId" value=""/>
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">No</button>
                        <a class="btn btn-primary" href="">Yes</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="login.cfm?logout">Logout</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="js/jquery.bvalidator.min.js"></script>
        <script src="js/default.min.js"></script>
        <script src="js/gray.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="js/contact.js"></script>
        <script>                        
            <cfif structKeyExists(URL,'From')>
                <cfif URL.From IS "View">
                    $('##ViewModal').modal('show');
                </cfif>
            </cfif>            
        </script>
    </cfoutput>
</body>
</html>