<!--#include file="ss.asp"-->
<!--#include file="security.asp"-->
<!--#include file="security_input.asp"-->
<!--#include file="connection.asp"-->
<script type="text/javascript">
function under()
{
	if (document.getElementById('sector').value=='Architecture' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>MasterPlanning</option> <option>Landscape</option> <option>Urban</option></select>';
	}
	else if (document.getElementById('sector').value=='Interior' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Home</option><option>Kids</option><option>Office</option><option>Showroom</option><option>Fair</option><option>Exhibition</option><option>ShopWindow</option><option>Retail</option><option>Display</option><option>Set</option><option>Show</option><option>Transportation</option></select>';
	}
	else if (document.getElementById('sector').value=='Industrial' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Furniture</option><option>Object</option><option>Glass</option><option>Plastic</option><option>Ceramics</option><option>Porcelain</option><option>Wood</option><option>Lighting</option><option>Appliance</option><option>Electronic</option><option>Transportation</option><option>Game-Toy</option><option>Home Textile</option><option>Packaging</option><option>Kid</option><option>Bath</option><option>Office</option><option>Cosmetic</option><option>Food</option><option>3D Modelling</option></select>';
	}
	else if (document.getElementById('sector').value=='Fashion' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Menswear</option><option>Womenswear</option><option>Childrenswear</option><option>Casualwear</option><option>Eveningwear</option><option>Nightwear</option><option>Sleepingwear</option><option>Houte Couture</option><option>Sportswear</option><option>Activewear</option><option>Jeanswear</option><option>Underwear</option><option>Lingerie</option><option>Swimwear</option><option>Weddingwear</option><option>Costume</option></select>';
	}
	else if (document.getElementById('sector').value=='Accessories' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Bijouterie</option><option>Jewellery</option><option>Silver</option><option>Gold</option><option>Diamond</option><option>Gemstone</option><option>Watch</option><option>Shoes</option><option>Bag</option><option>Eyewear</option></select>';
	}
	else if (document.getElementById('sector').value=='Graphic' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Identity</option><option>Printing</option><option>Editorial</option><option>Advertising</option><option>Web</option><option>Packaging</option><option>Typefaces</option><option>Illustration</option><option>Cartoon</option></select>';
	}
	else if (document.getElementById('sector').value=='Production' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Photography</option><option>Cinema</option><option>Broadcast</option><option>Animation</option><option>Shortfilm</option><option>Advertising</option></select>';
	}
	else if (document.getElementById('sector').value=='VisualArt' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Painting</option><option>Drawing</option><option>MixedMedia</option><option>Printmaking</option><option>Digital</option><option>Sculpture</option><option>Photography</option><option>Installation</option><option>Video</option><option>Performance</option><option>Glass</option><option>Ceramics</option><option>Jewellery</option></select>';
	}
	else if (document.getElementById('sector').value=='IslamicArt' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Calligraphy</option><option>Illumination</option><option>Miniature</option><option>Marbling</option><option>Ornament</option><option>Pattern</option></select>';
	}
	else if (document.getElementById('sector').value=='Craft' )
	{
	document.getElementById('sector2').style.display='';
	document.getElementById('sector2').innerHTML='<select name=\"sector2\" class=\"add_input\"><option value=\"\">Select One</option><option>Furniture</option><option>Lighting</option><option>Object</option><option>Glass</option><option>Ceramics</option><option>Metal</option><option>Textile</option><option>Jewellery</option><option>Game-Toy</option><option>Kid</option><option>Painting</option><option>Sculpture</option><option>Graffiti</option></select>';
	}
	else if (document.getElementById('sector').value=='' )
	{
	document.getElementById('sector2').style.display='none';
	}
}



</script>
<%

section=security(Trim(Request.QueryString("section")))
if section="list" or section="" then
	if security(Trim(Request.QueryString("pg")))="" then
		pg=1
	else
		pg=security(Trim(CInt(Request.QueryString("pg"))))
	end if
	
	Set producerRs = Server.CreateObject("Adodb.RecordSet")
	producerSql = "Select * from producer where app=1 order by app_no desc "
	producerRs.Open producerSql,conn,1,3
	producerRs.Pagesize = 4
	producerRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/producer.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=producer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=producer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=producer&section=list&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(producerRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=producer&section=list&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to producerRs.PageSize
		  if producerRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
				
					<table border="0" width="237" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=producerRs("app_no")%></td>
							<td background="images/buttons/b2.jpg" width="118" height="26"></td>
						</tr>
						<tr>
							<td  style="border-top:#FFFFFF 1px solid;"><img src="images/producer/<%=producerRs("img1")%>" width="118" height="118" border="0"/></td>
							<td  style="border-top:#FFFFFF 1px solid;"><img src="images/producer/<%=producerRs("img2")%>" width="118" height="118" border="0"/></td>
						</tr>
						<tr>
							<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producerRs("img3")%>" width="118" height="118" border="0"/></td>
							<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producerRs("img4")%>" width="118" height="118" border="0"/></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Company :</span><br /><%=producerRs("company")%></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Sector :</span><br /><%=producerRs("sector")%></span></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=producerRs("country")%></td>
						</tr>	 
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=producerRs("link")%>" target="_blank">
			<%
			if Len(Trim(producerRs("link")))>25 then
				txt=Left(producerRs("link"),25)
			    Response.Write(txt&"...")
		  else
		  		Response.Write(producerRs("link"))
		  end if%></a></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=producerRs("added_by")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=producerRs("added_date")%></td>
						</tr>
				  </table>
				
				</td>
			<%
			producerRs.Movenext
			Next
			producerRs.Close
			Set producerRs = Nothing
			%>
		  </tr>
	</table>
	
<%
elseif section="ad_d" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/producer.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=producer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=producer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=producer&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="producer_add" method="post" action="default.asp?cat=producer&section=ad_d_reg" enctype="multipart/form-data" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><span class="img_note"><br />
            </span><font face="Verdana, Arial, Helvetica, sans-serif">ADD PRODUCER </font><br />
            <br />
            <span class="img_note">Producer Photo (118x118 Pix)</span> <br />
            <input type="file" name="img1" class="add_file" />
            <br />
            <span class="img_note">Work Photo ( 118x118 Pix ) </span><br />
            <input type="file" name="img2" class="add_file" />
            <br />
            <span class="img_note">Work Photo ( 118x118 Pix )</span><br />
            <input type="file" name="img3" class="add_file" />
            <br />
            <span class="img_note">Work Photo ( 118x118 Pix )</span><br />
            <input type="file" name="img4" class="add_file" />
            <br />
          </td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Company :</span><br />
                <input type="text" name="company" class="add_input"/></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Sector :</span><br />
                <select name="sector" class="add_input" id="sector" onchange="javascript:under();">
                  <option value="">Select One</option>
                  <option value="Architecture">Architecture</option>
                  <option value="Interior">Interior</option>
                  <option value="Industrial">Industrial</option>
                  <option value="Fashion">Fashion</option>
                  <option value="Accessories">Accessories</option>
                  <option value="Graphic">Graphic</option>
                  <option value="Production">Production</option>
                  <option value="VisualArt">VisualArt</option>
                  <option value="IslamicArt">IslamicArt</option>
                  <option value="Craft">Craft</option>
                </select>
                <br />
            <br />
            <div id="sector2" style="display:none"> </div></td>
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
          <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><input name="submit2" type="submit" value="Submit" class="add_submit"/></td>
        </tr>
      </form>
    </table></td>
    <%	
		Set producer_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from producer where app=1 order by app_no desc"
		producer_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if producer_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
	<table border="0" width="237" cellpadding="0" cellspacing="0">
      <tr>
        <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=producer_addlistRs("app_no")%></td>
        <td background="images/buttons/b2.jpg" width="118" height="26"></td>
      </tr>
      <tr>
        <td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img1")%>" width="118" height="118" border="0"/></td>
        <td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img2")%>" width="118" height="118" border="0"/></td>
      </tr>
      <tr>
        <td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img3")%>" width="118" height="118" border="0"/></td>
        <td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img4")%>" width="118" height="118" border="0"/></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Company :</span><br />
              <%=producer_addlistRs("company")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Sector :</span><br />
              <%=producer_addlistRs("sector")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br />
              <%=producer_addlistRs("country")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br />
              <a href="<%=producer_addlistRs("link")%>" target="_blank">
              <%
if Len(Trim(producer_addlistRs("link")))>25 then
	txt=Left(producer_addlistRs("link"),25)
	Response.Write(txt&"...")
else
	Response.Write(producer_addlistRs("link"))
end if%>
              </a></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br />
              <%=producer_addlistRs("added_by")%></td>
      </tr>
      <tr>
        <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br />
              <%=producer_addlistRs("added_date")%></td>
      </tr>
    </table></td>
    <%
		producer_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>
<%
elseif section="ad_d_reg" then
%>

	<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/producer.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=producer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=producer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=producer&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
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

	company=security_input(Trim(Upload.Form("company")))
	sector=security_input(Trim(Upload.Form("sector")))
	sector2=security_input(Trim(Upload.Form("sector2")))
	country=security_input(Trim(Upload.Form("country")))
	link=ss(Trim(Upload.Form("link")))
	added_by=security_input(Trim(Upload.Form("added_by")))
	
	Randomize
	filename = int(rnd*99999999)

		if company="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif sector="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif sector2="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif country="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif link="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif added_by="" then	
			Response.Write ("Lütfen Her Kýsmý Doldurunuz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(company)>200 then	
			Response.Write ("Company Kýsmý 200 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(sector)>200 then	
			Response.Write ("Sector Kýsmý 200 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(sector2)>200 then	
			Response.Write ("Sector2 Kýsmý 200 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(country)>500 then	
			Response.Write ("Country Kýsmý 500 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
		elseif Len(link)>200 then	
			Response.Write ("Link Kýsmý 200 Karakterden Fazla Olamaz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
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
				Response.Write ("Resim Seçmelisiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
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
					Filee1.SaveAs Server.MapPath("images/producer/"&filename&"_1.jpg")
					Set Jpeg1 = Server.CreateObject("Persits.Jpeg")
							Path1 = Server.MapPath("images/producer/"&filename&"_1.jpg")
							Jpeg1.Open Path1 
							
					Filee2.SaveAs Server.MapPath("images/producer/"&filename&"_2.jpg")
					Set Jpeg2 = Server.CreateObject("Persits.Jpeg")
							Path2 = Server.MapPath("images/producer/"&filename&"_2.jpg")
							Jpeg2.Open Path2
							
					Filee3.SaveAs Server.MapPath("images/producer/"&filename&"_3.jpg")
					Set Jpeg3 = Server.CreateObject("Persits.Jpeg")
							Path3 = Server.MapPath("images/producer/"&filename&"_3.jpg")
							Jpeg3.Open Path3
							
					Filee4.SaveAs Server.MapPath("images/producer/"&filename&"_4.jpg")
					Set Jpeg4 = Server.CreateObject("Persits.Jpeg")
							Path4 = Server.MapPath("images/producer/"&filename&"_4.jpg")
							Jpeg4.Open Path4 		
							
					if Jpeg1.OriginalWidth <> 118 and Jpeg1.OriginalHeight <> 118 then
						Set del1 = Server.CreateObject("Scripting.FileSystemObject")
						del1.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\producer\"&filename&"_1.jpg" )
						x=1
					end if	
					if Jpeg2.OriginalWidth <> 118 and Jpeg1.OriginalHeight <> 118 then
						Set del2 = Server.CreateObject("Scripting.FileSystemObject")
						del2.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\producer\"&filename&"_2.jpg" )
						x=1
					end if	
					if Jpeg3.OriginalWidth <> 118 and Jpeg3.OriginalHeight <> 118 then
						Set del3 = Server.CreateObject("Scripting.FileSystemObject")
						del3.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\producer\"&filename&"_3.jpg" )
						x=1
					end if	
					if Jpeg4.OriginalWidth <> 118 and Jpeg4.OriginalHeight <> 118 then
						Set del4 = Server.CreateObject("Scripting.FileSystemObject")
						del4.DeleteFile(""&Request.ServerVariables("APPL_PHYSICAL_PATH" )&"images\producer\"&filename&"_4.jpg" )
						x=1
					end if	
					
					
					if x=1 then
						Response.Write("Lütfen Resimleri 118*118 px Olarak Yükleyiniz.<br><br><a href=javascript:history.go(-1)>[Back]</a>")
					else
						
							Set addRs = Server.CreateObject("Adodb.RecordSet")
							addSql="Select * From producer"
							addRs.Open addSql,conn,1,3
							addRs.AddNew
							addRs("img1")=filename&"_1.jpg"
							addRs("img2")=filename&"_2.jpg"
							addRs("img3")=filename&"_3.jpg"
							addRs("img4")=filename&"_4.jpg"
							addRs("company")=company
							addRs("sector")=sector+", "+sector2
							addRs("country")=country
							addRs("link")=link
							addRs("added_by")=added_by
							addRs("added_date")=Date
							addRs("app")=0
							addRs.Update
							addRs.Close
							Set addRs = Nothing
							Response.Write("Kaydinýz Eklendi.")
									
					end if
				end if		
		
	end if

%>	</span><br></td>
        </tr>
        
    </table>
	</td>
    <%	
		Set producer_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from producer where app=1 order by app_no desc"
		producer_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if producer_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
		<table border="0" width="237" cellpadding="0" cellspacing="0">
			<tr>
				<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=producer_addlistRs("app_no")%></td>
				<td background="images/buttons/b2.jpg" width="118" height="26"></td>
			</tr>
			<tr>
				<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img1")%>" width="118" height="118" border="0"/></td>
				<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img2")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr>
				<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img3")%>" width="118" height="118" border="0"/></td>
				<td  style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img4")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Company :</span><br /><%=producer_addlistRs("company")%></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Sector :</span><br /><%=producer_addlistRs("sector")%></span></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=producer_addlistRs("country")%></td>
			</tr>	 
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=producer_addlistRs("link")%>" target="_blank">
<%
if Len(Trim(producer_addlistRs("link")))>25 then
	txt=Left(producer_addlistRs("link"),25)
	Response.Write(txt&"...")
else
	Response.Write(producer_addlistRs("link"))
end if%></a></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=producer_addlistRs("added_by")%></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=producer_addlistRs("added_date")%></td>
			</tr>
	  </table>
    </td>
    <%
		producer_addlistRs.MoveNext
		Next
		%>
  </tr>
</table>

<%
elseif section="search" then 
%>
<table width="951" border="0" cellpadding="0" cellspacing="1">
  <tr>
    <td><img src="images/buttons/producer.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=producer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><a href="default.asp?cat=producer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
    <td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
    <td><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></td>
    <td><a href="default.asp?cat=producer&section=list&pg=2"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="images/yazi_back.jpg"><table border="0" width="237" cellpadding="0" cellspacing="0">
      <form name="search_form" method="post" action="default.asp?cat=producer&section=search_comp" >
        <tr>
          <td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"></td>
          <td background="images/buttons/b2.jpg" width="118" height="26"></td>
        </tr>
        <tr>
          <td colspan="2" style="border-top:#FFFFFF 1px solid;" background="images/yazi_back.jpg" align="center"><p><br />
            <font face="Verdana, Arial, Helvetica, sans-serif">PRODUCER SEARCH</font></p>
            <p><br>
	            <%
		  if Session("hata")<>"" then 
		 	 Response.Write(Session("hata")&"<br>")
		 	 Session("hata")=""
		  end if
		  %>
                  <input type="text" name="search" class="add_input" />
            </p></td>
        </tr>
        <tr>
          <td height="50" colspan="2" background="images/yazi_back.jpg"  align="center"><input name="submit" type="submit" value="Search" class="add_submit"/></td>
        </tr>
      </form>
    </table></td>
    <%	
		Set producer_addlistRs = Server.CreateObject("Adodb.RecordSet")
		addlistSql = "Select * from producer where app=1 order by app_no desc"
		producer_addlistRs.Open addlistSql,conn,1,3
		
		for x=1 to 3
		if producer_addlistRs.Eof then exit for
		%>
    <td colspan="2" valign="top" background="images/yazi_back.jpg">
		<table border="0" width="237" cellpadding="0" cellspacing="0">
			<tr>
				<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=producer_addlistRs("app_no")%></td>
				<td background="images/buttons/b2.jpg" width="118" height="26"></td>
			</tr>
			<tr>
				<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img1")%>" width="118" height="118" border="0"/></td>
				<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img2")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr>
				<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img3")%>" width="118" height="118" border="0"/></td>
				<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_addlistRs("img4")%>" width="118" height="118" border="0"/></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Company :</span><br /><%=producer_addlistRs("company")%></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Sector :</span><br /><%=producer_addlistRs("sector")%></span></td>
			</tr>
			<tr> 
				<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=producer_addlistRs("country")%></td>
			</tr>	 
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=producer_addlistRs("link")%>" target="_blank">
<%
if Len(Trim(producer_addlistRs("link")))>25 then
	txt=Left(producer_addlistRs("link"),25)
	Response.Write(txt&"...")
else
	Response.Write(producer_addlistRs("link"))
end if%></a></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=producer_addlistRs("added_by")%></td>
			</tr>
			<tr> 
				 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=producer_addlistRs("added_date")%></td>
			</tr>
	  </table>
    </td>
    <%
		producer_addlistRs.MoveNext
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
			Session("hata")="Search Kismi Bos Kalamaz."
			Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		elseif Len(search)>100 then
			Session("hata")="Search Kýsmý 100 Karakterin Üzerinde Olamaz."
			Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
		end if
	else
		pg=security(Trim(CInt(Request.QueryString("pg"))))
	end if
	
	Set producer_searchRs = Server.CreateObject("Adodb.RecordSet")
	producer_searchSql = "Select * from producer where app=1 and company like '%"&search&"%' or app=1 and sector like '%"&search&"%' or app=1 and country like '%"&search&"%' or app=1 and link like '%"&search&"%' or app=1 and added_by like '%"&search&"%'  or app=1 and added_date like '%"&search&"%' order by app_no desc "
	producer_searchRs.Open producer_searchSql,conn,1,3
	
	if producer_searchRs.Eof then
		Session("hata")="Aradýðýnýz Sonuç Bulunamadý."
		Response.Redirect(Request.ServerVariables("HTTP_REFERER"))
	end if
	producer_searchRs.Pagesize = 4
	producer_searchRs.AbsolutePage = pg
	
	
	%>
	<table width="951" border="0" cellpadding="0" cellspacing="1">
		 <tr>
				<td><img src="images/buttons/producer.jpg" width="118" height="26" /></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=producer&section=ad_d"><img src="images/buttons/a2.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><a href="default.asp?cat=producer&section=search"><img src="images/buttons/a3.jpg" width="118" height="26" border="0"/></a></td>
				<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
				<td><%if pg=1 then%><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=producer&section=search_comp&search=<%=search%>&pg=<%=pg-1%>"><img src="images/buttons/a4.jpg" width="118" height="26" border="0"/></a><%end if%></td>
				<td>
				<%if CInt(pg)=CInt(producer_searchRs.PageCount) then%><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/><%else%><a href="default.asp?cat=producer&section=search_comp&search=<%=search%>&pg=<%=pg+1%>"><img src="images/buttons/a5.jpg" width="118" height="26" border="0"/></a><%end if%></td>
	  </tr>
		  <tr>	
		  <%	  
		  for i=1 to producer_searchRs.PageSize
		  if producer_searchRs.Eof then exit for
		  %>
				<td colspan="2" valign="top" background="images/yazi_back.jpg">
					<table border="0" width="237" cellpadding="0" cellspacing="0">
						<tr>
							<td background="images/buttons/b1.jpg" width="118" height="26" align="center" style="border-right:#FFFFFF 1px solid;" class="icerikno"><%=producer_searchRs("app_no")%></td>
							<td background="images/buttons/b2.jpg" width="118" height="26"></td>
						</tr>
						<tr>
							<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_searchRs("img1")%>" width="118" height="118" border="0"/></td>
							<td height="118" style="border-top:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_searchRs("img2")%>" width="118" height="118" border="0"/></td>
						</tr>
						<tr>
							<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_searchRs("img3")%>" width="118" height="118" border="0"/></td>
							<td height="118" style="border-bottom:#FFFFFF 1px solid;"><img src="images/producer/<%=producer_searchRs("img4")%>" width="118" height="118" border="0"/></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Company :</span><br /><%=producer_searchRs("company")%></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Sector :</span><br /><%=producer_searchRs("sector")%></span></td>
						</tr>
						<tr> 
							<td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Country :</span><br /><%=producer_searchRs("country")%></td>
						</tr> 
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Link :</span><br /><a href="<%=producer_searchRs("link")%>" target="_blank">
			<%
			if Len(Trim(producer_searchRs("link")))>25 then
				txt=Left(producer_searchRs("link"),25)
				Response.Write(txt&"...")
			else
				Response.Write(producer_searchRs("link"))
			end if%></a></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added By :</span><br /><%=producer_searchRs("added_by")%></td>
						</tr>
						<tr> 
							 <td height="50" colspan="2" background="images/yazi_back.jpg" class="iceriktablo"><span class="tablobaslik">Added Date :</span><br /><%=producer_searchRs("added_date")%></td>
						</tr>
				  </table>
				
				</td>
			<%
			producer_searchRs.Movenext
			Next
			producer_searchRs.Close
			Set producer_searchRs = Nothing
			%>
		  </tr>
	</table>

<%end if%>