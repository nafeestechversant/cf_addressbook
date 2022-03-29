<cfif structKeyExists(form,'fld_FormSubmit')>
    <cfinvoke component="login" method="createUser" returnvariable="errorMessage"></cfinvoke>        
</cfif>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Address Book - Register</title>   
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
                            <img class="logo-img" src="img/logo.png" alt="...">                       
                            <h3 class="text-white-600">Address Book</h3> 
                            <ul class="navbar-nav ml-auto">                                             
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <a class="" href="register.cfm" id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-fw fa-user-alt"></i>
                                        <span class="mr-2 d-none d-lg-inline text-white-600 small">Sign Up</span>                                
                                    </a>                           
                                </li>                                                                                                
                                <li class="nav-item dropdown no-arrow">
                                    <a class="" href="login.cfm" id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false">                               
                                        <i class="fas fa-fw fa-sign-in-alt"></i>
                                        <span class="mr-2 d-none d-lg-inline text-white-600 small">Login</span>                                
                                    </a>                           
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>   
            </div>
            <div class="container">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">                
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-blue">
                                <div class="login-imgdiv">
                                    <img class="" src="img/logo.png" alt="...">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                                    </div>
                                    <cfif isDefined('errorMessage') AND NOT arrayIsEmpty(errorMessage)>            
                                        <cfloop array="#errorMessage#" index="message">
                                            <p  class="red">#message#</p>
                                        </cfloop>
                                    <cfelseif isDefined('errorMessage') AND arrayIsEmpty(errorMessage)>
                                        <p  class="green">User Registered successfully</p>       
                                    </cfif>
                                    <cfparam name="form.fld_fullName"  default=""  type="string">
                                    <cfparam name="form.fld_userEmail"  default=""  type="string">
                                    <cfparam name="form.fld_userName"  default=""  type="string">
                                    <cfparam name="form.fld_userPwd"  default=""  type="string">
                                    <cfparam name="form.fld_userCnfPwd"  default=""  type="string">
                                    <form class="user" id="register_form" method="post" action="">
                                        <div class="form-group">                                    
                                            <input type="text" class="form-control form-control-user" name="fld_fullName" id="fld_fullName"
                                                placeholder="Full Name" value="#form.fld_fullName#">
                                            <h5 id="fullNamecheck" class="red" >**Fullname is missing</h5>                                                                      
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user" name="fld_userEmail" id="fld_userEmail"
                                                placeholder="Email Address" value="#form.fld_userEmail#">
                                            <h5 id="emailvalid" class="red">**Your email must be a valid email</h5>                                            
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user" name="fld_userName" id="fld_userName"
                                            placeholder="UserName" value="#form.fld_userName#">
                                            <h5 id="usercheck" class="red" >**Username is missing</h5>
                                        </div>                               
                                        <div class="form-group">                                    
                                                <input type="password" class="form-control form-control-user" name="fld_userPwd" id="fld_userPwd" placeholder="Password" value="#form.fld_userPwd#">
                                                <h5 id="passcheck" class="red">**Please Fill the password</h5>                                                                        
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user" name="fld_userCnfPwd" id="fld_userCnfPwd" placeholder="Confirm Password" value="#form.fld_userCnfPwd#">
                                            <h5 id="conpasscheck" class="red">**Password didn't match</h5>
                                        </div>
                                        <input type="submit" class="btn btn-primary btn-user btn-block" id="fld_FormSubmit" name="fld_FormSubmit" value="Register Account">                                                                                                
                                    </form>
                                    <hr>                           
                                    <div class="text-center">
                                        <a class="small" href="login.cfm">Already have an account? Login!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="js/validate.js"></script> 
        </cfoutput>
    </body>
</html>