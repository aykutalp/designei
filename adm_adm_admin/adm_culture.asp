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
	if admRs("culture")=true or admRs("levell")>1  then
		section=Trim(Request.QueryString("section"))
		if section="" or section="mainlist" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set cultureRs = Server.Createobject("Adodb.RecordSet")
		cultureSql = "Select * from culture order by id desc"
		cultureRs.Open cultureSql,conn,1,3
		
		if cultureRs.Eof then
		Response.Write("<center>Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">culture B&ouml;l&uuml;m&uuml;ndeki Tüm Kayýtlar Listelenmiþtir.<br />
			   Onaylanmamýþ Kayýtlar Ýçin <a href="admin.asp?cat=culture&section=uncheck_list"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image</strong></td>
					<td width="100"><strong>Category</strong></td>
					<td width="100"><strong>Title</strong></td>
					<td width="100"><strong>Tag 1</strong></td>
					<td width="100"><strong>Tag 2</strong></td>
					<td width="100"><strong>Tag 3</strong></td>
					<td width="100"><strong>Tag 4</strong></td>
					<td width="100"><strong>Tag 5</strong></td>
					<td width="100"><strong>Link</strong></td>
					<td width="100"><strong>Added By</strong></td>
					<td width="100"><strong>Added Date</strong></td>
					<td><strong>Check</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Onayla</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			cultureRs.PageSize=5
			cultureRs.Absolutepage=pg
			for i=1 to cultureRs.PageSize
			if cultureRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/culture/<%=cultureRs("img")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(cultureRs("category"))%></td>
					<td><%=Trim(cultureRs("title"))%></td>
					<td><%=Trim(cultureRs("tag1"))%></td>
					<td><%=Trim(cultureRs("tag2"))%></td>
					<td><%=Trim(cultureRs("tag3"))%></td>
					<td><%=Trim(cultureRs("tag4"))%></td>
					<td><%=Trim(cultureRs("tag5"))%></td>
					<td>
					<%link=Left(cultureRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=cultureRs("added_by")%></td>
					<td><%=cultureRs("added_date")%></td>
					<td><%=cultureRs("app")%></td>
					<td><a href="admin.asp?cat=culture&section=edit&id=<%=cultureRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=culture&section=app&id=<%=cultureRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=culture&section=del&id=<%=cultureRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			cultureRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to cultureRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=culture&section=mainlist&pg="&p&""">"&p&"</a> ")
			end if
			next
			cultureRs.Close
			Set cultureRs = Nothing
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
		
		Set culture_uncheckRs = Server.Createobject("Adodb.RecordSet")
		culture_uncheckSql = "Select * from culture where app=0 order by id desc"
		culture_uncheckRs.Open culture_uncheckSql,conn,1,3
		
		if culture_uncheckRs.Eof then
		Response.Write("<center>Onaylanmamýþ Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">culture B&ouml;l&uuml;m&uuml;ndeki Onaylanmamýþ Kayýtlar Listelenmiþtir. <br />Bütün Kayýtlar Ýçin <a href="admin.asp?cat=culture&section=mainlist"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image</strong></td>
					<td width="100"><strong>Category</strong></td>
					<td width="100"><strong>Title</strong></td>
					<td width="100"><strong>Tag 1</strong></td>
					<td width="100"><strong>Tag 2</strong></td>
					<td width="100"><strong>Tag 3</strong></td>
					<td width="100"><strong>Tag 4</strong></td>
					<td width="100"><strong>Tag 5</strong></td>
					<td width="100"><strong>Link</strong></td>
					<td width="100"><strong>Added By</strong></td>
					<td width="100"><strong>Added Date</strong></td>
					<td><strong>Check</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Onayla</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			culture_uncheckRs.PageSize=5
			culture_uncheckRs.Absolutepage=pg
			for i=1 to culture_uncheckRs.PageSize
			if culture_uncheckRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/culture/<%=culture_uncheckRs("img")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(culture_uncheckRs("category"))%></td>
					<td><%=Trim(culture_uncheckRs("title"))%></td>
					<td><%=Trim(culture_uncheckRs("tag1"))%></td>
					<td><%=Trim(culture_uncheckRs("tag1"))%></td>
					<td><%=Trim(culture_uncheckRs("tag1"))%></td>
					<td><%=Trim(culture_uncheckRs("tag1"))%></td>
					<td><%=Trim(culture_uncheckRs("tag1"))%></td>
					<td>
					<%link=Left(culture_uncheckRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=culture_uncheckRs("added_by")%></td>
					<td><%=culture_uncheckRs("added_date")%></td>
					<td><%=culture_uncheckRs("app")%></td>
					<td><a href="admin.asp?cat=culture&section=edit&id=<%=culture_uncheckRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=culture&section=app&id=<%=culture_uncheckRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=culture&section=del&id=<%=culture_uncheckRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			culture_uncheckRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to culture_uncheckRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=culture&section=uncheck_list&pg="&p&""">"&p&"</a> ")
			end if
			next
			culture_uncheckRs.Close
			Set culture_uncheckRs = Nothing
		end if
		%>
		</center>
		
		
		<%
		elseif section="edit" then
		id=security(Trim(Request.QueryString("id")))
		Set culture_editRs = Server.CreateObject("Adodb.RecordSet")
		culture_editSql = "Select * from culture where id='"&id&"'"
		culture_editRs.Open culture_editSql,conn,1,3
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="culture_edit" action="admin.asp?cat=culture&section=editreg&id=<%=culture_editRs("id")%>" method="post">
			  <tr>
				<td colspan="2" align="center"><img src="../images/culture/<%=culture_editRs("img")%>" /></td>
			  </tr>
			   <tr>
				<td width="100">Category : </td>
				<td><input type="text" name ="category" value="<%=culture_editRs("category")%>" /></td>
			  </tr>
			   <tr>
				<td width="100">Title : </td>
				<td><input type="text" name ="title" value="<%=culture_editRs("title")%>" /></td>
			  </tr>
			  <tr>
				<td>Tag 1 :</td>
				<td><input type="text" name ="tag1" value="<%=culture_editRs("tag1")%>" /></td>
			  </tr>
			  <tr>
				<td>Tag 2 :</td>
				<td><input type="text" name ="tag2" value="<%=culture_editRs("tag2")%>" /></td>
			  </tr>
			   <tr>
				<td>Tag 3 :</td>
				<td><input type="text" name ="tag3" value="<%=culture_editRs("tag3")%>" /></td>
			  </tr>
			  			  <tr>
				<td>Tag 4 :</td>
				<td><input type="text" name ="tag4" value="<%=culture_editRs("tag4")%>" /></td>
			  </tr>
			  			  <tr>
				<td>Tag 5 :</td>
				<td><input type="text" name ="tag5" value="<%=culture_editRs("tag5")%>" /></td>
			  </tr>
			  <tr>
				<td>Link :</td>
				<td><input type="text" name ="link" value="<%=culture_editRs("link")%>" /></td>
			  </tr>
			  <tr>
				<td>Added By :</td>
				<td><input type="text" name ="added_by" value="<%=culture_editRs("added_by")%>" /></td>
			  </tr>
			  <tr>
				<td>Added Date :</td>
				<td><input type="text" name ="added_date" value="<%=culture_editRs("added_date")%>" /></td>
			  </tr>
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Update"/></td>
			  </tr>
		  </form>
		</table>
		<%
		culture_editRs.Close
		Set culture_editRs = Nothing 
		%>
		<%
		elseif section="editreg" then
		id=security(Trim(Request.QueryString("id")))
		category=Trim(Request.Form("category"))
		title=Trim(Request.Form("title"))
		tag1=Trim(Request.Form("tag1"))
		tag2=Trim(Request.Form("tag2"))
		tag3=Trim(Request.Form("tag3"))
		tag4=Trim(Request.Form("tag4"))
		tag5=Trim(Request.Form("tag5"))
		link=Trim(Request.Form("link"))
		added_by=Trim(Request.Form("added_by"))
		added_date=Trim(Request.Form("added_date"))
		
		if category="" or title="" or tag1="" or tag2="" or tag3="" or tag4="" or tag5="" or link="" or added_by="" or added_date="" then
			Response.Write("<center>Lütfen Bütün Alanlarý Doldurunuz.</center>")
		elseif Len(category)>50 then	
			Response.Write ("Category Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(title)>50 then	
			Response.Write ("Title Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(tag1)>50 then	
			Response.Write ("Tag1 Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(tag2)>50 then	
			Response.Write ("Tag2 Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(tag3)>50 then	
			Response.Write ("Tag3 Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(tag4)>50 then	
			Response.Write ("Tag4 Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(tag5)>50 then	
			Response.Write ("Tag5 Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(link)>200 then	
			Response.Write ("Link Kýsmý 200 Karakterden Fazla Olamaz.")
		elseif Len(added_by)>50 then	
			Response.Write ("Added By Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(added_date)>50 then	
			Response.Write ("Added Date Kýsmý 50 Karakterden Fazla Olamaz.")
		else
		
			Set culture_regRs = Server.CreateObject("Adodb.RecordSet")
			culture_regSql = "Select * from culture where id='"&id&"'"
			culture_regRs.Open culture_regSql,conn,1,3
			
			culture_regRs("category")=category
			culture_regRs("title")=title
			culture_regRs("tag1")=tag1
			culture_regRs("tag2")=tag2
			culture_regRs("tag3")=tag3
			culture_regRs("tag4")=tag4
			culture_regRs("tag5")=tag5
			culture_regRs("link")=link
			culture_regRs("added_by")=added_by
			culture_regRs("added_date")=added_date
			culture_regRs.Update
			Response.Write("<center>Kayýt Güncellendi.</center>")
			culture_regRs.Close
			Set culture_regRs = Nothing
		end if	
		
			
		%>
		<%
		elseif section="app" then  '------------ Onay kýsmý yapýlýcak onay id eklenicek
		Set culture_appnoRs = Server.CreateObject("Adodb.RecordSet")
		culture_appnoSql = "Select * from culture where app=1 order by app_no"
		culture_appnoRs.Open culture_appnoSql,conn,1,3
		
		if culture_appnoRs.Eof then
		app_no=0
		else
		culture_appnoRs.MoveLast
		app_no=culture_appnoRs("app_no")
		end if
		id=Trim(Request.QueryString("id"))
		Set culture_appRs = Server.CreateObject("Adodb.RecordSet")
		culture_appSql = "Select * from culture where id='"&id&"'"
		culture_appRs.Open culture_appSql,conn,1,3
		if culture_appRs("app")=true then
			Response.Write("<center>Zaten Onaylanmýþ</center>")
		else
			culture_appRs("app_no")=app_no+1
			culture_appRs("app")=1
			culture_appRs.Update
			Response.Write("<center> Onaylandý.<br><a href="&Request.ServerVariables("HTTP_REFERER")&">[Geri]</a></center>")
		end if
		culture_appRs.Close
		Set culture_appRs = Nothing
		
		%>
		<%
		elseif section="del" then
		id=security(Trim(Request.QueryString("id")))
		Set culture_delFsoRs = Server.CreateObject("Adodb.RecordSet")
		culture_delFsoSql = "Select * from culture where id='"&id&"'"
		culture_delFsoRs.Open culture_delFsoSql,conn,1,3
		Set culture_delFso= Server.CreateObject("Scripting.FileSystemObject")
		culture_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\culture\"&culture_delFsoRs("img"))
		Set culture_delRs = Server.CreateObject("Adodb.RecordSet")
		culture_delSql = "Delete from culture where id='"&id&"'"
		culture_delRs.Open culture_delSql,conn,1,3
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		%>		
			
		<%end if%>
	<%
	else
		Response.Write("<center>Culture Bölümünde Yetkiniz Kisitli. </center>")
	end if
	%>	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>	
	