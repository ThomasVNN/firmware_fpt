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
			function ExitWizard() 
			{
			    	if (confirm("<% tcWebApi_get("String_Entry","LoginFailJS0Text","s") %>")) 
			    	{
					window.parent.close();
				}
			}

			function uiSave()
			{
			  	if (document.wzPWform.uiViewPassword.value.length == 0)
			  	{
					alert("<% tcWebApi_get("String_Entry","ChangePasswordJS0Text","s") %>");
					return;
			  	}

				var password = document.wzPWform.uiViewPassword.value;
				
				<%if tcwebApi_get("WebCustom_Entry", "isCZTMSupported", "h")="Yes" Then%>
					if (password.length < 8 || password.length > 30) 
					{
						alert("<% tcWebApi_get("String_Entry","ChangePasswordJS3Text","s") %>");
						return -1;
					}
				<%end if%>
				
				for(var i = 0; i < password.length; i ++ )
				{
				   	var ascNum = password.charCodeAt(i);
				   	if (ascNum < 33 || ascNum > 126 || ascNum == 59)
				   	{
						alert("<% tcWebApi_get("String_Entry","AdminJS7Text","s") %>");
						return -1;
					}
				}

			 	if (document.wzPWform.uiViewPassword.value != document.wzPWform.uiViewPasswordConfirm.value)
			  	{
					alert("<% tcWebApi_get("String_Entry","ChangePasswordJS2Text","s") %>");
					return;
			  	}
			  	
			  	if(quotationCheck(document.forms[0].uiViewPassword, 30) ) 
					return;
					
			  	document.wzPWform.submit();
			}

			function quotationCheck(object, limit_len) 
			{
				var len = object.value.length;
				var c;
				var i, j = 0;
				
			    	for (i = 0; i < len; i++)
			    	{
				 	var c = object.value.charAt(i);
			      
				  	if (c == '"')
					{
						j += 6;
					}
					else
						j++;
			    	}
			    	
			   	if (j > limit_len)
				{
			   		alert('<% tcWebApi_get("String_Entry","AdminJS2Text","s") %>');      	  								    	    	   		
					return true;
				}	
				return false;
			}
		</script>
	</head>

	<body topmargin="10" leftmargin="0">
		<form name="wzPWform" method="post" ACTION="/cgi-bin/wizardTZ.asp">
			<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
			  	<tr>
			    		<td width="500" height="5" valign="baseline" class="orange"></td>
			  	</tr>
			</table>

			<table border="0" width="500" align="center" cellspacing="0" cellpadding="0">
			  	<tr>
			    		<td width="200" height="50" align="center" valign="middle" bgcolor="#FFFFFF">
			    			<div align="left">
							<img src="/logo.png" width="160" height="100">
						</div>
					</td>
			    		<td width="300" align="right" valign="bottom" bgcolor="#FFFFFF" class="model" >
				  		<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then tcWebApi_get("String_Entry","XponInfoText","s") else%>
				  			<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then tcWebApi_get("String_Entry","AdslVdslInfoText","s")%>/<%end if tcWebApi_get("String_Entry","AdslInfoText","s")%>
				  		<%end if%>
					</td>
			  	</tr>
			  	
			  	<tr>
			    		<td width="500" colspan="2" hclass="orange"> </td>
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
			    			<% tcWebApi_get("String_Entry","HelpIndexQuickText","s") %> - <% tcWebApi_get("String_Entry","WANPasswardText","s") %>
			    		</td>
			  	</tr>
			</table>

			<table width="500" border="0" align="center" cellpadding="2" cellspacing="0" bgcolor="#FFFFFF">
			  	<tr>
			    		<td width="40">&nbsp;</td>
			    		<td colspan="2" class="tabdata">			    
			        		<% tcWebApi_get("String_Entry","WizardPwdInfoText","s") %>			    			        
			       	 	<input type="hidden" name="wzExitFlag">			        
			    		</td>
			 	</tr>

			  	<tr>
				    	<td></td>
				    	<td></td>
				    	<td></td>
			  	</tr>
			  	
			  	<tr>
				    	<td height="10"></td>
				    	<td></td>
				    	<td></td>
			  	</tr>
			  	
			  	<tr>
			    		<td width="40">&nbsp;</td>
			    		<td width="150" class="tabdata" align="right">
			    			<% tcWebApi_get("String_Entry","AdminNewPasswordText","s") %> :			    
			    		</td>
			    		<td width="310" class="tabdata" align="left">
			    			<div align="left">			        
			        			<input type="password"  SIZE="32" MAXLENGTH="30" value="" name="uiViewPassword" id="uiViewPassword" > 			        
			        		</div>
			        	</td>
			  	</tr>
			  	
			  	<tr>
			    		<td width="40">&nbsp;</td>
			    		<td width="150" class="tabdata" align="right">			    
			    			<% tcWebApi_get("String_Entry","AdminConfirmPasswordText","s") %> :			    
			    		</td>
			    		<td class="tabdata" align="left">			        
			        		<input type="password" name="uiViewPasswordConfirm" value="" id="uiViewPasswordConfirm" SIZE="32" MAXLENGTH="30" >			        
			        	</td>
			  	</tr>
			  	
			  	<!--cindy add start-->
			  	<tr>
				    	<td width="40">&nbsp;</td>
				    	<td width="150">&nbsp;</td>
				    	<td width="200" class="tabdata" align="left">
				    		<% tcWebApi_get("String_Entry","AdminJS8Text","s") %> 
				    	</td>
			   	</tr>
			  	<!--cindy add end-->
			  	
			  	<!--<tr>
			    		<td height="25"></td>
			  	</tr>-->
			</table>

			<table width="500" height="40" border="0" align="center" cellpadding="0" cellspacing="0" class="orange">
				<tr>
				    	<td class="orange">
				        	<div id="button0" align="right" style="width:500px">
				          		<input name="BackBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonBackText","s") %>" class="tabdata" onClick="javascript:window.location='/cgi-bin/wizardstart.asp'" >
						  	<input name="NextBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonNextText","s") %>" class="tabdata" onClick="uiSave()">
				          		<input name="ExitBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonExitText","s") %>" class="tabdata" onClick="ExitWizard()">
				        	</div>
				        </td>
				</tr>
			</table>
		</form>
	</body>
</html>        
