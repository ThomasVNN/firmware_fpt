
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

</head>
<body>
<FORM METHOD="POST" ACTION="/cgi-bin/more_client_list.asp" name="dchp_client_list">

<div id="wrapper">
<INPUT type="HIDDEN" name="LeaseNum" value="<%TcWebApi_get("LanHost","LeaseNum","s")%>"><!--amy change DhcpLease to LanHost 20180322-->
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
	["31", "<%tcWebApi_Get("LanHost_Entry30", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry30", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry30", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry30", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry30", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry30", "ExpireTime","s")%>"],
	["32", "<%tcWebApi_staticGet("LanHost_Entry31", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry31", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry31", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry31", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry31", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry31", "ExpireTime","s")%>"],
	["33", "<%tcWebApi_staticGet("LanHost_Entry32", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry32", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry32", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry32", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry32", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry32", "ExpireTime","s")%>"],
	["34", "<%tcWebApi_staticGet("LanHost_Entry33", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry33", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry33", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry33", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry33", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry33", "ExpireTime","s")%>"],
	["35", "<%tcWebApi_staticGet("LanHost_Entry34", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry34", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry34", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry34", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry34", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry34", "ExpireTime","s")%>"],
	["36", "<%tcWebApi_staticGet("LanHost_Entry35", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry35", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry35", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry35", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry35", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry35", "ExpireTime","s")%>"],
	["37", "<%tcWebApi_staticGet("LanHost_Entry36", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry36", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry36", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry36", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry36", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry36", "ExpireTime","s")%>"],
	["38", "<%tcWebApi_staticGet("LanHost_Entry37", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry37", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry37", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry37", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry37", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry37", "ExpireTime","s")%>"],
	["39", "<%tcWebApi_staticGet("LanHost_Entry38", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry38", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry38", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry38", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry38", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry38", "ExpireTime","s")%>"],
	["40", "<%tcWebApi_staticGet("LanHost_Entry39", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry39", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry39", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry39", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry39", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry39", "ExpireTime","s")%>"],
	["41", "<%tcWebApi_staticGet("LanHost_Entry40", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry40", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry40", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry40", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry40", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry40", "ExpireTime","s")%>"],
	["42", "<%tcWebApi_staticGet("LanHost_Entry41", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry41", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry41", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry41", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry41", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry41", "ExpireTime","s")%>"],
	["43", "<%tcWebApi_staticGet("LanHost_Entry42", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry42", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry42", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry42", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry42", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry42", "ExpireTime","s")%>"],
	["44", "<%tcWebApi_staticGet("LanHost_Entry43", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry43", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry43", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry43", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry43", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry43", "ExpireTime","s")%>"],
	["45", "<%tcWebApi_staticGet("LanHost_Entry44", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry44", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry44", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry44", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry44", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry44", "ExpireTime","s")%>"],
	["46", "<%tcWebApi_staticGet("LanHost_Entry45", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry45", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry45", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry45", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry45", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry45", "ExpireTime","s")%>"],
	["47", "<%tcWebApi_staticGet("LanHost_Entry46", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry46", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry46", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry46", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry46", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry46", "ExpireTime","s")%>"],
	["48", "<%tcWebApi_staticGet("LanHost_Entry47", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry47", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry47", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry47", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry47", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry47", "ExpireTime","s")%>"],
	["49", "<%tcWebApi_staticGet("LanHost_Entry48", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry48", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry48", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry48", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry48", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry48", "ExpireTime","s")%>"],
	["50", "<%tcWebApi_staticGet("LanHost_Entry49", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry49", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry49", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry49", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry49", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry49", "ExpireTime","s")%>"],
	["51", "<%tcWebApi_staticGet("LanHost_Entry50", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry50", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry50", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry50", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry50", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry50", "ExpireTime","s")%>"],
	["52", "<%tcWebApi_staticGet("LanHost_Entry51", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry51", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry51", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry51", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry51", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry51", "ExpireTime","s")%>"],
	["53", "<%tcWebApi_staticGet("LanHost_Entry52", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry52", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry52", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry52", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry52", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry52", "ExpireTime","s")%>"],
	["54", "<%tcWebApi_staticGet("LanHost_Entry53", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry53", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry53", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry53", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry53", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry53", "ExpireTime","s")%>"],
	["55", "<%tcWebApi_staticGet("LanHost_Entry54", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry54", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry54", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry54", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry54", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry54", "ExpireTime","s")%>"],
	["56", "<%tcWebApi_staticGet("LanHost_Entry55", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry55", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry55", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry55", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry55", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry55", "ExpireTime","s")%>"],
	["57", "<%tcWebApi_staticGet("LanHost_Entry56", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry56", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry56", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry56", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry56", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry56", "ExpireTime","s")%>"],
	["58", "<%tcWebApi_staticGet("LanHost_Entry57", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry57", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry57", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry57", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry57", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry57", "ExpireTime","s")%>"],
	["59", "<%tcWebApi_staticGet("LanHost_Entry58", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry58", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry58", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry58", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry58", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry58", "ExpireTime","s")%>"],
	["60", "<%tcWebApi_staticGet("LanHost_Entry59", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry59", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry59", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry59", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry59", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry59", "ExpireTime","s")%>"],
	["61", "<%tcWebApi_staticGet("LanHost_Entry60", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry60", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry60", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry60", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry60", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry60", "ExpireTime","s")%>"],
	["62", "<%tcWebApi_staticGet("LanHost_Entry61", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry61", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry61", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry61", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry61", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry61", "ExpireTime","s")%>"],
	["63", "<%tcWebApi_staticGet("LanHost_Entry62", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry62", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry62", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry62", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry62", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry62", "ExpireTime","s")%>"],
	["64", "<%tcWebApi_staticGet("LanHost_Entry63", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry63", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry63", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry63", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry63", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry63", "ExpireTime","s")%>"],
	["65", "<%tcWebApi_staticGet("LanHost_Entry64", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry64", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry64", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry64", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry64", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry64", "ExpireTime","s")%>"],
	["66", "<%tcWebApi_staticGet("LanHost_Entry65", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry65", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry65", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry65", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry65", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry65", "ExpireTime","s")%>"],
	["67", "<%tcWebApi_staticGet("LanHost_Entry66", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry66", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry66", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry66", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry66", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry66", "ExpireTime","s")%>"],
	["68", "<%tcWebApi_staticGet("LanHost_Entry67", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry67", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry67", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry67", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry67", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry67", "ExpireTime","s")%>"],
	["69", "<%tcWebApi_staticGet("LanHost_Entry68", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry68", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry68", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry68", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry68", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry68", "ExpireTime","s")%>"],
	["70", "<%tcWebApi_staticGet("LanHost_Entry69", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry69", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry69", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry69", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry69", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry69", "ExpireTime","s")%>"],
	["71", "<%tcWebApi_staticGet("LanHost_Entry70", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry70", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry70", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry70", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry70", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry70", "ExpireTime","s")%>"],
	["72", "<%tcWebApi_staticGet("LanHost_Entry71", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry71", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry71", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry71", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry71", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry71", "ExpireTime","s")%>"],
	["73", "<%tcWebApi_staticGet("LanHost_Entry72", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry72", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry72", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry72", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry72", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry72", "ExpireTime","s")%>"],
	["74", "<%tcWebApi_staticGet("LanHost_Entry73", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry73", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry73", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry73", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry73", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry73", "ExpireTime","s")%>"],
	["75", "<%tcWebApi_staticGet("LanHost_Entry74", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry74", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry74", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry74", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry74", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry74", "ExpireTime","s")%>"],
	["76", "<%tcWebApi_staticGet("LanHost_Entry75", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry75", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry75", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry75", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry75", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry75", "ExpireTime","s")%>"],
	["77", "<%tcWebApi_staticGet("LanHost_Entry76", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry76", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry76", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry76", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry76", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry76", "ExpireTime","s")%>"],
	["78", "<%tcWebApi_staticGet("LanHost_Entry77", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry77", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry77", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry77", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry77", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry77", "ExpireTime","s")%>"],
	["79", "<%tcWebApi_staticGet("LanHost_Entry78", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry78", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry78", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry78", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry78", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry78", "ExpireTime","s")%>"],
	["80", "<%tcWebApi_staticGet("LanHost_Entry79", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry79", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry79", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry79", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry79", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry79", "ExpireTime","s")%>"],
	["81", "<%tcWebApi_staticGet("LanHost_Entry80", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry80", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry80", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry80", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry80", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry80", "ExpireTime","s")%>"],
	["82", "<%tcWebApi_staticGet("LanHost_Entry81", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry81", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry81", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry81", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry81", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry81", "ExpireTime","s")%>"],
	["83", "<%tcWebApi_staticGet("LanHost_Entry82", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry82", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry82", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry82", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry82", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry82", "ExpireTime","s")%>"],
	["84", "<%tcWebApi_staticGet("LanHost_Entry83", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry83", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry83", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry83", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry83", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry83", "ExpireTime","s")%>"],
	["85", "<%tcWebApi_staticGet("LanHost_Entry84", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry84", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry84", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry84", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry84", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry84", "ExpireTime","s")%>"],
	["86", "<%tcWebApi_staticGet("LanHost_Entry85", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry85", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry85", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry85", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry85", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry85", "ExpireTime","s")%>"],
	["87", "<%tcWebApi_staticGet("LanHost_Entry86", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry86", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry86", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry86", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry86", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry86", "ExpireTime","s")%>"],
	["88", "<%tcWebApi_staticGet("LanHost_Entry87", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry87", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry87", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry87", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry87", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry87", "ExpireTime","s")%>"],
	["89", "<%tcWebApi_staticGet("LanHost_Entry88", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry88", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry88", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry88", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry88", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry88", "ExpireTime","s")%>"],
	["90", "<%tcWebApi_staticGet("LanHost_Entry89", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry89", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry89", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry89", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry89", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry89", "ExpireTime","s")%>"],
	["91", "<%tcWebApi_staticGet("LanHost_Entry90", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry90", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry90", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry90", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry90", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry90", "ExpireTime","s")%>"],
	["92", "<%tcWebApi_staticGet("LanHost_Entry91", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry91", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry91", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry91", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry91", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry91", "ExpireTime","s")%>"],
	["93", "<%tcWebApi_staticGet("LanHost_Entry92", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry92", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry92", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry92", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry92", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry92", "ExpireTime","s")%>"],
	["94", "<%tcWebApi_staticGet("LanHost_Entry93", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry93", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry93", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry93", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry93", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry93", "ExpireTime","s")%>"],
	["95", "<%tcWebApi_staticGet("LanHost_Entry94", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry94", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry94", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry94", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry94", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry94", "ExpireTime","s")%>"],
	["96", "<%tcWebApi_staticGet("LanHost_Entry95", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry95", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry95", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry95", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry95", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry95", "ExpireTime","s")%>"],
	["97", "<%tcWebApi_staticGet("LanHost_Entry96", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry96", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry96", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry96", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry96", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry96", "ExpireTime","s")%>"],
	["98", "<%tcWebApi_staticGet("LanHost_Entry97", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry97", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry97", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry97", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry97", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry97", "ExpireTime","s")%>"],
	["99", "<%tcWebApi_staticGet("LanHost_Entry98", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry98", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry98", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry98", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry98", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry98", "ExpireTime","s")%>"],
	["100", "<%tcWebApi_staticGet("LanHost_Entry99", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry99", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry99", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry99", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry99", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry99", "ExpireTime","s")%>"],	
	["101", "<%tcWebApi_staticGet("LanHost_Entry100", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry100", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry100", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry100", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry100", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry100", "ExpireTime","s")%>"],
	["102", "<%tcWebApi_staticGet("LanHost_Entry101", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry101", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry101", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry101", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry101", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry101", "ExpireTime","s")%>"],
	["103", "<%tcWebApi_staticGet("LanHost_Entry102", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry102", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry102", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry102", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry102", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry102", "ExpireTime","s")%>"],
	["104", "<%tcWebApi_staticGet("LanHost_Entry103", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry103", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry103", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry103", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry103", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry103", "ExpireTime","s")%>"],
	["105", "<%tcWebApi_staticGet("LanHost_Entry104", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry104", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry104", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry104", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry104", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry104", "ExpireTime","s")%>"],
	["106", "<%tcWebApi_staticGet("LanHost_Entry105", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry105", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry105", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry105", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry105", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry105", "ExpireTime","s")%>"],
	["107", "<%tcWebApi_staticGet("LanHost_Entry106", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry106", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry106", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry106", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry106", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry106", "ExpireTime","s")%>"],
	["108", "<%tcWebApi_staticGet("LanHost_Entry107", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry107", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry107", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry107", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry107", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry107", "ExpireTime","s")%>"],
	["109", "<%tcWebApi_staticGet("LanHost_Entry108", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry108", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry108", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry108", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry108", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry108", "ExpireTime","s")%>"],
	["110", "<%tcWebApi_staticGet("LanHost_Entry109", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry109", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry109", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry109", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry109", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry109", "ExpireTime","s")%>"]

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
