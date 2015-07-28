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
	if admRs("producer")=true or admRs("levell")>1  then
		section=Trim(Request.QueryString("section"))
		if section="" or section="mainlist" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set producerRs = Server.Createobject("Adodb.RecordSet")
		producerSql = "Select * from producer order by id desc"
		producerRs.Open producerSql,conn,1,3
		
		if producerRs.Eof then
		Response.Write("<center>Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">Producer B&ouml;l&uuml;m&uuml;ndeki Tüm Kayýtlar Listelenmiþtir.<br />
			   Onaylanmamýþ Kayýtlar Ýçin <a href="admin.asp?cat=producer&section=uncheck_list"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image 1</strong></td>
					<td><strong>Image 2</strong></td>
					<td><strong>Image 3</strong></td>
					<td><strong>Image 4</strong></td>
					<td width="100"><strong>Company</strong></td>
					<td width="150"><strong>Sector</strong></td>
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
			producerRs.PageSize=5
			producerRs.Absolutepage=pg
			for i=1 to producerRs.PageSize
			if producerRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/producer/<%=producerRs("img1")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/producer/<%=producerRs("img2")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/producer/<%=producerRs("img3")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/producer/<%=producerRs("img4")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(producerRs("company"))%></td>
					<td><%=Trim(producerRs("sector"))%></td>
					<td><%=Trim(producerRs("country"))%></td>
					<td>
					<%link=Left(producerRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=Trim(producerRs("added_by"))%></td>
					<td><%=Trim(producerRs("added_date"))%></td>
					<td><%=producerRs("app")%></td>
					<td><a href="admin.asp?cat=producer&section=edit&id=<%=producerRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=producer&section=app&id=<%=producerRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=producer&section=del&id=<%=producerRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			producerRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to producerRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=producer&section=mainlist&pg="&p&""">"&p&"</a> ")
			end if
			next
			producerRs.Close
			Set producerRs = Nothing
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
		
		Set producer_uncheckRs = Server.Createobject("Adodb.RecordSet")
		producer_uncheckSql = "Select * from producer where app=0 order by id desc"
		producer_uncheckRs.Open producer_uncheckSql,conn,1,3
		
		if producer_uncheckRs.Eof then
		Response.Write("<center>Onaylanmamýþ Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">producer B&ouml;l&uuml;m&uuml;ndeki Onaylanmamýþ Kayýtlar Listelenmiþtir. <br />Bütün Kayýtlar Ýçin <a href="admin.asp?cat=producer&section=mainlist"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td><strong>Image 1</strong></td>
					<td><strong>Image 2</strong></td>
					<td><strong>Image 3</strong></td>
					<td><strong>Image 4</strong></td>
					<td width="100"><strong>Company</strong></td>
					<td width="150"><strong>Sector</strong></td>
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
			producer_uncheckRs.PageSize=5
			producer_uncheckRs.Absolutepage=pg
			for i=1 to producer_uncheckRs.PageSize
			if producer_uncheckRs.Eof then exit for
			%>
				<tr>
					<td><img src="../images/producer/<%=producer_uncheckRs("img1")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/producer/<%=producer_uncheckRs("img2")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/producer/<%=producer_uncheckRs("img3")%>"  border="0" width="59" height="59"/></td>
					<td><img src="../images/producer/<%=producer_uncheckRs("img4")%>"  border="0" width="59" height="59"/></td>
					<td><%=Trim(producer_uncheckRs("company"))%></td>
					<td><%=Trim(producer_uncheckRs("sector"))%></td>
					<td><%=Trim(producer_uncheckRs("country"))%></td>
					<td>
					<%link=Left(producer_uncheckRs("link"),20)
					Response.Write("<a href="&link&">"&link&"...</a>")%></td>
					<td><%=Trim(producer_uncheckRs("added_by"))%></td>
					<td><%=Trim(producer_uncheckRs("added_date"))%></td>
					<td><%=producer_uncheckRs("app")%></td>
					<td><a href="admin.asp?cat=producer&section=edit&id=<%=producer_uncheckRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=producer&section=app&id=<%=producer_uncheckRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=producer&section=del&id=<%=producer_uncheckRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			producer_uncheckRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to producer_uncheckRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=producer&section=uncheck_list&pg="&p&""">"&p&"</a> ")
			end if
			next
			producer_uncheckRs.Close
			Set producer_uncheckRs = Nothing
		end if
		%>
		</center>
		
		
		<%
		elseif section="edit" then
		id=security(Trim(Request.QueryString("id")))
		Set producer_editRs = Server.CreateObject("Adodb.RecordSet")
		producer_editSql = "Select * from producer where id='"&id&"'"
		producer_editRs.Open producer_editSql,conn,1,3
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="producer_edit" action="admin.asp?cat=producer&section=editreg&id=<%=producer_editRs("id")%>" method="post">
			  <tr>
				<td align="center"><img src="../images/producer/<%=producer_editRs("img1")%>" /></td>
				<td align="center"><img src="../images/producer/<%=producer_editRs("img2")%>" /></td>
			  </tr>
			  <tr>
				<td align="center"><img src="../images/producer/<%=producer_editRs("img3")%>" /></td>
				<td align="center"><img src="../images/producer/<%=producer_editRs("img4")%>" /></td>
			  </tr>
			  <tr>
				<td width="100">Company : </td>
				<td><input type="text" name ="company" value="<%=producer_editRs("company")%>" /></td>
			  </tr>
			  <tr>
				<td>Sector :</td>
				<td><input type="text" name ="sector" value="<%=producer_editRs("sector")%>" /></td>
			  </tr>
			  <tr>
				<td>Country :</td>
				<td><input type="text" name ="country" value="<%=producer_editRs("country")%>" /></td>
			  </tr>
			  <tr>
				<td>Link :</td>
				<td><input type="text" name ="link" value="<%=producer_editRs("link")%>" /></td>
			  </tr>
			  <tr>
				<td>Added By :</td>
				<td><input type="text" name ="added_by" value="<%=producer_editRs("added_by")%>" /></td>
			  </tr>
			  <tr>
				<td>Added Date :</td>
				<td><input type="text" name ="added_date" value="<%=producer_editRs("added_date")%>" /></td>
			  </tr>
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Update"/></td>
			  </tr>
		  </form>
		</table>
		<%
		producer_editRs.Close
		Set producer_editRs = Nothing 
		%>
		<%
		elseif section="editreg" then
		id=security(Trim(Request.QueryString("id")))
		company=Trim(Request.Form("company"))
		sector=Trim(Request.Form("sector"))
		country=Trim(Request.Form("country"))
		link=Trim(Request.Form("link"))
		added_by=Trim(Request.Form("added_by"))
		added_date=Trim(Request.Form("added_date"))
		
		if company="" or sector="" or country="" or link="" or added_by="" or added_date=""  then
			Response.Write("<center>Lütfen Bütün Alanlarý Doldurunuz.</center>")
		elseif Len(company)>200 then	
			Response.Write ("Company Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(sector)>200 then	
			Response.Write ("Sector Kýsmý 200 Karakterden Fazla Olamaz.")
		elseif Len(country)>500 then	
			Response.Write ("Country Kýsmý 500 Karakterden Fazla Olamaz..")
		elseif Len(link)>200 then	
			Response.Write ("Link Kýsmý 200 Karakterden Fazla Olamaz.")
		elseif Len(added_by)>50 then	
			Response.Write ("Added By Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(added_date)>50 then	
			Response.Write ("Added Date Kýsmý 50 Karakterden Fazla Olamaz.")
		else
			
			Set producer_regRs = Server.CreateObject("Adodb.RecordSet")
			producer_regSql = "Select * from producer where id='"&id&"'"
			producer_regRs.Open producer_regSql,conn,1,3
			
			producer_regRs("company")=company
			producer_regRs("sector")=sector
			producer_regRs("country")=country
			producer_regRs("link")=link
			producer_regRs("added_by")=added_by
			producer_regRs("added_date")=added_date
			producer_regRs.Update
			Response.Write("<center>Kayýt Güncellendi.</center>")
			producer_regRs.Close
			Set producer_regRs = Nothing
		end if
		
			
		%>
		<%
		elseif section="app" then  '------------ Onay kýsmý yapýlýcak onay id eklenicek
		Set producer_appnoRs = Server.CreateObject("Adodb.RecordSet")
		producer_appnoSql = "Select * from producer where app=1 order by app_no"
		producer_appnoRs.Open producer_appnoSql,conn,1,3
		
		if producer_appnoRs.Eof then
		app_no=0
		else
		producer_appnoRs.MoveLast
		app_no=producer_appnoRs("app_no")
		end if
		id=Trim(Request.QueryString("id"))
		Set producer_appRs = Server.CreateObject("Adodb.RecordSet")
		producer_appSql = "Select * from producer where id='"&id&"'"
		producer_appRs.Open producer_appSql,conn,1,3
		if producer_appRs("app")=true then
			Response.Write("<center>Zaten Onaylanmýþ</center>")
		else
			producer_appRs("app_no")=app_no+1
			producer_appRs("app")=1
			producer_appRs.Update
			Response.Write("<center> Onaylandý.<br><a href="&Request.ServerVariables("HTTP_REFERER")&">[Geri]</a></center>")
		end if
		producer_appRs.Close
		Set producer_appRs = Nothing
		
		%>
		<%
		elseif section="del" then
		id=security(Trim(Request.QueryString("id")))
		Set producer_delFsoRs = Server.CreateObject("Adodb.RecordSet")
		producer_delFsoSql = "Select * from producer where id='"&id&"'"
		producer_delFsoRs.Open producer_delFsoSql,conn,1,3
		Set producer_delFso= Server.CreateObject("Scripting.FileSystemObject")
		producer_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\producer\"&producer_delFsoRs("img1"))
		producer_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\producer\"&producer_delFsoRs("img2"))
		producer_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\producer\"&producer_delFsoRs("img3"))
		producer_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"images\producer\"&producer_delFsoRs("img4"))
		Set producer_delRs = Server.CreateObject("Adodb.RecordSet")
		producer_delSql = "Delete from producer where id='"&id&"'"
		producer_delRs.Open producer_delSql,conn,1,3
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		%>		
			
		<%end if%>
	<%
	else
		Response.Write("<center>Producer Bölümünde Yetkiniz Kisitli. </center>")
	end if
	%>	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>	
	