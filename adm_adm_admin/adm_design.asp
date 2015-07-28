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
	if admRs("design")=true or admRs("levell")>1  then
		section=Trim(Request.QueryString("section"))
		if section="" or section="mainlist" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set designRs = Server.Createobject("Adodb.RecordSet")
		designSql = "Select * from design order by id desc"
		designRs.Open designSql,conn,1,3
		
		if designRs.Eof then
		Response.Write("<center>Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">Design B&ouml;l&uuml;m&uuml;ndeki Tüm Kayýtlar Listelenmiþtir.<br />
			   Onaylanmamýþ Kayýtlar Ýçin <a href="admin.asp?cat=design&section=uncheck_list"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image</strong></td>
					<td width="100"><strong>Title</strong></td>
					<td width="150"><strong>Function</strong></td>
					<td width="100"><strong>Year</strong></td>
					<td width="100"><strong>Designer</strong></td>
					<td width="100"><strong>Client</strong></td>
					<td width="150"><strong>Link</strong></td>
					<td width="100"><strong>Added By</strong></td>
					<td width="100"><strong>Added Date</strong></td>
					<td><strong>Check</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Onayla</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			designRs.PageSize=5
			designRs.Absolutepage=pg
			for i=1 to designRs.PageSize
			if designRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/design/<%=designRs("img")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(designRs("title"))%></td>
					<td><%=Trim(designRs("functionn"))%></td>
					<td><%=Trim(designRs("yearr"))%></td>
					<td><%=Trim(designRs("designer"))%></td>
					<td><%=Trim(designRs("client"))%></td>
					<td>
					<%link=Left(designRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=Trim(designRs("added_by"))%></td>
					<td><%=Trim(designRs("added_date"))%></td>
					<td><%=designRs("app")%></td>
					<td><a href="admin.asp?cat=design&section=edit&id=<%=designRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=design&section=app&id=<%=designRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=design&section=del&id=<%=designRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			designRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to designRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=design&section=mainlist&pg="&p&""">"&p&"</a> ")
			end if
			next
			designRs.Close
			Set designRs = Nothing
		end if
		%>
		</center>
		
		
		<%	 
		elseif section="uncheck_list" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set design_uncheckRs = Server.Createobject("Adodb.RecordSet")
		design_uncheckSql = "Select * from design where app=0 order by id desc"
		design_uncheckRs.Open design_uncheckSql,conn,1,3
		
		if design_uncheckRs.Eof then
		Response.Write("<center>Onaylanmamýþ Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">Design B&ouml;l&uuml;m&uuml;ndeki Onaylanmamýþ Kayýtlar Listelenmiþtir. <br />Bütün Kayýtlar Ýçin <a href="admin.asp?cat=design&section=mainlist"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image</strong></td>
					<td width="100"><strong>Title</strong></td>
					<td width="150"><strong>Function</strong></td>
					<td width="100"><strong>Year</strong></td>
					<td width="100"><strong>Designer</strong></td>
					<td width="100"><strong>Client</strong></td>
					<td width="150"><strong>Link</strong></td>
					<td width="100"><strong>Added By</strong></td>
					<td width="100"><strong>Added Date</strong></td>
					<td><strong>Check</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Onayla</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			design_uncheckRs.PageSize=5
			design_uncheckRs.Absolutepage=pg
			for i=1 to design_uncheckRs.PageSize
			if design_uncheckRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/design/<%=design_uncheckRs("img")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(design_uncheckRs("title"))%></td>
					<td><%=Trim(design_uncheckRs("functionn"))%></td>
					<td><%=Trim(design_uncheckRs("yearr"))%></td>
					<td><%=Trim(design_uncheckRs("designer"))%></td>
					<td><%=Trim(design_uncheckRs("client"))%></td>
					<td>
					<%link=Left(design_uncheckRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=Trim(design_uncheckRs("added_by"))%></td>
					<td><%=Trim(design_uncheckRs("added_date"))%></td>
					<td><%=design_uncheckRs("app")%></td>
					<td><a href="admin.asp?cat=design&section=edit&id=<%=design_uncheckRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=design&section=app&id=<%=design_uncheckRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=design&section=del&id=<%=design_uncheckRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			design_uncheckRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to design_uncheckRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=design&section=uncheck_list&pg="&p&""">"&p&"</a> ")
			end if
			next
			design_uncheckRs.Close
			Set design_uncheckRs = Nothing
		end if
		%>
		</center>
		
		
		<%
		elseif section="edit" then
		id=security(Trim(Request.QueryString("id")))
		Set design_editRs = Server.CreateObject("Adodb.RecordSet")
		design_editSql = "Select * from design where id='"&id&"'"
		design_editRs.Open design_editSql,conn,1,3
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="design_edit" action="admin.asp?cat=design&section=editreg&id=<%=design_editRs("id")%>" method="post">
			  <tr>
				<td colspan="2" align="center"><img src="../images/design/<%=design_editRs("img")%>" /></td>
			  </tr>
			  <tr>
				<td width="100">Title : </td>
				<td><input type="text" name ="title" value="<%=design_editRs("title")%>" /></td>
			  </tr>
			  <tr>
				<td>Function :</td>
				<td><input type="text" name ="functionn" value="<%=design_editRs("functionn")%>" /></td>
			  </tr>
			  <tr>
				<td>Year :</td>
				<td><input type="text" name ="yearr" value="<%=design_editRs("yearr")%>" /></td>
			  </tr>
			  <tr>
				<td>Designer :</td>
				<td><input type="text" name ="designer" value="<%=design_editRs("designer")%>" /></td>
			  </tr>
			  <tr>
				<td>Client :</td>
				<td><input type="text" name ="client" value="<%=design_editRs("client")%>" /></td>
			  </tr>
			  <tr>
				<td>Link :</td>
				<td><input type="text" name ="link" value="<%=design_editRs("link")%>" /></td>
			  </tr>
			  <tr>
				<td>Added By :</td>
				<td><input type="text" name ="added_by" value="<%=design_editRs("added_by")%>" /></td>
			  </tr>
			   <tr>
				<td>Added Date :</td>
				<td><input type="text" name ="added_date" value="<%=design_editRs("added_date")%>" /></td>
			  </tr>
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Update"/></td>
			  </tr>
		  </form>
		</table>
		<%
		design_editRs.Close
		Set design_editRs = Nothing 
		%>
		<%
		elseif section="editreg" then
		id=security(Trim(Request.QueryString("id")))
		title=Trim(Request.Form("title"))
		functionn=Trim(Request.Form("functionn"))
		yearr=Trim(Request.Form("yearr"))
		designer=Trim(Request.Form("designer"))
		client=Trim(Request.Form("client"))
		link=Trim(Request.Form("link"))
		added_by=Trim(Request.Form("added_by"))
		added_date=Trim(Request.Form("added_date"))
		
		if title="" or functionn="" or yearr="" or designer="" or client="" or link="" or added_by="" or added_date="" then
			Response.Write("<center>Lütfen Bütün Alanlarý Doldurunuz.</center>")
		elseif Len(title)>50 then	
			Response.Write ("Title Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(functionn)>4000 then	
			Response.Write ("Function Kýsmý 4000 Karakterden Fazla Olamaz.")
		elseif Len(yearr)>20 then	
			Response.Write ("Year Kýsmý 20 Karakterden Fazla Olamaz.")
		elseif Len(designer)>50 then	
			Response.Write ("Designer Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(client)>200 then	
			Response.Write ("Client Kýsmý 200 Karakterden Fazla Olamaz.")
		elseif Len(link)>200 then	
			Response.Write ("Link Kýsmý 200 Karakterden Fazla Olamaz.")
		elseif Len(added_by)>50 then	
			Response.Write ("Added By Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(added_date)>50 then	
			Response.Write ("Added Date Kýsmý 50 Karakterden Fazla Olamaz.")
		else
		
			Set design_regRs = Server.CreateObject("Adodb.RecordSet")
			design_regSql = "Select * from design where id='"&id&"'"
			design_regRs.Open design_regSql,conn,1,3
			
			design_regRs("title")=title
			design_regRs("functionn")=functionn
			design_regRs("yearr")=yearr
			design_regRs("designer")=designer
			design_regRs("client")=client
			design_regRs("link")=link
			design_regRs("added_by")=added_by
			design_regRs("added_date")=added_date
			design_regRs.Update
			Response.Write("<center>Kayýt Güncellendi.</center>")
			design_regRs.Close
			Set design_regRs = Nothing
		end if	
		
			
		%>
		<%
		elseif section="app" then  '------------ Onay kýsmý yapýlýcak onay id eklenicek
		Set design_appnoRs = Server.CreateObject("Adodb.RecordSet")
		design_appnoSql = "Select * from design where app=1 order by app_no"
		design_appnoRs.Open design_appnoSql,conn,1,3
		
		if design_appnoRs.Eof then
		app_no=0
		else
		design_appnoRs.MoveLast
		app_no=design_appnoRs("app_no")
		end if
		id=Trim(Request.QueryString("id"))
		Set design_appRs = Server.CreateObject("Adodb.RecordSet")
		design_appSql = "Select * from design where id='"&id&"'"
		design_appRs.Open design_appSql,conn,1,3
		if design_appRs("app")=true then
			Response.Write("<center>Zaten Onaylanmýþ</center>")
		else
			design_appRs("app_no")=app_no+1
			design_appRs("app")=1
			design_appRs.Update
			Response.Write("<center> Onaylandý.<br><a href="&Request.ServerVariables("HTTP_REFERER")&">[Geri]</a></center>")
		end if
		design_appRs.Close
		Set design_appRs = Nothing
		
		%>
		<%
		elseif section="del" then
		id=security(Trim(Request.QueryString("id")))
		Set design_delFsoRs = Server.CreateObject("Adodb.RecordSet")
		design_delFsoSql = "Select * from design where id='"&id&"'"
		design_delFsoRs.Open design_delFsoSql,conn,1,3
		Set design_delFso= Server.CreateObject("Scripting.FileSystemObject")
		design_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\design\"&design_delFsoRs("img"))
		Set design_delRs = Server.CreateObject("Adodb.RecordSet")
		design_delSql = "Delete from design where id='"&id&"'"
		design_delRs.Open design_delSql,conn,1,3
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		%>		
			
		<%end if%>
	<%
	else
		Response.Write("<center>Design Bölümünde Yetkiniz Kisitli. </center>")
	end if
	%>	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>	
	