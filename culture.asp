<!--#include file="ss.asp"-->
<!--#include file="security.asp"-->
<!--#include file="security_input.asp"-->
<!--#include file="connection.asp"-->
<%
section=security(Trim(Request.QueryString("section")))
if section="list" or section="" then
	if security(Trim(Request.QueryString("pg")))="" then
		pg=1
	else
		pg=security(Trim(CInt(Request.QueryString("pg"))))
	end if
	
	Set cultureRs = Server.CreateObject("Adodb.RecordSet")
	cultureSql = "Select * from culture where app=1 order by app_no desc "
	cultureRs.Open cultureSql,conn,1,3
	'if  cultureRs.Eof or cultureRs.Bof   then '\\\\\\\\\\\\\\\\\\\\\\\\ Kay�t Yoksa Yz�d�r�r.
	' 	Response.Write ("Kay�t Bulunamad�.")
	'	Response.End
	'end if
	cultureRs.Pagesize = 4
	cultureRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/culture.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=culture&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=culture&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=culture&section=list&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(cultureRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=culture&section=list&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to cultureRs.PageSize
		  if cultureRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
				
					<table border="0" width="237" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=cultureRs("app_no")%></td>
							<td background="images/buttons/b2.jpg" width="118" height="26"></td>
						</tr>
						<tr>
							<td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/culture/<%=cultureRs("img")%>" width="237" height="237" border="0"/></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Category :</span><br />
						  <%=cultureRs("category")%></td>
						 </tr>
						 <tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
						  <%=cultureRs("title")%></td>
						 </tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
						  <%=cultureRs("tag1")%>, <%=cultureRs("tag2")%>, <%=cultureRs("tag3")%>, <%=cultureRs("tag4")%>, <%=cultureRs("tag5")%></span></td>
						</tr>
						<tr>
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=cultureRs("link")%>" target="_blank">
							<%if Len(Trim(cultureRs("link")))>25 then
									txt=Left(cultureRs("link"),25)
									Response.Write(txt&"...")
							  else
									Response.Write(cultureRs("link"))
							  end if%></a>
							</td>
						  </tr>				
						  <tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=cultureRs("added_by")%></td>
						</tr>
						 <tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=cultureRs("added_date")%></td>
						</tr>
				  </table>
				
				</td>
			<%
			cultureRs.Movenext
			Next
			cultureRs.Close
			Set cultureRs = Nothing
			%>
		  </tr>
	</table>
	
<%
elseif section="ad_d" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/culture.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=culture&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=culture&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=culture&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="culture_add" method="post" action="default.asp?cat=culture&section=ad_d_reg" enctype="multipart/form-data" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><span class="img_note"><br />
          </span><font face="Verdana, Arial, Helvetica, sans-serif">ADD CULTURE</font><br>
          <br />
                <input type="file" name="img" class="add_file" />
                <span class="img_note">237x237 Pix </span></td>
        </tr>
		<tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Category :</span><br />
            <select name="category">
				  <option>Music Album</option>
				  <option>Film</option>
				  <option>Book</option>
				  <option>Magazine</option>
			</select>
				</td>
        </tr>
		<tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
                <input type="text" name="title" class="add_input"/></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Tag 1 :</span><br />
                <input type="text" name="tag1" class="add_input"/></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Tag 2 :</span><br />
            <input type="text" name="tag2" class="add_input" /></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Tag 3 :</span><br />
                <input type="text" name="tag3"  class="add_input"/></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Tag 4 :</span><br />
                <input type="text" name="tag4" class="add_input" /></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Tag 5 :</span><br />
                <input type="text" name="tag5" class="add_input" /></td>
        </tr>
		<tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br />
                <input type="text" name="link" class="add_input" /></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
                <input type="text" name="added_by" class="add_input" /></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><input name="submit" type="submit" value="Submit" class="add_submit"/></td>
        </tr>
      </form>
    </table></td>
    <%	
		Set culture_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from culture where app=1 order by app_no desc"
		culture_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if culture_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=culture_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/culture/<%=culture_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Category :</span><br />
              <%=culture_addlistRs("category")%></td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=culture_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
              <%=culture_addlistRs("tag1")%>, <%=culture_addlistRs("tag2")%>, <%=culture_addlistRs("tag3")%>, <%=culture_addlistRs("tag4")%>, <%=culture_addlistRs("tag5")%></td>
      </tr>
	  <tr>
			<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=culture_addlistRs("link")%>" target="_blank">
			<%if Len(Trim(culture_addlistRs("link")))>25 then
					txt=Left(culture_addlistRs("link"),25)
					Response.Write(txt&"...")
			  else
					Response.Write(culture_addlistRs("link"))
			  end if%></a>
			</td>
		</tr>	
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=culture_addlistRs("added_by")%> </td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=culture_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		culture_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>


<%
elseif section="ad_d_reg" then
%>

	<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/culture.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=culture&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=culture&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=culture&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><span class="alert_note">
		  <br />
		  <%
	Set Upload = Server.CreateObject("Persits.Upload" )'Resim Upload Eki
	Upload.OverwriteFiles = False  
	Upload.SaveToMemory
	
	category=security_input(Trim(Upload.Form("category")))
	title=security_input(Trim(Upload.Form("title")))
	tag1=security_input(Trim(Upload.Form("tag1")))
	tag2=security_input(Trim(Upload.Form("tag2")))
	tag3=security_input(Trim(Upload.Form("tag3")))
	tag4=security_input(Trim(Upload.Form("tag4")))
	tag5=security_input(Trim(Upload.Form("tag5")))
	link=ss(Trim(Upload.Form("link")))
	added_by=security_input(Trim(Upload.Form("added_by")))
	
	
		if category="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif title="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag1="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag2="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag3="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag4="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag5="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif link="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif added_by="" then	
			Response.Write ("L�tfen Her K�sm� Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(category)>50 then	
			Response.Write ("Category K�sm� 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(title)>50 then	
			Response.Write ("Title K�sm� 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag1)>50 then	
			Response.Write ("Tag1 K�sm� 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag2)>50 then	
			Response.Write ("Tag2 K�sm� 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag3)>50 then	
			Response.Write ("Tag3 K�sm� 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag4)>50 then	
			Response.Write ("Tag4 K�sm� 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag5)>50 then	
			Response.Write ("Tag5 K�sm� 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(link)>200 then	
			Response.Write ("Link K�sm� 200 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(added_by)>50 then	
			Response.Write ("Added By K�sm� 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		else
			Set Fileee = Upload.Files("img")
			if Fileee Is Nothing then
				Response.Write ("Resim Se�melisiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
			else
				For Each File in Upload.Files
						if File.ImageType<>"JPG" Then  'biraz �nce m�saade verdiklerimizin d���nda b�t�n resim formatlar�n� kabul ediyoruz.
							Response.Write "L�tfen .jpg Uzant�l� Bir Dosya Se�iniz...<br><br><a href=javascript:history.go(-1)>[Back]</a>" 
							'Response.End  ' bunu kald�r�nca sayfa eski haline geliyo// bozulan sat�rlar else ifadesine al�narak d�zeltildi.	
						Else
							Randomize
							filename = int(rnd*99999999) &".jpg"
							Set Filee = Upload.Files("img")
								Path = Server.MapPath("images/culture/" & filename)
								Filee.SaveAs Path
								
								Set Jpeg = Server.CreateObject("Persits.Jpeg")
									Path = Server.MapPath("images/culture/"&filename)
									Jpeg.Open Path 
									if Jpeg.OriginalWidth <> 237 and Jpeg.OriginalHeight <> 237 then
										Set del = Server.CreateObject("Scripting.FileSystemObject")
										del.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\culture\"&filename )'E�er site ana dizinde olucaksa ilk ba�taki cultureei kald�r�l�cak 
										Response.Write("L�tfen 237*237 px Bir Resim Y�kleyiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
									else
											Set addRs = Server.CreateObject("Adodb.RecordSet")
											addSql="Select * From culture"
											addRs.Open addSql,conn,1,3
											addRs.AddNew
											addRs("img")=filename
											addRs("category")=category
											addRs("title")=title
											addRs("tag1")=tag1
											addRs("tag2")=tag2
											addRs("tag3")=tag3
											addRs("tag4")=tag4
											addRs("tag5")=tag5
											addRs("link")=link
											addRs("added_by")=added_by
											addRs("added_date")=Date
											addRs("app")=0
											addRs.Update
											Response.Write("Kayd�n�z Eklendi.")
											addRs.Close
											Set addRs = Nothing
										
									end if		
						End if	
					Next
				end if	
		
	end if	
%>	</span><br></td>
        </tr>
        
    </table>
	</td>
    <%	
		Set culture_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from culture where app=1 order by app_no desc"
		culture_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if culture_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=culture_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/culture/<%=culture_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Category :</span><br />
              <%=culture_addlistRs("category")%></td>
      </tr>
	    <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=culture_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
              <%=culture_addlistRs("tag1")%>, <%=culture_addlistRs("tag2")%>, <%=culture_addlistRs("tag3")%>, <%=culture_addlistRs("tag4")%>, <%=culture_addlistRs("tag5")%></td>
      </tr>
	   <tr>
			<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=culture_addlistRs("link")%>" target="_blank">
			<%if Len(Trim(culture_addlistRs("link")))>25 then
					txt=Left(culture_addlistRs("link"),25)
					Response.Write(txt&"...")
			  else
					Response.Write(culture_addlistRs("link"))
			  end if%></a>
			</td>
		</tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=culture_addlistRs("added_by")%> </td>
      </tr>
	  <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=culture_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		culture_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>


<%
elseif section="search" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/culture.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=culture&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=culture&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=culture&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="search_form" method="post" action="default.asp?cat=culture&section=search_comp" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><br />
            <font face="Verdana, Arial, Helvetica, sans-serif"> CULTURE SEARCH</font><br>
          <br>
		  <%
		  if Session("hata")<>"" then 
		 	 Response.Write(Session("hata")&"<br>")
		 	 Session("hata")=""
		  end if
		  %>
                <input type="text" name="search" class="add_input" /></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg"  align="center"><input name="submit" type="submit" value="Search" class="add_submit"/></td>
        </tr>
      </form>
    </table></td>
    <%	
		Set culture_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from culture where app=1 order by app_no desc"
		culture_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if culture_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=culture_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/culture/<%=culture_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
	  <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Category :</span><br />
              <%=culture_addlistRs("category")%></td>
      </tr>
	  <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=culture_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
              <%=culture_addlistRs("tag1")%>, <%=culture_addlistRs("tag2")%>, <%=culture_addlistRs("tag3")%>, <%=culture_addlistRs("tag4")%>, <%=culture_addlistRs("tag5")%></td>
      </tr>
	  <tr>
			<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=culture_addlistRs("link")%>" target="_blank">
			<%if Len(Trim(culture_addlistRs("link")))>25 then
					txt=Left(culture_addlistRs("link"),25)
					Response.Write(txt&"...")
			  else
					Response.Write(culture_addlistRs("link"))
			  end if%></a>
			</td>
	  </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=culture_addlistRs("added_by")%> </td>
      </tr>
	  <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=culture_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		culture_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>

<%
elseif section="search_comp" then
	search=security_input(Trim(Request.Form("search")))
	
	if security_input(Trim(Request.QueryString("search")))<>"" then
		search=security_input(Trim(Request.QueryString("search")))
	end if
	
	if security(Trim(Request.QueryString("pg")))="" then
		pg=1
			if search="" then
			Session("hata")="Search K�sm� Bo� Kalamaz."
			Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		elseif Len(search)>100 then
			Session("hata")="Search K�sm� 100 Karakterin �zerinde Olamaz."
			Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		end if
	else
		pg=security(Trim(CInt(Request.QueryString("pg"))))
	end if
	
	Set culture_searchRs = Server.CreateObject("Adodb.RecordSet")
	culture_searchSql = "Select * from culture where app=1 and category like '%"&search&"%' or app=1 and title like '%"&search&"%' or app=1 and tag1 like '%"&search&"%' or app=1 and tag2 like '%"&search&"%' or app=1 and  tag3 like '%"&search&"%' or app=1 and tag4 like '%"&search&"%' or app=1 and tag5 like '%"&search&"%'or app=1 and link like '%"&search&"%' or app=1 and added_by like '%"&search&"%' or app=1 and added_date like '%"&search&"%' order by app_no desc"
	culture_searchRs.Open culture_searchSql,conn,1,3
	
	if culture_searchRs.Eof then
		Session("hata")="Arad���n�z Sonu� Bulunamad�."
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
	end if
	culture_searchRs.Pagesize = 4
	culture_searchRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/culture.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=culture&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=culture&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=culture&section=search_comp&search=<%=search%>&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(culture_searchRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=culture&section=search_comp&search=<%=search%>&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to culture_searchRs.PageSize
		  if culture_searchRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
				
					<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=culture_searchRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/culture/<%=culture_searchRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
	  <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Category :</span><br />
              <%=culture_searchRs("category")%></td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=culture_searchRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
              <%=culture_searchRs("tag1")%>, <%=culture_searchRs("tag2")%>, <%=culture_searchRs("tag3")%>, <%=culture_searchRs("tag4")%>, <%=culture_searchRs("tag5")%></td>
      </tr>
	  <tr>
			<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=culture_searchRs("link")%>" target="_blank">
			<%if Len(Trim(culture_searchRs("link")))>25 then
					txt=Left(culture_searchRs("link"),25)
					Response.Write(txt&"...")
			  else
					Response.Write(culture_searchRs("link"))
			  end if%></a>
			</td>
	  </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=culture_searchRs("added_by")%> </td>
      </tr>
	  <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=culture_searchRs("added_date")%> </td>
      </tr>
    </table></td>
			<%
			culture_searchRs.Movenext
			Next
			culture_searchRs.Close
			Set culture_searchRs = Nothing
			%>
		  </tr>
	</table>

<%end if%>