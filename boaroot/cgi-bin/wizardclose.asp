<%
	tcWebApi_commit("Wan_PVC")
	tcWebApi_commit("Account_Entry")
	tcWebApi_commit("Timezone_Entry")
	tcWebApi_commit("Lan_Dhcp")
	tcWebApi_save()
%>

<html>
	<head>
		<title></title>
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="/style.css" type="text/css">
		<script type='text/javascript' src="/jsl.js"></script>
		<style type="text/css"></style>
		<script>
			function onClickclose()
			{
			    	window.parent.close();
			    	return false;
			}
		</script>
	</head>

	<body topmargin="10" leftmargin="0">
		<form name="wzCloseform" method="post">
			<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
			  	<tr>
			    		<td width="500" height="5" valign="baseline" class="orange"></td>
			  	</tr>
			</table>

			<table border="0" width="500" align="center" cellspacing="0" cellpadding="0">
			  	<tr>
			    		<td width="200" height="50" align="center" valign="middle" bgcolor="#FFFFFF"><div align="left"><img src="/logo.png" width="160" height="100"></div></td>
			    		<td width="300" height="50" align="right" valign="bottom" bgcolor="#FFFFFF" class="model">
				  		<%If tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" Then%>
				  			<%tcWebApi_get("String_Entry","XponInfoText","s")%>
				  		<%Else%>
							<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
								<%tcWebApi_get("String_Entry","VdslInfoText","s")%>/<%end if%>
							<%tcWebApi_get("String_Entry","AdslInfoText","s")%>
				   		<%End If%>
					</td>
			  	</tr>
			  	
			  	<tr>
			    		<td width="500" colspan="2" class="orange"> </td>
			  	</tr>
			</table>

			<table width="500" height="2" border="0" align="center" cellpadding="0" cellspacing="0" class="orange">
			  	<tr>
			    		<td class="orange"> </td>
			  	</tr>
			</table>

			<table width="500" height="35" border="0" align="center" cellpadding="0" cellspacing="0" color="#FF9933">
			  	<tr>
			    		<td width="500" bgcolor="#FFFFFF" class="headline">&nbsp;			    
			    			<%tcWebApi_get("String_Entry","WizardCompleteText","s")%>			    
			    		</td>
			  	</tr>
			</table>

			<table width="500" border="0" align="center" cellpadding="2" cellspacing="0" bgcolor="#FFFFFF">
			  	<tr>
			    		<td width="40">&nbsp;</td>
			    		<td colspan="2" class="tabdata">
				    		<span class="tabdata">			    
				    			<%tcWebApi_get("String_Entry","WizardSaveChangeText","s")%>			    
			    			</span>
			    		</td>
			  	</tr>

			  	<!--<tr>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			  	</tr>
			  	
			  	<tr>
			    		<td width="40">&nbsp;</td>
			    		<td width="150" class="tabdata" align="right">&nbsp;</td>
			    		<td width="310" class="tabdata" align="left">&nbsp;</td>
			  	</tr>
			  	
			  	<tr>
			    		<td width="40">&nbsp;</td>
			    		<td width="150" class="tabdata" align="right">&nbsp;</td>
			    		<td class="tabdata" align="left">&nbsp;</td>
			  	</tr>
			  	
			  	<tr>
			    		<td height="25"></td>
			  	</tr>-->
			</table>

			<table width="500" height="40" border="0" align="center" cellpadding="0" cellspacing="0" class="orange">
				<tr>
				    	<td class="orange">
				    		<div id="button0" align="right" style="width:500px">
							<INPUT onClick="onClickclose()" type=button class="button1" value="<% tcWebApi_get("String_Entry","ButtonCloseText","s") %>" name=close>        
						</div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>        
