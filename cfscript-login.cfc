component displayname="login" 
{
    remote  function checkLogin()
            {
                errorMessage=[];
                var fld_userName = form["fld_userName"];
                var fld_userPwd = form["fld_userPwd"];
                if (trim(fld_userName) == '') 
                {
                    errorMessage.append("Please Enter UserName");
                }
                if (trim(fld_userPwd) == '') 
                {
                    errorMessage.append("Please Enter Password");
                }
                if(arrayIsEmpty(errorMessage)) 
                {
                    qService = new query(); 				
                    qService.setName("checkLogin"); 
                    qService.addParam(name="username", value="#trim(form.fld_userName)#", cfsqltype="cf_sql_varchar");
                    qService.addParam(name="pwd", value="#hash(trim(form.fld_userPwd))#", cfsqltype="cf_sql_varchar");
                    qService.setSql("SELECT * FROM users WHERE username = :username AND pwd=:pwd");
                    var results=qService.execute();
                    var recordCnt  = results.getPrefix();

                    if (recordCnt.RECORDCOUNT == '1')
                    {
                       session.stLoggedInUser = {'userFullName' = results.getresult().fullname, 'userID' = results.getresult().userid} 
                       location("index.cfm", "no");                                               
                    } else 
                    {
                        errorMessage.append("Invalid User Login");
                        session.errMsg = errorMessage;
                        location("login.cfm", "no"); 
                    }                                     
                } else {
                    session.errMsg = errorMessage;
                    location("login.cfm", "no"); 
                }                                
            }

            remote  function createUser()
            {
                errorMessage=[];
                var fld_fullName = form["fld_fullName"];
                var fld_userEmail = form["fld_userEmail"];
                var fld_userName = form["fld_userName"];
                var fld_userPwd = form["fld_userPwd"];
                var fld_userCnfPwd = form["fld_userCnfPwd"];
                if (trim(fld_fullName) == '') 
                {
                    errorMessage.append("Please Enter FullName");
                }
                if (trim(fld_userEmail) == '' OR NOT isValid("eMail",trim(fld_userEmail))) 
                {
                    errorMessage.append("Please Enter valid Email");
                }
                if (trim(fld_userName) == '') 
                {
                    errorMessage.append("Please Enter UserName");
                }
                if (trim(fld_userPwd) == '') 
                {
                    errorMessage.append("Please Enter Password");
                }
                if (trim(fld_userCnfPwd) == '') 
                {
                    errorMessage.append("Please Enter Confirm Password");
                }
                if (trim(fld_userCnfPwd) NOT EQUAL '' AND trim(fld_userPwd) NOT EQUAL trim(fld_userCnfPwd)) 
                {
                    errorMessage.append("Confirm Password Mismatch");
                }
                checkUsername = queryExecute(sql:"SELECT username FROM users WHERE username=:username",params={username:{type:'varchar',value:'#form.fld_userName#'}});
                if(checkUsername.recordcount EQ 1) 
                {
                     errorMessage.append("Username Already exists");
                }
                checkEmail = queryExecute(sql:"SELECT email_id FROM users WHERE email_id=:email_id",params={email_id:{type:'varchar',value:'#form.fld_userEmail#'}});
                if(checkEmail.recordcount EQ 1) 
                {
                     errorMessage.append("Email Already exists");
                }               
                if(arrayIsEmpty(errorMessage)) 
                {
                    qService = new query();                    
                    qService.setName("qInsertUsr");
                    qService.addParam(name="fullname", value="#trim(form.fld_fullName)#", cfsqltype="cf_sql_varchar");
                    qService.addParam(name="email_id", value="#trim(form.fld_userEmail)#", cfsqltype="cf_sql_varchar");
                    qService.addParam(name="username", value="#trim(form.fld_userName)#", cfsqltype="cf_sql_varchar");
                    qService.addParam(name="pwd", value="#hash(trim(form.fld_userPwd))#", cfsqltype="cf_sql_varchar");                    
                    qService.setSql("
                        INSERT INTO users
                        (fullname, email_id, username, pwd)
                        VALUES
                        (:fullname, :email_id, :username, :pwd)
                    ");
                    qService.execute();
                    structdelete(session,'errMsgReg')
                    location("login.cfm", "no"); 
                                                        
                } else {
                    session.errMsgReg = errorMessage;
                    location("register.cfm", "no"); 
                }                                
            }
}