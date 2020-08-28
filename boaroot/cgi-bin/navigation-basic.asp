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
 	window.top.main.location="/cgi-bin/home_lan.asp";
	<%else%>
	window.top.main.location="/cgi-bin/home_wizard.asp";
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
	<% tcWebApi_set("dynDisp_Entry", "CurPage", "1")%>
<div id="container">
<ul id="menu">
<!--CINDY add 11/29-->
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
	<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_wizard.asp" target="main" style="color:#fff;" onclick="change_bg(this);" class="current"> <%tcWebApi_get("String_Entry","NavigationAccQuickText","s")%>&nbsp;<%tcWebApi_get("String_Entry","NavigationAccStartText","s")%> </a></li> 
	<% End if%>
<!--CINDY add 11/29-->

	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit0","h") = "1" THEN%>
	<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_wan.asp" target="main"  onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBasInternetText","s")%> </a></li> 
	<% End if%>
	
	<%if tcwebApi_get("WebCustom_Entry","is3GDongleSupport","h")="Yes" then%>
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit5","h") = "1" THEN%>
	<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_3g.asp" target="main"  onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBas3GDongleText","s")%> </a></li>
	<% End if%>
	<% End if%>
	
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit1","h") = "1" THEN%>
		 <li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_lan.asp" target="main"  onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBasLANText","s")%> </a></li>
	<% End if%>
       
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit2","h") = "1" THEN%>
	<% If tcWebApi_get("Info_WLan","isExist","h") = "On" Then%>    
		 <li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_wireless.asp" target="main"  onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBasWirelessText","s")%> </a></li> 
		<!--cindy delete
		 <li><a href="/cgi-bin/wifiqa_advanced.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","WMM2G","s")%></a></li> 
		-->
	<% elseif tcWebApi_get("Info_WLan","isExist","h") = "Error" Then%>    
		 <li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_wireless.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBasWirelessText","s")%> </a></li> 
		<!--cindy delete
		 <li><a href="/cgi-bin/wifiqa_advanced.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","WMM2G","s")%></a></li> 
		-->
	<% elseif tcWebApi_get("Info_WLan","isExist","h") = "Disable" Then%>    
		 <li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_wireless.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBasWirelessText","s")%> </a></li> 
		<!--cindy delete
		 <li><a href="/cgi-bin/wifiqa_advanced.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","WMM2G","s")%></a></li> 
		-->
	<%End if%>
	<% End if%>
       
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit6","h") = "1" THEN%>
	<% If tcWebApi_get("Info_WLan11ac","isExist","h") = "On" Then%>
		 <li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_wireless_5g.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBas5GWirelessText","s")%> </a></li> 
		<!--cindy delete
		 <li><a href="/cgi-bin/wifiqa_advanced_5G.asp" target="main" onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","WMM5G","s")%></a></li> 
		-->
	<% elseif tcWebApi_get("Info_WLan11ac","isExist","h") = "Error" Then%>    
		 <li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_wireless_5g.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBas5GWirelessText","s")%> </a></li> 
		<!--cindy delete
		 <li><a href="/cgi-bin/wifiqa_advanced_5G.asp" target="main" onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","WMM5G","s")%></a></li> 
		-->
	<% elseif tcWebApi_get("Info_WLan11ac","isExist","h") = "Disable" Then%>    
		 <li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/home_wireless_5g.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBas5GWirelessText","s")%> </a></li> 
		<!--cindy delete
		 <li><a href="/cgi-bin/wifiqa_advanced_5G.asp" target="main" onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","WMM5G","s")%></a></li> 
		-->
	<%End if%>
	<% End if%> 
<!--cindy move from navigation_advanced.asp-->
	        <li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/adv_nat_top.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAdvNATText","s")%> </a></li>
	        <li><a href="/cgi-bin/adv_qos.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationAdvQoSText","s")%> </a></li>
<!--cindy move from navigation_advanced.asp-->
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit3","h") = "1" THEN%>
         <li><a href="/cgi-bin/home_advancedwireless.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBasAdvWireText","s")%> </a></li> 
	<%End if%>
	
	<%IF tcwebApi_get("WebCustom_Entry","is6RDSupported", "h")="Yes" then%>
	<% IF tcWebApi_get("dynDisp_Entry","CurMaskBit4","h") = "1" THEN%>
	 <li><a href="/cgi-bin/adv_6rdtunnel.asp" target="main" onclick="change_bg(this);" class="other"> <%tcWebApi_get("String_Entry","NavigationBasIPv6RDText","s")%> </a></li> 
	<% End if%>
	<% End if%>

</ul>
</div>
</body>
</html>
