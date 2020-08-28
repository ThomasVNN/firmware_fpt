<%
If Request_Form("AuthFlag")="1" then 
	TCWebApi_set("GPON_ONU","Password","Auth_Password")
	tcWebApi_commit("GPON_ONU")
	TCWebApi_save();
End If
%>


<html><head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="/style.css" tppabs="/style.css">

<script language="JavaScript" src="/val.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
<script language="JavaScript">

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
			return true;
		}
	}
	return false;
}

function AuthSave() 
{
	<%if tcWebApi_get("WebCustom_Entry", "isC1ZYSupported", "h") = "Yes" then%>
	var errStr = '<%tcWebApi_get("String_Entry","PonAuthJS15Text","s")%>';
	
	if (document.AUTH_form.Auth_Password.value.length != 10){
		alert(errStr);
		return false;
	}
	
	if (PasswdCheck(document.AUTH_form.Auth_Password)){
		alert(errStr);
		return false;
	}
	
	<% else %>
	if(document.AUTH_form.Auth_Password.value.length <= 0){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS12Text","s")%>");
		return false;
	}

	if (document.AUTH_form.Auth_Password.value.length != 10){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS13Text","s")%>");
		return false;
	}
	if (PasswdCheck(document.AUTH_form.Auth_Password)){
		alert("<%tcWebApi_get("String_Entry","PonAuthJS11Text","s")%>" + c);
		return false;
	}
	<% end if %>

	document.AUTH_form.AuthFlag.value=1;
	document.AUTH_form.submit();
}

</script>
</head><body>
<FORM METHOD="POST" ACTION="/cgi-bin/access_auth_registerID.asp" name="AUTH_form"><table width="760" border="0" align=center cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td height="5" class="light-orange" colspan="5">&nbsp;</td>
	</tr>
	<tr>
		<td width="150" height="30" class="title-main">
			<font color="#FFFFFF">
				<%if tcWebApi_get("WebCustom_Entry", "isC1ZYSupported", "h") = "Yes" then%>
				<%tcWebApi_get("String_Entry","PonAuthSLIDText","s")%>
				<% else %>
				<%tcWebApi_get("String_Entry","PonAuthRegisterIDText","s")%>
				<% end if %>
			</font>
		</td>
		<td width="10" class="black">&nbsp;</td>
		<td width="150"></td>
		<td width="10" ></td>
		<td width="440"></td>
	</tr>

	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata">
			<div align=right>
				<font color="#000000">
					<%if tcWebApi_get("WebCustom_Entry", "isC1ZYSupported", "h") = "Yes" then%>
					<%tcWebApi_get("String_Entry","PonAuthSLIDText","s")%>
					<% else %>
					<%tcWebApi_get("String_Entry","PonAuthRegisterIDText","s")%>
					<% end if %>
				</font>
			</div>
		</td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<INPUT TYPE="TEXT" NAME="Auth_Password" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("GPON_ONU","Password","h") <> "N/A" then TCWebApi_get("GPON_ONU","Password","s") end if%>" >
		</td>
	</tr>
	</table>
	<table width="760" border="0" align=center cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
	<td width="160" class="light-orange">&nbsp;</td><td width="160">&nbsp;</td><td width="440"></td></tr>
  <tr>
    <td width="160" class="black" height="42" >&nbsp;</td><td width="160" class="orange">&nbsp;</td><td width="440" class="orange">
		<INPUT TYPE="HIDDEN" NAME="AuthFlag" VALUE="0">
		<INPUT TYPE="button" NAME="SaveBtn" VALUE="<%tcWebApi_get("String_Entry","ButtonApplyText","s")%>" onClick="AuthSave();">	
	</td>
</tr>
</table></form>
</body></html>
