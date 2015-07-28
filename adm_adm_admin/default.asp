<!--#include file="security.asp"-->
<!--#include file="connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>Untitled Document</title>
</head>

<body>
<%
cat=security(Trim(Request.QueryString("cat")))
if cat="login" or cat="" then%>
<center>
<table border="0">
<form id="password" action="default.asp?cat=logincheck" method="post">
<tr>
<td align="left">Admin </td>
<td align="left"><input type="text" name="adm" id="adm"  size="15"/></td>
</tr>
<tr>
<td align="left">Password </td>
<td align="left"><input  type="password" name="password" id="password" size="15"/></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" name="login" value="Login"/>
</td>
</tr>
</form>
</table>
</center>

<%
elseif cat="logincheck" then
	adm_admin=security(Trim(Request.Form("adm")))
	adm_password=security(Trim(Request.Form("password")))
	
	Set admRs = Server.CreateObject("Adodb.RecordSet")
	admSql="Select * from admin where admin='"&adm_admin&"'"
	admRs.Open admSql,conn,1,3
	if not admRs.eof then
		if adm_admin=Trim(admRs("admin")) and adm_password=Trim(admRs("password")) then
			Session("adm_designei")="true"
			Session("adm_admin")=adm_admin
			Session("adm_password")=adm_password
			Session("adm_level")=admRs("levell")
			Response.Redirect("admin.asp") 
		else
			Response.Write ("<center><h3>Hata.</h3></center>")
		end if
	else
		Response.Write ("<center><h3>Hata...</h3>.</center>")	
	end if

%>

<%end if%>
</body>
</html>
