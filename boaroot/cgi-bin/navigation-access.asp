<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" lang="utf-8" dir="ltr">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv="Content-Type" content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<link rel="stylesheet" type="text/css" href="/style.css">
<style type="text/css">
body
{
    width:100%;
    height:100%;
    padding:0;
    margin:0;
}

.current{
background:#38a7dc;
background-position:center;
padding:0;
margin:0;
text-decoration:none;
outline:0;
color:#fff;
}
	
.other
{
background: #ffffff;
background-position:center;
padding:0; 
margin:0;
text-decoration:none;
outline:0;
}

#container
{
padding: 0;
background:#e6e6e6;
-moz-border-radius:10px;
-webkit-border-radius:10px;
border-radius:10px;
behavior:url(/PIE.htc);
background-position:center;
float:left;
}

#container ul
{	
padding:0;
margin:0;
list-style-type:none;
vertical-align:center;
}

#menu li a
{
display:block;
width:192px;
height:35px;
line-height:35px;
font-size:15px;
font-weight:bold;
font-family:Arial,Helvetica,sans-serif;
color:#38a7dc;
text-align:center; 
padding:0;
margin:0;
}
#menu li a:hover
{
background:#38a7dc;
background-position:center;
color:#fff !important;
}

#menu li
{
width:192px;
text-align:center; 
padding:0;
margin:0;
}
</style>


<%if tcWebApi_get("WebCustom_Entry","isC1ZYSupported","h") = "Yes" then%>
<script language="JavaScript" src="/menu.js"></script>
<%end if%>
<script>
function doLoad()
{
	<%if tcWebApi_get("WebCustom_Entry","isC1ZYSupported","h") = "Yes" then%>
	initSubMenuColor();
	<%end if%>

       <%if tcWebApi_get("GPON_ONU","OnuType","h") = "1" then%>
 	window.top.main.location="/cgi-bin/access_auth.asp";
	<%else%>
	window.top.main.location="/cgi-bin/access_snmp.asp";
	<%End If%>
	
	document.getElementsByTagName("body")[0].style.height = window.innerHeight+"px";  

}

function change_bg(obj)
{
    var a=document.getElementById("menu").getElementsByTagName("a");
    for(var i=0;i<a.length;i++)
    {
        a[i].className="other";
        a[i].style.color="#38a7dc";
    }
    obj.className="current";
    obj.style.color="#fff";
}

</script>

</head>

<body onload="doLoad();" >
	<% tcWebApi_set("dynDisp_Entry", "CurPage", "3")%>
<div id="container">
<ul id="menu">
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
	<% If tcWebApi_get("WebCustom_Entry","isSNMPFunSupported","h") = "Yes" then %>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/access_snmp.asp" target="main" style="color:#fff;" onclick="change_bg(this);" class="current"> <%tcWebApi_get("String_Entry","NavigationAccSNMPText","s")%> </a></li>
	<% End if%>
	<% End if%>
	  
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/access_upnp.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAccUPnPText","s")%> </a></li>
	<% End if%>
	  
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/access_ddns.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAccDDNSText","s")%> </a></li>
	<% End if%>
	  
<!--foxconn burce add for port acl  start-->
<!--	  
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
		<li><a href="/cgi-bin/access_acl.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAccACLText","s")%> </a></li>
	<% End if%>
	


	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
		<li><a href="/cgi-bin/port_acl.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationPortCtlText","s")%> </a></li>
	<% End if%>
-->
<!--foxconn burce add for port acl  end -->
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit4","h") = "1" THEN%>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/access_ipfilter.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAccFilterText","s")%> </a></li>
	<% End if%>
	  
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit5","h") = "1" THEN%>
		<%if tcWebApi_get("WebCustom_Entry", "isC1HGUSupported", "h") = "Yes" then%>
			<li style="display:none"><a href="/cgi-bin/access_cwmp.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAccTR69Text","s")%> </a></li>
		<%else%>
			<li style="display:none"><a href="/cgi-bin/access_cwmp.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAccCWMPText","s")%> </a></li>
		<%End If%>
	<% End if%>
	  
	<%If tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>
		<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit7","h") = "1" THEN%>
			<%If tcWebApi_get("WebCustom_Entry", "isXponDASANSupported", "h") = "Yes" then%>
				<li><a href="/cgi-bin/access_auth_registerID.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","PonAuthText","s")%> </a></li>
			<%elseif tcWebApi_get("WebCustom_Entry", "isC1ZYSupported", "h") = "Yes" then%>
				<li><a href="/cgi-bin/access_auth_registerID.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","PonAuthText","s")%> </a></li>
			<%else%>
				<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/access_auth.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","PonAuthText","s")%> </a></li>
			<%End If%>
		<%End If%>
	<%End If%>
	  
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit6","h") = "1" THEN%>
		<li><a href="/cgi-bin/access_parental.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAccParentalText","s")%> </a></li>
	<% End if%>
	  
	<% IF tcWebApi_get("WebCustom_Entry","isSambaSupported","h") = "Yes" THEN%>
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit7","h") = "1" THEN%>
	    <li><a href="/cgi-bin/access_samba.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","SambaText","s")%> </a></li>
	<% End if%>
	<% End if%>
	  
	<% IF tcWebApi_get("GUI_Entry0","timeOfDay","h") = "support" THEN%>
		<li><a href="/cgi-bin/access_timeofday.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAccParentCtlText","s")%> </a></li>
	<% End if%>
	
</ul>
</div>
</body>
</html>
