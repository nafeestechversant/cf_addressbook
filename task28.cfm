<cfif structKeyExists(form,'fld_FormSubmit')>
  <cfinvoke component="task28" method="getQueryTask28" ></cfinvoke>   
  <cfoutput>Created Successfully</cfoutput>
</cfif>
<html>
 <head>
   <title>Task 28</title>
 </head>
  <body>
    <cfoutput>
      <div align="center">
          <cfparam name="form.fld_userName"  default=""  type="string">
          <cfparam name="form.fld_userPwd"  default=""  type="string">
          <cfparam name="form.fld_userRole"  default=""  type="string">
          <form name="form1" method="post" action="">
            <table width="75%" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center">
                  <label for="fld_userName">Username :</label>					
                </td>
                <td align="left">
                  <input name="fld_userName" id="fld_userName" required="true" />
                </td>
              </tr>
              <tr>
                <td align="center">
                  <label for="fld_userEmail">Password :</label>					
                </td>
                <td align="left">
                  <input type="password" name="fld_userPwd" id="fld_userPwd" required="true" />
                </td>
              </tr>
              <tr>
                <td align="center">
                  <label for="fld_userEmail">Role :</label>					
                </td>
                <td align="left">
                  <select name="fld_userRole" required="true">
                    <option value=""></option>
                    <option value=1>Admin</option>
                    <option value=2>Editor</option>
                    <option value=3>User</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td align="right">
                  <input type="submit" id="fld_FormSubmit" name="fld_FormSubmit" value="Create User">
                </td>
                <td align="left">
                  <a href="task28_1.cfm">Login</a>
                </td>
              </tr>
            </table>
          </form>
        </div>
    </cfoutput>
</body>
</html>
