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
	
	Set designerRs = Server.CreateObject("Adodb.RecordSet")
	designerSql = "Select * from designer where app=1 order by app_no desc "
	designerRs.Open designerSql,conn,1,3
	designerRs.Pagesize = 4
	designerRs.AbsolutePage = pg
	
	
	%>
<style type="text/css">
<!--
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
}
-->
</style>

	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/designer.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=designer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=designer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=designer&section=list&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(designerRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=designer&section=list&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to designerRs.PageSize
		  if designerRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
				
					<table border="0" width="237" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=designerRs("app_no")%></td>
							<td background="images/buttons/b2.jpg" width="118" height="26"></td>
						</tr>
						<tr>
							<td  style="border-top:#FFFFFF 1px solid;"><img src="images/designer/<%=designerRs("img1")%>" width="118" height="118" border="0"/></td>
							<td  style="border-top:#FFFFFF 1px solid;"><img src="images/designer/<%=designerRs("img2")%>" width="118" height="118" border="0"/></td>
						</tr>
						<tr>
							<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designerRs("img3")%>" width="118" height="118" border="0"/></td>
							<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designerRs("img4")%>" width="118" height="118" border="0"/></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Name :</span><br /><%=designerRs("name")%></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Discipline :</span><br /><%=designerRs("discipline")%></span></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=designerRs("country")%></td>
						</tr>	 
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=designerRs("link")%>" target="_blank">
			<%
			if Len(Trim(designerRs("link")))>25 then
				txt=Left(designerRs("link"),25)
			    Response.Write(txt&"...")
		  else
		  		Response.Write(designerRs("link"))
		  end if%></a></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=designerRs("added_by")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=designerRs("added_date")%></td>
						</tr>
				  </table>
				
				</td>
			<%
			designerRs.Movenext
			Next
			designerRs.Close
			Set designerRs = Nothing
			%>
		  </tr>
	</table>
	
<%
elseif section="ad_d" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/designer.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=designer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=designer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=designer&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="designer_add" method="post" action="default.asp?cat=designer&section=ad_d_reg" enctype="multipart/form-data" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><span class="img_note"><br />
              </span><font face="Verdana, Arial, Helvetica, sans-serif">ADD DESIGNER</font> <br>
              <br>
		  		<span class="img_note">Designer Photo (Black and White) </span><br />
                <input type="file" name="img1" class="add_file" /> <br />
				<span class="img_note">Work Photo (118x118 Pix) </span><br />
				<input type="file" name="img2" class="add_file" /> <br />
				<span class="img_note">Work Photo (118x118 Pix)</span><br />
				<input type="file" name="img3" class="add_file" /> <br />
				<span class="img_note">Work Photo (118x118 Pix)</span><br />
			<input type="file" name="img4" class="add_file" /> <br />			</td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Name :</span><br />
                <input type="text" name="name" class="add_input"/></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Discipline :</span><br />
			 <select name="discipline" class="add_input">
					<option value="">Select One</option>
					<option>Architecture</option>
					<option>Industrial</option>
					<option>Fashion</option>
					<option>Accessories</option>
					<option>Jewellery</option>
					<option>Graphic</option>
					<option>Production</option>
					<option>Art</option>
					<option>IslamicArt</option>
			  </select>		
		  </td>
        </tr>
		 <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Discipline 2 :</span><br />
			 <select name="discipline2" class="add_input">
					<option value="">Select One</option>
					<option>Architecture</option>
					<option>Industrial</option>
					<option>Fashion</option>
					<option>Accessories</option>
					<option>Jewellery</option>
					<option>Graphic</option>
					<option>Production</option>
					<option>Art</option>
					<option>IslamicArt</option>
			  </select>		
		  </td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br />
				 <select name="country">
					<option value="">Select Country</option>
					<option>Afghanistan</option>
					<option>Albania</option>
					<option>Algeria</option>
					<option>American Samoa</option>
					<option>Andorra</option>
					<option>Angola</option>
					<option>Anguilla</option>
					<option>Antarctica</option>
					<option>Antigua and Barbuda</option>
					<option>Argentina</option>
					<option>Armenia</option>
					<option>Aruba</option>
					<option>Australia</option>
					<option>Austria</option>
					<option>Azerbaijan</option>
					<option>Bahamas</option>
					<option>Bahrain</option>
					<option>Bangladesh</option>
					<option>Barbados</option>
					<option>Belarus</option>
					<option>Belgium</option>
					<option>Belize</option>
					<option>Benin</option>
					<option>Bermuda</option>
					<option>Bhutan</option>
					<option>Bolivia</option>
					<option>Bosnia and Herzegovina</option>
					<option>Botswana</option>
					<option>Bouvet Island</option>
					<option>Brazil</option>
					<option>British Indian Ocean</option>
					<option>Brunei</option>
					<option>Bulgaria</option>
					<option>Burkina Faso</option>
					<option>Burundi</option>
					<option>Cambodia</option>
					<option>Cameroon</option>
					<option>Canada</option>
					<option>Cape Verde</option>
					<option>Cayman Islands</option>
					<option>Central African Republic</option>
					<option>Chad</option>
					<option>Chile</option>
					<option>China</option>
					<option>Christmas Island</option>
					<option>Cocos (Keeling) Islands</option>
					<option>Colombia</option>
					<option>Comoros</option>
					<option>Congo</option>
					<option>Congo (DRC)</option>
					<option>Cook Islands</option>
					<option>Costa Rica</option>
					<option>Côte d'Ivoire</option>
					<option>Croatia</option>
					<option>Cuba</option>
					<option>Cyprus</option>
					<option>Czech Republic</option>
					<option>Denmark</option>
					<option>Djibouti</option>
					<option>Dominica</option>
					<option>Dominican Republic</option>
					<option>Ecuador</option>
					<option>Egypt</option>
					<option>El Salvador</option>
					<option>Equatorial Guinea</option>
					<option>Eritrea</option>
					<option>Estonia</option>
					<option>Ethiopia</option>
					<option>Faroe Islands</option>
					<option>Fiji Islands</option>
					<option>Finland</option>
					<option>France</option>
					<option>French Guiana</option>
					<option>French Polynesia</option>
					<option>Gabon</option>
					<option>Gambia, The</option>
					<option>Georgia</option>
					<option>Germany</option>
					<option>Ghana</option>
					<option>Gibraltar</option>
					<option>Greece</option>
					<option>Greenland</option>
					<option>Grenada</option>
					<option>Guadeloupe</option>
					<option>Guam</option>
					<option>Guatemala</option>
					<option>Guernsey</option>
					<option>Guinea</option>
					<option>Guinea-Bissau</option>
					<option>Guyana</option>
					<option>Haiti</option>
					<option>Honduras</option>
					<option>Hong Kong SAR</option>
					<option>Hungary</option>
					<option>Iceland</option>
					<option>India</option>
					<option>Indonesia</option>
					<option>Iran</option>
					<option>Iraq</option>
					<option>Ireland</option>
					<option>Isle of Man</option>
					<option>Israel</option>
					<option>Italy</option>
					<option>Jamaica</option>
					<option>Japan</option>
					<option>Jersey</option>
					<option>Jordan</option>
					<option>Kazakhstan</option>
					<option>Kenya</option>
					<option>Kiribati</option>
					<option>Korea</option>
					<option>Kuwait</option>
					<option>Kyrgyzstan</option>
					<option>Laos</option>
					<option>Latvia</option>
					<option>Lebanon</option>
					<option>Lesotho</option>
					<option>Liberia</option>
					<option>Libya</option>
					<option>Liechtenstein</option>
					<option>Lithuania</option>
					<option>Luxembourg</option>
					<option>Macao SAR</option>
					<option>Macedonia</option>
					<option>Madagascar</option>
					<option>Malawi</option>
					<option>Malaysia</option>
					<option>Maldives</option>
					<option>Mali</option>
					<option>Malta</option>
					<option>Marshall Islands</option>
					<option>Martinique</option>
					<option>Mauritania</option>
					<option>Mauritius</option>
					<option>Mayotte</option>
					<option>Mexico</option>
					<option>Micronesia</option>
					<option>Moldova</option>
					<option>Monaco</option>
					<option>Mongolia</option>
					<option>Montenegro</option>
					<option>Montserrat</option>
					<option>Morocco</option>
					<option>Mozambique</option>
					<option>Myanmar</option>
					<option>Namibia</option>
					<option>Nauru</option>
					<option>Nepal</option>
					<option>Netherlands</option>
					<option>Netherlands Antilles</option>
					<option>New Caledonia</option>
					<option>New Zealand</option>
					<option>Nicaragua</option>
					<option>Niger</option>
					<option>Nigeria</option>
					<option>Niue</option>
					<option>Norfolk Island</option>
					<option>North Korea</option>
					<option>Northern Mariana Islands</option>
					<option>Norway</option>
					<option>Oman</option>
					<option>Pakistan</option>
					<option>Palau</option>
					<option>Palestinian Authority</option>
					<option>Panama</option>
					<option>Papua New Guinea</option>
					<option>Paraguay</option>
					<option>Peru</option>
					<option>Philippines</option>
					<option>Pitcairn Islands</option>
					<option>Poland</option>
					<option>Portugal</option>
					<option>Puerto Rico</option>
					<option>Qatar</option>
					<option>Reunion</option>
					<option>Romania</option>
					<option>Russia</option>
					<option>Rwanda</option>
					<option>Samoa</option>
					<option>San Marino</option>
					<option>São Tomé and Príncipe</option>
					<option>Saudi Arabia</option>
					<option>Senegal</option>
					<option>Serbia</option>
					<option>Seychelles</option>
					<option>Sierra Leone</option>
					<option>Singapore</option>
					<option>Slovakia</option>
					<option>Slovenia</option>
					<option>Solomon Islands</option>
					<option>Somalia</option>
					<option>South Africa</option>
					<option>Spain</option>
					<option>Sri Lanka</option>
					<option>St. Helena</option>
					<option>St. Kitts and Nevis</option>
					<option>St. Lucia</option>
					<option>St. Pierre and Miquelon</option>
					<option>Sudan</option>
					<option>Suriname</option>
					<option>Svalbard and Jan Mayen</option>
					<option>Swaziland</option>
					<option>Sweden</option>
					<option>Switzerland</option>
					<option>Syria</option>
					<option>Taiwan</option>
					<option>Tajikistan</option>
					<option>Tanzania</option>
					<option>Thailand</option>
					<option>Timor-Leste (East Timor)</option>
					<option>Togo</option>
					<option>Tokelau</option>
					<option>Tonga</option>
					<option>Trinidad and Tobago</option>
					<option>Tunisia</option>
					<option>Turkey</option>
					<option>Turkmenistan</option>
					<option>Turks and Caicos Islands</option>
					<option>Tuvalu</option>
					<option>Uganda</option>
					<option>Ukraine</option>
					<option>United Arab Emirates</option>
					<option>United Kingdom</option>
					<option>United States</option>
					<option>Uruguay</option>
					<option>Uzbekistan</option>
					<option>Vanuatu</option>
					<option>Vatican City</option>
					<option>Venezuela</option>
					<option>Vietnam</option>
					<option>Virgin Islands, U.S.</option>
					<option>Virgin Islands, British</option>
					<option>Wallis and Futuna</option>
					<option>Yemen</option>
					<option>Zambia</option>
					<option>Zimbabwe</option>
				</select>
			</td>
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
		Set designer_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from designer where app=1 order by app_no desc"
		designer_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if designer_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
		<table border="0" width="237" cellpadding="0" cellspacing="0">
			<tr>
				<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=designer_addlistRs("app_no")%></td>
				<td background="images/buttons/b2.jpg" width="118" height="26"></td>
			</tr>
			<tr>
				<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img1")%>" width="118" height="118" border="0"/></td>
				<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img2")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr>
				<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img3")%>" width="118" height="118" border="0"/></td>
				<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img4")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Name :</span><br /><%=designer_addlistRs("name")%></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Discipline :</span><br /><%=designer_addlistRs("discipline")%></span></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=designer_addlistRs("country")%></td>
			</tr>	 
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=designer_addlistRs("link")%>" target="_blank">
<%
if Len(Trim(designer_addlistRs("link")))>25 then
	txt=Left(designer_addlistRs("link"),25)
	Response.Write(txt&"...")
else
	Response.Write(designer_addlistRs("link"))
end if%></a></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=designer_addlistRs("added_by")%></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=designer_addlistRs("added_date")%></td>
			</tr>
	  </table>
    </td>
    <%
		designer_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>


<%
elseif section="ad_d_reg" then
%>

	<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/designer.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=designer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=designer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=designer&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
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

	namee=security_input(Trim(Upload.Form("name")))
	discipline=security_input(Trim(Upload.Form("discipline")))
	discipline2=security_input(Trim(Upload.Form("discipline2")))
	country=security_input(Trim(Upload.Form("country")))
	link=ss(Trim(Upload.Form("link")))
	added_by=security_input(Trim(Upload.Form("added_by")))
	
	if discipline2<>"" then
		discipline=discipline+", "+discipline2
	end if
	
	Randomize
	filename = int(rnd*99999999)
	
		if namee="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif discipline="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif country="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif link="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif added_by="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(namee)>50 then	
			Response.Write ("Name Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(discipline)>200 then	
			Response.Write ("Discipline Kýsmý 200 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(country)>500 then	
			Response.Write ("Country Kýsmý 500 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(link)>200 then	
			Response.Write ("Link Kýsmý 200 Karakterden Fazla Olamaz<br><br><a href=javascript:history.go(-1)>[Back]</a>.")
		elseif Len(added_by)>50 then	
			Response.Write ("Added By Kýsmý 50 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		else
			Set Filee1 = Upload.Files("img1")
			Set Filee2 = Upload.Files("img2")
			Set Filee3 = Upload.Files("img3")
			Set Filee4 = Upload.Files("img4")
			
			if Filee1 Is Nothing then
				Response.Write ("Resim Seçmelisiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
			elseif Filee1.ImageType<>"JPG" then
				Response.Write "Lütfen .jpg Uzantýlý Bir Dosya Seçiniz...<br><br><a href=javascript:history.go(-1)>[Back]</a>"				
			elseif Filee2 Is Nothing then
				Response.Write ("Resim Seçmelisiniz.")
			elseif Filee2.ImageType<>"JPG" then
				Response.Write "Lütfen .jpg Uzantýlý Bir Dosya Seçiniz...<br><br><a href=javascript:history.go(-1)>[Back]</a>"
			elseif Filee3 Is Nothing then
				Response.Write ("Resim Seçmelisiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
			elseif Filee3.ImageType<>"JPG" then
				Response.Write "Lütfen .jpg Uzantýlý Bir Dosya Seçiniz...<br><br><a href=javascript:history.go(-1)>[Back]</a>"
			elseif Filee4 Is Nothing then
				Response.Write ("Resim Seçmelisiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
			elseif Filee4.ImageType<>"JPG" then
				Response.Write "Lütfen .jpg Uzantýlý Bir Dosya Seçiniz...<br><br><a href=javascript:history.go(-1)>[Back]</a>"	
			else
					x=0
					Filee1.SaveAs Server.MapPath("images/designer/"&filename&"_1.jpg")
					Set Jpeg1 = Server.CreateObject("Persits.Jpeg")
							Path1 = Server.MapPath("images/designer/"&filename&"_1.jpg")
							Jpeg1.Open Path1 
							
					Filee2.SaveAs Server.MapPath("images/designer/"&filename&"_2.jpg")
					Set Jpeg2 = Server.CreateObject("Persits.Jpeg")
							Path2 = Server.MapPath("images/designer/"&filename&"_2.jpg")
							Jpeg2.Open Path2
							
					Filee3.SaveAs Server.MapPath("images/designer/"&filename&"_3.jpg")
					Set Jpeg3 = Server.CreateObject("Persits.Jpeg")
							Path3 = Server.MapPath("images/designer/"&filename&"_3.jpg")
							Jpeg3.Open Path3
							
					Filee4.SaveAs Server.MapPath("images/designer/"&filename&"_4.jpg")
					Set Jpeg4 = Server.CreateObject("Persits.Jpeg")
							Path4 = Server.MapPath("images/designer/"&filename&"_4.jpg")
							Jpeg4.Open Path4 		
							
					if Jpeg1.OriginalWidth <> 118 and Jpeg1.OriginalHeight <> 118 then
						Set del1 = Server.CreateObject("Scripting.FileSystemObject")
						del1.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\designer\"&filename&"_1.jpg" )
						x=1
					end if	
					if Jpeg2.OriginalWidth <> 118 and Jpeg1.OriginalHeight <> 118 then
						Set del2 = Server.CreateObject("Scripting.FileSystemObject")
						del2.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\designer\"&filename&"_2.jpg" )
						x=1
					end if	
					if Jpeg3.OriginalWidth <> 118 and Jpeg3.OriginalHeight <> 118 then
						Set del3 = Server.CreateObject("Scripting.FileSystemObject")
						del3.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\designer\"&filename&"_3.jpg" )
						x=1
					end if	
					if Jpeg4.OriginalWidth <> 118 and Jpeg4.OriginalHeight <> 118 then
						Set del4 = Server.CreateObject("Scripting.FileSystemObject")
						del4.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\designer\"&filename&"_4.jpg" )
						x=1
					end if	
					
					
					if x=1 then
						Response.Write("Lütfen Resimleri 118*118 px Olarak Yükleyiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
					else
							Set addRs = Server.CreateObject("Adodb.RecordSet")
							addSql="Select * From designer"
							addRs.Open addSql,conn,1,3
							addRs.AddNew
							addRs("img1")=filename&"_1.jpg"
							addRs("img2")=filename&"_2.jpg"
							addRs("img3")=filename&"_3.jpg"
							addRs("img4")=filename&"_4.jpg"
							addRs("name")=namee
							addRs("discipline")=discipline
							addRs("country")=country
							addRs("link")=link
							addRs("added_by")=added_by
							addRs("added_date")=Date
							addRs("app")=0
							addRs.Update
							Response.Write("Kaydýnýz Eklendi.")
							addRs.Close
							Set addRs = Nothing
					end if
				end if		
		
	end if	
%>	</span><br></td>
        </tr>
        
    </table>
	</td>
    <%	
		Set designer_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from designer where app=1 order by app_no desc"
		designer_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if designer_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
		<table border="0" width="237" cellpadding="0" cellspacing="0">
			<tr>
				<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=designer_addlistRs("app_no")%></td>
				<td background="images/buttons/b2.jpg" width="118" height="26"></td>
			</tr>
			<tr>
				<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img1")%>" width="118" height="118" border="0"/></td>
				<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img2")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr>
				<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img3")%>" width="118" height="118" border="0"/></td>
				<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img4")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Name :</span><br /><%=designer_addlistRs("name")%></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Discipline :</span><br /><%=designer_addlistRs("discipline")%></span></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=designer_addlistRs("country")%></td>
			</tr>	 
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=designer_addlistRs("link")%>" target="_blank">
<%
if Len(Trim(designer_addlistRs("link")))>25 then
	txt=Left(designer_addlistRs("link"),25)
	Response.Write(txt&"...")
else
	Response.Write(designer_addlistRs("link"))
end if%></a></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=designer_addlistRs("added_by")%></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=designer_addlistRs("added_date")%></td>
			</tr>
	  </table>
    </td>
    <%
		designer_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>

<%
elseif section="search" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/designer.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=designer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=designer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=designer&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="search_form" method="post" action="default.asp?cat=designer&section=search_comp" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><br />
            <font face="Verdana, Arial, Helvetica, sans-serif"> DESIGNER SEARCH</font><br>
          <br>
		  <%
		  if Session("hata")<>"" then 
		 	 Response.Write(Session("hata")&"<br>")
		 	 Session("hata")=""
		  end if
		  %>
		  <br />
                <input type="text" name="search" class="add_input" /></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg"  align="center"><input name="submit" type="submit" value="Search" class="add_submit"/></td>
        </tr>
      </form>
    </table></td>
    <%	
		Set designer_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from designer where app=1 order by app_no desc"
		designer_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if designer_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
		<table border="0" width="237" cellpadding="0" cellspacing="0">
			<tr>
				<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=designer_addlistRs("app_no")%></td>
				<td background="images/buttons/b2.jpg" width="118" height="26"></td>
			</tr>
			<tr>
				<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img1")%>" width="118" height="118" border="0"/></td>
				<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img2")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr>
				<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img3")%>" width="118" height="118" border="0"/></td>
				<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_addlistRs("img4")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Name :</span><br /><%=designer_addlistRs("name")%></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Discipline :</span><br /><%=designer_addlistRs("discipline")%></span></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=designer_addlistRs("country")%></td>
			</tr>	 
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=designer_addlistRs("link")%>" target="_blank">
<%
if Len(Trim(designer_addlistRs("link")))>25 then
	txt=Left(designer_addlistRs("link"),25)
	Response.Write(txt&"...")
else
	Response.Write(designer_addlistRs("link"))
end if%></a></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=designer_addlistRs("added_by")%></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=designer_addlistRs("added_date")%></td>
			</tr>
	  </table>
    </td>
    <%
		designer_addlistRs.MoveNext
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
	
	Set designer_searchRs = Server.CreateObject("Adodb.RecordSet")
	designer_searchSql = "Select * from designer where app=1 and name like '%"&search&"%' or app=1 and discipline like '%"&search&"%' or app=1 and country like '%"&search&"%' or app=1 and link like '%"&search&"%' or app=1 and added_by like '%"&search&"%' or app=1 and added_date like '%"&search&"%' order by app_no desc "
	designer_searchRs.Open designer_searchSql,conn,1,3
	
	if designer_searchRs.Eof then
		Session("hata")="Aradýðýnýz Sonuç Bulunamadý."
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
	end if
	designer_searchRs.Pagesize = 4
	designer_searchRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/designer.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=designer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=designer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=designer&section=search_comp&search=<%=search%>&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(designer_searchRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=designer&section=search_comp&search=<%=search%>&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to designer_searchRs.PageSize
		  if designer_searchRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
					<table border="0" width="237" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=designer_searchRs("app_no")%></td>
							<td background="images/buttons/b2.jpg" width="118" height="26"></td>
						</tr>
						<tr>
							<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_searchRs("img1")%>" width="118" height="118" border="0"/></td>
							<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_searchRs("img2")%>" width="118" height="118" border="0"/></td>
						</tr>
						<tr>
							<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_searchRs("img3")%>" width="118" height="118" border="0"/></td>
							<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=designer_searchRs("img4")%>" width="118" height="118" border="0"/></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Name :</span><br /><%=designer_searchRs("name")%></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Discipline :</span><br /><%=designer_searchRs("discipline")%></span></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=designer_searchRs("country")%></td>
						</tr>	 
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=designer_searchRs("link")%>" target="_blank">
			<%
			if Len(Trim(designer_searchRs("link")))>25 then
				txt=Left(designer_searchRs("link"),25)
				Response.Write(txt&"...")
			else
				Response.Write(designer_searchRs("link"))
			end if%></a></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=designer_searchRs("added_by")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=designer_searchRs("added_date")%></td>
						</tr>
				  </table>
				
				</td>
			<%
			designer_searchRs.Movenext
			Next
			designer_searchRs.Close
			Set designer_searchRs = Nothing
			%>
		  </tr>
	</table>


<%end if%>