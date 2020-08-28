
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<style type="text/css">
.button_1
{
display:inline-block;
cursor:pointer;
color:#fff;
font:bold 15px Arial,Verdana,sans-serif;
margin:10px 5px;
padding:3px 8px;
line-height:normal;
*overflow:visible ;
text-align:center;
text-decoration:none;
position:relative;
background:#38a7dc;
behavior:url(/PIE.htc);
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
	html.push("<table id=client_list width=660 border=1 align=center cellpadding=1 cellspacing=0  bordercolor=#CCCCCC bgcolor=#FFFFFF>");
	
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
	if(parseInt(document.dchp_client_list.LeaseNum.value)>210)
	{
		html.push("<div id=positionstyle>");
		html.push("<input type=button name=MORE class=button_1 value=\" 1 \" onClick=javascript:window.location=\'/cgi-bin/more_client_list.asp\'>");
		html.push("<input type=button name=MORE class=button_1 value=\" 2 \" onClick=javascript:window.location=\'/cgi-bin/more_client_list_2.asp\'>");
		html.push("<input type=button name=MORE class=button_1 value=\" 3 \" onClick=javascript:window.location=\'/cgi-bin/more_client_list_3.asp\'>");
		html.push("</div>");
	}
	else if(parseInt(document.dchp_client_list.LeaseNum.value)>110)
	{
		html.push("<div id=positionstyle>");
		html.push("<input type=button name=MORE class=button_1 value=\" 1 \" onClick=javascript:window.location=\'/cgi-bin/more_client_list.asp\'>");
		html.push("<input type=button name=MORE class=button_1 value=\" 2 \" onClick=javascript:window.location=\'/cgi-bin/more_client_list_2.asp\'>");
		html.push("</div>");
	}
	else
	{
		html.push("<div id=positionstyle>");
		html.push("<input type=button name=MORE class=button_1 value=\" 1 \" onClick=javascript:window.location=\'/cgi-bin/more_client_list.asp\'>");
		html.push("</div>");
	}
	document.getElementById(id).innerHTML = html.join('');
}
</script>

<style type="text/css">

</style>
</head>
<body>
<FORM METHOD="POST" ACTION="/cgi-bin/more_client_list.asp" name="dchp_client_list">

<div id="wrapper">
<INPUT type="HIDDEN" name="LeaseNum" value="<%TcWebApi_get("LanHost","LeaseNum","s")%>">
<table width="660px" border="0" style="table-layout: fixed;" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="uiViewBodyTable">

  <tr height="30px">
  	<td class="title-main" align=left style="white-space:nowrap;">
  	<%tcWebApi_get("String_Entry","LANClientListText","s")%></td>
  </tr>
  </table>
   
<table width="660" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
 <tr id="buttoncolor">
 <td align=left class="tabdata">
	<div id=dhcpclientList></div>
<script language=JavaScript>
var tableHeader = [
	["8%","<%tcWebApi_get("String_Entry","LANDTABLEINDEXText","s")%>"],
	["22%","<%tcWebApi_get("String_Entry","LANDTABLEHOSTNAMEText","s")%>"],
	["16%","<%tcWebApi_get("String_Entry","LANDTABLEIPText","s")%>"],
	["19%","<%tcWebApi_get("String_Entry","LANDTABLEMACText","s")%>"],
	["19%","<%tcWebApi_get("String_Entry","LANDTABLECONNECTYPEText","s")%>"],	
	["16%","<%tcWebApi_get("String_Entry","LANDTABLEEXPIREText","s")%>"]
];
//amy change DhcpLease_Entry.x to LanHost_Entry.x 20180322.
var tableData = [
	["211", "<%tcWebApi_get("LanHost_Entry210", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry210", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry210", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry210", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry210", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry210", "ExpireTime","s")%>"],
	["212", "<%tcWebApi_staticGet("LanHost_Entry211", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry211", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry211", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry211", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry211", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry211", "ExpireTime","s")%>"],
	["213", "<%tcWebApi_staticGet("LanHost_Entry212", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry212", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry212", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry212", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry212", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry212", "ExpireTime","s")%>"],
	["214", "<%tcWebApi_staticGet("LanHost_Entry213", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry213", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry213", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry213", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry213", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry213", "ExpireTime","s")%>"],
	["215", "<%tcWebApi_staticGet("LanHost_Entry214", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry214", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry214", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry214", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry214", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry214", "ExpireTime","s")%>"],
	["216", "<%tcWebApi_staticGet("LanHost_Entry215", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry215", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry215", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry215", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry215", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry215", "ExpireTime","s")%>"],
	["217", "<%tcWebApi_staticGet("LanHost_Entry216", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry216", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry216", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry216", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry216", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry216", "ExpireTime","s")%>"],
	["218", "<%tcWebApi_staticGet("LanHost_Entry217", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry217", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry217", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry217", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry217", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry217", "ExpireTime","s")%>"],
	["219", "<%tcWebApi_staticGet("LanHost_Entry218", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry218", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry218", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry218", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry218", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry218", "ExpireTime","s")%>"],
	["220", "<%tcWebApi_staticGet("LanHost_Entry219", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry219", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry219", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry219", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry219", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry219", "ExpireTime","s")%>"],
	["221", "<%tcWebApi_staticGet("LanHost_Entry220", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry220", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry220", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry220", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry220", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry220", "ExpireTime","s")%>"],
	["222", "<%tcWebApi_staticGet("LanHost_Entry221", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry221", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry221", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry221", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry221", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry221", "ExpireTime","s")%>"],
	["223", "<%tcWebApi_staticGet("LanHost_Entry222", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry222", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry222", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry222", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry222", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry222", "ExpireTime","s")%>"],
	["224", "<%tcWebApi_staticGet("LanHost_Entry223", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry223", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry223", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry223", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry223", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry223", "ExpireTime","s")%>"],
	["225", "<%tcWebApi_staticGet("LanHost_Entry224", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry224", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry224", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry224", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry224", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry224", "ExpireTime","s")%>"],
	["226", "<%tcWebApi_staticGet("LanHost_Entry225", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry225", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry225", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry225", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry225", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry225", "ExpireTime","s")%>"],
	["227", "<%tcWebApi_staticGet("LanHost_Entry226", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry226", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry226", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry226", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry226", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry226", "ExpireTime","s")%>"],
	["228", "<%tcWebApi_staticGet("LanHost_Entry227", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry227", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry227", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry227", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry227", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry227", "ExpireTime","s")%>"],
	["229", "<%tcWebApi_staticGet("LanHost_Entry228", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry228", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry228", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry228", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry228", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry228", "ExpireTime","s")%>"],
	["230", "<%tcWebApi_staticGet("LanHost_Entry229", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry229", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry229", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry229", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry229", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry229", "ExpireTime","s")%>"],
	["231", "<%tcWebApi_staticGet("LanHost_Entry230", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry230", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry230", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry230", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry230", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry230", "ExpireTime","s")%>"],
	["232", "<%tcWebApi_staticGet("LanHost_Entry231", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry231", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry231", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry231", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry231", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry231", "ExpireTime","s")%>"],
	["233", "<%tcWebApi_staticGet("LanHost_Entry232", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry232", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry232", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry232", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry232", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry232", "ExpireTime","s")%>"],
	["234", "<%tcWebApi_staticGet("LanHost_Entry233", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry233", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry233", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry233", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry233", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry233", "ExpireTime","s")%>"],
	["235", "<%tcWebApi_staticGet("LanHost_Entry234", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry234", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry234", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry234", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry234", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry234", "ExpireTime","s")%>"],
	["236", "<%tcWebApi_staticGet("LanHost_Entry235", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry235", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry235", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry235", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry235", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry235", "ExpireTime","s")%>"],
	["237", "<%tcWebApi_staticGet("LanHost_Entry236", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry236", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry236", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry236", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry236", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry236", "ExpireTime","s")%>"],
	["238", "<%tcWebApi_staticGet("LanHost_Entry237", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry237", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry237", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry237", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry237", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry237", "ExpireTime","s")%>"],
	["239", "<%tcWebApi_staticGet("LanHost_Entry238", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry238", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry238", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry238", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry238", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry238", "ExpireTime","s")%>"],
	["240", "<%tcWebApi_staticGet("LanHost_Entry239", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry239", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry239", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry239", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry239", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry239", "ExpireTime","s")%>"],
	["241", "<%tcWebApi_staticGet("LanHost_Entry240", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry240", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry240", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry240", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry240", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry240", "ExpireTime","s")%>"],
	["242", "<%tcWebApi_staticGet("LanHost_Entry241", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry241", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry241", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry241", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry241", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry241", "ExpireTime","s")%>"],
	["243", "<%tcWebApi_staticGet("LanHost_Entry242", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry242", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry242", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry242", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry242", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry242", "ExpireTime","s")%>"],
	["244", "<%tcWebApi_staticGet("LanHost_Entry243", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry243", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry243", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry243", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry243", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry243", "ExpireTime","s")%>"],
	["245", "<%tcWebApi_staticGet("LanHost_Entry244", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry244", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry244", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry244", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry244", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry244", "ExpireTime","s")%>"],
	["246", "<%tcWebApi_staticGet("LanHost_Entry245", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry245", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry245", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry245", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry245", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry245", "ExpireTime","s")%>"],
	["247", "<%tcWebApi_staticGet("LanHost_Entry246", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry246", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry246", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry246", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry246", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry246", "ExpireTime","s")%>"],
	["248", "<%tcWebApi_staticGet("LanHost_Entry247", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry247", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry247", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry247", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry247", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry247", "ExpireTime","s")%>"],
	["249", "<%tcWebApi_staticGet("LanHost_Entry248", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry248", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry248", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry248", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry248", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry248", "ExpireTime","s")%>"],
	["250", "<%tcWebApi_staticGet("LanHost_Entry249", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry249", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry249", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry249", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry249", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry249", "ExpireTime","s")%>"],
	["251", "<%tcWebApi_staticGet("LanHost_Entry250", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry250", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry250", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry250", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry250", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry250", "ExpireTime","s")%>"],
	["252", "<%tcWebApi_staticGet("LanHost_Entry251", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry251", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry251", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry251", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry251", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry251", "ExpireTime","s")%>"],
	["253", "<%tcWebApi_staticGet("LanHost_Entry252", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry252", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry252", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry252", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry252", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry252", "ExpireTime","s")%>"]
];

		showTable('dhcpclientList',tableHeader,tableData,2);
		</script>
</td>
</tr>
</table>
</div>
</form>
</body>
</html>
