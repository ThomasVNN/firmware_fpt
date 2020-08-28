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
	window.top.main.location="/cgi-bin/status_deviceinfo.asp";
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

<body onload="doLoad();" style="margin:0;padding:0;">
<% tcWebApi_set("dynDisp_Entry", "CurPage", "6")%>
<div id="container">
<ul id="menu">
<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
	<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/status_deviceinfo.asp" target="main" style="color:#fff;" onclick="change_bg(this);" class="current"><%tcWebApi_get("String_Entry","NavigationStatusDeviceText","s")%></a></li>
<%End if%>
	 
<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
	<%if tcWebApi_get("WebCustom_Entry","isSyslogEnhance","h") = "Yes" then%>
	<li  style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/status_log2.asp" target="main" onclick="change_bg(this);" class="other">  <%tcWebApi_get("String_Entry","NavigationStatusSystemText","s")%>  </a></li>
	<%else%>
	<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/status_log.cgi" target="main" onclick="change_bg(this);" class="other">  <%tcWebApi_get("String_Entry","NavigationStatusSystemText","s")%>  </a></li>
	<%end if%>
<%End if%>

<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
	<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/status_statistics.asp" target="main" onclick="change_bg(this);"  class="other">  <%tcWebApi_get("String_Entry","NavigationStatusStatisticsText","s")%>  </a></li>
<%End if%>
	
<% IF tcWebApi_get("WebCustom_Entry","isVOIPSupported","h") = "Yes" THEN%>
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
		<% IF tcWebApi_get("VoIPBasic_Common","SIPProtocol","h") <> "H.248" THEN%>
		<li ><a href="/cgi-bin/status_voip.asp" target="main" onclick="change_bg(this);" class="other">  VoIP  </a></li>
		<%else%>
		<li ><a href="/cgi-bin/status_voip_Megaco.asp" target="main" onclick="change_bg(this);" class="other">  VoIP  </a></li>
		<%end if%>
	<%End if%>
<%End if%>

<%if tcwebApi_get("WebCustom_Entry","isCZOTESupported","h")="Yes" then%>
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
	<%End if%>
	<li ><a href="/cgi-bin/wizardPPP_OTE.asp" target="main" onclick="change_bg(this);" class="other">  <%tcWebApi_get("String_Entry","NavigationStatusInforText","s")%>  </a></li>
<%End if%>	
<!--cindy add for wifi table and lan table 12/11-->
	<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/EthernetStatus.asp" target="main" onclick="change_bg(this);"  class="other">  <%tcWebApi_get("String_Entry","EthernetStatusText","s")%>  </a></li>
	<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/devicetable.asp" target="main" onclick="change_bg(this);"  class="other">  <%tcWebApi_get("String_Entry","NavigationTDeviceTableText","s")%>  </a></li>
	<li><a href="/cgi-bin/wirelessSignal.asp" target="main" onclick="change_bg(this);"  class="other">  <%tcWebApi_get("String_Entry","NavigationTWirelessSignalText","s")%>  </a></li>

<!--cindy add for wifi table and lan table 12/11-->
</ul>
</div>
</body>
</html>
