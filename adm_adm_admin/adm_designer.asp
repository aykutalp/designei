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
	if admRs("designer")=true or admRs("levell")>1  then
		section=Trim(Request.QueryString("section"))
		if section="" or section="mainlist" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set designerRs = Server.Createobject("Adodb.RecordSet")
		designerSql = "Select * from designer order by id desc"
		designerRs.Open designerSql,conn,1,3
		
		if designerRs.Eof then
		Response.Write("<center>Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">Designer B&ouml;l&uuml;m&uuml;ndeki Tüm Kayýtlar Listelenmiþtir.<br />
			   Onaylanmamýþ Kayýtlar Ýçin <a href="admin.asp?cat=designer&section=uncheck_list"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image 1</strong></td>
					<td><strong>Image 2</strong></td>
					<td><strong>Image 3</strong></td>
					<td><strong>Image 4</strong></td>
					<td width="100"><strong>Name</strong></td>
					<td width="150"><strong>Discipline</strong></td>
					<td width="100"><strong>Country</strong></td>
					<td width="150"><strong>Link</strong></td>
					<td width="100"><strong>Added By</strong></td>
					<td width="100"><strong>Added Date</strong></td>
					<td><strong>Check</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Onayla</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			designerRs.PageSize=5
			designerRs.Absolutepage=pg
			for i=1 to designerRs.PageSize
			if designerRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/designer/<%=designerRs("img1")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/designer/<%=designerRs("img2")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/designer/<%=designerRs("img3")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/designer/<%=designerRs("img4")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(designerRs("name"))%></td>
					<td><%=Trim(designerRs("discipline"))%></td>
					<td><%=Trim(designerRs("country"))%></td>
					<td>
					<%link=Left(designerRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=Trim(designerRs("added_by"))%></td>
					<td><%=Trim(designerRs("added_date"))%></td>
					<td><%=designerRs("app")%></td>
					<td><a href="admin.asp?cat=designer&section=edit&id=<%=designerRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=designer&section=app&id=<%=designerRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=designer&section=del&id=<%=designerRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			designerRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to designerRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=designer&section=mainlist&pg="&p&""">"&p&"</a> ")
			end if
			next
			designerRs.Close
			Set designerRs = Nothing
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
		
		Set designer_uncheckRs = Server.Createobject("Adodb.RecordSet")
		designer_uncheckSql = "Select * from designer where app=0 order by id desc"
		designer_uncheckRs.Open designer_uncheckSql,conn,1,3
		
		if designer_uncheckRs.Eof then
		Response.Write("<center>Onaylanmamýþ Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">Designer B&ouml;l&uuml;m&uuml;ndeki Onaylanmamýþ Kayýtlar Listelenmiþtir. <br />Bütün Kayýtlar Ýçin <a href="admin.asp?cat=designer&section=mainlist"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image 1</strong></td>
					<td><strong>Image 2</strong></td>
					<td><strong>Image 3</strong></td>
					<td><strong>Image 4</strong></td>
					<td width="100"><strong>Name</strong></td>
					<td width="150"><strong>Discipline</strong></td>
					<td width="100"><strong>Country</strong></td>
					<td width="150"><strong>Link</strong></td>
					<td width="100"><strong>Added By</strong></td>
					<td width="100"><strong>Added Date</strong></td>
					<td><strong>Check</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Onayla</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			designer_uncheckRs.PageSize=5
			designer_uncheckRs.Absolutepage=pg
			for i=1 to designer_uncheckRs.PageSize
			if designer_uncheckRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/designer/<%=designer_uncheckRs("img1")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/designer/<%=designer_uncheckRs("img2")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/designer/<%=designer_uncheckRs("img3")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/designer/<%=designer_uncheckRs("img4")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(designer_uncheckRs("name"))%></td>
					<td><%=Trim(designer_uncheckRs("discipline"))%></td>
					<td><%=Trim(designer_uncheckRs("country"))%></td>
					<td>
					<%link=Left(designer_uncheckRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=Trim(designer_uncheckRs("added_by"))%></td>
					<td><%=Trim(designer_uncheckRs("added_date"))%></td>
					<td><%=designer_uncheckRs("app")%></td>
					<td><a href="admin.asp?cat=designer&section=edit&id=<%=designer_uncheckRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=designer&section=app&id=<%=designer_uncheckRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=designer&section=del&id=<%=designer_uncheckRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			designer_uncheckRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to designer_uncheckRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=designer&section=uncheck_list&pg="&p&""">"&p&"</a> ")
			end if
			next
			designer_uncheckRs.Close
			Set designer_uncheckRs = Nothing
		end if
		%>
		</center>
		
		
		<%
		elseif section="edit" then
		id=security(Trim(Request.QueryString("id")))
		Set designer_editRs = Server.CreateObject("Adodb.RecordSet")
		designer_editSql = "Select * from designer where id='"&id&"'"
		designer_editRs.Open designer_editSql,conn,1,3
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="designer_edit" action="admin.asp?cat=designer&section=editreg&id=<%=designer_editRs("id")%>" method="post">
			  <tr>
				<td align="center"><img src="../images/designer/<%=designer_editRs("img1")%>" /></td>
				<td align="center"><img src="../images/designer/<%=designer_editRs("img2")%>" /></td>
			  </tr>
			  <tr>
				<td align="center"><img src="../images/designer/<%=designer_editRs("img3")%>" /></td>
				<td align="center"><img src="../images/designer/<%=designer_editRs("img4")%>" /></td>
			  </tr>
			  <tr>
				<td width="100">Name : </td>
				<td><input type="text" name ="name" value="<%=designer_editRs("name")%>" /></td>
			  </tr>
			  <tr>
				<td>Discipline :</td>
				<td><input type="text" name ="discipline" value="<%=designer_editRs("discipline")%>" /></td>
			  </tr>
			  <tr>
				<td>Country :</td>
				<td><input type="text" name ="country" value="<%=designer_editRs("country")%>" /></td>
			  </tr>
			  <tr>
				<td>Link :</td>
				<td><input type="text" name ="link" value="<%=designer_editRs("link")%>" /></td>
			  </tr>
			  <tr>
				<td>Added By :</td>
				<td><input type="text" name ="added_by" value="<%=designer_editRs("added_by")%>" /></td>
			  </tr>
			  <tr>
				<td>Added Date :</td>
				<td><input type="text" name ="added_date" value="<%=designer_editRs("added_date")%>" /></td>
			  </tr>
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Update"/></td>
			  </tr>
		  </form>
		</table>
		<%
		designer_editRs.Close
		Set designer_editRs = Nothing 
		%>
		<%
		elseif section="editreg" then
		id=security(Trim(Request.QueryString("id")))
		namee=Trim(Request.Form("name"))
		discipline=Trim(Request.Form("discipline"))
		country=Trim(Request.Form("country"))
		link=Trim(Request.Form("link"))
		added_by=Trim(Request.Form("added_by"))
		added_date=Trim(Request.Form("added_date"))
		
		if namee="" or discipline="" or country="" or link="" or added_by="" or added_date="" then
			Response.Write("<center>Lütfen Bütün Alanlarý Doldurunuz.</center>")
		elseif Len(namee)>50 then	
			Response.Write ("Name Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(discipline)>200 then	
			Response.Write ("Discipline Kýsmý 200 Karakterden Fazla Olamaz.")
		elseif Len(country)>500 then	
			Response.Write ("Country Kýsmý 500 Karakterden Fazla Olamaz..")
		elseif Len(link)>200 then	
			Response.Write ("Link Kýsmý 200 Karakterden Fazla Olamaz.")
		elseif Len(added_by)>50 then	
			Response.Write ("Added By Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(added_date)>50 then	
			Response.Write ("Added Date Kýsmý 50 Karakterden Fazla Olamaz.")
		else
			
			Set designer_regRs = Server.CreateObject("Adodb.RecordSet")
			designer_regSql = "Select * from designer where id='"&id&"'"
			designer_regRs.Open designer_regSql,conn,1,3
			
			designer_regRs("name")=namee
			designer_regRs("discipline")=discipline
			designer_regRs("country")=country
			designer_regRs("link")=link
			designer_regRs("added_by")=added_by
			designer_regRs("added_date")=added_date
			designer_regRs.Update
			Response.Write("<center>Kayýt Güncellendi.</center>")
			designer_regRs.Close
			Set designer_regRs = Nothing
		end if
		
			
		%>
		<%
		elseif section="app" then  '------------ Onay kýsmý yapýlýcak onay id eklenicek
		Set designer_appnoRs = Server.CreateObject("Adodb.RecordSet")
		designer_appnoSql = "Select * from designer where app=1 order by app_no"
		designer_appnoRs.Open designer_appnoSql,conn,1,3
		
		if designer_appnoRs.Eof then
		app_no=0
		else
		designer_appnoRs.MoveLast
		app_no=designer_appnoRs("app_no")
		end if
		id=Trim(Request.QueryString("id"))
		Set designer_appRs = Server.CreateObject("Adodb.RecordSet")
		designer_appSql = "Select * from designer where id='"&id&"'"
		designer_appRs.Open designer_appSql,conn,1,3
		if designer_appRs("app")=true then
			Response.Write("<center>Zaten Onaylanmýþ</center>")
		else
			designer_appRs("app_no")=app_no+1
			designer_appRs("app")=1
			designer_appRs.Update
			Response.Write("<center> Onaylandý.<br><a href="&Request.ServerVariables("HTTP_REFERER")&">[Geri]</a></center>")
		end if
		designer_appRs.Close
		Set designer_appRs = Nothing
		
		%>
		<%
		elseif section="del" then
		id=security(Trim(Request.QueryString("id")))
		Set designer_delFsoRs = Server.CreateObject("Adodb.RecordSet")
		designer_delFsoSql = "Select * from designer where id='"&id&"'"
		designer_delFsoRs.Open designer_delFsoSql,conn,1,3
		Set designer_delFso= Server.CreateObject("Scripting.FileSystemObject")
		designer_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\designer\"&designer_delFsoRs("img1"))
		designer_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\designer\"&designer_delFsoRs("img2"))
		designer_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\designer\"&designer_delFsoRs("img3"))
		designer_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\designer\"&designer_delFsoRs("img4"))
		Set designer_delRs = Server.CreateObject("Adodb.RecordSet")
		designer_delSql = "Delete from designer where id='"&id&"'"
		designer_delRs.Open designer_delSql,conn,1,3
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		%>		
			
		<%end if%>
	<%
	else
		Response.Write("<center>Designer Bölümünde Yetkiniz Kisitli. </center>")
	end if
	%>	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>	
	