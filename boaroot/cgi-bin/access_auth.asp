<%
If Request_Form("AuthFlag")="1" then 
	TCWebApi_set("EPON_LOIDAuth","LOID0","Auth_LOID")
	TCWebApi_set("EPON_LOIDAuth","Password0","Auth_Password")
	tcWebApi_commit("EPON_LOIDAuth")
	
	TCWebApi_set("GPON_LOIDAuth","LOID","Auth_LOID")
	TCWebApi_set("GPON_LOIDAuth","Password","Auth_Password")
	tcWebApi_commit("GPON_LOIDAuth")
	
if tcWebApi_get("WebCustom_Entry","isXPONSNLoadIDDisplay","h") = "Yes" then	
	TCWebApi_set("GPON_ONU","SerialNumber","Auth_SN")
if tcWebApi_get("WebCustom_Entry","isXPONSNPswDisplay","h") = "Yes" then	
	TCWebApi_set("GPON_ONU","Password","Auth_PSW")
end if
	tcWebApi_commit("GPON_ONU")
end if	

	TCWebApi_save();
	TCWebApi_set("System_Entry","reboot_type","AuthFlag") 
	tcWebApi_CommitWithoutSave("System_Entry")
End If
%>

<!--
If you execute doRefresh() and then reload webpage, doRefresh() will be disabled.
Therefore, execute doRefresh() after webpage reloads.
-->
<!-- Foxconn alan fix a bug when some value set wrong it will also prompt "Reboot Complete!" -->
<%If Request_Form("AuthFlag") = "1"  Then%>
<script language="JavaScript">
	setTimeout("doRefresh()",70000);
</script>
<%End If%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="/style.css" tppabs="/style.css">

<style  type="text/css">

*{color:  #404040;}

</style>


<script language="JavaScript" src="/val.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
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

function doNonSympolCheck(c)
{
	if ((c >= "0")&&(c <= "9"))
	{
		return 1;
	}
	else if ((c >= "A")&&(c <= "Z"))
	{
		return 1;
	}
	else if ((c >= "a")&&(c <= "z"))
	{
		return 1;
	}

  return -1;
}

function PasswdCheck(object)
{
	var len = object.value.length;
	var c;
	var i = 0;
	for(i=0; i<len; i++)
	{
		var c = object.value.charAt(i);
		if(doNonSympolCheck(c)==-1)
		{
			alert("<%tcWebApi_get("String_Entry","PonAuthJS1Text","s")%>" + c);
			return true;
		}
	}
	return false;
}

function AuthSave() 
{
/* Foxconn alan remove start for remove LOID and Password authentication
	<%if tcWebApi_get("WebCustom_Entry","isLOIDPWDLenEnhance","h") = "Yes" then%>
	if (document.AUTH_form.Auth_LOID.value.length > 24){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS3Text","s")%>");
		return false;
	}
	if (document.AUTH_form.Auth_Password.value.length > 12){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS4Text","s")%>");
		return false;
	}
	<%else%>
	if(document.AUTH_form.Auth_LOID.value.length <= 0){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS2Text","s")%>");
		return false;
	}
	if (document.AUTH_form.Auth_LOID.value.length > 24){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS3Text","s")%>");
		return false;
	}
	if (document.AUTH_form.Auth_Password.value.length >= 12){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS4Text","s")%>");
		return false;
	}
	<%end if%>
Foxconn alan remove end */
	
	/*if (PasswdCheck(document.AUTH_form.Auth_Password)){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS5Text","s")%>");
		return false;
	}*/

	<%if tcWebApi_get("WebCustom_Entry","isXPONSNLoadIDDisplay","h") = "Yes" then%>
	if(document.AUTH_form.Auth_SN.value.length <= 0){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS8Text","s")%>");
		return false;
	}

	if (document.AUTH_form.Auth_SN.value.length != 12){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS9Text","s")%>");
		return false;
	}
	
	if (!document.AUTH_form.Auth_SN.value.match(/[a-zA-Z]{4}[a-zA-Z0-9]{8}/)){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS10Text","s")%>");
		return false;
	}
	<%if tcWebApi_get("WebCustom_Entry","isXPONSNPswDisplay","h") = "Yes" then%>
	if(document.AUTH_form.Auth_PSW.value.length <= 0){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS25Text","s")%>");
		return false;
	}

	if (document.AUTH_form.Auth_PSW.value.length > 10){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS26Text","s")%>");
		return false;
	}
/* Foxconn alan add for check GPON Password */
	if (PasswdCheck(document.AUTH_form.Auth_PSW)){
		return false;
	}
	<% end if %>
	<% end if %>
<%if tcWebApi_get("WebCustom_Entry","isC5HENSFUSupported","h") = "Yes" then%>
	alert("<%tcWebApi_get("String_Entry","PonAuthJS23Text","s")%>");
<%else%>
	alert("<%tcWebApi_get("String_Entry","PonAuthJS6Text","s")%>");
<%end if%>

	showSpin();//cindy add
	document.AUTH_form.AuthFlag.value=1;
	document.AUTH_form.submit();
}

function doRefresh()
{
	alert("<%tcWebApi_get("String_Entry","PonAuthJS7Text","s")%>");
	var mydate = new Date();
	mydate.setTime(mydate.getTime() - 1);
	document.cookie = "SESSIONID=; expires=" + mydate.toGMTString(); 
	window.top.location.href = "../";    
}

<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
function return_login()
{
		top.location.replace("/cgi-bin/login.asp");
}
<%end if%>
</script>
</head>

<body>
<FORM METHOD="POST" ACTION="/cgi-bin/access_auth.asp" name="AUTH_form">
			<div id="pagestyle"><!--cindy add for border 11/28-->
			<div id="contenttype">
<!--Foxconn alan remove start for remove LOID and Password authentication
				<table width="740px" border="0"  cellpadding="0" cellspacing="0">
<tr><td height="40px"  colspan="5"></td></tr>
<tr><td width="10" valign="right" >&nbsp; </td>
<td width="150" height="15" class="title-main" style="padding-left:30px;">      	
			<%
				if tcWebApi_get("WebCustom_Entry","isC5HENSFUSupported","h") = "Yes" then
					tcWebApi_get("String_Entry","PonAuthLOIDText2","s")
				else
					tcWebApi_get("String_Entry","PonAuthLOIDText","s")
				end if%>
</td>
<td  colspan="3" valign="middle" style="padding-right:20"><hr style="height:1px;border:none;border-top:1px solid #38A7DC;" /></td>
</tr>
</table>



				<table width="740" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td width="150" height="10"> </td>
		<td width="10">&nbsp;</td>
		<td width="150"></td>
		<td width="10" ></td>
		<td width="440"></td>
	</tr>
	<tr>		
		<td width="150" height="25" class="light-orange"></td>
		<td width="10" class="light-orange"></td>
		<td class="tabdata"><div align=right><img src="/exclamation.gif"></div></td>
		<td>&nbsp;</td>
		<td class="tabdata">
		<div style="color:FF9933;">
		 <%tcWebApi_get("String_Entry","PonAuthWarningText","s")%> 
		 </div>
		</td>
	</tr>
	<tr>		
		<td width="150" height="25" class="light-orange"></td>
		<td width="10" class="light-orange"></td>
		<td class="tabdata"><div align=right> 
			<%
			if tcWebApi_get("WebCustom_Entry","isC5HENSFUSupported","h") = "Yes" then
				tcWebApi_get("String_Entry","PonAuthLOIDText2","s")
			else
				tcWebApi_get("String_Entry","PonAuthLOIDText","s")
			end if	
			%> </div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<%if tcWebApi_get("WebCustom_Entry","isLOIDPWDLenEnhance","h") = "Yes" then%>
			<INPUT TYPE="TEXT" NAME="Auth_LOID" SIZE="30" MAXLENGTH="24" VALUE="<% If TCWebApi_get("EPON_LOIDAuth","LOID0","h") <> "N/A" then TCWebApi_get("EPON_LOIDAuth","LOID0","s") end if%>" >
			<%else%>
			<INPUT TYPE="TEXT" NAME="Auth_LOID" SIZE="30" MAXLENGTH="24" VALUE="<% If TCWebApi_get("EPON_LOIDAuth","LOID0","h") <> "N/A" then TCWebApi_get("EPON_LOIDAuth","LOID0","s") end if%>" >
			<%end if%>
		</td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","PonAuthPwdText","s")%> </div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<%if tcWebApi_get("WebCustom_Entry","isLOIDPWDLenEnhance","h") = "Yes" then%>
			<INPUT TYPE="TEXT" NAME="Auth_Password" SIZE="30" MAXLENGTH="12" VALUE="<% If TCWebApi_get("EPON_LOIDAuth","Password0","h") <> "N/A" then TCWebApi_get("EPON_LOIDAuth","Password0","s") end if%>" >
			<%else%>
			<INPUT TYPE="TEXT" NAME="Auth_Password" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("EPON_LOIDAuth","Password0","h") <> "N/A" then TCWebApi_get("EPON_LOIDAuth","Password0","s") end if%>" >
			<%end if%>
		</td>
	</tr>
Foxconn alan remove end -->
				
<!--Foxconn alan add start for GPON SerialNumber and GPONPassword authentication -->
				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;" >
					

						<tr height="25px" class="bgcolor">

							<td  align="left" class="title-main" style="padding-left:20px;">
								<%if tcWebApi_get("WebCustom_Entry","isXPONSNLoadIDDisplay","h") = "Yes" then
					tcWebApi_get("String_Entry","DeviceGPONSNText","s")	
								end if%>
							</td>
						</tr>
					</table>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						<tr height="30px">
						    	
						    	<td colspan="2" align=left class="tabdata" style="padding-left:20px;">
								<div style="color:#F36F22;">
								    		<img src="/exclamation.gif">
			 					<%tcWebApi_get("String_Entry","PonAuthWarningText","s")%> 
								 </div>
							</td>
						</tr>
											
					<%if tcWebApi_get("WebCustom_Entry","isXPONSNLoadIDDisplay","h") = "Yes" then%>
							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","DeviceGPONSNText","s")%></td>
							     	<td align=left class="tabdata">
									<INPUT TYPE="TEXT" NAME="Auth_SN" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("GPON_ONU","SerialNumber","h") <> "N/A" then TCWebApi_get("GPON_ONU","SerialNumber","s") end if%>" disabled="true">
								</td>
							</tr>
							
						<%if tcWebApi_get("WebCustom_Entry","isXPONSNPswDisplay","h") = "Yes" then%>
								<tr height="30px">
								    	
								    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","DeviceGPONSNPSWText","s")%> </td>
								     	<td align=left class="tabdata">
								     		<INPUT TYPE="TEXT" NAME="Auth_PSW" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("GPON_ONU","Password","h") <> "N/A" then TCWebApi_get("GPON_ONU","Password","s") end if%>" >&nbsp;
								     		<%tcWebApi_get("String_Entry","PonAuthJS27Text","s")%> 
									</td>
								</tr>
						<%end if%>
					<%end if%>

						
					</table>
				</div>
				
<!-- Foxconn alan add end -->
				
<!--Foxconn alan remove start for remove original GPON SerialNumber and GPON Password
	<%if tcWebApi_get("WebCustom_Entry","isXPONSNLoadIDDisplay","h") = "Yes" then%>
	<tr>
		<td width="150" height="30" class="title-main"><%tcWebApi_get("String_Entry","DeviceXPONSNText","s")%> </td>
		<td width="10">&nbsp;</td>
		<td width="150"><hr noshade></td>
		<td width="10" ><hr noshade></td>
		<td colspan="3"><hr noshade></td>
	</tr>
	<tr>		
		<td width="150" height="25" class="light-orange"></td>
		<td width="10" class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","DeviceXPONSNText","s")%> </div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<INPUT TYPE="TEXT" NAME="Auth_SN" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("GPON_ONU","SerialNumber","h") <> "N/A" then TCWebApi_get("GPON_ONU","SerialNumber","s") end if%>" >
		</td>
	</tr>
	<%if tcWebApi_get("WebCustom_Entry","isXPONSNPswDisplay","h") = "Yes" then%>
	<tr>		
		<td width="150" height="25" class="light-orange"></td>
		<td width="10" class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000"><%tcWebApi_get("String_Entry","DeviceXPONSNPSWText","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<INPUT TYPE="TEXT" NAME="Auth_PSW" SIZE="30" MAXLENGTH="10" VALUE="<% If TCWebApi_get("GPON_ONU","Password","h") <> "N/A" then TCWebApi_get("GPON_ONU","Password","s") end if%>" >
		</td>
	</tr>
	<%end if%>
	<%end if%>
	</table>
Foxconn alan remove end-->

				<div id="button0">
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;" >
					
						<tr height="25px">
							<td  align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata"  >
						<tr height="40px">
							
							<td colspan="2" align=left class="tabdata" style="padding-left:20px;">
								<INPUT TYPE="HIDDEN" NAME="AuthFlag" VALUE="0">
								<INPUT TYPE="SUBMIT" NAME="SaveBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="AuthSave();">
							</td>
							<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
							<td align=left class="tabdata" style="display:none">
								<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
									<% If Request_Form("islogin")="0" then %>
												<INPUT TYPE="button" NAME="ReturnBtn" class="returnBtn" VALUE="<%tcWebApi_get("String_Entry","ButtonReturn1Text","s")%>" onClick="return_login();">
									<%end if%>
								<%end if%>
							</td>
						</tr>

						
					</table>
				</div>
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
					<td align=center colSpan=3 style="background-color:transparent;font-family: Arial,Helvetica,sans-serif;"><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%></font></td>
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
