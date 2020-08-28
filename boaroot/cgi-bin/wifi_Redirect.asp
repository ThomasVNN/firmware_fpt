<!DOCTYPE HTML PUBLIC "-//W3C//Dli HTML 4.01 Transitional//EN">
<html><head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" /> 
<meta http-equiv="Content-Type" content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<link rel="stylesheet" type="text/css" href="/style.css">

<style type="text/css">

 body
{
    width:100%;
    height:100%;
    background:url(/WiFiRedirect.png) no-repeat top center;
    padding:0;
    margin:0;
    font-size:17px; 
    font-style:bold;
}

table
{
    font-size:15px; 
    font-style:bold;
    font-family:Arial, Helvetica, sans-serif;
   
}

</style>

<script>
function doLoad()
{

	document.getElementsByTagName("body")[0].style.height = window.innerHeight+"px";  

}
</script>



</head>
<body onload="doLoad();">
<FORM METHOD="POST" ACTION="/cgi-bin/wifi_Redirect.asp" name="wifiRedirect_Form">


<table border="0" width="1003px" cellpadding="0" cellspacing="0" align="center">
<tr height="140px">
<td width="680">&nbsp;
</td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectEnglishInfo1Text","s")%>
</td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectEnglishInfo2Text","s")%>
</td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectEnglishInfo3Text","s")%></td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectEnglishInfo4Text","s")%>
</td>
</tr>



<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectEnglishInfo5Text","s")%>
</td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectEnglishInfo6Text","s")%>
</td>
</tr>


<tr height="80px">
<td>&nbsp;</td>
</tr>



<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectVNInfo1Text","s")%>
</td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectVNInfo2Text","s")%>
</td>
</tr>
<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectVNInfo3Text","s")%>
</td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectVNInfo4Text","s")%>
</td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectVNInfo5Text","s")%>
</td>
</tr>

<tr>
<td align="center">
<%tcWebApi_get("String_Entry","WiFiRedirectVNInfo6Text","s")%>
</td>
</tr>

</table>

</FORM>
</body>
</html>



