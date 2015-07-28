<!--#include file="security.asp"-->
<!--#include file="connection.asp"-->
<%
if Session("adm_admin")<>"" then
	Set admRs = Server.CreateObject("Adodb.RecordSet")
	admSql="Select * from admin where admin='"&Session("adm_admin")&"'"
	admRs.Open admSql,conn,1,3
else
	Response.Redirect("default.asp?cat=login")
end if
If Session("adm_designei")="true" and Session("adm_admin")=Trim(admRs("admin")) and Session("adm_password")=Trim(admRs("password")) then
	if admRs("levell")>2 then
	Response.Write("<center><a href=""admin.asp?cat=admin&section=ad_d"">Yeni Admin Ekle</a></center><br>")
		section=Trim(Request.QueryString("section"))
		if section="" or section="mainlist" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set adminRs = Server.Createobject("Adodb.RecordSet")
		adminSql = "Select * from admin order by id desc"
		adminRs.Open adminSql,conn,1,3
		
		if adminRs.Eof then
		Response.Write("<center>Kayýt Bulunamadý.</center>")
		else
		%>
			<center>Yetkili Listesi</center><br />
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td width="100"><strong>Admin</strong></td>
					<td width="100"><strong>Level</strong></td>
					<td width="200"><strong>Authority</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			adminRs.PageSize=5
			adminRs.Absolutepage=pg
			for i=1 to adminRs.PageSize
			if adminRs.Eof then exit for
			%>
				<tr>
					<td><%=Trim(adminRs("admin"))%></td>
					<td><% 
					if adminRs("levell")=1 then 
						Response.Write("Editör") 
					elseif  adminRs("levell")=3 then
						Response.Write("Administrator")
					end if
					%></td>
					<td>
					<%if adminRs("design")=true then
						Response.Write("Design ")
					end if
					if adminRs("designer")=true then
						Response.Write("Designer ")
					end if
					if adminRs("producer")=true then
						Response.Write("Producer ")
					end if
					if adminRs("inspire")=true then
						Response.Write("Inspire ")
					end if
					if adminRs("magazine")=true then
						Response.Write("Magazine ")
					end if
					if adminRs("video")=true then
						Response.Write("Video ")
					end if
					if adminRs("culture")=true then
						Response.Write("Culture ")
					end if
				
					%>&nbsp;</td>
					
					<td><a href="admin.asp?cat=admin&section=edit&id=<%=adminRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=admin&section=del&id=<%=adminRs("id")%>" onClick="return confirm('Bu Admini Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			adminRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to adminRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=admin&section=mainlist&pg="&p&""">"&p&"</a> ")
			end if
			next
			adminRs.Close
			Set adminRs = Nothing
		end if
		%>
		</center>
		
		
		<%
		elseif section="ad_d" then
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="admin_add" action="admin.asp?cat=admin&section=ad_dreg" method="post">
			  <tr>
				<td width="100">Admin : </td>
				<td><input type="text" name ="admin" /></td>
			  </tr>
			  <tr>
				<td>Password :</td>
				<td><input type="text" name ="password" /></td>
			  </tr>
			  <tr>
				<td>Level :</td>
				<td>
				<select name="level">
					<option value="1" selected="selected">Editör</option>
					<option value="3">Administrator</option>	
				</select>				
				</td>
			  </tr>
			  <tr>
				<td>Authority :</td>
				<td>
				<input type="checkbox" name ="design"  /> Design  
				<input type="checkbox" name ="designer" /> Designer<br /> 
				<input type="checkbox" name ="producer"  /> Producer 
				<input type="checkbox" name ="inspire"  /> Inspire<br />
				<input type="checkbox" name ="magazine" /> Magazine
				<input type="checkbox" name ="video"  /> Video<br />
				<input type="checkbox" name ="culture"  /> Culture				</td>
			  </tr> 
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Add"/></td>
			  </tr>
		  </form>
		</table>
		
		
		<%
		elseif section="ad_dreg" then
		admin=Trim(Request.Form("admin"))
		password=Trim(Request.Form("password"))
		level=Trim(Request.Form("level"))
		
		if Request.Form("design")="" then
			design=0
		else
			design=1
		end if
		if Request.Form("designer")="" then
			designer=0
		else
			designer=1
		end if
		if Request.Form("producer")="" then
			producer=0
		else
			producer=1
		end if
		if Request.Form("inspire")="" then
			inspire=0
		else
			inspire=1
		end if
		if Request.Form("magazine")="" then
			magazine=0
		else
			magazine=1
		end if
		if Request.Form("video")="" then
			video=0
		else
			video=1
		end if
		if Request.Form("culture")="" then
			culture=0
		else
			culture=1
		end if
		
		if admin="" or password="" or level="" then
			Response.Write("<center>Lütfen Bütün Alanlarý Doldurunuz.</center>")
		'elseif Len(title)>50 or Len(functionn)>5000 or Len(material)>2000 or Len(yearr)>20 or Len(adminer)>50 or Len(location)>200 or Len(link)>200 or Len(added_by)>50 then
		'	Response.Write("Alanlarýn kapsitesini aþtýnýz.")
		Response.End()
		end if
		
		Set admin_addregRs = Server.CreateObject("Adodb.RecordSet")
		admin_addregSql = "Select * from admin"
		admin_addregRs.Open admin_addregSql,conn,1,3
		admin_addregRs.AddNew
		admin_addregRs("admin")=admin
		admin_addregRs("password")=password
		admin_addregRs("levell")=level
		admin_addregRs("design")=design
		admin_addregRs("designer")=designer
		admin_addregRs("producer")=producer
		admin_addregRs("inspire")=inspire
		admin_addregRs("magazine")=magazine
		admin_addregRs("video")=video
		admin_addregRs("culture")=culture
		admin_addregRs.Update
		Response.Write("<center>Admin Eklendi.</center>")
		admin_addregRs.Close
		Set admin_addregRs = Nothing	
		%>
		
		
		
		<%
		elseif section="edit" then
		id=security(Trim(Request.QueryString("id")))
		Set admin_editRs = Server.CreateObject("Adodb.RecordSet")
		admin_editSql = "Select * from admin where id='"&id&"'"
		admin_editRs.Open admin_editSql,conn,1,3
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="admin_edit" action="admin.asp?cat=admin&section=editreg&id=<%=admin_editRs("id")%>" method="post">
			  <tr>
				<td width="100">Admin : </td>
				<td><strong><%=admin_editRs("admin")%></strong></td>
			  </tr>
			  <tr>
				<td>Password :</td>
				<td><input type="text" name ="password" value="<%=admin_editRs("password")%>" /></td>
			  </tr>
			  <tr>
				<td>Level :</td>
				<td>
				<select name="level">
				<%if admin_editRs("levell")=1 then%>
					<option value="1" selected="selected">Editör</option>
					<option value="3">Administrator</option>
				<%elseif admin_editRs("levell")=3 then%>
					<option value="3" selected="selected">Administrator</option>
					<option value="1">Editör</option>	
				<%end if%>	
				</select>				</td>
			  </tr>
			  <tr>
				<td>Authority :</td>
				<td>
				<input type="checkbox" name ="design"  <%if admin_editRs("design")=true then %> checked="checked" <%end if%> /> Design  
				<input type="checkbox" name ="designer"  <%if admin_editRs("designer")=true then %> checked="checked" <%end if%> /> Designer<br /> 
				<input type="checkbox" name ="producer"  <%if admin_editRs("producer")=true then %> checked="checked" <%end if%> /> Producer 
				<input type="checkbox" name ="inspire"  <%if admin_editRs("inspire")=true then %> checked="checked" <%end if%> /> Inspire<br />
				<input type="checkbox" name ="magazine"  <%if admin_editRs("magazine")=true then %> checked="checked" <%end if%> /> Magazine
				<input type="checkbox" name ="video"  <%if admin_editRs("video")=true then %> checked="checked" <%end if%> /> Video<br />
				<input type="checkbox" name ="culture"  <%if admin_editRs("culture")=true then %> checked="checked" <%end if%> /> Culture				</td>
			  </tr> 
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Update"/></td>
			  </tr>
		  </form>
		</table>
		<%
		admin_editRs.Close
		Set admin_editRs = Nothing 
		%>
		<%
		elseif section="editreg" then
		id=security(Trim(Request.QueryString("id")))
		password=Trim(Request.Form("password"))
		level=Trim(Request.Form("level"))
		
		if Request.Form("design")="" then
			design=0
		else
			design=1
		end if
		if Request.Form("designer")="" then
			designer=0
		else
			designer=1
		end if
		if Request.Form("producer")="" then
			producer=0
		else
			producer=1
		end if
		if Request.Form("inspire")="" then
			inspire=0
		else
			inspire=1
		end if
		if Request.Form("magazine")="" then
			magazine=0
		else
			magazine=1
		end if
		if Request.Form("video")="" then
			video=0
		else
			video=1
		end if
		if Request.Form("culture")="" then
			culture=0
		else
			culture=1
		end if
		
		if  password="" or level="" then
			Response.Write("Lütfen Bütün Alanlarý Doldurunuz.")
		'elseif Len(title)>50 or Len(functionn)>5000 or Len(material)>2000 or Len(yearr)>20 or Len(adminer)>50 or Len(location)>200 or Len(link)>200 or Len(added_by)>50 then
		'	Response.Write("Alanlarýn kapsitesini aþtýnýz.")
		Response.End()
		end if
		
		Set admin_regRs = Server.CreateObject("Adodb.RecordSet")
		admin_regSql = "Select * from admin where id='"&id&"'"
		admin_regRs.Open admin_regSql,conn,1,3
		
		admin_regRs("password")=password
		admin_regRs("levell")=level
		admin_regRs("design")=design
		admin_regRs("designer")=designer
		admin_regRs("producer")=producer
		admin_regRs("inspire")=inspire
		admin_regRs("magazine")=magazine
		admin_regRs("video")=video
		admin_regRs("culture")=culture
		admin_regRs.Update
		Response.Write("<center>Admin Güncellendi.</center>")
		admin_regRs.Close
		Set admin_regRs = Nothing
			
		%>
			
		<%
		elseif section="del" then
		id=security(Trim(Request.QueryString("id")))
		Set admin_delRs = Server.CreateObject("Adodb.RecordSet")
		admin_delSql = "Delete from admin where id='"&id&"'"
		admin_delRs.Open admin_delSql,conn,1,3
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		%>		
			
		<%end if%>
	<%
	else
		Response.Write("<center>Admin Bölümünde Yetkiniz Kisitli. </center>")
	end if
	%>	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>	
	