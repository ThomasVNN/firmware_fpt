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
	window.top.main.location="/cgi-bin/tools_admin.asp";
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
		<% tcWebApi_set("dynDisp_Entry", "CurPage", "4")%>
<div id="container">
<ul id="menu">

              <% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/tools_admin.asp" target="main" style="color:#fff;" onclick="change_bg(this);" class="current"> <%tcWebApi_get("String_Entry","NavigationMainAdminText","s")%></a> </li> 
		<% End if%>
		
 	       <% IF tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/tools_time.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationMainTimeZoneText","s")%></a> </li> 
		<% End if%>
	  		
		<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/tools_update.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationMainFirmwareText","s")%></a> </li> 
		<% End if%>
	  		
		<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/tools_system.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationMainSysRestartText","s")%></a> </li> 
		<% End if%>
	  		
		<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit4","h") = "1" THEN%>
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/tools_test.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationMainDiagnosticsText","s")%></a> </li> 
		<% End if%>
	  		
		<!--cindy add for wifi timer and reboot timer 20190730-->
		<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/tools_wifitimer.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationMainWiFiTimerText","s")%></a> </li> 
		<li><a href="/cgi-bin/tools_reboottimer.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationMainRebootTimerText","s")%></a> </li> 
		<!--cindy add for wifi timer and reboot timer 20190730-->
		
		<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit5","h") = "1" THEN%>
		<li><a href="/cgi-bin/tools_save.asp" target="main"  onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","NavigationMainSaveText","s")%></a> </li>
		<% End if%>
		
		<% IF tcWebApi_get("GUI_Entry0","landingPage","h") = "support" THEN%>
		<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit6","h") = "1" THEN%>
		<li><a href="/cgi-bin/tools_landingPage.asp" target="main"  onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","NavigationMainlandingPageText","s")%></a> </li>

   	  
	<% IF tcWebApi_get("GUI_Entry0","vlanTag","h") = "support" THEN%>
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit6","h") = "1" THEN%>
		<li><a href="/cgi-bin/adv_pvidsetting.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAdvPvidText","s")%> </a></li>
	<% End if%>
	<% End if%>

	<%IF tcwebApi_get("GUI_Entry0","staticRoute6", "h")="support" then%>
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit7","h") = "1" THEN%>
	        <li><a href="/cgi-bin/adv_ipv6_static_route.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAdvIPv6Text","s")%> </a></li>
	<% End if%>
	<% End if%>
	  
	<% if tcWebApi_get("WebCustom_Entry", "isRoutePolicySupported", "h") = "Yes" then%>
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit7","h") = "1" THEN%>
	       <li><a href="/cgi-bin/adv_routepolicy.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAdvRoutePolicyText","s")%> </a></li> 
	<% End if%>
	<% End if%>
	  
	<% IF tcWebApi_get("FonNet_Entry","WebGUI","h") = "1" THEN%>
	        <li><a href="/cgi-bin/adv_fonnet.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationFONText","s")%> </a></li>
	<% End if%>
	  
	<% If tcWebApi_get("WebCustom_Entry","isVpnSupport","h") = "Yes" then %>
	        <li><a href="/cgi-bin/adv_vpn_setting.asp" target="main" onclick="change_bg(this);" class="other"> 
	        	<%tcWebApi_get("String_Entry","SetAdvVPNSettingText","s")%> </a></li>
	<% End if%>



		
		<% End if%>
		<% End if%>

</ul>
</div>
</body>
</html>
