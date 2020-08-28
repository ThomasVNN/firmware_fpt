<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" href="/style.css" type="text/css">
<script language="JavaScript" src="OutVariant.asp"></script>
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" src="/jsl.js"></script>
<script language="JavaScript" src="/ip.js"></script>
<style  type="text/css">
*{color:  #404040;}

#positionstyle
{
margin-left:20px;
}
</style>

<script language="JavaScript">
function Reload(){
window.location.reload();

}

function showTable0(id,header,data,keyIndex){
	var html = ["<table id=client_list border=0  cellpadding=1 cellspacing=0>"];
	
	// 1.generate table header
	html.push("<tr height=30px>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + " align=center class=tabdata>" +"<STRONG><FONT color=#000000>"+ header[i][1] +" </strong>"+ "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
	for(var i =0; i<data.length; i++){
		if(data[i][keyIndex] != "N/A"){
			html.push("<tr height=30px>");
			for(var j=0; j<data[i].length; j++){
				html.push("<td align=center class=topborderstyle>" + data[i][j] + "</td>");
			}
			html.push("</tr>");
		}
	}
	html.push("</table>");
	if(parseInt(document.Devicetable.WIFILeaseNum.value)>30)
	{
		html.push("<div id=positionstyle>");
		html.push("<input type=button name=MORE class=button1 value=More... onClick=javascript:window.open(\"/cgi-bin/more_rssi_list_2.asp\")>");
		html.push("</div>");
	}

	document.getElementById(id).innerHTML = html.join('');
}


function showTable1(id,header,data,keyIndex){
	var html = ["<table id=client_list border=0  cellpadding=1 cellspacing=0>"];
	
	// 1.generate table header
	html.push("<tr height=30px>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + " align=center class=tabdata>" +"<STRONG><FONT color=#000000>"+ header[i][1] +" </strong>"+ "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
	for(var i =0; i<data.length; i++){
		if(data[i][keyIndex] != "N/A"){
			html.push("<tr height=30px>");
			for(var j=0; j<data[i].length; j++){
				html.push("<td align=center class=topborderstyle>" + data[i][j] + "</td>");
			}
			html.push("</tr>");
		}
	}
	html.push("</table>");
	if(parseInt(document.Devicetable.WIFI5GLeaseNum.value)>30)
	{
		html.push("<div id=positionstyle>");
		html.push("<input type=button name=MORE class=button1 value=More... onClick=javascript:window.open(\"/cgi-bin/more_rssi_list_5.asp\")>")
		html.push("</div>");
	}

	document.getElementById(id).innerHTML = html.join('');
}

 </script>
 
</head>

<body>
<FORM METHOD="POST" ACTION="/cgi-bin/Devicetable.asp" name="Devicetable">
<div id="pagestyle"><!--cindy add for border 11/28-->
<div id="contenttype">
<div id="block1">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">  
		<td class="title-main" align=left style="padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessRSSIInformation","s")%></td>
    </tr>	 
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
 <tr>
 <td align=left class="tabdata">
 <div class="configstyle">
 <INPUT type="HIDDEN" name="WIFILeaseNum" value="<%TcWebApi_get("WiFiInfo_Common","WiFiNum","s")%>">
 <div id="RSSI2"></div>
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
	["1", "<%tcWebApi_Get("WiFiInfo_Entry0", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry0", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry0", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry0", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry0", "Rssi1","s")%>"],
	["2", "<%tcWebApi_staticGet("WiFiInfo_Entry1", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry1", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry1", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry1", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry1", "Rssi1","s")%>"],
	["3", "<%tcWebApi_staticGet("WiFiInfo_Entry2", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry2", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry2", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry2", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry2", "Rssi1","s")%>"],
	["4", "<%tcWebApi_staticGet("WiFiInfo_Entry3", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry3", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry3", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry3", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry3", "Rssi1","s")%>"],
	["5", "<%tcWebApi_staticGet("WiFiInfo_Entry4", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry4", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry4", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry4", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry4", "Rssi1","s")%>"],
	["6", "<%tcWebApi_staticGet("WiFiInfo_Entry5", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry5", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry5", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry5", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry5", "Rssi1","s")%>"],
	["7", "<%tcWebApi_staticGet("WiFiInfo_Entry6", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry6", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry6", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry6", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry6", "Rssi1","s")%>"],
	["8", "<%tcWebApi_staticGet("WiFiInfo_Entry7", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry7", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry7", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry7", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry7", "Rssi1","s")%>"],
	["9", "<%tcWebApi_staticGet("WiFiInfo_Entry8", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry8", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry8", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry8", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry8", "Rssi1","s")%>"],
	["10", "<%tcWebApi_staticGet("WiFiInfo_Entry9", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry9", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry9", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry9", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry9", "Rssi1","s")%>"],
	["11", "<%tcWebApi_staticGet("WiFiInfo_Entry10", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry10", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry10", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry10", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry10", "Rssi1","s")%>"],
	["12", "<%tcWebApi_staticGet("WiFiInfo_Entry11", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry11", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry11", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry11", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry11", "Rssi1","s")%>"],
	["13", "<%tcWebApi_staticGet("WiFiInfo_Entry12", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry12", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry12", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry12", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry12", "Rssi1","s")%>"],
	["14", "<%tcWebApi_staticGet("WiFiInfo_Entry13", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry13", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry13", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry13", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry13", "Rssi1","s")%>"],
	["15", "<%tcWebApi_staticGet("WiFiInfo_Entry14", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry14", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry14", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry14", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry14", "Rssi1","s")%>"],
	["16", "<%tcWebApi_staticGet("WiFiInfo_Entry15", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry15", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry15", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry15", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry15", "Rssi1","s")%>"],
	["17", "<%tcWebApi_staticGet("WiFiInfo_Entry16", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry16", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry16", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry16", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry16", "Rssi1","s")%>"],
	["18", "<%tcWebApi_staticGet("WiFiInfo_Entry17", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry17", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry17", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry17", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry17", "Rssi1","s")%>"],
	["19", "<%tcWebApi_staticGet("WiFiInfo_Entry18", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry18", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry18", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry18", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry18", "Rssi1","s")%>"],
	["20", "<%tcWebApi_staticGet("WiFiInfo_Entry19", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry19", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry19", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry19", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry19", "Rssi1","s")%>"],
	["21", "<%tcWebApi_staticGet("WiFiInfo_Entry20", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry20", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry20", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry20", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry20", "Rssi1","s")%>"],
	["22", "<%tcWebApi_staticGet("WiFiInfo_Entry21", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry21", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry21", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry21", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry21", "Rssi1","s")%>"],
	["23", "<%tcWebApi_staticGet("WiFiInfo_Entry22", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry22", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry22", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry22", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry22", "Rssi1","s")%>"],
	["24", "<%tcWebApi_staticGet("WiFiInfo_Entry23", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry23", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry23", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry23", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry23", "Rssi1","s")%>"],
	["25", "<%tcWebApi_staticGet("WiFiInfo_Entry24", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry24", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry24", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry24", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry24", "Rssi1","s")%>"],
	["26", "<%tcWebApi_staticGet("WiFiInfo_Entry25", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry25", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry25", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry25", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry25", "Rssi1","s")%>"],
	["27", "<%tcWebApi_staticGet("WiFiInfo_Entry26", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry26", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry26", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry26", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry26", "Rssi1","s")%>"],
	["28", "<%tcWebApi_staticGet("WiFiInfo_Entry27", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry27", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry27", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry27", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry27", "Rssi1","s")%>"],
	["29", "<%tcWebApi_staticGet("WiFiInfo_Entry28", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry28", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry28", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry28", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry28", "Rssi1","s")%>"],
	["30", "<%tcWebApi_staticGet("WiFiInfo_Entry29", "HostName","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry29", "IP","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry29", "MAC","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry29", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFiInfo_Entry29", "Rssi1","s")%>"]	
	];

		showTable0('RSSI2',tableHeader,tableData,2);
	</script>
</div>
</td>
</tr>	 
</table>
</div><!--id="block1" 12/11-->

<div id="block1">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">    
		<td class="title-main" align=left style="padding-left:20px;"> <%tcWebApi_get("String_Entry","Wireless5GRSSIInformation","s")%></td>
    </tr>	 
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
 <tr>
 <td align=left class="tabdata">
 <div class="configstyle">
 <INPUT type="HIDDEN" name="WIFI5GLeaseNum" value="<%TcWebApi_get("WiFi5GInfo_Common","WiFi5GNum","s")%>">
 <div id="RSSI5"></div>
	<script language=JavaScript>
	var tableHeader5g = [
	["8%","<%tcWebApi_get("String_Entry","LANDTABLEINDEXText","s")%>"],
	["22%","<%tcWebApi_get("String_Entry","LANDTABLEHOSTNAMEText","s")%>"],
	["18%","<%tcWebApi_get("String_Entry","LANDTABLEIPText","s")%>"],
	["24%","<%tcWebApi_get("String_Entry","LANDTABLEMACText","s")%>"],
	["14%","<%tcWebApi_get("String_Entry","WLANRSSI1","s")%>"],	
	["14%","<%tcWebApi_get("String_Entry","WLANRSSI2","s")%>"]
	];

	var tableData5g = [
	["1", "<%tcWebApi_Get("WiFi5GInfo_Entry0", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry0", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry0", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry0", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry0", "Rssi1","s")%>"],
	["2", "<%tcWebApi_staticGet("WiFi5GInfo_Entry1", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry1", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry1", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry1", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry1", "Rssi1","s")%>"],
	["3", "<%tcWebApi_staticGet("WiFi5GInfo_Entry2", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry2", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry2", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry2", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry2", "Rssi1","s")%>"],
	["4", "<%tcWebApi_staticGet("WiFi5GInfo_Entry3", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry3", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry3", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry3", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry3", "Rssi1","s")%>"],
	["5", "<%tcWebApi_staticGet("WiFi5GInfo_Entry4", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry4", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry4", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry4", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry4", "Rssi1","s")%>"],
	["6", "<%tcWebApi_staticGet("WiFi5GInfo_Entry5", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry5", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry5", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry5", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry5", "Rssi1","s")%>"],
	["7", "<%tcWebApi_staticGet("WiFi5GInfo_Entry6", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry6", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry6", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry6", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry6", "Rssi1","s")%>"],
	["8", "<%tcWebApi_staticGet("WiFi5GInfo_Entry7", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry7", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry7", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry7", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry7", "Rssi1","s")%>"],
	["9", "<%tcWebApi_staticGet("WiFi5GInfo_Entry8", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry8", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry8", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry8", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry8", "Rssi1","s")%>"],
	["10", "<%tcWebApi_staticGet("WiFi5GInfo_Entry9", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry9", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry9", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry9", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry9", "Rssi1","s")%>"],
	["11", "<%tcWebApi_staticGet("WiFi5GInfo_Entry10", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry10", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry10", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry10", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry10", "Rssi1","s")%>"],
	["12", "<%tcWebApi_staticGet("WiFi5GInfo_Entry11", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry11", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry11", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry11", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry11", "Rssi1","s")%>"],
	["13", "<%tcWebApi_staticGet("WiFi5GInfo_Entry12", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry12", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry12", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry12", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry12", "Rssi1","s")%>"],
	["14", "<%tcWebApi_staticGet("WiFi5GInfo_Entry13", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry13", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry13", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry13", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry13", "Rssi1","s")%>"],
	["15", "<%tcWebApi_staticGet("WiFi5GInfo_Entry14", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry14", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry14", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry14", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry14", "Rssi1","s")%>"],
	["16", "<%tcWebApi_staticGet("WiFi5GInfo_Entry15", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry15", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry15", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry15", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry15", "Rssi1","s")%>"],
	["17", "<%tcWebApi_staticGet("WiFi5GInfo_Entry16", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry16", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry16", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry16", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry16", "Rssi1","s")%>"],
	["18", "<%tcWebApi_staticGet("WiFi5GInfo_Entry17", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry17", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry17", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry17", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry17", "Rssi1","s")%>"],
	["19", "<%tcWebApi_staticGet("WiFi5GInfo_Entry18", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry18", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry18", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry18", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry18", "Rssi1","s")%>"],
	["20", "<%tcWebApi_staticGet("WiFi5GInfo_Entry19", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry19", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry19", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry19", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry19", "Rssi1","s")%>"],
	["21", "<%tcWebApi_staticGet("WiFi5GInfo_Entry20", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry20", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry20", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry20", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry20", "Rssi1","s")%>"],
	["22", "<%tcWebApi_staticGet("WiFi5GInfo_Entry21", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry21", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry21", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry21", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry21", "Rssi1","s")%>"],
	["23", "<%tcWebApi_staticGet("WiFi5GInfo_Entry22", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry22", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry22", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry22", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry22", "Rssi1","s")%>"],
	["24", "<%tcWebApi_staticGet("WiFi5GInfo_Entry23", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry23", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry23", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry23", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry23", "Rssi1","s")%>"],
	["25", "<%tcWebApi_staticGet("WiFi5GInfo_Entry24", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry24", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry24", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry24", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry24", "Rssi1","s")%>"],
	["26", "<%tcWebApi_staticGet("WiFi5GInfo_Entry25", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry25", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry25", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry25", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry25", "Rssi1","s")%>"],
	["27", "<%tcWebApi_staticGet("WiFi5GInfo_Entry26", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry26", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry26", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry26", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry26", "Rssi1","s")%>"],
	["28", "<%tcWebApi_staticGet("WiFi5GInfo_Entry27", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry27", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry27", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry27", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry27", "Rssi1","s")%>"],
	["29", "<%tcWebApi_staticGet("WiFi5GInfo_Entry28", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry28", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry28", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry28", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry28", "Rssi1","s")%>"],
	["30", "<%tcWebApi_staticGet("WiFi5GInfo_Entry29", "HostName","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry29", "IP","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry29", "MAC","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry29", "Rssi0","s")%>","<%tcWebApi_staticGet("WiFi5GInfo_Entry29", "Rssi1","s")%>"]
	];

		showTable1('RSSI5',tableHeader5g,tableData5g,2);
	</script>
</div>
</td>
</tr>	 
</table>
</div><!--id="block1" 12/11-->

<div id="button0">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
	<tr height="25px">		
		<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;"><%tcWebApi_get("String_Entry","WirelessSignalText","s")%></td>
	</tr>
</table>

<table width="620" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr height="30px">
<td align=left class="tabdata" style="padding-left:20px;">
<input type="button" class="button1" onclick="Reload()" value="<%tcWebApi_get("String_Entry","ButtonRefresh0Text","s")%>"></td>
</tr>
</table>
</div>
</div><!--id="contenttype"-->
</div><!--id="pagestyle"-->

	<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
               <table width="690" border="0" cellpadding="0" cellspacing="0">
	        	<tr height="30">
				<td width="20">&nbsp;</td>
				<td width="250">&nbsp;</td>
				<td width="420"></td>
			</tr>	
			<tr>
				<td align=center colSpan=3 style="background-color:transparent;font-family: Arial,Helvetica,sans-serif;"><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%> </font></td>
			</tr>
			<tr height="10">
		        	<td width="20">&nbsp;</td>
				<td width="250">&nbsp;</td>
				<td width="420"></td>
			</tr>	
		</table>
	<%end if%>
 </FORM>
</body></html>
