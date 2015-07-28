<!--#include file="security.asp"-->
<!--#include file="connection.asp"-->

<%
'' Güvenlik Satýrý Eklenicek
if Session("adm_admin")<>"" then
	Set admRs = Server.CreateObject("Adodb.RecordSet")
	admSql="Select * from admin where admin='"&Session("adm_admin")&"'"
	admRs.Open admSql,conn,1,3
else
	Response.Redirect("default.asp?cat=login")
end if
If Session("adm_designei")="true" and Session("adm_admin")=Trim(admRs("admin")) and Session("adm_password")=Trim(admRs("password")) then

%>
	<table align="center" border="0">
	  <tr>
		<td align="center">
			<a href="admin.asp?cat=design">Design</a> |
			<a href="admin.asp?cat=designer">Designer</a> |
			<a href="admin.asp?cat=producer">Producer</a> |
			<a href="admin.asp?cat=inspire">Inspire</a> |
			<a href="admin.asp?cat=magazine">Magazine</a> |
			<a href="admin.asp?cat=video">Video</a> |
			<a href="admin.asp?cat=culture">Culture</a> 
			<%if admRs("levell")=3 then Response.Write("| <a href=""admin.asp?cat=admin"">Admin</a>") %>
			<br /><br />	
		</td>
	 </tr>
	 <tr>
		<td>
			<%'-------------- Baþlangýç
			cat=security(Trim(Request.QueryString("cat")))
			if cat="design" then
			%>
			<!--#include file="adm_design.asp"-->
			<%
			elseif cat="designer" then
			%>
			<!--#include file="adm_designer.asp"-->
			<%
			elseif cat="producer" then
			%>
			<!--#include file="adm_producer.asp"-->
			<%
			elseif cat="inspire" then
			%>
			<!--#include file="adm_inspire.asp"-->
			<%
			elseif cat="magazine" then
			%>
			<!--#include file="adm_magazine.asp"-->
			<%
			elseif cat="video" then
			%>
			<!--#include file="adm_video.asp"-->
			<%
			elseif cat="culture" then
			%>
			<!--#include file="adm_culture.asp"-->
			<%
			elseif cat="admin" then
			%>
			<!--#include file="adm_adm.asp"-->
			<%end if%>
		</td>
	  </tr>
	</table>
	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>