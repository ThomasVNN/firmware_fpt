<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head>
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
	display:block;
 	 background:url(/button2.jpg) no-repeat;
	 background-position:center;
  	padding:0;
  	margin:0;
	width:140px;
	text-align:center;
	line-height:40px;
	text-decoration:none;
	outline:0;
	color:#fff;
}
	
.other
{
  display:block;
  background:url(/button.jpg) no-repeat;
  background-position:center;
  padding:0;
  margin:0;
  width:140px;
  text-align:center;
  line-height:40px;
  text-decoration:none;
  outline:0;
  color:#fff;
}

#container ul
{
    list-style-type:none;
    float:right;
    margin:5px;
    padding:0;
}

#container
{
  height:100%;
  width:160px;
  margin-left:200px;
  margin-right:10px;
  margin-top:40px;
  padding:0;
  border-width:0;
}

#menu li a
{
    font-size:13px;
    font-weight:bold;
    margin:0;
}
#menu li
{
border-style:solid; 
border-color:#8C8C8C;
padding:0 0 0 3px;
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
	window.top.main.location="/cgi-bin/home_wizard.asp";
	document.getElementsByTagName("body")[0].style.height = window.innerHeight+"px";  

}

function change_bg(obj)
{
    var a=document.getElementById("menu").getElementsByTagName("a");
    for(var i=0;i<a.length;i++)
    {
        a[i].className="other";
    }
    obj.className="current";
}


</script>
</head>

<body onload="doLoad();" >
<% tcWebApi_set("dynDisp_Entry", "CurPage", "0")%>
<div id="container">
<ul id="menu"> 

<li><a href="/cgi-bin/home_wizard.asp" target="main"  onclick="change_bg(this);" class="current"> <%tcWebApi_get("String_Entry","NavigationAccQuickText","s")%>&nbsp;<%tcWebApi_get("String_Entry","NavigationAccStartText","s")%></a></li> 
</ul>
</div> 
</body>
</html>

