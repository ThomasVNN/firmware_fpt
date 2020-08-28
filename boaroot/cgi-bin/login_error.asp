<html xmlns="http://www.w3.org/1999/xhtml"><head><title>login</title>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=content-type content="text/html; charset=gb2312">
<link rel="stylesheet" type="text/css" href="/style.css" tppabs="/style.css">
<style  type="text/css">

#div_visite{
	background:#f4f4f4 url(/bg.gif) repeat top left;
	border-radius: 8px 8px 8px 8px;
	-moz-border-radius: 8px 8px 8px 8px;
	-webkit-border-radius: 8px 8px 8px 8px;
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
.button1
{
display:inline-block;
cursor:pointer;
color:#fff;
font:bold 15px Arial,Verdana,sans-serif;
margin:5px;
padding:7px 14px;
line-height:normal;
*overflow:visible ;
text-align:center;
text-decoration:none;
position:relative;
background:#38a7dc;
border:1px solid #38a7dc;
outline:0;
}

#buttoncolor input:hover
{
display:inline-block;
background:#1a6f98;
color:#fff;
outline:0;
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
	       if(document.getElementById('username').value != "" && document.getElementById('password').value == ""  )
	       {	document.getElementById('password').focus();	}
		else
		{
		submitform();
		return false;}
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
	<tr>
		<td style="text-align:center;">
			<img src="/login.png" width="120" height="65">
		</td>
	</tr>
	</table>

	<!--gleaf added begin-->
	<table  cellspacing="0" cellpadding="0" width="500" style="margin-top:5px;">
	  	<tr height="20px">
			<td width="190px"></td>
			<td width="55px" style="color:grey; font-family: Arial,Helvetica,sans-serif;font-size: 15px;font-weight:bold;text-align:left;"><%tcWebApi_get("String_Entry", "HotlineText", "s")%></td>
			<td style="color:red; font-family: Arial,Helvetica,sans-serif;font-size: 15px;font-weight:bold;text-align:left;"><%tcWebApi_get("String_Entry", "HotlineNumText", "s")%></td>
	  	</tr>
	  </table>
	  <!--gleaf added end-->
	  
	<table  cellspacing="0" cellpadding="0" align="center" width="500" height="200">
		<tr>
			<td>
				<table  cellspacing="0" cellpadding="0" align="center" border="0" width="500" height="160"  >				
				  <tr>
				   	<td width=160px height=40px>
				   	<div id="usr"></div>
					</td>				    
					<td align=left>&nbsp;&nbsp;<input id="username" style="height:30px;width: 160px; font-family: arial;line-height:30px;" name="username" size="20" > </td>
				  </tr>
				  
				  <tr>
				     <td height=40px>
				   	<div  id="pwd"></div>
				     </td>
				     <td align=left>&nbsp;&nbsp;<input id="password" style="height:30px;width: 160px; font-family: arial ;line-height:30px;" type="password" name="password" size="20"></td>
				  </tr>
				  <tr  >
				  <td height=25px>
				  </td>
					    <td><div style="color:red; text-align:left;font-family: Arial,Helvetica,sans-serif;font-size: 15px;font-weight:bold;"><%tcWebApi_get("String_Entry", "FailInfo", "s")%></div></td>
				  </tr>

				  </table>
				     </td>
				  </tr>
				 <tr>
				 <td>
				 <table  cellspacing="0" cellpadding="0"  border="0" width="500" align="center" >

				  <tr id="buttoncolor"  height=40px>
				  <!--amy
				    <td   height=30px >
				    </td>
					  
				    <td> 
				    <span width="175px" style="padding-left:155px;"><input id="btnsubmit" onclick="submitform()" type="button" value="<%tcWebApi_get("String_Entry", "LoginText", "s")%>" name="btnsubmit"></span>
				    <span width="175px" style="padding-left:20px;"><input id="btncancel" type="reset" value="<%tcWebApi_get("String_Entry", "CancelText", "s")%>" name="btncancel"></span>
				    </td>
				    -->
					    <td align=center>
				    	<input class="button1" onclick="submitform()" type="button" value="<%tcWebApi_get("String_Entry", "LoginText", "s")%>" name="btnsubmit">
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
