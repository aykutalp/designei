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
	if admRs("video")=true or admRs("levell")>1  then
		section=Trim(Request.QueryString("section"))
		if section="" or section="mainlist" then
		
		if Request.QueryString("pg")="" then
			pg=1
		else
			pg=CInt(Request.QueryString("pg"))
		end if
		
		Set videoRs = Server.Createobject("Adodb.RecordSet")
		videoSql = "Select * from video order by id desc"
		videoRs.Open videoSql,conn,1,3
		
		if videoRs.Eof then
		Response.Write("<center>Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">video B&ouml;l&uuml;m&uuml;ndeki Tüm Kayýtlar Listelenmiþtir.<br />
			   Onaylanmamýþ Kayýtlar Ýçin <a href="admin.asp?cat=video&section=uncheck_list"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td width="100"><strong>Category</strong></td>
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
			videoRs.PageSize=5
			videoRs.Absolutepage=pg
			for i=1 to videoRs.PageSize
			if videoRs.Eof then exit for
			%>
				<tr>
					<td><%=Trim(videoRs("category"))%></td>
					<td><%=Trim(videoRs("title"))%></td>
					<td><%=Trim(videoRs("tag1"))%></td>
					<td><%=Trim(videoRs("tag2"))%></td>
					<td><%=Trim(videoRs("tag3"))%></td>
					<td><%=Trim(videoRs("tag4"))%></td>
					<td><%=Trim(videoRs("tag5"))%></td>
					<td><%=videoRs("added_by")%></td>
					<td><%=videoRs("added_date")%></td>
					<td><%=videoRs("app")%></td>
					<td><a href="admin.asp?cat=video&section=edit&id=<%=videoRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=video&section=app&id=<%=videoRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=video&section=del&id=<%=videoRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			videoRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to videoRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=video&section=mainlist&pg="&p&""">"&p&"</a> ")
			end if
			next
			videoRs.Close
			Set videoRs = Nothing
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
		
		Set video_uncheckRs = Server.Createobject("Adodb.RecordSet")
		video_uncheckSql = "Select * from video where app=0 order by id desc"
		video_uncheckRs.Open video_uncheckSql,conn,1,3
		
		if video_uncheckRs.Eof then
		Response.Write("<center>Onaylanmamýþ Kayýt Bulunamadý.</center>")
		else
		%>
			<p align="center">video B&ouml;l&uuml;m&uuml;ndeki Onaylanmamýþ Kayýtlar Listelenmiþtir. <br />Bütün Kayýtlar Ýçin <a href="admin.asp?cat=video&section=mainlist"> Buraya</a> Týklayýnýz.</p>
			<table border="1"  cellpadding="2" cellspacing="0" align="center">
				<tr align="center">
					<td width="100"><strong>Category</strong></td>
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
			video_uncheckRs.PageSize=5
			video_uncheckRs.Absolutepage=pg
			for i=1 to video_uncheckRs.PageSize
			if video_uncheckRs.Eof then exit for
			%>
				<tr>
					<td><%=Trim(video_uncheckRs("category"))%></td>
					<td><%=Trim(video_uncheckRs("title"))%></td>
					<td><%=Trim(video_uncheckRs("tag1"))%></td>
					<td><%=Trim(video_uncheckRs("tag2"))%></td>
					<td><%=Trim(video_uncheckRs("tag3"))%></td>
					<td><%=Trim(video_uncheckRs("tag4"))%></td>
					<td><%=Trim(video_uncheckRs("tag5"))%></td>
					<td><%=video_uncheckRs("added_by")%></td>
					<td><%=video_uncheckRs("added_date")%></td>
					<td><%=video_uncheckRs("app")%></td>
					<td><a href="admin.asp?cat=video&section=edit&id=<%=video_uncheckRs("id")%>">Düzenle</a></td>
					<td><a href="admin.asp?cat=video&section=app&id=<%=video_uncheckRs("id")%>">Onayla</a></td>
					<td><a href="admin.asp?cat=video&section=del&id=<%=video_uncheckRs("id")%>" onClick="return confirm('Bu Kaydý Silmek Ýstediðinden Eminmisin ?!')">Sil</a></td>
				</tr>
			<%
			video_uncheckRs.MoveNext
			next
			%>
			</table>
			<center>
			<%
			for p=1 to video_uncheckRs.PageCount
			if p=pg then
				Response.Write("<b>"&p&" </b>")
			else
				Response.Write("<a href=""admin.asp?cat=video&section=uncheck_list&pg="&p&""">"&p&"</a> ")
			end if
			next
			video_uncheckRs.Close
			Set video_uncheckRs = Nothing
		end if
		%>
		</center>
		
		
		<%
		elseif section="edit" then
		id=security(Trim(Request.QueryString("id")))
		Set video_editRs = Server.CreateObject("Adodb.RecordSet")
		video_editSql = "Select * from video where id='"&id&"'"
		video_editRs.Open video_editSql,conn,1,3
		%>
		<table border="1" cellpadding="2" cellspacing="0" align="center" >
			<form name="video_edit" action="admin.asp?cat=video&section=editreg&id=<%=video_editRs("id")%>" method="post">
			  <tr>
				<td colspan="2" align="center">
				<div id="container">
				<a href="http://www.macromedia.com/go/getflashplayer">Get the Flash Player</a> to see this player.
				</div>         
				<script type="text/javascript" src="../video/swfobject.js"></script>         
				<script type="text/javascript">var s1 = new SWFObject("../video/player.swf","ply","237","237","9","#FFFFFF");
					s1.addParam("allowfullscreen","true");
					s1.addParam("allowscriptaccess","always");         
					s1.addParam("flashvars","file=../video/upload/<%=video_editRs("video")%>&image=preview.jpg");
					s1.write("container");
				</script>
				</td>
			  </tr>
			   <tr>
				<td width="100">Category : </td>
				<td><input type="text" name ="category" value="<%=video_editRs("category")%>" /></td>
			  </tr>
			  <tr>
				<td width="100">Title : </td>
				<td><input type="text" name ="title" value="<%=video_editRs("title")%>" /></td>
			  </tr>
			  <tr>
				<td>Tag 1 :</td>
				<td><input type="text" name ="tag1" value="<%=video_editRs("tag1")%>" /></td>
			  </tr>
			  <tr>
				<td>Tag 2 :</td>
				<td><input type="text" name ="tag2" value="<%=video_editRs("tag2")%>" /></td>
			  </tr>
			   <tr>
				<td>Tag 3 :</td>
				<td><input type="text" name ="tag3" value="<%=video_editRs("tag3")%>" /></td>
			  </tr>
			  			  <tr>
				<td>Tag 4 :</td>
				<td><input type="text" name ="tag4" value="<%=video_editRs("tag4")%>" /></td>
			  </tr>
			  			  <tr>
				<td>Tag 5 :</td>
				<td><input type="text" name ="tag5" value="<%=video_editRs("tag5")%>" /></td>
			  </tr>
			  <tr>
				<td>Added By :</td>
				<td><input type="text" name ="added_by" value="<%=video_editRs("added_by")%>" /></td>
			  </tr>
			   <tr>
				<td>Added Date :</td>
				<td><input type="text" name ="added_date" value="<%=video_editRs("added_date")%>" /></td>
			  </tr>
			  <tr>
				<td colspan="2" align="center"><input type="submit" value="Update"/></td>
			  </tr>
		  </form>
		</table>
		<%
		video_editRs.Close
		Set video_editRs = Nothing 
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
		added_by=Trim(Request.Form("added_by"))
		added_date=Trim(Request.Form("added_date"))
		
		if category="" or title="" or tag1="" or tag2="" or tag3="" or tag4="" or tag5="" or added_by="" or added_date="" then
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
		elseif Len(added_by)>50 then	
			Response.Write ("Added By Kýsmý 50 Karakterden Fazla Olamaz.")
		elseif Len(added_date)>50 then	
			Response.Write ("Added Date Kýsmý 50 Karakterden Fazla Olamaz.")
		else
		
			Set video_regRs = Server.CreateObject("Adodb.RecordSet")
			video_regSql = "Select * from video where id='"&id&"'"
			video_regRs.Open video_regSql,conn,1,3
			
			video_regRs("category")=category
			video_regRs("title")=title
			video_regRs("tag1")=tag1
			video_regRs("tag2")=tag2
			video_regRs("tag3")=tag3
			video_regRs("tag4")=tag4
			video_regRs("tag5")=tag5
			video_regRs("added_by")=added_by
			video_regRs("added_date")=added_date
			video_regRs.Update
			Response.Write("<center>Kayýt Güncellendi.</center>")
			video_regRs.Close
			Set video_regRs = Nothing
		end if	
		
			
		%>
		<%
		elseif section="app" then  '------------ Onay kýsmý yapýlýcak onay id eklenicek
		Set video_appnoRs = Server.CreateObject("Adodb.RecordSet")
		video_appnoSql = "Select * from video where app=1 order by app_no"
		video_appnoRs.Open video_appnoSql,conn,1,3
		
		if video_appnoRs.Eof then
		app_no=0
		else
		video_appnoRs.MoveLast
		app_no=video_appnoRs("app_no")
		end if
		id=Trim(Request.QueryString("id"))
		Set video_appRs = Server.CreateObject("Adodb.RecordSet")
		video_appSql = "Select * from video where id='"&id&"'"
		video_appRs.Open video_appSql,conn,1,3
		if video_appRs("app")=true then
			Response.Write("<center>Zaten Onaylanmýþ</center>")
		else
			video_appRs("app_no")=app_no+1
			video_appRs("app")=1
			video_appRs.Update
			Response.Write("<center> Onaylandý.<br><a href="&Request.ServerVariables("HTTP_REFERER")&">[Geri]</a></center>")
		end if
		video_appRs.Close
		Set video_appRs = Nothing
		
		%>
		<%
		elseif section="del" then
		id=security(Trim(Request.QueryString("id")))
		Set video_delFsoRs = Server.CreateObject("Adodb.RecordSet")
		video_delFsoSql = "Select * from video where id='"&id&"'"
		video_delFsoRs.Open video_delFsoSql,conn,1,3
		Set video_delFso= Server.CreateObject("Scripting.FileSystemObject")
		video_delFso.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH")&"video\upload\"&video_delFsoRs("video"))
		Set video_delRs = Server.CreateObject("Adodb.RecordSet")
		video_delSql = "Delete from video where id='"&id&"'"
		video_delRs.Open video_delSql,conn,1,3
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		%>		
			
		<%end if%>
	<%
	else
		Response.Write("<center>video Bölümünde Yetkiniz Kisitli. </center>")
	end if
	%>	
<%
Else
	Response.Redirect("default.asp?cat=login")
End If%>	
	