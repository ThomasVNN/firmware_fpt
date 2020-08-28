<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link rel="stylesheet" href="/style.css" type="text/css">
<script language="JavaScript" src="OutVariant.asp"></script>
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" src="/jsl.js"></script>
<script language="JavaScript" src="/ip.js"></script>
<style  type="text/css">
*{color:  #404040;}

</style>

<script language="JavaScript">
function Reload(){
window.location.reload();

}

function showTable(id,header,data,keyIndex){
	var html = ["<table id=client_list border=0  cellpadding=1 cellspacing=0>"];
	// 1.generate table header
	html.push("<tr height=30px>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + " align=center class=tabdata>" +"<STRONG><FONT color=#000000>"+ header[i][1] +" </strong>"+ "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
	for(var i =0; i<data.length; i++)
	{
		   if(data[i][keyIndex] != "N/A")
		 {
			html.push("<tr height=30px>");
			for(var j=0; j<data[i].length; j++)
			{
				html.push("<td align=center class=topborderstyle>" + data[i][j] + "</td>");
			}
			html.push("</tr>");
		}
	}
	html.push("</table>");
	if(parseInt(document.Devicetable.LeaseNum.value)>30)
	{	
		html.push('<table width="620" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">');
		html.push("<tr height=30px>");
		html.push('<td align=left class="tabdata" style="padding-left:20px;">');
		html.push("<input type=button name=MORE class=button1 value=More... onClick=javascript:window.open(\"/cgi-bin/more_client_list.asp\")>");
		html.push("</td>");
		html.push("</tr>");
		html.push("</table>");
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
  		<td class="title-main" align=left style="padding-left:20px;"><%tcWebApi_get("String_Entry","LANClientListText","s")%></td>
    </tr>	 
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
 <tr>
 <td align=left class="tabdata" >
 <div class="configstyle">
<INPUT type="HIDDEN" name="LeaseNum" value="<%TcWebApi_get("LanHost","LeaseNum","s")%>"><!--amy change DhcpLease to LanHost 20180322-->
 
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

var tableData = [
	["1", "<%tcWebApi_Get("LanHost_Entry0", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry0", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry0", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry0", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry0", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry0", "ExpireTime","s")%>"],
	["2", "<%tcWebApi_staticGet("LanHost_Entry1", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry1", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry1", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry1", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry1", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry1", "ExpireTime","s")%>"],
	["3", "<%tcWebApi_staticGet("LanHost_Entry2", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry2", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry2", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry2", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry2", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry2", "ExpireTime","s")%>"],
	["4", "<%tcWebApi_staticGet("LanHost_Entry3", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry3", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry3", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry3", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry3", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry3", "ExpireTime","s")%>"],
	["5", "<%tcWebApi_staticGet("LanHost_Entry4", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry4", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry4", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry4", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry4", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry4", "ExpireTime","s")%>"],
	["6", "<%tcWebApi_staticGet("LanHost_Entry5", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry5", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry5", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry5", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry5", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry5", "ExpireTime","s")%>"],
	["7", "<%tcWebApi_staticGet("LanHost_Entry6", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry6", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry6", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry6", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry6", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry6", "ExpireTime","s")%>"],
	["8", "<%tcWebApi_staticGet("LanHost_Entry7", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry7", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry7", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry7", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry7", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry7", "ExpireTime","s")%>"],
	["9", "<%tcWebApi_staticGet("LanHost_Entry8", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry8", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry8", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry8", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry8", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry8", "ExpireTime","s")%>"],
	["10", "<%tcWebApi_staticGet("LanHost_Entry9", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry9", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry9", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry9", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry9", "ExpireDay","s")%>" + "days "+ "<br />" + "<%tcWebApi_staticGet("LanHost_Entry9", "ExpireTime","s")%>"],
	["11", "<%tcWebApi_staticGet("LanHost_Entry10", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry10", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry10", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry10", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry10", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry10", "ExpireTime","s")%>"],
	["12", "<%tcWebApi_staticGet("LanHost_Entry11", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry11", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry11", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry11", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry11", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry11", "ExpireTime","s")%>"],
	["13", "<%tcWebApi_staticGet("LanHost_Entry12", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry12", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry12", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry12", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry12", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry12", "ExpireTime","s")%>"],
	["14", "<%tcWebApi_staticGet("LanHost_Entry13", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry13", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry13", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry13", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry13", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry13", "ExpireTime","s")%>"],
	["15", "<%tcWebApi_staticGet("LanHost_Entry14", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry14", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry14", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry14", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry14", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry14", "ExpireTime","s")%>"],
	["16", "<%tcWebApi_staticGet("LanHost_Entry15", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry15", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry15", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry15", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry15", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry15", "ExpireTime","s")%>"],
	["17", "<%tcWebApi_staticGet("LanHost_Entry16", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry16", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry16", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry16", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry16", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry16", "ExpireTime","s")%>"],
	["18", "<%tcWebApi_staticGet("LanHost_Entry17", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry17", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry17", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry17", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry17", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry17", "ExpireTime","s")%>"],
	["19", "<%tcWebApi_staticGet("LanHost_Entry18", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry18", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry18", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry18", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry18", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry18", "ExpireTime","s")%>"],
	["20", "<%tcWebApi_staticGet("LanHost_Entry19", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry19", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry19", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry19", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry19", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry19", "ExpireTime","s")%>"],
	["21", "<%tcWebApi_staticGet("LanHost_Entry20", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry20", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry20", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry20", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry20", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry20", "ExpireTime","s")%>"],
	["22", "<%tcWebApi_staticGet("LanHost_Entry21", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry21", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry21", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry21", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry21", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry21", "ExpireTime","s")%>"],
	["23", "<%tcWebApi_staticGet("LanHost_Entry22", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry22", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry22", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry22", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry22", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry22", "ExpireTime","s")%>"],
	["24", "<%tcWebApi_staticGet("LanHost_Entry23", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry23", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry23", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry23", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry23", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry23", "ExpireTime","s")%>"],
	["25", "<%tcWebApi_staticGet("LanHost_Entry24", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry24", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry24", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry24", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry24", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry24", "ExpireTime","s")%>"],
	["26", "<%tcWebApi_staticGet("LanHost_Entry25", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry25", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry25", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry25", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry25", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry25", "ExpireTime","s")%>"],
	["27", "<%tcWebApi_staticGet("LanHost_Entry26", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry26", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry26", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry26", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry26", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry26", "ExpireTime","s")%>"],
	["28", "<%tcWebApi_staticGet("LanHost_Entry27", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry27", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry27", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry27", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry27", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry27", "ExpireTime","s")%>"],
	["29", "<%tcWebApi_staticGet("LanHost_Entry28", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry28", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry28", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry28", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry28", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry28", "ExpireTime","s")%>"],
	["30", "<%tcWebApi_staticGet("LanHost_Entry29", "HostName","s")%>","<%tcWebApi_staticGet("LanHost_Entry29", "IP","s")%>","<%tcWebApi_staticGet("LanHost_Entry29", "MAC","s")%>","<%tcWebApi_staticGet("LanHost_Entry29", "InterfaceType","s")%>","<%tcWebApi_staticGet("LanHost_Entry29", "ExpireDay","s")%>" + "days " + "<br />" + "<%tcWebApi_staticGet("LanHost_Entry29", "ExpireTime","s")%>"]
];

		showTable('dhcpclientList',tableHeader,tableData,2);
	</script>
</div>		
</td>
</tr>	 
</table>
</div><!--id="block1" 12/11-->

<div id="button0">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
	<tr height="25px">		
		<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;"><%tcWebApi_get("String_Entry","DeviceTableText","s")%></td>
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
