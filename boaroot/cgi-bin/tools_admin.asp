<%
	If Request_Form("adminFlag") = "1" Then
		TCWebApi_set("Account_Entry0","web_passwd","uiViewTools_Password")
		TCWebApi_set("Account_Entry0","console_passwd","uiViewTools_Password")
		
		if tcwebApi_get("WebCustom_Entry","isThreeLevelChangePassWord","h") = "Yes" Then
			TCWebApi_set("Account_Entry1","web_passwd","Password2")
			TCWebApi_set("Account_Entry2","web_passwd","Password3")
		end if
		
		tcWebApi_commit("Account_Entry0")
	End If
%>

<!--cindy add start-->
<%If Request_Form("adminFlag") = "1" Then%>
	<script language="JavaScript">
		setTimeout("dostatus()", 1000);
	</script>
<%End If%>
<!--cindy add end-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="/style.css" type="text/css">
		<script language="JavaScript" src="OutVariant.asp"></script>
		<script language="JavaScript" src="/general.js"></script>
		<script language="JavaScript" src="/jsl.js"></script>
		<script language="JavaScript" src="/ip.js"></script>
		<style  type="text/css">
			*{color:  #404040;}

		</style>

<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
		<script language="JavaScript">

//<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
function showSpin(){
	var opts = {
		  lines: 8, // The number of lines to draw
		  length: 0, // The length of each line
		  width: 6, // The line thickness
		  radius: 7, // The radius of the inner circle
		  scale: 1, // Scales overall size of the spinner
		  corners: 1, // Corner roundness (0..1)
		  color: '#999999', // CSS color or array of colors
		  fadeColor: '#transparent', // CSS color or array of colors
		  speed: 1.1, // Rounds per second
		  rotate: 0, // The rotation offset
		  animation: 'spinner-line-fade-quick', // The CSS animation name for the lines
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  className: 'spinner', // The CSS class to assign to the spinner
		  top: '50%', // Top position relative to parent
		  left: '50%', // Left position relative to parent
		  shadow:false, // Box-shadow for the lines
		  position: 'absolute' // Element positioning
		};
	
var target = document.getElementById('firstDiv');
var spinner = new Spinner(opts).spin(target);
}
//<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
		
			function fresh()
			{
				<%if tcwebApi_get("WebCustom_Entry","isThreeLevelChangePassWord","h") = "Yes" then%>
					<%if TCWebAPI_get("WebCurSet_Entry", "CurrentAccess", "h") = "0" then %>
						if(document.tool_admin.uiViewTools_Password != null)
							document.tool_admin.uiViewTools_Password.value = adminPwd;
						if(document.tool_admin.uiViewTools_PasswordConfirm != null)
							document.tool_admin.uiViewTools_PasswordConfirm.value = adminPwd;
					<%end if%>
						
					<%if TCWebAPI_get("WebCurSet_Entry", "CurrentAccess", "h") <> "2" then%>
						if(document.tool_admin.Password2 != null)
							document.tool_admin.Password2.value = userPwd;
						if(document.tool_admin.PasswordConfirm2 != null)
							document.tool_admin.PasswordConfirm2.value = userPwd;
					<%end if%>
						
					if(document.tool_admin.Password3 != null)
						document.tool_admin.Password3.value = user2Pwd;
					if(document.tool_admin.PasswordConfirm3 != null)
						document.tool_admin.PasswordConfirm3.value = user2Pwd;
				<%end if%>	
			}
			
			/*//cindy add start
			function doRefresh()
			{
			    	alert("<%tcWebApi_get("String_Entry","AdminJS9Text","s")%>");
				var mydate = new Date();
				mydate.setTime(mydate.getTime() - 1);
				<%if tcwebApi_get("WebCustom_Entry","isSupportLogout","h")="Yes" then%>
				document.cookie = "uid=del;path=/; expires=" + mydate.toGMTString(); 
				document.cookie = "psw=del;path=/; expires=" + mydate.toGMTString(); 
				<%else%>
				document.cookie = "SESSIONID=; expires=" + mydate.toGMTString(); 
				<%end if%>
				window.top.location.href = "../";    
			}
			//cindy add end */
			
			//cindy add start
			function dostatus()
			{
                         //var form=document.tool_admin;
                         //form.uistatus.value = "<%tcWebApi_get("String_Entry","AdminJS9Text","s")%>";
                          //document.getElementById("display_div0").style.visibility="visible";
                          document.getElementById("display_div0").style.display="";
			}
			//cindy add end
			
			function uiSave() 
			{
			 	<%if tcwebApi_get("WebCustom_Entry","isThreeLevelChangePassWord","h") = "Yes" then%>   
					if(document.tool_admin.CurrentAccess.value == "0")
					{
				<%end if%>
					
			    	if (document.tool_admin.uiViewTools_Password.value.length == 0) 
				{
			    		alert("<%tcWebApi_get("String_Entry","AdminJS0Text","s")%>");
			    		return;
			    	}

				var password = document.tool_admin.uiViewTools_Password.value;
				
				<%if tcwebApi_get("WebCustom_Entry", "isCZGeneralSupported", "h")="Yes" Then%>
					if (password.length < 8 || password.length > 30) 
					{
			    			alert("<%tcWebApi_get("String_Entry","AdminJS6Text","s")%>");
						return -1;
					}
				<%end if%>
					
				for(var i = 0; i < password.length; i ++ )
				{
				  	 var ascNum = password.charCodeAt(i);
				   	//ascNUM : 59 ->semicolon(;)
					
				   	if (ascNum < 33 || ascNum > 126 || ascNum == 59)
					{
			   			alert("<%tcWebApi_get("String_Entry","AdminJS7Text","s")%>");
						return -1;
					}
				}
				
			    	if (document.tool_admin.uiViewTools_Password.value != document.tool_admin.uiViewTools_PasswordConfirm.value) 
				{
			        	alert("<%tcWebApi_get("String_Entry","AdminJS1Text","s")%>");
			        	return;
			    	}
					
			    	if(quotationCheck(document.tool_admin.uiViewTools_Password, 30) ) 
					return;
				
			 	<%if tcwebApi_get("WebCustom_Entry","isThreeLevelChangePassWord","h") = "Yes" then%>   
					}
					
					if(document.tool_admin.CurrentAccess.value !== "2")
					{
						if (document.tool_admin.Password2.value.length == 0) 
						{
				    			alert("<%tcWebApi_get("String_Entry","AdminJS0Text","s")%>");
				    			return;
				   		}
						
					 	if (document.tool_admin.Password2.value != document.tool_admin.PasswordConfirm2.value) 
						{
				       	 	alert("<%tcWebApi_get("String_Entry","AdminJS1Text","s")%>");
				       		return;
				   		}
						
				    		if(quotationCheck(document.tool_admin.Password2, 30) ) 
							return;					
					}

					if (document.tool_admin.Password3.value.length == 0) 
					{
				  	 	alert("<%tcWebApi_get("String_Entry","AdminJS0Text","s")%>");
				   		return;
				  	}
					
					if (document.tool_admin.Password3.value != document.tool_admin.PasswordConfirm3.value) 
					{
				      		alert("<%tcWebApi_get("String_Entry","AdminJS1Text","s")%>");
				      	 	return;
				   	}
					
				    	if(quotationCheck(document.tool_admin.Password3, 30) ) 
						return;
			 	<%end if%>
				showSpin();//cindy add
			 	document.tool_admin.adminFlag.value=1;
			    	document.tool_admin.submit();
			    	return;
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
			   		alert('<%tcWebApi_get("String_Entry","AdminJS2Text","s")%>');      	  								    	    	   		
					return true;
				}	
				return false;
			}
		</script>
	</head>

	<body onLoad="fresh()">
		<FORM METHOD="POST" ACTION="/cgi-bin/tools_admin.asp" name="tool_admin">
			<INPUT TYPE="HIDDEN" NAME="adminFlag" VALUE="0">
			<INPUT TYPE="HIDDEN" NAME="CurrentAccess" VALUE=<%TCWebAPI_get("WebCurSet_Entry", "CurrentAccess", "s")%>>
			<div id="pagestyle"><!--cindy add for border 11/28-->
				<div id="contenttype">  <!--gleaf-->
					<div id="block1">		
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed; margin:5px 0;">
							<tr height="25px" style="background-color:#e6e6e6;">
								<td align=left class="title-main" style="width:620px;padding-left:20px;">
									<%tcWebApi_get("String_Entry","AdminText","s")%>
								</td>
							</tr>
						</table>
						
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
						  	<%if tcwebApi_get("WebCustom_Entry","isThreeLevelChangePassWord","h") = "Yes" then%>
								<%if TCWebAPI_get("WebCurSet_Entry", "CurrentAccess", "h") = "0" then %>
									<tr height="30px">
										<td align=left class="tabdata" style="width:250px;padding-left:20px;">
										     	<%tcWebApi_get("String_Entry","AdminUsernameText","s")%> </td>
										<td align=left class="tabdata" style="word-wrap:break-word;word-break:break-all;">
											<strong>
												<% tcWebApi_get("Account_Entry0","username","s") %>
											</strong>
										</td>
									</tr>

									<tr height="30px">
										<td align=left class="tabdata" style="width:250px;padding-left:20px;">
										 	<%tcWebApi_get("String_Entry","AdminNewPasswordText","s")%>
										</td>
										<td align=left class="tabdata" style="white-space:nowrap;">
										 	<INPUT TYPE="PASSWORD" NAME="uiViewTools_Password" SIZE="32" MAXLENGTH="30" VALUE="">    
										</td>
									</tr>

									<tr height="30px">
										<td align=left class="tabdata" style="width:250px;padding-left:20px;">
											<%tcWebApi_get("String_Entry","AdminConfirmPasswordText","s")%>
										</td>
										<td align=left class="tabdata" style="white-space:nowrap;">
											<INPUT TYPE="PASSWORD" NAME="uiViewTools_PasswordConfirm" SIZE="32" MAXLENGTH="30" VALUE="">
										</td>
									</tr>
								
									<!--cindy add start0915-->
									<tr>
										<td align=left class="tabdata" style="width:250px;padding-left:20px;">
										        <INPUT TYPE="TEXT" NAME="uistatus" disabled SIZE="32" MAXLENGTH="30" style="border:none;color:red;" VALUE="">    </td>
									</tr>
									<!--cindy add end0915-->
								<%end if %>
							<%else%>
								<tr height="30px">
									<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									     	<%tcWebApi_get("String_Entry","AdminUsernameText","s")%>
									</td>
									<td align=left class="tabdata" style="word-wrap:break-word;word-break:break-all;">
										<strong>
											<% tcWebApi_get("Account_Entry0","username","s") %>
											</strong>
										</td>
								</tr>

								<tr height="30px">
									<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									     	<%tcWebApi_get("String_Entry","AdminNewPasswordText","s")%>
									</td>
									<td align=left class="tabdata" color="#F36F22" style="white-space:nowrap;">
									 	<INPUT TYPE="PASSWORD" NAME="uiViewTools_Password" SIZE="32" MAXLENGTH="31" VALUE="">  
									 	<%tcWebApi_get("String_Entry","AdminJS8Text","s")%>    
									</td>
								</tr>

								<tr height="30px">
									<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									     	<%tcWebApi_get("String_Entry","AdminConfirmPasswordText","s")%>
									</td>
									<td align=left class="tabdata" style="white-space:nowrap;">
										<INPUT TYPE="PASSWORD" NAME="uiViewTools_PasswordConfirm" SIZE="32" MAXLENGTH="31" VALUE="">    
									</td>
								</tr>
								
								<!--cindy add start0915-->
								<tr height="30px" id="display_div0" style="display:none;">
									<td align=left class="tabdata" style="width:250px;padding-left:20px;color:red;font-size:15px;">
										<%tcWebApi_get("String_Entry","AdminJS9Text","s")%>
									</td>
								</tr>
								<!--cindy add end0915-->
							<%end if%>
					
							<%if tcwebApi_get("WebCustom_Entry","isThreeLevelChangePassWord","h") = "Yes" then%>
								<%if TCWebAPI_get("WebCurSet_Entry", "CurrentAccess", "h") <> "2" then%>
									<tr height="30px">
										<td align=left class="tabdata" style="width:250px;padding-left:20px;">
										     	<%tcWebApi_get("String_Entry","AdminUsernameText","s")%>
										</td>
									     	<td align=left class="tabdata" style="word-wrap:break-word;word-break:break-all;">
									     		<strong>
												<% tcWebApi_get("Account_Entry1","username","s") %>
											</strong>
										</td>
									</tr>

									<tr height="30px">
										<td align=left class="tabdata" style="width:250px;padding-left:20px;">
										     	<%tcWebApi_get("String_Entry","AdminNewPasswordText","s")%>
										</td>
										<td align=left class="tabdata" style="white-space:nowrap;">
										        <INPUT TYPE="PASSWORD" NAME="Password2" SIZE="32" MAXLENGTH="30" VALUE="">    
										</td>
									</tr>

									<tr height="30px">
										<td align=left class="tabdata" style="width:250px;padding-left:20px;">
										 	<%tcWebApi_get("String_Entry","AdminConfirmPasswordText","s")%>
										</td>
										<td align=left class="tabdata" style="white-space:nowrap;">
										        <INPUT TYPE="PASSWORD" NAME="PasswordConfirm2" SIZE="32" MAXLENGTH="30" VALUE="">    
										</td>
									</tr>
									
									<!--cindy add start0915-->
									<tr>
										<td align=left class="tabdata" style="width:250px;padding-left:20px;">
										        <INPUT TYPE="TEXT" NAME="uistatus" disabled SIZE="32" MAXLENGTH="30" style="border:none;color:red;font-size:15px;" VALUE="">    
										</td>
									</tr>
									<!--cindy add end0915-->
								<%end if%>

								<tr height="30px">
									<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									     <%tcWebApi_get("String_Entry","AdminUsernameText","s")%>
									</td>
									<td align=left class="tabdata" style="word-wrap:break-word;word-break:break-all;">
										<strong>
											<% tcWebApi_get("Account_Entry2","username","s") %>
										</strong>
									</td>
								</tr>

								<tr height="30px">
									<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									     	<%tcWebApi_get("String_Entry","AdminNewPasswordText","s")%>
									</td>
									<td align=left class="tabdata" style="white-space:nowrap;">
									        <INPUT TYPE="PASSWORD" NAME="Password3" SIZE="32" MAXLENGTH="30" VALUE="">    
									</td>
								</tr>

								<tr height="30px">
									<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									     	<%tcWebApi_get("String_Entry","AdminConfirmPasswordText","s")%>
									</td>
									<td align=left class="tabdata" style="white-space:nowrap;">
									        <INPUT TYPE="PASSWORD" NAME="PasswordConfirm3" SIZE="32" MAXLENGTH="30" VALUE="">    
									</td>
								</tr>
								
								<!--cindy add start0915-->
								<tr>
									<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									        <INPUT TYPE="TEXT" NAME="uistatus" disabled SIZE="32" MAXLENGTH="30" style="border:none;color:red;font-size:15px;" VALUE="">    
									</td>
								</tr>
								<!--cindy add end0915-->						
							<%end if%>
						</table>
					</div><!--id="block1" 12/22-->

					<div id="button0">
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
							<tr height="25px">
								<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;">
									<%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%>
								</td>
							</tr>
						</table>

						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
							<tr height="40px">
								<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									<INPUT TYPE="button" class="button1" NAME="SaveBtn" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="uiSave()"> 
								</td>
								<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
							</tr>
						</table>
					</div><!--id="button0" 12/22-->
				</div> <!--gleaf-->
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
		</form>
	</body>
</html>
