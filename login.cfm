<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Address Book - Login</title>    
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
                                <!-- Nav Item - Alerts -->
                                <li class="nav-item dropdown no-arrow mx-1">
                                    <a class="" href="register.cfm" id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-fw fa-user-alt"></i>
                                        <span class="mr-2 d-none d-lg-inline text-white-600 small">Sign Up</span>                                
                                    </a>                            
                                </li>                                                                        
                                <!-- Nav Item - User Information -->
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
                <!-- Outer Row -->
                <div class="row justify-content-center">
                    <div class="col-xl-10 col-lg-12 col-md-9">
                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <!-- Nested Row within Card Body -->
                                <div class="row">
                                    <div class="col-lg-6 d-none d-lg-block bg-blue">
                                        <div class="login-imgdiv">
                                            <img class="" src="img/logo.png" alt="...">
                                        </div>                                
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="p-5">
                                            <div class="text-center">
                                                <h1 class="h4 text-gray-900 mb-4">LOGIN</h1>
                                            </div>
                                            <cfif isDefined('errorMessage') AND errorMessage.len() >
                                                <cfloop array="#errorMessage#" index="error">
                                                <p class="alert alert-error">#error#</p>
                                                </cfloop>
                                            </cfif>
                                            <cfif isDefined('errorMessage') AND NOT arrayIsEmpty(errorMessage)>            
                                                <cfloop array="#errorMessage#" index="message">
                                                    <p  class="red">#message#</p>
                                                </cfloop>
                                            <cfelseif isDefined('errorMessage') AND arrayIsEmpty(errorMessage)>
                                                <cflocation url = "index.cfm">         
                                            </cfif>
                                            <cfparam name="form.fld_userName"  default=""  type="string">
                                            <cfparam name="form.fld_userPwd"  default=""  type="string">
                                            <form class="user" id="login_form" method="post" action="login.cfc?method=getLoginQuery">
                                                <div class="form-group">
                                                    <input type="text" name="fld_userName" class="form-control form-control-user"
                                                        id="fld_userName" aria-describedby="emailHelp"
                                                        placeholder="Username" value="#form.fld_userName#">
                                                </div>
                                                <div class="form-group">
                                                    <input type="password" name="fld_userPwd" class="form-control form-control-user"
                                                        id="fld_userPwd" placeholder="Password" value="#form.fld_userPwd#">
                                                </div>
                                                 <input type="submit" class="btn btn-primary btn-user btn-block login-btn" id="fld_LoginSubmit" name="fld_LoginSubmit" value="Login">                                               
                                                <hr>
                                                <a href="##" class="btn btn-google btn-user btn-block">
                                                    <i class="fab fa-google fa-fw"></i> Login with Google
                                                </a>
                                                <a href="##" class="btn btn-facebook btn-user btn-block">
                                                    <i class="fab fa-facebook-f fa-fw"></i> Login with Facebook
                                                </a>
                                            </form>
                                            <hr>                                   
                                            <div class="text-center">
                                                <a class="small" href="register.cfm">Create an Account!</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>    
            <script src="vendor/jquery/jquery.min.js"></script>   
<!---             <script src="js/jquery.validate.js"></script> --->
            <script src="js/validation.js"></script>   
        </cfoutput>
    </body>
</html>