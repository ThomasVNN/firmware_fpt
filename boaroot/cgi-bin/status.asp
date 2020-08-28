<%
	if request_Form("StatusActionFlag") <> "" then
		tcWebApi_set("LanguageSwitch_Entry","Type","StatusActionFlag")
		tcWebApi_commit("LanguageSwitch_Entry")	
	end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" lang="utf-8" dir="ltr">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv="Content-Type" content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<link rel="stylesheet" type="text/css" href="/style.css" tppabs="http://192.168.1.1/css/style.css">
		<style type="text/css">
			<%if tcwebApi_get("LanguageSwitch_Entry","Type","h")="1" then%>
				#menu li
				{
				       list-style-type:none;
					float:left;
					padding:0;
					margin:0;
				}
			<%else%>
				#menu li
				{
				       list-style-type:none;
					float:left;
					padding:0;
					margin:0;
				}
			<%end if%>

			#menu li a
			{
				font-size:18px;
				font-weight:bold;
				font-family:Arial,Helvetica,sans-serif;
				padding:0;
				margin:0;
			}
			
			#menu li a:hover
			{
			 	background-color:#FF9933;
			}
			
			#webgui a:hover
			{
			  	background-color:#FF9933;
			}
			
			#logoutstyle table :hover
			{
			 	background-color:#FF9933;
			}
			
			#languagestyle
			{
				cursor:pointer;
				color: #fff;
				font:bold 17px Arial,Verdana,sans-serif;
				background-color:#38A7DC;				
				margin-left:10px;
				padding:0 5px 4px 5px;
				vertical-align:middle;
			}
			
			#logoutstyle
			{
				cursor:pointer;
				color: #fff;
				font:bold 15px Arial,Verdana,sans-serif;
				margin:0px;
				padding:0;
			}
			
			#menu
			{			
				width:690;
				height:65px;
				padding:0;
				margin:0;
				float:right;
			}

			.current
			{
				display:block;
				background-color:#1a6f98;
				background-position:center;
				padding:0;
				margin:0;
				width:115px;
				height:65px;
				text-align:center;
				line-height:65px;
				text-decoration:none;
				outline:0;
				color:#fff;
			}
				
			.other
			{
				display:block;
				background-color:#38A7DC;
				background-position:center;
				padding:0;
				margin:0;
				width:115px;
				height:65px;
				text-align:center;
				line-height:65px;
				text-decoration:none;
				outline:0;
				color:#fff;
			}

			.style-select select
			{
			   background: #FFFFFF;
			   width: 110px;
			   font-size: 14px;
			   border: 1px solid #38A7DC;
			   height: 27px;
			   color: #38A7DC;
			   padding:3px;
			   position:relative; z-index:1;
			   appearance:none;
			   -moz-appearance:none;/*for Firefox*/
			   -webkit-appearance: none; /*for chrome and Safari*/
			}	
			.dispear
			{
  			  width: 20px;
   			  height: 20px;
    			  background: #FFF;
   			  position: relative;
  			  z-index: 4;
    			  left: -4px;
    			  top: -23px;
			}
		</style>

		<script language="javascript">
			<%if request_Form("StatusActionFlag") <> "" then %>
				window.top.location='index.asp';
			<%end if%>
				
			function doSubmit()
			{
			<%if tcwebApi_get("LanguageSwitch_Entry","Type","h")="2" then%>
				index=1;
			<%elseif tcwebApi_get("LanguageSwitch_Entry","Type","h")="1" then%>
				index=2;
			<%end if%>
				document.forms[0].StatusActionFlag.value = index;
				document.forms[0].submit();
			}

			<%if tcwebApi_get("WebCustom_Entry","isSupportLogout","h")="Yes" then%>
				function delCookie(name)
				{  
					var exp = new Date();  
					exp.setTime(exp.getTime() - 10000);  
					document.cookie = name + "=del;path=/;expires=" + exp.toGMTString();  
				}
			
				function doLogout()
				{
					delCookie("uid");
					delCookie("psw");
					//top.location.replace("/cgi-bin/login.asp");
					//cindy add because https is invalid 
					top.window.location.href="/cgi-bin/login.asp";
					//cindy add because https is invalid 
					document.cookie = "logout=1;path=/;";
					document.status_form.submit();
				}

				function transferpage()
				{
					top.test.nav.location="/cgi-bin/status_deviceinfo.asp"; 
				}
			<%end if%>

			function change_bg1(obj)
			{
			   	window.top.nav.location="/cgi-bin/navigation.asp";
			    	var a=document.getElementById("menu").getElementsByTagName("a");
			    	for(var i=0;i<a.length;i++)
			    	{
			    		a[i].className="other";
			    	}
			    	obj.className="current";
			}

			function change_bg2(obj)
			{
			    	window.top.nav.location="/cgi-bin/navigation-basic.asp";
			    	var a=document.getElementById("menu").getElementsByTagName("a");
			    	for(var i=0;i<a.length;i++)
			    	{
			        	a[i].className="other";
			    	}
			    	obj.className="current";
			}

			function change_bg3(obj)
			{
			    	window.top.nav.location="/cgi-bin/navigation-advanced.asp";
			    	var a=document.getElementById("menu").getElementsByTagName("a");
			    	for(var i=0;i<a.length;i++)
			    	{
			        	a[i].className="other";
			    	}
			    	obj.className="current";
			}

			function change_bg4(obj)
			{
			    	window.top.nav.location="/cgi-bin/navigation-access.asp";
			    	var a=document.getElementById("menu").getElementsByTagName("a");
			    	for(var i=0;i<a.length;i++)
			    	{
			        	a[i].className="other";
			    	}
			    	obj.className="current";
			}
			
			function change_bg5(obj)
			{
			    	window.top.nav.location="/cgi-bin/navigation-maintenance.asp";
			    	var a=document.getElementById("menu").getElementsByTagName("a");
			    	for(var i=0;i<a.length;i++)
			    	{
			       	a[i].className="other";
			    	}
			    	obj.className="current";
			}
			
			function change_bg6(obj)
			{
			    	window.top.nav.location="/cgi-bin/navigation-status.asp";
			    	var a=document.getElementById("menu").getElementsByTagName("a");
			    	for(var i=0;i<a.length;i++)
			    	{
			        	a[i].className="other";
			    	}
			    	obj.className="current";
			}
			
			function change_bg7(obj)
			{
			    	window.top.nav.location="/cgi-bin/navigation-help.asp";
			    	var a=document.getElementById("menu").getElementsByTagName("a");
			    	for(var i=0;i<a.length;i++)
			    	{
			        	a[i].className="other";
			    	}
			    	obj.className="current";
			}
		</script>
	</head>

	<body>
		<form METHOD="POST" action="/cgi-bin/status.asp" name="status_form">
			<table width="956" height="5" border="0" cellpadding="0" cellspacing="0" bgcolor="#38A7DC" style="margin:0 auto;">
			  	<tr>
			    		<td></td>
			  	</tr>
			</table>
			
			<table width="956" height="5" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
			  	<tr>
			    		<td></td>
			  	</tr>
			</table>
			
		<div id="webgui">
		    	<table border="0" width="956" height="35" cellspacing="0" cellpadding="0" style="margin:0 auto;">
		  		<tr>
					<td align=right valign="top">	
							<!-- Foxconn alan modify language change start -->
							<%if tcwebApi_get("WebCustom_Entry","isC1ZYSupported","h") <> "Yes" then%>
								<INPUT TYPE="HIDDEN" NAME="StatusActionFlag" VALUE="">
								<%if tcwebApi_get("WebCustom_Entry","isChineseOnlySupport","h")<>"Yes" then%>	
									<%if tcwebApi_get("WebCustom_Entry","isMultiLanguageSupport","h")="Yes" then%>	
									<!--
							  			<%if tcwebApi_get("LanguageSwitch_Entry","Type","h")="1" then%>
									 		<a id="languagestyle" NAME="StatusEngBTN" onclick="doSubmit(2);"><%tcWebApi_get("String_Entry","ButtonEnglishText","s")%></a>
									  	<%elseif tcwebApi_get("LanguageSwitch_Entry","Type","h")="2" then%>
									  		<a id="languagestyle" NAME="StatusTurBTN" onclick="doSubmit(1);"><%tcWebApi_get("String_Entry","ButtonTurkeyText","s")%></a>
							  			<%end if%>
							  		-->
							  		<div class="style-select">
							  			<select size="1" onchange="doSubmit()">
							  			<option <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ButtonEnglishText","s")%></option>
							  			<option <% if tcWebApi_get("LanguageSwitch_Entry","Type","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ButtonTurkeyText","s")%></option>
							  			</select>
							  		</div>
							  		<div class="dispear"></div>
									<%end if%>
								<%end if%>
							<%end if%>
							<!-- Foxconn modify end -->
						</td>
						<td align=right  style="vertical-align:top;width:105px;">
							<!--
							<%if tcwebApi_get("WebCustom_Entry","isSupportLogout","h")="Yes" then%>
								<span id="logoutstyle" onclick="doLogout();">&nbsp;&nbsp;<%tcWebApi_get("String_Entry", "LogoutText", "s")%></span>
							<%end if%>
							-->
							<%if tcwebApi_get("WebCustom_Entry","isSupportLogout","h")="Yes" then%>
							<div id="logoutstyle" onclick="doLogout();">
							<table bgcolor="#38A7DC" border="0" cellpadding="0" cellspacing="0">
								<tr>
										<td style="padding:2px 0 2px 4px;"><img src="/icon.png"></td>
										<td style="padding:2px 4px 2px 0;"><%tcWebApi_get("String_Entry", "LogoutText", "s")%></td>
								</tr>
							</table>
						</div>
							<%end if%>
					</td>
				</tr>
			</table>
			</div>

		 	<table  id="mainnavibar" width="956" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
				<tr>
				    	<%if tcWebApi_get("WebCustom_Entry","isC1ZYSupported","h") = "Yes" then%>
				    		<td width="160" height="100"  valign=middle class="light-blue" style="padding-left:16px;">
				    	<%else%>
				    		<td width="160" height="100"  valign=middle style="padding-left:16px;">
				    	<%end if%>				    	
				    			<div align=left>
							  	<%if tcWebApi_get("WebCustom_Entry","isC5HENSFUSupported","h") <> "Yes" then%>
									<img src="/logo.png" tppabs="logo.png" width="160" height="100">
								<%else%>
									<img src="/logo.jpg" tppabs="logo.jpg" width="160" height="100">
								<%end if%>
							</div>
						</td>

					<td width="2px">&nbsp;&nbsp;</td>			
					<td  style="vertical-align:center;">
						<ul  id="menu">
							<!--cindy modify 11/24-->
							<% tcWebApi_set("dynDisp_Entry", "CurPage", "6")%>
							<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit6","h") = "1" THEN%>
					        		<li>
					        			<a href=# class="current" 
								        	<% tcWebApi_set("dynDisp_Entry", "CurPage", "6")%>
								        	<%if tcwebApi_get("WebCustom_Entry","isCZOTESupported","h")="Yes" then%>        	   	
								        		onclick="change_bg6(this);"
								        	<%else%>        	
								        		<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
								        			onclick="change_bg6(this);"
								        		<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
								        			onclick="change_bg6(this);"
								        		<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
								        			onclick="change_bg6(this);"
								        		<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
								        			<% IF tcWebApi_get("WebCustom_Entry","isVOIPSupported","h") = "Yes" THEN%>	
								        				<% IF tcWebApi_get("VoIPBasic_Common","SIPProtocol","h") <> "H.248" THEN%>
								        					onclick="change_bg6(this);"
								        				<%else%>
								        					onclick="change_bg6(this);"
								        				<%end if%>
								        			<%end if%>
								        		<% End if%>
										<% End if%>>
										<%tcWebApi_get("String_Entry","NavigationStatusText","s")%>
									</a>
								</li> 
							<% End if%>

							<!--cindy modify 11/24-->
							<!--
								<% tcWebApi_set("dynDisp_Entry", "CurPage", "0")%>
								<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit0","h") = "1" THEN%>
								        <li><a href=#  tppabs="navigation.html"  onclick="change_bg1(this);" class="other"><%tcWebApi_get("String_Entry","NavigationAccQuickText","s")%>&nbsp;<%tcWebApi_get("String_Entry","NavigationAccStartText","s")%></a></li>
								<%End if%>     
							-->
							
							<% tcWebApi_set("dynDisp_Entry", "CurPage", "1")%>
							
							<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit1","h") = "1" THEN%>
								<li>
									<a href=# class="other" 
										<% tcWebApi_set("dynDisp_Entry", "CurPage", "1")%>
										<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
											onclick="change_bg2(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
											onclick="change_bg2(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
											onclick="change_bg2(this);"
										<% End if%>>
										<%tcWebApi_get("String_Entry","NavigationAccNetworkText","s")%>
									</a>
								</li>
							<%End if %>

							<% tcWebApi_set("dynDisp_Entry", "CurPage", "2")%>
							
							<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit2","h") = "1" THEN%>
								<li>
									<a href=# class="other"
										<% tcWebApi_set("dynDisp_Entry", "CurPage", "2")%>
										<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
											onclick="change_bg3(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
											onclick="change_bg3(this;)"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
											onclick="change_bg3(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
											onclick="change_bg3(this)"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit4","h") = "1" THEN%>
											onclick="change_bg3(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit5","h") = "1" THEN%>
											onclick="change_bg3(this);"
										<% End if%>>
										<%tcWebApi_get("String_Entry","NavigationAccAdvancedText","s")%>
									</a>
								</li>
							<%End if %>
	
							<% tcWebApi_set("dynDisp_Entry", "CurPage", "3")%>
							
							<%IF tcWebApi_get("dynDisp_Entry","MainMaskBit3","h") = "1" THEN %>
								<li>
									<a href=#  class="other" 
										<% tcWebApi_set("dynDisp_Entry", "CurPage", "3")%>	
										<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
											<% If tcWebApi_get("WebCustom_Entry","isSNMPFunSupported","h") = "Yes" then %>
												onclick="change_bg4(this);"
											<%Else %> 
												onclick="change_bg4(this);"
											<%End if %> 
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
											onclick="change_bg4(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
											onclick="change_bg4(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
											onclick="change_bg4(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit4","h") = "1" THEN%>
											onclick="change_bg4(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit5","h") = "1" THEN%>
											onclick="change_bg4(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit6","h") = "1" THEN%>
											onclick="change_bg4(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit7","h") = "1" THEN%>
											<% If tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then %>
												<%If tcWebApi_get("WebCustom_Entry", "isXponDASANSupported", "h") = "Yes" then%>
													onclick="change_bg4(this);"
												<%elseif tcWebApi_get("WebCustom_Entry", "isC1ZYSupported", "h") = "Yes" then%>
													onclick="change_bg4(this);"
												<%else%>
													onclick="change_bg4(this);"
												<%End If%>
											<% End if %>
										<% End if%>>
										<%tcWebApi_get("String_Entry","NavigationStatusAccessText","s")%>
									</a>
								</li>
							<% End if%>
								
							<% tcWebApi_set("dynDisp_Entry", "CurPage", "4")%>
							
							<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit4","h") = "1" THEN%>
								<li>
									<a href=# class="other"
										<% tcWebApi_set("dynDisp_Entry", "CurPage", "4")%>
										<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
											onclick="change_bg5(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
											onclick="change_bg5(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
											onclick="change_bg5(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
											onclick="change_bg5(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit4","h") = "1" THEN%>
											onclick="change_bg5(this);"
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit5","h") = "1" THEN%>
											onclick="change_bg5(this);"
										<% End if%>>
										<%tcWebApi_get("String_Entry","NavigationAccMaintenanceText","s")%>
									</a>
								</li>
							<%End if%>
		
							<% tcWebApi_set("dynDisp_Entry", "CurPage", "5")%>
							
							<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit5","h") = "1" THEN%>
								<li>
									<a href=# class="other" 
										<% tcWebApi_set("dynDisp_Entry", "CurPage", "5")%>
										<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
											<% IF tcWebApi_get("VoIPBasic_Common","SIPProtocol","h") <> "H.248" THEN%>
												onclick='javascript:top.main.location="/cgi-bin/voip_basic1.asp"'
											<%else%>
												onclick='javascript:top.main.location="/cgi-bin/voip_basic1_Megaco.asp"'
											<% End if%>
										<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
											<% IF tcWebApi_get("VoIPBasic_Common","SIPProtocol","h") <> "H.248" THEN%>
												onclick='javascript:top.main.location="/cgi-bin/voip_advanced1.asp"'
											<%else%>
												onclick='javascript:top.main.location="/cgi-bin/voip_advanced1_Megaco.asp"'
											<% End if%>
										<% End if%>>
										<%tcWebApi_get("String_Entry","NavigationAccVoIPText","s")%>
									</a>
								</li>
							<%End if%>
							
							<!--	
								<% tcWebApi_set("dynDisp_Entry", "CurPage", "6")%>
								<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit6","h") = "1" THEN%>
							        	<li><a href=# style="color:#FF9933;"
							        	<% tcWebApi_set("dynDisp_Entry", "CurPage", "6")%>
							        	<%if tcwebApi_get("WebCustom_Entry","isCZOTESupported","h")="Yes" then%>        	   	
							        	onclick="change_bg6(this);"
							        	<%else%>        	
							        	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
							        	onclick="change_bg6(this);"
							        	<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
							        	onclick="change_bg6(this);"
							        	<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
							        	onclick="change_bg6(this);"
							        	<% elseif tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
							        	<% IF tcWebApi_get("WebCustom_Entry","isVOIPSupported","h") = "Yes" THEN%>	
							        	<% IF tcWebApi_get("VoIPBasic_Common","SIPProtocol","h") <> "H.248" THEN%>
							        	onclick="change_bg6(this);"
							        	<%else%>
							        	onclick="change_bg6(this);"
							        	<%end if%>
							        	<%end if%>
							        	<% End if%>
									<% End if%>
							        	><%tcWebApi_get("String_Entry","NavigationStatusText","s")%></a></li> 
								<% End if%>
							-->

							<% tcWebApi_set("dynDisp_Entry", "CurPage", "7")%>
							
							<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit7","h") = "1" THEN%>
							        <li>
							        	<a href=#  onclick="change_bg7(this);" class="other">
							        		<%tcWebApi_get("String_Entry","NavigationAccHelpText","s")%>
							        	</a>
							        </li>
							<% End if%>	
						</ul>
					</td>
				</tr>
			</table>

			<table width="956" height="20" border="0" cellpadding="0" cellspacing="0" style="margin:0 auto;">
			  	<tr>
			    		<td></td>
			  	</tr>
			</table>
			
		</form>	
	</body>
</html>
