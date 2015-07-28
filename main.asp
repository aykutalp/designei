<style type="text/css">
<!--
.style1 {	font-family: Verdana, Arial, Helvetica, sans-serif; padding-left:0px; padding-right:10px; 
	font-size: 12px;
	color: #FF0000;
	font-weight: bold;
}
.style6 {font-size: 12px; color: #000000; font-family: Verdana, Arial, Helvetica, sans-serif; padding-left:0px; padding-right:10px;}
-->
</style>

		<table width="951" border="0" cellpadding="0" cellspacing="1">
			 <tr>
					<td><img src="images/buttons/a1.jpg" width="118" height="26" /></td>
					<td><img src="images/buttons/a6.jpg" width="118" height="26" border="0" /></td>
					<td><img src="images/buttons/a1.jpg" width="118" height="26" /></td>
					<td><img src="images/buttons/a6.jpg" width="118" height="26" border="0" /></td>
					<td><img src="images/buttons/a1.jpg" width="118" height="26" /></td>
					<td><img src="images/buttons/a6.jpg" width="118" height="26" /></td>
					<td><img src="images/buttons/a1.jpg" width="118" height="26" /></td>
					<td><img src="images/buttons/a6.jpg" width="118" height="26" border="0" /></td>
		  </tr>
			
							<tr>
								<td background="images/buttons/b1.jpg" width="118" height="26" align="center" class="icerikno"></td>
								<td background="images/buttons/b2.jpg" width="118" height="26"><a href="http://www.google.com" target="_blank"><img src="images/buttons/b2.jpg" width="118" height="26" border="0" /></a></td>
								<td background="images/buttons/b1.jpg" width="118" height="26" align="center" class="icerikno"></td>
								<td background="images/buttons/b2.jpg" width="118" height="26"><a href="http://www.seslisozluk.com/" target="_blank"><img src="images/buttons/b2.jpg" width="118" height="26" border="0" /></a></td>
								<td background="images/buttons/b1.jpg" width="118" height="26" align="center" class="icerikno"></td>
								<td background="images/buttons/b2.jpg" width="118" height="26"><a href="http://tr.wikipedia.org/wiki/Ana_Sayfa" target="_blank"><img src="images/buttons/b2.jpg" width="118" height="26" border="0" /></a></td>
								<td background="images/buttons/b1.jpg" width="118" height="26" align="center" class="icerikno"></td>
								<td background="images/buttons/b2.jpg" width="118" height="26"><a href="http://www.istanbultasarimmerkezi.org" target="_blank"><img src="images/buttons/b2.jpg" width="118" height="26" border="0" /></a></td>
							</tr>
							<tr valign="top">
							<%
							Set Rsdesignmain = Server.CreateObject("Adodb.RecordSet")' Desing Kýsmý
							Sqldesignmain = "Select  top 1 * from design where app=1 order by app_no desc"
							Rsdesignmain.Open Sqldesignmain,conn,1,3
							
							Set Rsdesignermain = Server.CreateObject("Adodb.RecordSet") ' Designer Kýsmý
							Sqldesignermain = "Select  top 1 * from designer where app=1 order by app_no desc"
							Rsdesignermain.Open Sqldesignermain,conn,1,3
							
							Set Rsinspiremain = Server.CreateObject("Adodb.RecordSet") ' Inspire Kýsmý
							Sqlinspiremain = "Select  top 1 * from inspire where app=1 order by app_no desc"
							Rsinspiremain.Open Sqlinspiremain,conn,1,3
							
							Set Rsmagazinemain = Server.CreateObject("Adodb.RecordSet") ' Video Kýsmý
							Sqlmagazinemain = "Select  top 1 * from magazine where app=1 order by app_no desc"
							Rsmagazinemain.Open Sqlmagazinemain,conn,1,3
							%>
								<td colspan="2"><img src="images/design/<%=Rsdesignmain("img")%>" width="237" height="237" border="0"/></td>
								<td colspan="2" >
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
									  <tr>
										<td style="border-right:#FFFFFF 1px solid; border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=Rsdesignermain("img1")%>" width="118" height="118" border="0"/></td>
										<td style="border-bottom:#FFFFFF 1px solid;"><img src="images/designer/<%=Rsdesignermain("img2")%>" width="118" height="118" border="0"/></td>
									  </tr>
									  <tr>
										<td style="border-right:#FFFFFF 1px solid;"><img src="images/designer/<%=Rsdesignermain("img3")%>" width="118" height="118" border="0"/></td>
										<td><img src="images/designer/<%=Rsdesignermain("img4")%>" width="118" height="118" border="0"/></td>
									  </tr>
							  </table>							  </td>
								<td colspan="2"><img src="images/inspire/<%=Rsinspiremain("img")%>" width="237" height="237" border="0"/></td>
								<td colspan="2"><img src="images/magazine/<%=Rsmagazinemain("img")%>" width="237" height="237" border="0"/></td>
		  </tr>
							<tr> 
								<td height="120" colspan="2" valign="top" background="images/yazi_back.jpg" class="iceriktablo">
								<p class="style1">&nbsp;</p>
								<p class="style1">Designei About </p>								
								<p class="style6">DESIGNEI that is English digital publishing of Portal  Group is established for sharing information between professional and amateur  world designers. It comprises all of the art and design disciplines. Designers  and artists from all over the world who can use simple English words can easily  understand the site without having advanced level of English. All of the  sharing is being done by means of (Single Word) <strong>TAG</strong>. Thanks to this system; you  can carry TAG from internet search engines to the design and you can carry TAG from design to the search engines. And you can also conduct your searches. The  site which aims to provide exact knowledge sharing also aims to provide  communication between designers. It is valid for all intended users. You can  add any information to the portal quickly which do not require any membership.  And you can use the information which is formerly added on portal.</p>
								<p class="style6">&nbsp;</p>
							  <p class="style6">&nbsp;</p></td>
								<td height="120" colspan="2" valign="top" background="images/yazi_back.jpg" class="iceriktablo"><p class="style1">&nbsp;</p>
								  <p class="style1">Use Designei </p>
								  <p class="style6">The portal aims to reach the exact information  with quickest way. You can add information to the portal by means of reading  the following <strong>ADD</strong> part, obtain information from the portal by means of reading  <strong>SEARCH</strong> part and you can join our team by means of reading <strong>EDITOR SHIP</strong> menu. </p>
								  <p class="style1">For Add </p>
							      <p class="style6">You can add your ideas and information that you  want to share. Firstly, you must enter the category where you want to add  information. Please fill the visual and text form completely which appears on  the screen by means of clicking the ADD button of the part. Your information  will be published in two days if it is regarded as suitable.</p>
							      <p class="style1">For Search</p>
							      <p class="style6">You must enter the part where you want to  conduct search. Please fill the search form by means of clicking the SEARCH  button. The information that you search will come on the screen quickly.</p>
							      <p class="style1">For 


 Editor Ship </p>
							      <p align="left" class="style6">If you want to join our  team you can send e-mail to the address of <a href="mailto:editor@designei.com">editor@designei.com</a></p>
							  <p align="left" class="style6">&nbsp;                              </p></td>
								<td height="120" colspan="2" valign="top" background="images/yazi_back.jpg" class="iceriktablo"><p>&nbsp;</p>
							    <p class="style1">Design Disciplines </p>
						        <p class="style6"><strong>Architecture Design</strong> <br />
					          Architecture, master planning, landscape, urban, restoration, interior design.</p>
						        <p><span class="style6"><strong>Industrial Design</strong></span><br />
						        <span class="style6">Furniture, object (glass, metal,  plastic, ceramics, porcelain, wood, mixed material), lighting, appliance, transportation, game and toy, packaging (except paper), bath, cosmetic, food. </span></p>
						      <p class="style6"><strong>Graphic Design</strong><br />
						        Identity, printing, editorial, advertising, web,  packaging (paper), typefaces, illustration, cartoon, comics.&nbsp; </p>
						      <p class="style6"><strong>Production Design</strong><br />
						        Photography, cinema, broadcast, animation,  short film, advertising</p>
						      <p class="style6"><strong>Fashion Design</strong><br />
						        Casual wear, evening wear, night  wear, sleeping wear, houte coutere, sports wear, lingerie, swim wear, child wear, wedding wear, costume. </p>
						      <p class="style6"><strong>Accessories</strong><br />
						        Bijouterie, silver jewellery,  gold jewellery, diamond, gemstone,kid jewellery,pets jewellery, watch, shoes, bag, hat, eyewear, personal  object.</p>
						      <p class="style6"><strong>Islamic Arts</strong><br />
						        Islamic caligraphy, miniature painting, illuminate, marbling. </p>
						      <p>&nbsp;</p></p></td>
								<td height="120" colspan="2" valign="top" background="images/yazi_back.jpg" class="iceriktablo"><p>&nbsp;</p>
							    <p><span class="style1">Parts:</span></p>
					            <p class="style6">You can look at the designs which are being  published in the <strong>Design</strong> part or you can add your designs or other designer&rsquo;s  works that you like.In the <strong>Designer</strong> Part, you can look at  photographs and their selected 3 designs which belong to best designers of the  world so that you can gain information about them. Moreover, you can look at  your and other designer&rsquo;s information.&nbsp; </p>
					            <p class="style6">You can reach the world&rsquo;s best producers&rsquo;  information who is interested with design and designer. Thus, you can add your  favourite <strong>Producer</strong> and share him/her with other designers. </p>
					            <p class="style6">In the <strong>Magazine</strong> part, you can visit news about  design. Moreover, you can reach information about publishing, exhibitions,  fairs, competitions, congresses, seminars, portals, schools and museums. In the  <strong>Video</strong> part, you can watch videos about designs from all over the world and add  your own videos here. In the<strong> Culture </strong>part, even not directly related with  design, you can follow the films, books, magazine and music albums which  improves designers as culturally. So that you can share the cultural works with  your colleagues which is beneficial for you. You can communicate with our team  with the <strong>Contact</strong> part.</p>
				                <p class="style6">&nbsp;</p></td>
			  </tr>
							<tr>
                              <td height="120" colspan="2" valign="top" background="images/yazi_back.jpg" class="iceriktablo"><p class="style1">&nbsp;</p>
                                  <p class="style1">Designei  </p>
                                  <p class="style6">Portal grubunun ingilizce dijital yayini olan DESIGNEI,
                                  
                                  profesyonel ve amator dunya tasarimcilari arasinda bilgi paylasimini saglamak icin kurulmustur. </p>
                                <p class="style6"> Butun tasarim ve sanat disiplinlerini icermektedir. 
                                  
                                  Bu tasarim portali ingilizce oldugu halde ingilizce bilmeden kullanilabilecek sekilde tasarlanmistir. 
                                  
                                  Portalin icinde tek bir ingilizce cumle yoktur. Butun bilgiler ingilizce kelimeler uzerinden paylasilmaktadir. 
                                  
                                  Ingilizce sozluk kullanan her milletten tasarimci ve sanatci ingilizceye hakim olmasi gerekmeden bilgi paylasabilir 
                                  
                                  ve bilgi ihtiyacini karsilayabilir. Butun paylasim <strong>TAG</strong> (Tek Kelime) lar uzerinden gerceklestirilmektedir.
                                  
                                  Bu sistem sayesinde internet arama motorlarlarindan designei ye, designei den arama motorlarina TAG tasiyabilir 
                                  
                                  arasatirmalariniza devam edebilirsiniz. </p>
                                <p class="style6">Do&#287;ru bilgi payla&#351;&#305;m&#305;n&#305; hedefleyen, profosyonel ve amat&ouml;r tasar&#305;mc&#305;lar&#305; bir araya getirmeyi ama&ccedil;lamaktad&#305;r. &#304;steyen t&uuml;m kat&#305;l&#305;mc&#305;lara a&ccedil;&#305;kt&#305;r.&Uuml;yelik Sistemi Olmayan portal&#305;m&#305;za payla&#351;mak istedi&#287;iniz bilgileri hemen ekleyebilir, Portaldaki mevcut bilgilerden yararlanabilirsiniz.</p>
                                <p class="style6">&nbsp;</p></td>
							  <td height="120" colspan="2" valign="top" background="images/yazi_back.jpg" class="iceriktablo"><p class="style1">&nbsp;</p>
							      <p class="style1">Designei Kullan&#305;m&#305; </p>
							    <p class="style6">Tasarim portallarimiz dogru bilgiye hizla ulasamayi amaclamistir.
							      
							      Asagidaki 
							      
							      <strong>&quot;Add (Ekle)&quot;</strong> bolumunu okuyarak portala bilgi girebilir,
							      
							      <strong>&quot;Search (Ara)&quot;</strong> bolumu okuyarak portaldan bilgi alabilir,
							      
							      <strong>&quot;Editor Ship (Editorluk)&quot;</strong> bolumunu okuyarak ekibimize katilabilirsiniz.</p>
							    <p class="style1">Add (Ekle) </p>
							    <p align="left" class="style6">Paylasmak istediginiz bilgileri ve fikirlerinizi girebilirsiniz.
							      
							      Hangi bolume bilgi girmek isterseniz, once o bolume girmelisiniz.
							      
							      Bolumun ADD (EKLE) butonuna tiklayarak, 
							      
							      karsiniza cikan gorsel ve metin formunu eksiksiz doldurunuz.
							      
							      Doldurdugunuz bilgiler uygun oldugunda 2 gun icinde yayinlanacaktir.
							      . </p>
							    <p class="style1">Search (Ara)</p>
							    <p class="style6">Aramak istediginiz bilgileri ve fikirlerinizi arayabilirsiniz.
							      
							      Hangi bolumde arama yapmak istiyorsaniz, once o bolume girmelisiniz.
							      
							      Bolumun SEARCH (ARA) butonuna basarak, karsiniza gelen arama formunu doldurunuz.
							      
							      Aradiginiz bilgiler kisa yoldan onunuze gelecektir. </p>
							    <p class="style1">Editor Ship (Edit&ouml;rl&uuml;k)</p>
							    <p align="left" class="style6">Ekibimize katilmak icin <a href="mailto:editor@designei.com">editor@designei.com</a> adresine mail atabilirsiniz.</p>
							    <p align="left" class="style6">&nbsp; </p></td>
							  <td height="120" colspan="2" valign="top" background="images/yazi_back.jpg" class="iceriktablo"><p>&nbsp;</p>
							      <p class="style1">Tasar&#305;m  Disiplinleri </p>
						        <p class="style6"><strong>Mimari Tasar&#305;m </strong><br />
							      Mimarl&#305;k, b&ouml;lge planlama, peyzaj, &#351;ehir,restorasyon, i&ccedil; mimari </p>
							      <p class="style6"><strong>End&uuml;striyel Tasar&#305;m </strong><br />
							      Mobilya, obje ( cam, metal, plastik, seramik, porselen, ah&#351;ap, kar&#305;&#351;&#305;k materyal), ayd&#305;nlatma, cihaz, ula&#351;&#305;m arac&#305;, oyun ve oyuncak, ambalaj ( ka&#287;&#305;t materyal hari&ccedil; ), banyo, kozmatik, g &#305;da </p>
							      <p class="style6"><strong>Grafik Tasar&#305;m </strong><br />
							      Kurumsal kimlik, bask&#305;, yay&#305;n, reklam, web, ambalaj ( ka&#287;&#305;t materyal ), font, il&uuml;strasyon, karikat&uuml;r, &ccedil;izgi roman </p>
						        <p class="style6"><strong> Prod&uuml;ksiyon Tasar&#305;m&#305;</strong><br />
							      Foto&#287;raf, sinema, radyo televizyon, animasyon, k&#305;sa film, reklam</p>
							      <p class="style6"><strong> Moda Tasar&#305;m&#305;</strong><br />
							      G&uuml;nl&uuml;k k&#305;yafet, ak&#351;am k&#305;yafeti, gece k&#305;yafeti, uyku k&#305;yafeti, ki&#351;isel k&#305;yafet, spor k&#305;yafet, i&ccedil; &ccedil;ama&#351;&#305;r&#305;, mayo, &ccedil;ocuk k&#305;yafeti, evlilik k&#305;yafeti, kost&uuml;m </p>
							      <p class="style6"><strong> Tak&#305; ve Aksesuar Tasar&#305;m&#305;</strong><br />
							      Bijuteri, g&uuml;m&uuml;&#351; m&uuml;cevher , alt&#305;n m&uuml;cevher, p&#305;rlanta, de&#287;erli ta&#351;, &ccedil;ocuk tak&#305;lar&#305;, hayvan tak&#305;lar&#305;, saat, ayakkab&#305;, &ccedil;anta, &#351;apka, g&ouml;zl&uuml;k, ki&#351;isel obje</p>
							      <p class="style6"><strong>&#304;slam Sanatlar&#305; </strong><br />
							      Hat, minyat&uuml;r, tezhib, ebru</p>
							      <p>&nbsp;</p>
							    </p></td>
							  <td height="120" colspan="2" valign="top" background="images/yazi_back.jpg" class="iceriktablo"><p>&nbsp;</p>
							      <p><span class="style1">B&ouml;l&uuml;mler:</span></p>
							      <p class="style6"><strong>Design</strong> bolumunde sergilenen tasarimlari gezebilir,
							      
							      sizin yada begendiginiz baska tasarimcilarin tasarimlarini ekleyebilirsiniz.
							      
							        <strong>Designer</strong> bolumunde dunyanin en iyi tasarimcilarinin fotograflarini ve 
							      
							      secilmis 3 tasarimlarini cok kolay sekilde gorerek onlar hakkinda hizli fikir sahibi olabilir, 
							      
							      kendinizin yada baska tasarimcilarin bilgilerini girebilirsiniz.
							      
							        <strong>Producer</strong> bolumunde dunyanin tasarim ve tasarimci ile ilgilenen en iyi ureticilerinin bilgilerine ulasabilir, 
							      
							      sevdiginiz ureticiyi girerek diger tasarimcilar ile paylasabilirsiniz.
							      
							        <strong>Inspire</strong> bolumunde tasarim yaparken size ilham olabilecek goruntuler gorebilir,
							      
							      paylasmak istediginiz ilham goruntusunu bu bolume ekleyebilirsiniz.
							      
							        <strong>Magazine</strong> bolumunde tasarim ile ilgili haberlerin, sergilerin, fuarlarin, yarismalarin, kongrelerin, 
							      
							      seminerlerin, portallarin, okullarin, muzelerin, merkezlerin bilgilerini ziyaret edebilir, bildiklerinizi paylasabilirsiniz.
							      
							        <strong>Video</strong> bolumunde dunyada tasarim ile ilgili cekilmis videolari izleyebilir,
							      
							      kendi videolarinizi bu bolume girebilirsiniz.
							      
							        <strong>Culture</strong> bolmunde direkt tasarim ile ilgili olmasa da tasarimcilari kulturel olarak gelistiren 
							      
							      film, kitap, dergi, muzik albumlerini takip edebilir,
							      
							      size faydali olmus kulturel eserleri diger tasarimcilar ile paylasabilirsiniz.
							      
					              <strong>Contact</strong> bolumunde ekibimiz ile iletisime gecebilirsiniz.</p>
							      <p class="style6">&nbsp;</p></td>
		  </tr>
							
		</table>
	