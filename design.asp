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
	
	Set designRs = Server.CreateObject("Adodb.RecordSet")
	designSql = "Select * from design where app=1 order by app_no desc "
	designRs.Open designSql,conn,1,3
	designRs.Pagesize = 4
	designRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/design.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=design&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=design&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=design&section=list&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(designRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=design&section=list&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to designRs.PageSize
		  if designRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
				
					<table border="0" width="237" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=designRs("app_no")%></td>
							<td background="images/buttons/b2.jpg" width="118" height="26"></td>
						</tr>
						<tr>
							<td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/design/<%=designRs("img")%>" width="237" height="237" border="0"/></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
						  <%=designRs("title")%></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Function :</span><br />
						  <%=designRs("functionn")%></span></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Year :</span><br /><%=designRs("yearr")%></td>
						</tr>	 
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Designer :</span><br /><%=designRs("designer")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Client :</span><br /><%=designRs("client")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=designRs("link")%>" target="_blank">
			<%
			if Len(Trim(designRs("link")))>25 then
				txt=Left(designRs("link"),25)
			    Response.Write(txt&"...")
		  else
		  		Response.Write(designRs("link"))
		  end if%></a></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=designRs("added_by")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=designRs("added_date")%></td>
						</tr>
				  </table>
				
				</td>
			<%
			designRs.Movenext
			Next
			designRs.Close
			Set designRs = Nothing
			%>
		  </tr>
	</table>
	
<%
elseif section="ad_d" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/design.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=design&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=design&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=design&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="design_add" method="post" action="default.asp?cat=design&section=ad_d_reg" enctype="multipart/form-data" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><span class="img_note"><br />
          </span><font face="Verdana, Arial, Helvetica, sans-serif">ADD DESIGN </font><br>
          <br />
                <input name="img" type="file" class="add_file"/>
                <span class="img_note">237X237 Pix </span></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
                <input type="text" name="title" class="add_input"/></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Function :</span><br />
                <textarea name="function" class="add_input" rows="4"></textarea></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Year :</span><br />
                <input type="text" name="year"  class="add_input"/></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Designer :</span><br />
                <input type="text" name="designer" class="add_input" /></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Client :</span><br />
                <input type="text" name="client" class="add_input" /></td>
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
		Set design_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from design where app=1 order by app_no desc"
		design_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if design_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=design_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/design/<%=design_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=design_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Function :</span><br />
              <%=design_addlistRs("functionn")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Year :</span><br />
              <%=design_addlistRs("yearr")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Designer :</span><br />
              <%=design_addlistRs("designer")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Client :</span><br />
              <%=design_addlistRs("client")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=design_addlistRs("link")%>" target="_blank">
		<%if Len(Trim(design_addlistRs("link")))>25 then
				txt=Left(design_addlistRs("link"),25)
			    Response.Write(txt&"...")
		  else
		  		Response.Write(design_addlistRs("link"))
		  end if%></a>
		</td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=design_addlistRs("added_by")%> </td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=design_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		design_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>


<%
elseif section="ad_d_reg" then
%>

	<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/design.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=design&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=design&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=design&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
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
	Set Upload = Server.CreateObject("Persits.Upload.1" )'Resim Upload Eki
	Upload.OverwriteFiles = False  
	Upload.SaveToMemory

	title=security_input(Trim(Upload.Form("title")))
	functionn=security_input(Trim(Upload.Form("function")))
	yearr=security_input(Trim(Upload.Form("year")))
	designer=security_input(Trim(Upload.Form("designer")))
	client=security_input(Trim(Upload.Form("client")))
	link=ss(Trim(Upload.Form("link")))
	added_by=security_input(Trim(Upload.Form("added_by")))
	
	if Session("flood")<>"" then 'Flood Korumasý Geliþtirilmeli...
		Session.Timeout=1
		Response.Write("Üst Üste Kayýt Ekleyemezsiniz.")
	else
		if title="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif functionn="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif yearr="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif designer="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif client="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif link="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif added_by="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(title)>50 then	
			Response.Write ("Title Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(functionn)>4000 then	
			Response.Write ("Function Kýsmý 4000 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(yearr)>20 then	
			Response.Write ("Year Kýsmý 20 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(designer)>50 then	
			Response.Write ("Designer Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(client)>200 then	
			Response.Write ("Client Kýsmý 200 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(link)>200 then	
			Response.Write ("Link Kýsmý 200 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
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
								Path = Server.MapPath("images/design/" & filename)
								Filee.SaveAs Path
								
								Set Jpeg = Server.CreateObject("Persits.Jpeg")
									Path = Server.MapPath("images/design/"&filename)
									Jpeg.Open Path 
									if Jpeg.OriginalWidth <> 237 and Jpeg.OriginalHeight <> 237 then
										Set del = Server.CreateObject("Scripting.FileSystemObject")
										del.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\design\"&filename )'Eðer site ana dizinde olucaksa ilk baþtaki designei kaldýrýlýcak 
										Response.Write("Lütfen 237*237 px Bir Resim Yükleyiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
									else
											Set addRs = Server.CreateObject("Adodb.RecordSet")
											addSql="Select * From design"
											addRs.Open addSql,conn,1,3
											addRs.AddNew
											addRs("img")=filename
											addRs("title")=title
											addRs("functionn")=functionn
											addRs("yearr")=yearr
											addRs("designer")=designer
											addRs("client")=client
											addRs("link")=link
											addRs("added_by")=added_by
											addRs("added_date")=date
											addRs("app")=0
											addRs("app_no")=0
											addRs.Update
											Session("flood")=1
											Session.Timeout=1
											Response.Write("Kaydýnýz Eklendi.")
											addRs.Close
											Set addRs = Nothing
										
									end if		
						End if	
					Next
				end if	
		end if
	end if
%>	</span><br></td>
        </tr>
        
    </table>
	</td>
    <%	
		Set design_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from design where app=1 order by app_no desc"
		design_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if design_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=design_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/design/<%=design_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=design_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Function :</span><br />
              <%=design_addlistRs("functionn")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Year :</span><br />
              <%=design_addlistRs("yearr")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Designer :</span><br />
              <%=design_addlistRs("designer")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Client :</span><br />
              <%=design_addlistRs("client")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=design_addlistRs("link")%>" target="_blank">
		<%if Len(Trim(design_addlistRs("link")))>25 then
				txt=Left(design_addlistRs("link"),25)
			    Response.Write(txt&"...")
		  else
		  		Response.Write(design_addlistRs("link"))
		  end if%></a>
		</td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=design_addlistRs("added_by")%> </td>
      </tr>
	  <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=design_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		design_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>

<%
elseif section="search" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/design.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=design&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=design&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=design&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="search_form" method="post" action="default.asp?cat=design&section=search_comp" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><br />
            <font face="Verdana, Arial, Helvetica, sans-serif">DESIGN SEARCH</font> <br>
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
          <td height="20" colspan="2" background="images/yazi_back.jpg" class="search_check"><input type="checkbox" name="title" value="title" /> Title</td>
        </tr>
		<tr>
          <td height="20" colspan="2" background="images/yazi_back.jpg" class="search_check"><input type="checkbox" name="function" value="function" /> Function</td>
        </tr>
		<tr>
          <td height="20" colspan="2" background="images/yazi_back.jpg" class="search_check"><input type="checkbox" name="year" value="year" /> Year</td>
        </tr>
		<tr>
          <td height="20" colspan="2" background="images/yazi_back.jpg" class="search_check"><input type="checkbox" name="designer" value="designer" /> Designer</td>
        </tr>
		<tr>
          <td height="20" colspan="2" background="images/yazi_back.jpg" class="search_check"><input type="checkbox" name="client" value="client" /> Client</td>
        </tr>
		<tr>
          <td height="20" colspan="2" background="images/yazi_back.jpg" class="search_check"><input type="checkbox" name="added_by" value="added_by" /> Added By</td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg"  align="center"><input name="submit" type="submit" value="Search" class="add_submit"/></td>
        </tr>
      </form>
    </table></td>
    <%	
		Set design_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from design where app=1 order by app_no desc"
		design_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if design_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=design_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/design/<%=design_addlistRs("img")%>" width="237" height="237" border="0"/></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
              <%=design_addlistRs("title")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Function :</span><br />
              <%=design_addlistRs("functionn")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Year :</span><br />
              <%=design_addlistRs("yearr")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Designer :</span><br />
              <%=design_addlistRs("designer")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Client :</span><br />
              <%=design_addlistRs("client")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=design_addlistRs("link")%>" target="_blank">
		<%if Len(Trim(design_addlistRs("link")))>25 then
				txt=Left(design_addlistRs("link"),25)
			    Response.Write(txt&"...")
		  else
		  		Response.Write(design_addlistRs("link"))
		  end if%></a>
		</td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=design_addlistRs("added_by")%> </td>
      </tr>
	   <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=design_addlistRs("added_date")%> </td>
      </tr>
    </table></td>
    <%
		design_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>

<%
elseif section="search_comp" then
	search=security_input(Trim(Request.Form("search")))
	title=security_input(Trim(Request.Form("title")))
	functionn=security_input(Trim(Request.Form("function")))
	yearr=security_input(Trim(Request.Form("year")))
	designer=security_input(Trim(Request.Form("designer")))
	client=security_input(Trim(Request.Form("client")))
	added_by=security_input(Trim(Request.Form("added_by")))
	
	if security_input(Trim(Request.QueryString("search")))<>"" then
		search=security_input(Trim(Request.QueryString("search")))	
	end if
	
	if Request.QueryString("search_part")<>"" then
		search_part=security_input(Trim(Request.QueryString("search_part")))
		kisim=split(search_part," ")
			for i=0 to UBound(kisim)
				if kisim(i)="title" then
					title=""
					title="title"
					Response.write "title2 "
				end if
				if kisim(i)="function" then
					functionn=""
					functionn="functionn"
					Response.write "function "
				end if
				if kisim(i)="year" then
					yearr=""
					yearr="yearr"
				end if
				if kisim(i)="designer" then
					designer=""
					designer="designer"
				end if
				if kisim(i)="client" then
					client=""
					client="client"
				end if
				if kisim(i)="added_by" then
					added_by=""
					added_by="added_by"
				end if
			next
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
	
	search_part2=""
	ve="false"
	sart="where "
	if title<>"" then
		sart= sart & "app=1 and title like '%"&search&"%'"
		ve="true"
		search_part2=search_part2 & "title"
	else
		ve="false"
	end if
	
	if functionn<>"" then
		if ve="true" then
			sart= sart & "and app=1 and functionn like '%"&search&"%'"
			search_part2=search_part2 &"+function"
		else
			sart= sart & "app=1 and functionn like '%"&search&"%'"
			ve="true"
			search_part2="function"
		end if
	end if
	
	if yearr<>"" then
		if ve="true" then
			sart= sart & "and app=1 and yearr like '%"&search&"%'"
			search_part2=search_part2 &"+year"
		else
			sart= sart & "app=1 and yearr like '%"&search&"%'"
			ve="true"
			search_part2="year"
		end if
	end if
	
	if designer<>"" then
		if ve="true" then
			sart= sart & "and app=1 and designer like '%"&search&"%'"
			search_part2=search_part2 &"+designer"
		else
			sart= sart & "app=1 and designer like '%"&search&"%'"
			ve="true"
			search_part2="designer"
		end if
	end if
	
	if client<>"" then
		if ve="true" then
			sart= sart & "and app=1 and client like '%"&search&"%'"
			search_part2=search_part2 &"+client"
		else
			sart= sart & "app=1 and client like '%"&search&"%'"
			ve="true"
			search_part2="client"
		end if
	end if
	
	if added_by<>"" then
		if ve="true" then
			sart= sart & "and app=1 and added_by like '%"&search&"%'"
			search_part2=search_part2 &"+added_by"
		else
			sart= sart & "app=1 and added_by like '%"&search&"%'"
			ve="true"
			search_part2="added_by"
		end if
	end if
		
	Set design_searchRs = Server.CreateObject("Adodb.RecordSet")
	design_searchSql = "Select * from design "& sart & " order by app_no desc"
	design_searchRs.Open design_searchSql,conn,1,3
	
	if design_searchRs.Eof then
		Session("hata")="Aradýðýnýz Sonuç Bulunamadý."
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
	end if
	design_searchRs.Pagesize = 4
	design_searchRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/design.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=design&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=design&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=design&section=search_comp&search=<%=search%>&search_part=<%=search_part2%>&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(design_searchRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=design&section=search_comp&search=<%=search%>&search_part=<%=search_part2%>&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to design_searchRs.PageSize
		  if design_searchRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
				
					<table border="0" width="237" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=design_searchRs("app_no")%></td>
							<td background="images/buttons/b2.jpg" width="118" height="26"></td>
						</tr>
						<tr>
							<td colspan="2" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/design/<%=design_searchRs("img")%>" width="237" height="237" border="0"/></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Title :</span><br />
						  <%=design_searchRs("title")%></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Function :</span><br />
						  <%=design_searchRs("functionn")%></span></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Year :</span><br /><%=design_searchRs("yearr")%></td>
						</tr>	 
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Designer :</span><br /><%=design_searchRs("designer")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Client :</span><br /><%=design_searchRs("client")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=design_searchRs("link")%>" target="_blank">
			<%
			if Len(Trim(design_searchRs("link")))>25 then
				txt=Left(design_searchRs("link"),25)
			    Response.Write(txt&"...")
		  else
		  		Response.Write(design_searchRs("link"))
		  end if%></a></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=design_searchRs("added_by")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=design_searchRs("added_date")%></td>
						</tr>
				  </table>
				
				</td>
			<%
			design_searchRs.Movenext
			Next
			design_searchRs.Close
			Set design_searchRs = Nothing
			%>
		  </tr>
	</table>


<%end if%>