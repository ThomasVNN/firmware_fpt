<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" type="text/css" href="/style.css">
		<style  type="text/css">
			*{color:  #404040;}

		</style>

		<script type='text/javascript'>
			function onClickRunWizard() 
			{
				<%if tcWebApi_get("WebCustom_Entry","isISPWizard","h") = "Yes" then%>
					window.open("/cgi-bin/wizardset.asp","OpenClose","toolbar=no,menubar=no,height=430,width=520,location=0,left=100,top=100");
				<%else%>
					window.open("/cgi-bin/wizardset.asp","OpenClose","toolbar=no,menubar=no,height=400,width=520,location=0,left=100,top=100");
				<%end if%>
			    	return false;
			}
		</script>
	</head>

	<body>
		<div id="pagestyle"><!--cindy add for border 11/28-->
		   <div id="contenttype">
			<div id="block1"><!--cindy add for id="block1" 12/05-->
				<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="margin:5px 0;">
					<tr height="25px" style="width:100%;background:#e6e6e6;">
						<td width="250px" align=left class="title-main" style="padding-left:20px;"><% tcWebApi_get("String_Entry","HelpIndexQuickText","s") %></td>
					</tr>
				</table>

				<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
				  	<tr>
				    		<td width="20">&nbsp;</td>
				   		<!-- <td class="databold" style="padding-right:30px;padding-bottom:10px;">-->
				    		<td class="databold" style="padding-right:20px;text-align:justify;text-justify:auto;">  <!--gleaf modified-->
				    			<%If tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>
				    				<% tcWebApi_get("String_Entry","HelpHomeXPONWizardText","s") %>
				    			<%else%>
				     				<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
				     					<% tcWebApi_get("String_Entry","HelpHomeVDSLWizardText","s") %>
				     				<%else%>
				     					<% tcWebApi_get("String_Entry","HelpHomeADSLWizardText","s") %>
				     				<%end if%>
				    			<%End If%>
				    		</td>
				  	</tr>
				</table>
			</div><!--cindy add for id="block1" 12/05-->
			<!-- saffi modified start -->
			<div id="button0"><!--cindy add for id="button0" 12/05-->
				<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
					<tr height="25px">		
						<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;">
							<%tcWebApi_get("String_Entry","ClickButtonRunWizardText","s")%>
						</td>
					</tr>
				</table>

				<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
					 <tr height="40px">
					 	<td  align="left" class="tabdata" style="padding-left:20px;">
					 		<INPUT type=button value="<% tcWebApi_get("String_Entry","ButtonRunWizardText","s") %>" name=wizard  class="button1" onclick="onClickRunWizard()">
					 	</td>
					 </tr>
				</table>
			</div><!--cindy add for id="button0" 12/05-->
		  </div><!--id=contenttype-->
		</div><!--cindy add for border 11/28-->

		<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
			<table width="690" border="0" cellpadding="0" cellspacing="0">
				<tr height="30">
					<td width="20">&nbsp;</td>
					<td width="250">&nbsp;</td>
					<td width="420"></td>
				</tr>	
				<tr>
					<td align=center colSpan=3 style="background-color:transparent;font-family: Arial,Helvetica,sans-serif;"><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%> </font></td>
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
