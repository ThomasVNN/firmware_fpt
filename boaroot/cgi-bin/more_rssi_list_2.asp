<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">

<style type="text/css">
.button2
{
display:inline-block;
cursor:pointer;
color:#fff;
font:bold 15px Arial,Verdana,sans-serif;
margin:10px;
padding:3px 8px;
line-height:normal;
*overflow:visible ;
text-align:center;
text-decoration:none;
position:relative;
background:#38a7dc;
border:1px solid #38a7dc;
outline:0;
}

#positionstyle
{
text-align:center;
}

#wrapper{
margin:20px auto;
width:660px;
background:#FFFFFF;
padding:10px 20px;
}

</style>

<script language="JavaScript">

function showTable(id,header,data,keyIndex){
	var html = [""];
	html.push("<table  width=660 border=1 align=center cellpadding=1 cellspacing=0  bordercolor=#CCCCCC bgcolor=#FFFFFF>");
	
	// 1.generate table header
	html.push("<tr height=30px>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + " align=center class=tabdata>" +"<STRONG><FONT color=#000000>"+ header[i][1] +"</font></strong>"+ "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
	for(var i =0; i<data.length; i++){
		if(data[i][keyIndex] != "N/A"){
			html.push("<tr height=30px>");
			for(var j=0; j<data[i].length; j++){
				html.push("<td align=center class=tabdata>" + data[i][j] + "</td>");
			}
			html.push("</tr>");
		}
	}
	html.push("</table>");
	
	html.push("<div id=positionstyle>");
	html.push("<input type=button name=MORE class=button2 value=\" 1 \" onClick=javascript:window.location=\'/cgi-bin/more_rssi_list_2.asp\'>");
	html.push("</div>");

	document.getElementById(id).innerHTML = html.join('');
}
</script>

</head>
<body>
<FORM METHOD="POST" ACTION="/cgi-bin/more_rssi_list_2.asp" name="rssi_client_list">

<div id="wrapper">
<INPUT type="HIDDEN" name="LeaseNum" value="<%TcWebApi_get("WiFiInfo_Common","WiFiNum","s")%>">
<table width="660px" border="0" style="table-layout: fixed;" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="uiViewBodyTable">
  
  <tr height="30px">
  	<td class="title-main" align=left style="white-space:nowrap;">
  	<%tcWebApi_get("String_Entry","WirelessRSSIInformation","s")%></td>
  </tr>	 
</table>
  
<table width="660" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
 <tr id="buttoncolor">
 <td align=left class="tabdata">
	<div id=rssiclientList></div>
<script language=JavaScript>
	var tableHeader = [
	["8%","<%tcWebApi_get("String_Entry","LANDTABLEINDEXText","s")%>"],
	["22%","<%tcWebApi_get("String_Entry","LANDTABLEHOSTNAMEText","s")%>"],
	["18%","<%tcWebApi_get("String_Entry","LANDTABLEIPText","s")%>"],
	["24%","<%tcWebApi_get("String_Entry","LANDTABLEMACText","s")%>"],
	["14%","<%tcWebApi_get("String_Entry","WLANRSSI1","s")%>"],	
	["14%","<%tcWebApi_get("String_Entry","WLANRSSI2","s")%>"]
	];

var tableData = [
	["31", "<%tcWebApi_get("WiFiInfo_Entry30", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry30", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry30", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry30", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry30", "Rssi1","s")%>"],
	["32", "<%tcWebApi_staticGet("WiFiInfo_Entry31", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry31", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry31", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry31", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry31", "Rssi1","s")%>"],
	["33", "<%tcWebApi_staticGet("WiFiInfo_Entry32", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry32", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry32", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry32", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry32", "Rssi1","s")%>"],
	["34", "<%tcWebApi_staticGet("WiFiInfo_Entry33", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry33", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry33", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry33", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry33", "Rssi1","s")%>"],
	["35", "<%tcWebApi_staticGet("WiFiInfo_Entry34", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry34", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry34", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry34", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry34", "Rssi1","s")%>"],
	["36", "<%tcWebApi_staticGet("WiFiInfo_Entry35", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry35", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry35", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry35", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry35", "Rssi1","s")%>"],
	["37", "<%tcWebApi_staticGet("WiFiInfo_Entry36", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry36", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry36", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry36", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry36", "Rssi1","s")%>"],
	["38", "<%tcWebApi_staticGet("WiFiInfo_Entry37", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry37", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry37", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry37", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry37", "Rssi1","s")%>"],
	["39", "<%tcWebApi_staticGet("WiFiInfo_Entry38", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry38", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry38", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry38", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry38", "Rssi1","s")%>"],
	["40", "<%tcWebApi_staticGet("WiFiInfo_Entry39", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry39", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry39", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry39", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry39", "Rssi1","s")%>"],
	["41", "<%tcWebApi_staticGet("WiFiInfo_Entry40", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry40", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry40", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry40", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry40", "Rssi1","s")%>"],
	["42", "<%tcWebApi_staticGet("WiFiInfo_Entry41", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry41", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry41", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry41", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry41", "Rssi1","s")%>"],
	["43", "<%tcWebApi_staticGet("WiFiInfo_Entry42", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry42", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry42", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry42", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry42", "Rssi1","s")%>"],
	["44", "<%tcWebApi_staticGet("WiFiInfo_Entry43", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry43", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry43", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry43", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry43", "Rssi1","s")%>"],
	["45", "<%tcWebApi_staticGet("WiFiInfo_Entry44", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry44", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry44", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry44", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry44", "Rssi1","s")%>"],
	["46", "<%tcWebApi_staticGet("WiFiInfo_Entry45", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry45", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry45", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry45", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry45", "Rssi1","s")%>"],
	["47", "<%tcWebApi_staticGet("WiFiInfo_Entry46", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry46", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry46", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry46", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry46", "Rssi1","s")%>"],
	["48", "<%tcWebApi_staticGet("WiFiInfo_Entry47", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry47", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry47", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry47", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry47", "Rssi1","s")%>"],
	["49", "<%tcWebApi_staticGet("WiFiInfo_Entry48", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry48", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry48", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry48", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry48", "Rssi1","s")%>"],
	["50", "<%tcWebApi_staticGet("WiFiInfo_Entry49", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry49", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry49", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry49", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry49", "Rssi1","s")%>"],
	["51", "<%tcWebApi_staticGet("WiFiInfo_Entry50", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry50", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry50", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry50", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry50", "Rssi1","s")%>"]
];

		showTable('rssiclientList',tableHeader,tableData,2);
		</script>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
