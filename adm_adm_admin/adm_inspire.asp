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
	if admRs("inspire")=true or admRs("levell")>1  then
		section=Trim(Request.QueryString("section"))
		if section="" or section="mainlist" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set inspireRs = Server.Createobject("Adodb.RecordSet")
		inspireSql = "Select * from inspire order by id desc"
		inspireRs.Open inspireSql,conn,1,3
		
		if inspireRs.Eof then
		Response.Write("<center>Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">Inspire B&ouml;l&uuml;m&uuml;ndeki Tüm Kayýtlar Listelenmiþtir.<br />
			   Onaylanmamýþ Kayýtlar Ýçin <a href="admin.asp?cat=inspire&section=uncheck_list"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image</strong></td>
					<td width="100"><strong>Title</strong></td>
					<td width="100"><strong>Tag 1</strong></td>
					<td width="100"><strong>Tag 2</strong></td>
					<td width="100"><strong>Tag 3</strong></td>
					<td width="100"><strong>Tag 4</strong></td>
					<td width="100"><strong>Tag 5</strong></td>
					<td width="100"><strong>Added By</strong></td>
					<td width="100"><strong>Added Date</strong></td>
					<td><strong>Check</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Onayla</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			inspireRs.PageSize=5
			inspireRs.Absolutepage=pg
			for i=1 to inspireRs.PageSize
			if inspireRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/inspire/<%=inspireRs("img")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(inspireRs("title"))%></td>
					<td><%=Trim(inspireRs("tag1"))%></td>
					<td><%=Trim(inspireRs("tag2"))%></td>
					<td><%=Trim(inspireRs("tag3"))%></td>
					<td><%=Trim(inspireRs("tag4"))%></td>
					<td><%=Trim(inspireRs("tag5"))%></td>
					<td><%=inspireRs("added_by")%></td>
					<td><%=inspireRs("added_date")%></td>
					<td><%=inspireRs("app")%></td>
					<td><a href="admin.asp?cat=inspire&section=edit&id=<%=inspireRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=inspire&section=app&id=<%=inspireRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=inspire&section=del&id=<%=inspireRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			inspireRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to inspireRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=inspire&section=mainlist&pg="&p&""">"&p&"</a> ")
			end if
			next
			inspireRs.Close
			Set inspireRs = Nothing
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
		
		Set inspire_uncheckRs = Server.Createobject("Adodb.RecordSet")
		inspire_uncheckSql = "Select * from inspire where app=0 order by id desc"
		inspire_uncheckRs.Open inspire_uncheckSql,conn,1,3
		
		if inspire_uncheckRs.Eof then
		Response.Write("<center>Onaylanmamýþ Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">Inspire B&ouml;l&uuml;m&uuml;ndeki Onaylanmamýþ Kayýtlar Listelenmiþtir. <br />Bütün Kayýtlar Ýçin <a href="admin.asp?cat=inspire&section=mainlist"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image</strong></td>
					<td width="100"><strong>Title</strong></td>
					<td width="100"><strong>Tag 1</strong></td>
					<td width="100"><strong>Tag 2</strong></td>
					<td width="100"><strong>Tag 3</strong></td>
					<td width="100"><strong>Tag 4</strong></td>
					<td width="100"><strong>Tag 5</strong></td>
					<td width="100"><strong>Added By</strong></td>
					<td width="100"><strong>Added Date</strong></td>
					<td><strong>Check</strong></td>
					<td><strong>Düzenle</strong></td>
					<td><strong>Onayla</strong></td>
					<td><strong>Sil</strong></td>
				</tr>
			<%
			inspire_uncheckRs.PageSize=5
			inspire_uncheckRs.Absolutepage=pg
			for i=1 to inspire_uncheckRs.PageSize
			if inspire_uncheckRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/inspire/<%=inspire_uncheckRs("img")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(inspire_uncheckRs("title"))%></td>
					<td><%=Trim(inspire_uncheckRs("tag1"))%></td>
					<td><%=Trim(inspire_uncheckRs("tag1"))%></td>
					<td><%=Trim(inspire_uncheckRs("tag1"))%></td>
					<td><%=Trim(inspire_uncheckRs("tag1"))%></td>
					<td><%=Trim(inspire_uncheckRs("tag1"))%></td>
					<td><%=inspire_uncheckRs("added_by")%></td>
					<td><%=inspire_uncheckRs("added_date")%></td>
					<td><%=inspire_uncheckRs("app")%></td>
					<td><a href="admin.asp?cat=inspire&section=edit&id=<%=inspire_uncheckRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=inspire&section=app&id=<%=inspire_uncheckRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=inspire&section=del&id=<%=inspire_uncheckRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			inspire_uncheckRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to inspire_uncheckRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=inspire&section=uncheck_list&pg="&p&""">"&p&"</a> ")
			end if
			next
			inspire_uncheckRs.Close
			Set inspire_uncheckRs = Nothing
		end if
		%>
		</center>
		
		
		<%
		elseif section="edit" then
		id=security(Trim(Request.QueryString("id")))
		Set inspire_editRs = Server.CreateObject("Adodb.RecordSet")
		inspire_editSql = "Select * from inspire where id='"&id&"'"
		inspire_editRs.Open inspire_editSql,conn,1,3
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="inspire_edit" action="admin.asp?cat=inspire&section=editreg&id=<%=inspire_editRs("id")%>" method="post">
			  <tr>
				<td colspan="2" align="center"><img src="../images/inspire/<%=inspire_editRs("img")%>" /></td>
			  </tr>
			  <tr>
				<td width="100">Title : </td>
				<td><input type="text" name ="title" value="<%=inspire_editRs("title")%>" /></td>
			  </tr>
			  <tr>
				<td>Tag 1 :</td>
				<td><input type="text" name ="tag1" value="<%=inspire_editRs("tag1")%>" /></td>
			  </tr>
			  <tr>
				<td>Tag 2 :</td>
				<td><input type="text" name ="tag2" value="<%=inspire_editRs("tag2")%>" /></td>
			  </tr>
			   <tr>
				<td>Tag 3 :</td>
				<td><input type="text" name ="tag3" value="<%=inspire_editRs("tag3")%>" /></td>
			  </tr>
			  			  <tr>
				<td>Tag 4 :</td>
				<td><input type="text" name ="tag4" value="<%=inspire_editRs("tag4")%>" /></td>
			  </tr>
			  			  <tr>
				<td>Tag 5 :</td>
				<td><input type="text" name ="tag5" value="<%=inspire_editRs("tag5")%>" /></td>
			  </tr>
			  <tr>
				<td>Added By :</td>
				<td><input type="text" name ="added_by" value="<%=inspire_editRs("added_by")%>" /></td>
			  </tr>
			  <tr>
				<td>Added Date :</td>
				<td><input type="text" name ="added_date" value="<%=inspire_editRs("added_date")%>" /></td>
			  </tr>
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Update"/></td>
			  </tr>
		  </form>
		</table>
		<%
		inspire_editRs.Close
		Set inspire_editRs = Nothing 
		%>
		<%
		elseif section="editreg" then
		id=security(Trim(Request.QueryString("id")))
		title=Trim(Request.Form("title"))
		tag1=Trim(Request.Form("tag1"))
		tag2=Trim(Request.Form("tag2"))
		tag3=Trim(Request.Form("tag3"))
		tag4=Trim(Request.Form("tag4"))
		tag5=Trim(Request.Form("tag5"))
		added_by=Trim(Request.Form("added_by"))
		added_date=Trim(Request.Form("added_date"))
		
		if title="" or tag1="" or tag2="" or tag3="" or tag4="" or tag5="" or added_by="" or added_date="" then
			Response.Write("<center>Lütfen Bütün Alanlarý Doldurunuz.</center>")
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
		elseif Len(added_by)>50 then	
			Response.Write ("Added By Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(added_date)>50 then	
			Response.Write ("Added Date Kýsmý 50 Karakterden Fazla Olamaz.")
		else
		
			Set inspire_regRs = Server.CreateObject("Adodb.RecordSet")
			inspire_regSql = "Select * from inspire where id='"&id&"'"
			inspire_regRs.Open inspire_regSql,conn,1,3
			
			inspire_regRs("title")=title
			inspire_regRs("tag1")=tag1
			inspire_regRs("tag2")=tag2
			inspire_regRs("tag3")=tag3
			inspire_regRs("tag4")=tag4
			inspire_regRs("tag5")=tag5
			inspire_regRs("added_by")=added_by
			inspire_regRs("added_date")=added_date
			inspire_regRs.Update
			Response.Write("<center>Kayýt Güncellendi.</center>")
			inspire_regRs.Close
			Set inspire_regRs = Nothing
		end if	
		
			
		%>
		<%
		elseif section="app" then  '------------ Onay kýsmý yapýlýcak onay id eklenicek
		Set inspire_appnoRs = Server.CreateObject("Adodb.RecordSet")
		inspire_appnoSql = "Select * from inspire where app=1 order by app_no"
		inspire_appnoRs.Open inspire_appnoSql,conn,1,3
		
		if inspire_appnoRs.Eof then
		app_no=0
		else
		inspire_appnoRs.MoveLast
		app_no=inspire_appnoRs("app_no")
		end if
		id=Trim(Request.QueryString("id"))
		Set inspire_appRs = Server.CreateObject("Adodb.RecordSet")
		inspire_appSql = "Select * from inspire where id='"&id&"'"
		inspire_appRs.Open inspire_appSql,conn,1,3
		if inspire_appRs("app")=true then
			Response.Write("<center>Zaten Onaylanmýþ</center>")
		else
			inspire_appRs("app_no")=app_no+1
			inspire_appRs("app")=1
			inspire_appRs.Update
			Response.Write("<center> Onaylandý.<br><a href="&Request.ServerVariables("HTTP_REFERER")&">[Geri]</a></center>")
		end if
		inspire_appRs.Close
		Set inspire_appRs = Nothing
		
		%>
		<%
		elseif section="del" then
		id=security(Trim(Request.QueryString("id")))
		Set inspire_delFsoRs = Server.CreateObject("Adodb.RecordSet")
		inspire_delFsoSql = "Select * from inspire where id='"&id&"'"
		inspire_delFsoRs.Open inspire_delFsoSql,conn,1,3
		Set inspire_delFso= Server.CreateObject("Scripting.FileSystemObject")
		inspire_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\inspire\"&inspire_delFsoRs("img"))
		Set inspire_delRs = Server.CreateObject("Adodb.RecordSet")
		inspire_delSql = "Delete from inspire where id='"&id&"'"
		inspire_delRs.Open inspire_delSql,conn,1,3
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		%>		
			
		<%end if%>
	<%
	else
		Response.Write("<center>Inspire Bölümünde Yetkiniz Kisitli. </center>")
	end if
	%>	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>	
	