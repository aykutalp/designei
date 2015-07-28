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
	
	Set inspireRs = Server.CreateObject("Adodb.RecordSet")
	inspireSql = "Select * from inspire where app=1 order by app_no desc "
	inspireRs.Open inspireSql,conn,1,3
	'if  inspireRs.Eof or inspireRs.Bof   then '\\\\\\\\\\\\\\\\\\\\\\\\ Kayýt Yoksa Yzýdýrýr.
	' 	Response.Write ("Kayýt Bulunamadý.")
	'	Response.End
	'end if
	inspireRs.Pagesize = 4
	inspireRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/inspire.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=inspire&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=inspire&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=inspire&section=list&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(inspireRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=inspire&section=list&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to inspireRs.PageSize
		  if inspireRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
				
					<table border="0" width="237" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=inspireRs("app_no")%></td>
							<td background="images/buttons/b2.jpg" width="118" height="26"></td>
						</tr>
						<tr>
							<td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/inspire/<%=inspireRs("img")%>" width="237" height="237" border="0"/></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
						  <%=inspireRs("title")%></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
						  <%=inspireRs("tag1")%>, <%=inspireRs("tag2")%>, <%=inspireRs("tag3")%>, <%=inspireRs("tag4")%>, <%=inspireRs("tag5")%></span></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=inspireRs("added_by")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=inspireRs("added_date")%></td>
						</tr>
				  </table>
				
				</td>
			<%
			inspireRs.Movenext
			Next
			inspireRs.Close
			Set inspireRs = Nothing
			%>
		  </tr>
	</table>
	
<%
elseif section="ad_d" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/inspire.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=inspire&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=inspire&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=inspire&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="inspire_add" method="post" action="default.asp?cat=inspire&section=ad_d_reg" enctype="multipart/form-data" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><span class="img_note"><br />
          </span><font face="Verdana, Arial, Helvetica, sans-serif">ADD INSPIRE </font><br>
          <br />
                <input type="file" name="img" class="add_file" /><br>
                <span class="img_note">237x237 pix </span></td>
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
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
                <input type="text" name="added_by" class="add_input" /></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><input name="submit" type="submit" value="Submit" class="add_submit"/></td>
        </tr>
      </form>
    </table></td>
    <%	
		Set inspire_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from inspire where app=1 order by app_no desc"
		inspire_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if inspire_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=inspire_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/inspire/<%=inspire_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=inspire_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
              <%=inspire_addlistRs("tag1")%>, <%=inspire_addlistRs("tag2")%>, <%=inspire_addlistRs("tag3")%>, <%=inspire_addlistRs("tag4")%>, <%=inspire_addlistRs("tag5")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=inspire_addlistRs("added_by")%> </td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=inspire_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		inspire_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>


<%
elseif section="ad_d_reg" then
%>

	<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/inspire.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=inspire&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=inspire&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=inspire&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
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

	title=security_input(Trim(Upload.Form("title")))
	tag1=security_input(Trim(Upload.Form("tag1")))
	tag2=security_input(Trim(Upload.Form("tag2")))
	tag3=security_input(Trim(Upload.Form("tag3")))
	tag4=security_input(Trim(Upload.Form("tag4")))
	tag5=security_input(Trim(Upload.Form("tag5")))
	added_by=security_input(Trim(Upload.Form("added_by")))
	
	
		if title="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag1="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag2="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag3="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag4="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif tag5="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif added_by="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(title)>50 then	
			Response.Write ("Title Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag1)>50 then	
			Response.Write ("Tag1 Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag2)>50 then	
			Response.Write ("Tag2 Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag3)>50 then	
			Response.Write ("Tag3 Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag4)>50 then	
			Response.Write ("Tag4 Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(tag5)>50 then	
			Response.Write ("Tag5 Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(added_by)>50 then	
			Response.Write ("Added By Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		else
			Set Fileee = Upload.Files("img")
			if Fileee Is Nothing then
				Response.Write ("Resim Seçmelisiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
			else
				For Each File in Upload.Files
						if File.ImageType<>"JPG" Then  'biraz önce müsaade verdiklerimizin dýþýnda bütün resim formatlarýný kabul ediyoruz.
							Response.Write "Lütfen .jpg Uzantýlý Bir Dosya Seçiniz...<br><br><a href=javascript:history.go(-1)>[Back]</a>" 
							'Response.End  ' bunu kaldýrýnca sayfa eski haline geliyo// bozulan satýrlar else ifadesine alýnarak düzeltildi.	
						Else
							Randomize
							filename = int(rnd*99999999) &".jpg"
							Set Filee = Upload.Files("img")
								Path = Server.MapPath("images/inspire/" & filename)
								Filee.SaveAs Path
								
								Set Jpeg = Server.CreateObject("Persits.Jpeg")
									Path = Server.MapPath("images/inspire/"&filename)
									Jpeg.Open Path 
									if Jpeg.OriginalWidth <> 237 and Jpeg.OriginalHeight <> 237 then
										Set del = Server.CreateObject("Scripting.FileSystemObject")
										del.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\inspire\"&filename )'Eðer site ana dizinde olucaksa ilk baþtaki inspireei kaldýrýlýcak 
										Response.Write("Lütfen 237*237 px Bir Resim Yükleyiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
									else
											Set addRs = Server.CreateObject("Adodb.RecordSet")
											addSql="Select * From inspire"
											addRs.Open addSql,conn,1,3
											addRs.AddNew
											addRs("img")=filename
											addRs("title")=title
											addRs("tag1")=tag1
											addRs("tag2")=tag2
											addRs("tag3")=tag3
											addRs("tag4")=tag4
											addRs("tag5")=tag5
											addRs("added_by")=added_by
											addRs("added_date")=Date
											addRs("app")=0
											addRs.Update
											Response.Write("Kaydýnýz Eklendi.")
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
		Set inspire_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from inspire where app=1 order by app_no desc"
		inspire_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if inspire_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=inspire_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/inspire/<%=inspire_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=inspire_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
              <%=inspire_addlistRs("tag1")%>, <%=inspire_addlistRs("tag2")%>, <%=inspire_addlistRs("tag3")%>, <%=inspire_addlistRs("tag4")%>, <%=inspire_addlistRs("tag5")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=inspire_addlistRs("added_by")%> </td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=inspire_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		inspire_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>



<%
elseif section="search" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/inspire.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=inspire&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=inspire&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=inspire&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="search_form" method="post" action="default.asp?cat=inspire&section=search_comp" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><br />
            <font face="Verdana, Arial, Helvetica, sans-serif">INSPIRE SEARCH</font><br>
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
		Set inspire_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from inspire where app=1 order by app_no desc"
		inspire_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if inspire_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=inspire_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/inspire/<%=inspire_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=inspire_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
              <%=inspire_addlistRs("tag1")%>, <%=inspire_addlistRs("tag2")%>, <%=inspire_addlistRs("tag3")%>, <%=inspire_addlistRs("tag4")%>, <%=inspire_addlistRs("tag5")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=inspire_addlistRs("added_by")%> </td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=inspire_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		inspire_addlistRs.MoveNext
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
			Session("hata")="Search Kýsmý Boþ Kalamaz."
			Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		elseif Len(search)>100 then
			Session("hata")="Search Kýsmý 100 Karakterin Üzerinde Olamaz."
			Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		end if
	else
		pg=security(Trim(CInt(Request.QueryString("pg"))))
	end if
	
	Set inspire_searchRs = Server.CreateObject("Adodb.RecordSet")
	inspire_searchSql = "Select * from inspire where app=1 and title like '%"&search&"%' or app=1 and tag1 like '%"&search&"%' or app=1 and tag2 like '%"&search&"%' or app=1 and tag3 like '%"&search&"%' or app=1 and tag4 like '%"&search&"%' or app=1 and tag5 like '%"&search&"%' or  app=1 and added_by like '%"&search&"%' or  app=1 and added_date like '%"&search&"%' order by app_no desc "
	inspire_searchRs.Open inspire_searchSql,conn,1,3
	
	if inspire_searchRs.Eof then
		Session("hata")="Aradýðýnýz Sonuç Bulunamadý."
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
	end if
	inspire_searchRs.Pagesize = 4
	inspire_searchRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/inspire.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=inspire&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=inspire&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=inspire&section=search_comp&search=<%=search%>&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(inspire_searchRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=inspire&section=search_comp&search=<%=search%>&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to inspire_searchRs.PageSize
		  if inspire_searchRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
				
					<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=inspire_searchRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/inspire/<%=inspire_searchRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=inspire_searchRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Search Tags :</span><br />
              <%=inspire_searchRs("tag1")%>, <%=inspire_searchRs("tag2")%>, <%=inspire_searchRs("tag3")%>, <%=inspire_searchRs("tag4")%>, <%=inspire_searchRs("tag5")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=inspire_searchRs("added_by")%> </td>
      </tr>
	  <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=inspire_searchRs("added_date")%> </td>
      </tr>
    </table></td>
			<%
			inspire_searchRs.Movenext
			Next
			inspire_searchRs.Close
			Set inspire_searchRs = Nothing
			%>
		  </tr>
	</table>
	
<%end if%>