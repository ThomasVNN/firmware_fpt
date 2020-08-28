<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
		<link rel="stylesheet" type="text/css" href="/style.css">
		
	</head>

	<body text=#000000 bgcolor=#ffffff>
		<div id="pagestyle"><!--cindy add for border 11/28-->
		<div id="contenttype">
			<tbody>
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640" style="margin:5px 0px;"  >
			  			<tr height="25px" class="bgcolor">
							<td style="padding-left:20px;">
								<span class="help-header">
			    						<%tcWebApi_get("String_Entry","HelpIndexAccManageText","s")%>
								</span>
							</td>
			  			</tr>
					</table>
				</div>
<!--cindy delete 09/06
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"   >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexACLText","s")%>
							      	</span><br>
							      	<span class="help-text">
									<%if tcWebApi_get("WebCustom_Entry","isCwmpVDSLSupport","h") <> "Yes" then%> 
										<%tcWebApi_get("String_Entry","HelpAccessTip0Text","s")%>	   
									<%End if%>
									<%if tcWebApi_get("WebCustom_Entry","isCwmpVDSLSupport","h") = "Yes" then%> 
										<%tcWebApi_get("String_Entry","HelpAccessTip6Text","s")%>	   
									<%End if%>
						  		</span>
					    		</td>
					  	</tr>
					</table>
				</div>
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"  >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexIPFilterText","s")%>
							      	</span><br>
							      	<span class="help-text">
							        	<%tcWebApi_get("String_Entry","HelpAccessTip1Text","s")%>
							      	</span> 
					    		</td>
					  	</tr>
					</table>
				</div>
-->
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"  >                                                     
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
					      			<span class="help-main">
					      				<%tcWebApi_get("String_Entry","HelpIndexSNMPText","s")%>
					      			</span><br>
					      			<span class="help-text">
					      				<%tcWebApi_get("String_Entry","HelpAccessTip2Text","s")%>
					      			</span> 
					    		</td>
					  	</tr>
					</table>
				</div>
			                                                                  
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640" style="padding-left:20px;padding-right:20px;"   >                                                               
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexUPnPText","s")%>
								</span><br>
							      	<span class="help-text">
							      		<%tcWebApi_get("String_Entry","HelpAccessTip3Text","s")%>
							      		<!-- Foxconn alan add -->
							      		<%tcWebApi_get("String_Entry","HelpAccessTip3TextExt","s")%>
							      		<%tcWebApi_get("String_Entry","HelpAccessTip4Text","s")%>   
							      	</span> 
					    		</td>
					  	</tr>
					</table>
				</div>
			                                                                            
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"  >                                                                         
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexDDNSText","s")%>
							      	</span><br>
							      	<span class="help-text">
							      		<%tcWebApi_get("String_Entry","HelpAccessTip5Text","s")%>
							      	</span> 
					    		</td>
					  	</tr>
					</table>  
				</div>
<!--cindy add Filter information 09/06-->
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"  >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexIPFilterText","s")%>
							      	</span><br>
							      	<span class="help-text">
							        	<%tcWebApi_get("String_Entry","HelpAccessTip1Text","s")%>
							      	</span> 
					    		</td>
					  	</tr>
					</table>
				</div>
<!--cindy add Filter information 09/06-->
			</tbody>
			</div>
		</div><!--cindy add for border 11/28-->		
		
			<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
				<table width="690" border="0" cellpadding="0" cellspacing="0">
					<tr height="30">
						<td width="20">&nbsp;</td>
						<td width="250">&nbsp;</td>
						<td width="420"></td>
				        </tr>	
			           	<tr>
						<td align=center colSpan=3 style="color:#404040;background-color:transparent;font-family: Arial,Helvetica,sans-serif;"><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%> </font></td>
			        	</tr>
					<tr height="10">
						<td width="20">&nbsp;</td>
						<td width="250">&nbsp;</td>
						<td width="420"></td>
			        	</tr>
	                	</table>
	        	<%end if%>
	</body>
</html>
