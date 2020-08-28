<html xmlns="http://www.w3.org/1999/xhtml"><head><title>login</title>
<meta http-equiv=content-type content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="/style.css" tppabs="/style.css">
<style  type="text/css">

#div_visite{
	background:#f4f4f4 url(/bg.gif) repeat top left;
	border-radius: 8px 8px 8px 8px;
	-moz-border-radius: 8px 8px 8px 8px;
	-webkit-border-radius: 8px 8px 8px 8px;
	
	-webkit-box-shadow: #666 0px 3px 4px;
	-moz-box-shadow: #666 0px 3px 4px;
	box-shadow: #666 0px 3px 4px;
	
	margin-left: auto;
	margin-right: auto;
	margin-top: 170px;
	padding: 15px 20px;
       width: 500px;
       height:350px;
    }
    
 #fpt
  {
	background:url(/login.png) no-repeat top left;
	background-size: 100px 35px;
  }

#usr
{
background:url(/usr.png) no-repeat center right;
height:60px;
}

#pwd
{
 background:url(/pwd.png) no-repeat center right;
height:60px;
}

</style>
<script language=javascript type=text/javascript>
document.onkeypress = function(e)
{
	var code;
	if (!e)
	{
		var e=window.event;
	}
	if(e.keyCode)
	{
		code = e.keyCode;
	}
	else if(e.which)
	{
		code = e.which;
	}
	if(code == 13)
	{
		submitform();
		return false;
	}
}
function doLoad()
{
	document.configform.username.focus();
}
function submitform()
{
	var username = document.getElementById('username');
	var password = document.getElementById('password');
	
	if (username.value == "")
	{
		alert("<%tcWebApi_get("String_Entry", "AccountErrorText", "s")%>");
		return false;
	}
	if (password.value == "")
	{
		alert("<%tcWebApi_get("String_Entry", "PasswordErrorText", "s")%>");
		return false;
	}
	
	var cookie = "uid=" + username.value + ";path=/;";
	document.cookie = cookie;
	var cookie = "psw=" + password.value + ";path=/;";
	document.cookie = cookie;
	top.location.replace("/cgi-bin/requestFromLoginPage");
	return true;
}
function gotoLOID()
{
	location.replace("/cgi-bin/access_auth.asp?islogin=0");
}
</script>



</head>
<%if tcWebApi_get("WebCustom_Entry","isNewGuiSupported","h") <> "Yes" then %>
<body onload="doLoad()" height="100%" align="center">
<div width="100%" height="100%" align="center">
<div id=div_visite >
	<form id="configform" name="configform" action="/cgi-bin/login.asp" method="get">		
	<table  cellspacing="0" cellpadding="0" align="center" width="500">
	<tr><td><img src="/login.png" width="120" height="65">
	</td></tr>
	</table>
	<table  cellspacing="0" cellpadding="0" align="center" width="500" height="290">
	<tr><td></td></tr>
		<tr>
			<td>
				<table  cellspacing="0" cellpadding="0" align="center"  border="0" width="500" height="150">
				<tr><td colspan="2"></td></tr>
				  <tr>
				   	<td width=150px height=40px>
				   	<div id="usr"></div>
					</td>				    
					<td>&nbsp;&nbsp;<input id="username" style="height:30px;width: 160px; font-family: arial" name="username" size="20" > </td>
				  </tr>
				  <tr>
				     <td height=40px>
				   	<div  id="pwd"></div>
				     </td>
				    <td>&nbsp;&nbsp;<input id="password" style="height:30px;width: 160px; font-family: arial" type="password" name="password" size="20"></td>
				  </tr>

				  <tr>
				     <td height=40px>
				     </td>
				    <td><div style="color:red;"><%tcWebApi_get("String_Entry", "ReloginInfo", "s")%></div></td>
				  </tr>			  		<tr>
				     <td height=20px>
				     </td>
				    <td style="color:red; font-family: Arial;font-size: 13px;font-weight:bold;">

				    <%if tcWebApi_get("Account_Entry0", "access_fail", "h")="1" then %>
					<%tcWebApi_get("String_Entry", "FailInfo", "s")%>
				    <% end if %>
				    </td>
				  </tr>
				  <tr>
				    <td   height=30px >
				    </td>
				    <td> 
				    <span width="175px" style="padding-left:155px;"><input id="btnsubmit" onclick="submitform()" type="button" value="<%tcWebApi_get("String_Entry", "LoginText", "s")%>" name="btnsubmit"></span>
				    <span width="175px" style="padding-left:20px;"><input id="btncancel" type="reset" value="<%tcWebApi_get("String_Entry", "CancelText", "s")%>" name="btncancel"></span>
				    </td>
					</tr>
				 <tr>
				    <td   height=20px >
				    </td>
				    <td> 
				    </td>
				  </tr>
				</table>
			</td>
		</tr>
		</table>
	</form>
</div>
</div>
</body>
<%else%>
<body onload="doLoad()">
<form id=configform name=configform action=/cgi-bin/login.asp method=get>
<div id=tblmain align=center>
<table cellSpacing=0 width=800>
  <tbody>
  <tr>
    <td>
      <table cellSpacing=0 width="100%">
        <tbody>
        <tr>
          <td style="BACKGROUND: white" height=3></td></tr></tbody></table>
      <table class=orange height=5 cellSpacing=0 cellPadding=0 width=800>
        <tbody>
        <tr>
          <td></td></tr></tbody></table>
      <table cellSpacing=0 cellPadding=0 width=800 bgColor=#ffffff>
        <tbody>
        <tr>
          <td width=200 height=50>
          <%if tcWebApi_get("WebCustom_Entry","isC1ZYSupported","h") = "Yes" then%>
          <img src="/logo.png" width="100%" height="100%" border=0>
          <%else%>
          <img src="/logo.jpg" 
          border=0>
          <%end if%>
          </td>
          <td class=model vAlign=bottom align=right width=600 height=50><font color=#000000>
          <%if tcWebApi_get("WebCustom_Entry", "isC1SFUSupported", "h") = "Yes" then%>
          	<%If tcWebApi_get("GPON_ONU","ModelName","h") <> "N/A" Then tcWebApi_get("GPON_ONU","ModelName","s") end if%>
          <% else %>
          	<%tcWebApi_get("String_Entry","AdslInfoText","s")%>
          <% end if %>
          </font> </td></tr></tbody></table>
      <table height=1 cellSpacing=0 cellPadding=0 width=800 align=center 
      bgColor=#cccccc border=0>
        <tbody>
        <tr>
          <td></td></tr></tbody></table>
      <table style="background-color: white" height=300 cellSpacing=0 
      width="100%" summary="" border=0>
        <tbody>
        <tr>
          <td align=middle>
            <div id=maincontent style="width: 600px">
            <table id=box_header style="border:1px solid" cellSpacing=0 >
              <tbody>
              <tr>
                <td class=orange width=300 colSpan=3 height=20 
              border="0"></td></tr>
              <tr>
                <td>
                  <table height=100  border=0 colspan="3" width=300>
                    <tbody>
                    <tr>
                      <td style="width: 100px; text-align: right">
                      	<%tcWebApi_get("String_Entry", "AccountText", "s")%>:&nbsp;</td>
                      <td><input id="username" style="width: 150px; font-family: arial" name="username" size="20"></td></tr>
                    <tr>
                      <td style="width: 100px; text-align: right"><%tcWebApi_get("String_Entry", "PasswordText", "s")%>:&nbsp;</td>
                      <td><input id="password" style="width: 150px; font-family: arial" type=password  name=password size="20"></td>
                    </tr>
                    <tr>
                      <td align=center colSpan=3>
                      	<%if tcWebApi_get("WebCustom_Entry","isC5HENSFUSupported","h") = "Yes" then %>
                      	<input  id=Register onclick=gotoLOID() type=button value="<%tcWebApi_get("String_Entry", "RegisterText", "s")%>">&nbsp; 
                      	<%end if%>
												<input  id=btnsubmit onclick=submitform() type=button value="<%tcWebApi_get("String_Entry", "LoginText", "s")%>" name=btnsubmit>&nbsp;&nbsp; 
												<input  id=btncancel type=reset value="<%tcWebApi_get("String_Entry", "CancelText", "s")%>" name=btncancel>&nbsp; 
                      </td></tr></tbody></table></td></tr></tbody></table></div></td></tr></tbody></table>
		<table id=footer_container cellSpacing=0 border=0>
		  <tbody>
		    <tr>
		      <td class=orange width=800 height=10></td>
		    </tr>
		    <%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
		    <tr>
		    	<td align=center><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%></font></td>
		  	</tr>
		  	<%end if%>
		  </tbody>
		</table></td></tr></tbody></table></div></form></body>
<%end if%>		
</html>

