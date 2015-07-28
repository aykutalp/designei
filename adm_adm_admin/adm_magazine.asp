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
	if admRs("magazine")=true or admRs("levell")>1  then
		section=Trim(Request.QueryString("section"))
		if section="" or section="mainlist" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set magazineRs = Server.Createobject("Adodb.RecordSet")
		magazineSql = "Select * from magazine order by id desc"
		magazineRs.Open magazineSql,conn,1,3
		
		if magazineRs.Eof then
		Response.Write("<center>Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">magazine B&ouml;l&uuml;m&uuml;ndeki Tüm Kayýtlar Listelenmiþtir.<br />
			   Onaylanmamýþ Kayýtlar Ýçin <a href="admin.asp?cat=magazine&section=uncheck_list"> Buraya</a> Týklayýnýz.</p>
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
			magazineRs.PageSize=5
			magazineRs.Absolutepage=pg
			for i=1 to magazineRs.PageSize
			if magazineRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/magazine/<%=magazineRs("img")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(magazineRs("category"))%></td>
					<td><%=Trim(magazineRs("title"))%></td>
					<td><%=Trim(magazineRs("tag1"))%></td>
					<td><%=Trim(magazineRs("tag2"))%></td>
					<td><%=Trim(magazineRs("tag3"))%></td>
					<td><%=Trim(magazineRs("tag4"))%></td>
					<td><%=Trim(magazineRs("tag5"))%></td>
					<td>
					<%link=Left(magazineRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=magazineRs("added_by")%></td>
					<td><%=magazineRs("added_date")%></td>
					<td><%=magazineRs("app")%></td>
					<td><a href="admin.asp?cat=magazine&section=edit&id=<%=magazineRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=magazine&section=app&id=<%=magazineRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=magazine&section=del&id=<%=magazineRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			magazineRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to magazineRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=magazine&section=mainlist&pg="&p&""">"&p&"</a> ")
			end if
			next
			magazineRs.Close
			Set magazineRs = Nothing
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
		
		Set magazine_uncheckRs = Server.Createobject("Adodb.RecordSet")
		magazine_uncheckSql = "Select * from magazine where app=0 order by id desc"
		magazine_uncheckRs.Open magazine_uncheckSql,conn,1,3
		
		if magazine_uncheckRs.Eof then
		Response.Write("<center>Onaylanmamýþ Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">magazine B&ouml;l&uuml;m&uuml;ndeki Onaylanmamýþ Kayýtlar Listelenmiþtir. <br />Bütün Kayýtlar Ýçin <a href="admin.asp?cat=magazine&section=mainlist"> Buraya</a> Týklayýnýz.</p>
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
			magazine_uncheckRs.PageSize=5
			magazine_uncheckRs.Absolutepage=pg
			for i=1 to magazine_uncheckRs.PageSize
			if magazine_uncheckRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/magazine/<%=magazine_uncheckRs("img")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(magazine_uncheckRs("category"))%></td>
					<td><%=Trim(magazine_uncheckRs("title"))%></td>
					<td><%=Trim(magazine_uncheckRs("tag1"))%></td>
					<td><%=Trim(magazine_uncheckRs("tag1"))%></td>
					<td><%=Trim(magazine_uncheckRs("tag1"))%></td>
					<td><%=Trim(magazine_uncheckRs("tag1"))%></td>
					<td><%=Trim(magazine_uncheckRs("tag1"))%></td>
					<td>
					<%link=Left(magazine_uncheckRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=magazine_uncheckRs("added_by")%></td>
					<td><%=magazine_uncheckRs("added_date")%></td>
					<td><%=magazine_uncheckRs("app")%></td>
					<td><a href="admin.asp?cat=magazine&section=edit&id=<%=magazine_uncheckRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=magazine&section=app&id=<%=magazine_uncheckRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=magazine&section=del&id=<%=magazine_uncheckRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			magazine_uncheckRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to magazine_uncheckRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=magazine&section=uncheck_list&pg="&p&""">"&p&"</a> ")
			end if
			next
			magazine_uncheckRs.Close
			Set magazine_uncheckRs = Nothing
		end if
		%>
		</center>
		
		
		<%
		elseif section="edit" then
		id=security(Trim(Request.QueryString("id")))
		Set magazine_editRs = Server.CreateObject("Adodb.RecordSet")
		magazine_editSql = "Select * from magazine where id='"&id&"'"
		magazine_editRs.Open magazine_editSql,conn,1,3
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="magazine_edit" action="admin.asp?cat=magazine&section=editreg&id=<%=magazine_editRs("id")%>" method="post">
			  <tr>
				<td colspan="2" align="center"><img src="../images/magazine/<%=magazine_editRs("img")%>" /></td>
			  </tr>
			   <tr>
				<td width="100">Category : </td>
				<td><input type="text" name ="category" value="<%=magazine_editRs("category")%>" /></td>
			  </tr>
			  <tr>
				<td width="100">Title : </td>
				<td><input type="text" name ="title" value="<%=magazine_editRs("title")%>" /></td>
			  </tr>
			  <tr>
				<td>Tag 1 :</td>
				<td><input type="text" name ="tag1" value="<%=magazine_editRs("tag1")%>" /></td>
			  </tr>
			  <tr>
				<td>Tag 2 :</td>
				<td><input type="text" name ="tag2" value="<%=magazine_editRs("tag2")%>" /></td>
			  </tr>
			   <tr>
				<td>Tag 3 :</td>
				<td><input type="text" name ="tag3" value="<%=magazine_editRs("tag3")%>" /></td>
			  </tr>
			  			  <tr>
				<td>Tag 4 :</td>
				<td><input type="text" name ="tag4" value="<%=magazine_editRs("tag4")%>" /></td>
			  </tr>
			  			  <tr>
				<td>Tag 5 :</td>
				<td><input type="text" name ="tag5" value="<%=magazine_editRs("tag5")%>" /></td>
			  </tr>
			  <tr>
				<td>Link :</td>
				<td><input type="text" name ="link" value="<%=magazine_editRs("link")%>" /></td>
			  </tr>
			  <tr>
				<td>Added By :</td>
				<td><input type="text" name ="added_by" value="<%=magazine_editRs("added_by")%>" /></td>
			  </tr>
			   <tr>
				<td>Added Date :</td>
				<td><input type="text" name ="added_date" value="<%=magazine_editRs("added_date")%>" /></td>
			  </tr>
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Update"/></td>
			  </tr>
		  </form>
		</table>
		<%
		magazine_editRs.Close
		Set magazine_editRs = Nothing 
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
		
			Set magazine_regRs = Server.CreateObject("Adodb.RecordSet")
			magazine_regSql = "Select * from magazine where id='"&id&"'"
			magazine_regRs.Open magazine_regSql,conn,1,3
			
			magazine_regRs("category")=category
			magazine_regRs("title")=title
			magazine_regRs("tag1")=tag1
			magazine_regRs("tag2")=tag2
			magazine_regRs("tag3")=tag3
			magazine_regRs("tag4")=tag4
			magazine_regRs("tag5")=tag5
			magazine_regRs("link")=link
			magazine_regRs("added_by")=added_by
			magazine_regRs("added_date")=added_date
			magazine_regRs.Update
			Response.Write("<center>Kayýt Güncellendi.</center>")
			magazine_regRs.Close
			Set magazine_regRs = Nothing
		end if	
		
			
		%>
		<%
		elseif section="app" then  '------------ Onay kýsmý yapýlýcak onay id eklenicek
		Set magazine_appnoRs = Server.CreateObject("Adodb.RecordSet")
		magazine_appnoSql = "Select * from magazine where app=1 order by app_no"
		magazine_appnoRs.Open magazine_appnoSql,conn,1,3
		
		if magazine_appnoRs.Eof then
		app_no=0
		else
		magazine_appnoRs.MoveLast
		app_no=magazine_appnoRs("app_no")
		end if
		id=Trim(Request.QueryString("id"))
		Set magazine_appRs = Server.CreateObject("Adodb.RecordSet")
		magazine_appSql = "Select * from magazine where id='"&id&"'"
		magazine_appRs.Open magazine_appSql,conn,1,3
		if magazine_appRs("app")=true then
			Response.Write("<center>Zaten Onaylanmýþ</center>")
		else
			magazine_appRs("app_no")=app_no+1
			magazine_appRs("app")=1
			magazine_appRs.Update
			Response.Write("<center> Onaylandý.<br><a href="&Request.ServerVariables("HTTP_REFERER")&">[Geri]</a></center>")
		end if
		magazine_appRs.Close
		Set magazine_appRs = Nothing
		
		%>
		<%
		elseif section="del" then
		id=security(Trim(Request.QueryString("id")))
		Set magazine_delFsoRs = Server.CreateObject("Adodb.RecordSet")
		magazine_delFsoSql = "Select * from magazine where id='"&id&"'"
		magazine_delFsoRs.Open magazine_delFsoSql,conn,1,3
		Set magazine_delFso= Server.CreateObject("Scripting.FileSystemObject")
		magazine_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\magazine\"&magazine_delFsoRs("img"))
		Set magazine_delRs = Server.CreateObject("Adodb.RecordSet")
		magazine_delSql = "Delete from magazine where id='"&id&"'"
		magazine_delRs.Open magazine_delSql,conn,1,3
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		%>		
			
		<%end if%>
	<%
	else
		Response.Write("<center>Magazine Bölümünde Yetkiniz Kisitli. </center>")
	end if
	%>	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>	
	