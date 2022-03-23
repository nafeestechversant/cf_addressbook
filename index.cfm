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
        <link href="css/style.css" rel="stylesheet">
    </head>
<body class="bg-gradient-primary">
    <cfoutput>    
        <div class="container-fluid">
            <div class="row">
                <div class="col-xl-12 col-lg-12 col-md-9">                          
                    <nav class="navbar navbar-expand navbar-light bg-blue topbar mb-4 static-top shadow">                                                   
                        <ul class="navbar-nav ml-auto">                                                                                          
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="##" id="userDropdown" role="button"
                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-white-600 small">Douglas McGee</span>                               
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
                    <div class="print-sec">
                        <i class="far fa-file-pdf fa-sm fa-fw mr-2 text-white-400 pdf-icon"></i>
                        <i class="far fa-file-excel fa-sm fa-fw mr-2 text-white-400 excel-icon"></i>
                        <i class="fas fa-print fa-sm fa-fw mr-2 text-white-400 print-icon"></i>                                                                                                                
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-3 col-lg-3 pl-lg-0">
                    <div class="contact-sec bg-white">
                        <img class="no-img" src="img/RAY.jpg" width="50%" alt="...">
                        <h6 class="m-0 font-weight-bold text-primary">Douglas McGee</h6> 
                        <a class="btn btn-primary btn-create-cnt" href="##" data-toggle="modal" data-target="##CreateModal">                                   
                            CREATE CONTACT
                        </a>                                                                                                                                                  
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 pr-lg-0">
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
                                            <tr>
                                                <td class="image-td"><img class="no-img2" src="img/RAY.jpg" width="25%" alt="..."></td>
                                                <td>Tiger Nixon</td>
                                                <td>System Architect</td>
                                                <td>Edinburgh</td>
                                                <td>
                                                    <a class="btn btn-primary btn-action-cnt" href="##" data-toggle="modal" data-target="##CreateModal">                                   
                                                        Edit
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-primary btn-action-cnt" href="##" data-toggle="modal" data-target="##DeleteModal">                                   
                                                        Delete
                                                    </a>
                                                </td>
                                                <td>
                                                    <a class="btn btn-primary btn-action-cnt" href="##" data-toggle="modal" data-target="##ViewModal">                                   
                                                        View
                                                    </a>
                                                </td>
                                            </tr>
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
                        <h5 class="modal-title" id="exampleModalLabel">Create Contact</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-9 col-lg-9 pl-lg-0 pr-lg-0">
                        <h5 class="font-weight-bold text-primary">Personal Contact</h5>
                        <form class="user">
                                <div class="form-group row">
                                    <div class="col-sm-3 mb-3 mb-sm-0">
                                        <label>Title</label>
                                        <select class="form-control form-control-user form-select">
                                            <option>Open this select menu</option>
                                            <option value="Mr">Mr</option>
                                            <option value="Mrs">Mrs</option>
                                            <option value="Ms">Ms</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-5 mb-3 mb-sm-0">
                                        <label>First Name</label>
                                        <input type="text" class="form-control form-control-user" id="exampleFirstName"
                                            placeholder="First Name">
                                    </div>
                                    <div class="col-sm-4">
                                        <label>Last Name</label>
                                        <input type="text" class="form-control form-control-user" id="exampleLastName"
                                            placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label>Gender</label>
                                        <select class="form-control form-control-user form-select">                                            
                                            <option value="male">Male</option>
                                            <option value="female">Female</option>                                            
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Date of Birth</label>
                                        <input type="date" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label>Upload Photo</label>
                                        <input type="file" name="" class="form-control form-control-user"
                                            id="" placeholder="" value="">
                                    </div>                            
                                </div>
                                <h5 class="font-weight-bold text-primary">Contact Details</h5>                               
                                <div class="form-group row">                                    
                                    <div class="col-sm-5 mb-3 mb-sm-0">
                                        <label>Address</label>
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleInputPassword" placeholder="Address">
                                    </div>
                                    <div class="col-sm-4">
                                        <label>Street</label>
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="Street">
                                    </div>
                                    <div class="col-sm-3">
                                        <label>Pincode</label>
                                        <input type="password" class="form-control form-control-user"
                                            id="exampleRepeatPassword" placeholder="Pincode">
                                    </div>
                                </div>
                                 <div class="form-group  row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <label>Email</label>
                                        <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                            placeholder="Email Address">
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Phone</label>
                                          <input type="email" class="form-control form-control-user" id="exampleInputEmail"
                                            placeholder="Phone">
                                    </div>                                  
                                </div>
                                <a href="login.html" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </a>
                                <hr>
                               
                        </form>
                    </div>
                    <div class="col-xl-3 col-lg-3 pr-lg-0 no-img3">
                        <img class="no-img" src="img/RAY.jpg" width="75%" alt="...">
                    </div>

                    </div>
                    </div>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-primary" href="login.cfm?logout">Create</a>
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>                        
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
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                   <div class="modal-body">
                        <div class="container">
                            <div class="row">
                                <div class="col-xl-9 col-lg-9 pl-lg-0 pr-lg-0">
                        <h5 class="font-weight-bold text-primary">Personal Contact</h5>
                             <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                                                     
                                        <tbody>
                                            <tr><td>
                                        <label>Title</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                              <tr><td>
                                        <label>First Name</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                              <tr><td>
                                        <label>Last Name</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                              <tr><td>
                                        <label>Gender</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                              <tr><td>
                                        <label>Date of Birth</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                              <tr><td>
                                        <label>Address</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                              <tr><td>
                                        <label>Street</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                             <tr><td>
                                        <label>Pincode</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                             <tr><td>
                                        <label>Email</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                             <tr><td>
                                        <label>Phone</label>
                                                </td>
                                                <td>Tiger Nixon</td>                                                
                                            </tr>
                                        </tbody>                                                                                                      
                                    </table>
                                </div>
                       
                                
                               
                               
                               
                       
                    </div>
                    <div class="col-xl-3 col-lg-3 pr-lg-0 no-img3">
                        <img class="no-img" src="img/RAY.jpg" width="75%" alt="...">
                    </div>

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
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Are you sure want to delete.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">No</button>
                        <a class="btn btn-primary" href="login.cfm?logout">Yes</a>
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
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    </cfoutput>
</body>
</html>