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
	window.top.main.location="/cgi-bin/help_status.asp";
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
<% tcWebApi_set("dynDisp_Entry", "CurPage", "7")%>
<div id="container">
<ul id="menu">
<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/help_status.asp" target="main" style="color:#fff;" onclick="change_bg(this);" class="current"><%tcWebApi_get("String_Entry","NavigationStatusText","s")%></a></li>
<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/help_interface.asp" target="main"  onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","NavigationAccSetupText","s")%></a></li>
<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/help_advanced.asp" target="main"  onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","NavigationAccAdvancedText","s")%></a></li>
<li style="border-bottom:1px solid #e6e6e6;"><a href="/cgi-bin/help_access.asp" target="main"  onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","HelpIndexAccManageText","s")%></a></li>
<li ><a href="/cgi-bin/help_maintenance.asp" target="main"  onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","HelpIndexMaintenText","s")%></a></li>
<!--cindy delete 09/06
<li ><a href="/cgi-bin/help_quickstart.asp" target="main"  onclick="change_bg(this);" class="other"><%tcWebApi_get("String_Entry","HelpIndexQuickText","s")%></a></li>
-->
</ul>
</div>
</body></html>
