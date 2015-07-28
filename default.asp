<!--#include file="security.asp"-->
<!--#include file="connection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="Designei, Design Eye Idea">
<meta name="keywords" content="Design, Designer, Designeei, Dizayn, Fashion, Industrial, Architectural, Artists, Graphic, Design Portal, Producer, inspire, magazine, video, istanbul Tasarım Merkezi, Tasarım, Turkey, Jewellery , Furniture, Fenerbahçe, Kitchen, Bath">
<meta http-equiv="Cache-Control" content="no-cache">
<meta name="verify-v1" content="Vedi1YMTaURfBxNZ/9Otv/DamvY3QYZ6C0peQREQbC0=" />
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-9" />
<title>DESIGNEI</title>
<style type="text/css">
<!--
.copy2008 {font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #666666;
}
body {
	background-color: #CCCCCC;
}
.tablobaslik {color: #FF0000;
	font-weight: bold;
}
.iceriktablo{font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif; padding-left:15px; }
.icerikno{font-size: 12px; font-family: Verdana, Arial, Helvetica, sans-serif; color:#FFFFFF; font-weight:bold; }
.img_note {font-family: Verdana, Arial, Helvetica, sans-serif; font-size:10px; color:#FF0000;}
.add_input{	
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	border:#999999 1px solid;
}
.add_submit{
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color:#FFFFFF;
	border:#CCCCCC 1px solid;
	background-color: #999999;
}
.alert_note {font-family: Verdana, Arial, Helvetica, sans-serif;  font-size:11px; color:#333333;}
.add_file{	
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	border:#999999 1px solid;
	width:190px;
}
.search_check {
	padding-left:50px;
	font-size: 12px; 
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
-->
</style>
</head>

<body topmargin="0">
<table width="200" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td rowspan="4"><img src="images/sol_sag.jpg" width="15" height="26" /></td>
    <td><img src="images/buttons/logos/banner.jpg" width="953" height="151" border="0" usemap="#Map" /></td>
    <td rowspan="4"><img src="images/sol_sag.jpg" width="15" height="26" /></td>
  </tr>
  <tr>
  	<td>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td style="border-right:#FFFFFF 1px solid;border-left:#FFFFFF 1px solid;"><a href="default.asp?cat=design"><img src="images/buttons/1.jpg" width="118" height="26" border="0"/></a></td>
			<td style="border-right:#FFFFFF 1px solid;"><a href="default.asp?cat=designer"><img src="images/buttons/2.jpg" width="118" height="26" border="0"/></a></td>
			<td style="border-right:#FFFFFF 1px solid;"><a href="default.asp?cat=producer"><img src="images/buttons/3.jpg" width="118" height="26" border="0"/></a></td>
			<td style="border-right:#FFFFFF 1px solid;"><a href="default.asp?cat=inspire"><img src="images/buttons/4.jpg" width="118" height="26" border="0"/></a></td>
			<td style="border-right:#FFFFFF 1px solid;"><a href="default.asp?cat=magazine"><img src="images/buttons/5.jpg" width="118" height="26" border="0"/></a></td>
			<td style="border-right:#FFFFFF 1px solid;"><a href="default.asp?cat=video"><img src="images/buttons/6.jpg" width="118" height="26" border="0"/></a></td>
			<td style="border-right:#FFFFFF 1px solid;"><a href="default.asp?cat=culture"><img src="images/buttons/7.jpg" width="118" height="26" border="0"/></a></td>
			<td style="border-right:#FFFFFF 1px solid;"><a href="concak.asp"><img src="images/buttons/8.jpg" width="118" height="26" border="0" /></a></td>
		  </tr>
	 </table>
 	</td>
  </tr>
  <tr>
    <td valign="top">
	<%cat=security(Request.QueryString("cat"))
	if cat="" or cat="main" then
	%>
		<!--#include file="main.asp"-->
	<%elseif cat="design" then%>
		<!--#include file="design.asp"-->
	<%elseif cat="designer" then%>
		<!--#include file="designer.asp"-->
	<%elseif cat="producer" then%>
		<!--#include file="producer.asp"-->
	<%elseif cat="inspire" then%>
		<!--#include file="inspire.asp"-->
	<%elseif cat="magazine" then%>
		<!--#include file="magazine.asp"-->
	<%elseif cat="video" then%>
		<!--#include file="video.asp"-->
	<%elseif cat="culture" then%>
		<!--#include file="culture.asp"-->
	<%end if%>
	</td>
  </tr>
  <tr>
    <td><div align="center">
      <p class="copy2008">&nbsp;</p>
      <p class="copy2008">Copyright © 2008 Istanbul Design Center </p>
      <p class="copy2008">&nbsp;</p>
    </div></td>
  </tr>
</table>

<map name="Map" id="Map">
  <area shape="rect" coords="603,64,758,145" href="http://www.istanbultasarimportali.com" />
<area shape="rect" coords="781,65,943,148" href="http://www.istanbultasarimmerkezi.com" />
<area shape="rect" coords="15,14,273,145" href="http://www.designei.com" />
<area shape="rect" coords="473,89,575,140" href="http://greatsinan.com/" />
</map>&nbsp;</body>
</html>
