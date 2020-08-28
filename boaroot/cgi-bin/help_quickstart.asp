<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
		<link rel="stylesheet" type="text/css" href="/style.css">
		
	</head>

	<body text=#000000>
		<div id="pagestyle"><!--cindy add for border 11/28-->
			<div id="contenttype">
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640" style="margin:5px 0px;">
 	 					<tr height="25px" class="bgcolor">
							<td style="padding-left:20px;">
						    		<span class="help-header">
						    			<%tcWebApi_get("String_Entry","HelpIndexQuickText","s")%>
						    		</span>
						    	</td>
						</tr>
					</table>
				</div>
				
				<div id="block1">		
					<table cellspacing=0 cellpadding=0 border=0 width="640">							
						<tr>
						    	<td style="text-align:justify;text-justify:auto;padding-left:20px;padding-right:20px;">
						      		<span class="help-text">
							    		<%tcWebApi_get("String_Entry","HelpQuickTip0Text","s")%>
								</span>
						    	</td>
						</tr>
					</table>
				</div>	
  			</div>
		</div><!--cindy add for border 11/28-->

		<table width="782" border="0" cellpadding="0" cellspacing="0">
			<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
				<tr height="32">
					<td width="60">&nbsp;</td>
					<td width="210">&nbsp;</td>
					<td width="432"></td>
				</tr>	

				<tr>
					<td align=center colSpan=3 style="background-color:transparent;font-family: Arial,Helvetica,sans-serif;"><font size=2 color="#404040"><%tcWebApi_get("String_Entry", "CopyrightText", "s")%> </font></td>
				</tr>
			<%end if%>
		</table>
	</body>
</html>
