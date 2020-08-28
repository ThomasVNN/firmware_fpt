<html>
<head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" href="/style.css" type="text/css">
<script language="JavaScript" type="text/JavaScript">
var str_langQos = [
				["Yes", "<%tcWebApi_get("String_Entry", "ACLYesText", "s")%>"],
				["No", "<%tcWebApi_get("String_Entry", "ACLNoText", "s")%>"]
			];
function	getStr(key)
{
	for (var i=0; i<str_langQos.length; i++) {
		if (key == str_langQos[i][0])
		{
			return str_langQos[i][1];
		}
	}
	return "";
}
</script>

<style  type="text/css">

#maintable{color: #FFFFFF;}

table td
{
margin:5 0;padding:5 0;
}
</style>


</head>
<body topmargin="10" leftmargin="0">
<div style="width:100%;" align="center">
<table width="820" cellpadding="0" cellspacing="0" >
<tr>
	<td width="820" height="5" valign="baseline" class="orange"></td>
</tr>
</table>
<table width="820" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
	<td width="820" height="35" class="headline"><font color="#8c8c8c"><%tcWebApi_get("String_Entry","QosCgiSettingsSummary","s")%></font></td>
</tr>
<tr>
	<td align="center">
	<table cellspacing=0 cellpadding=0 border=1 bordercolor="#d9d9d9"width="820"  id="maintable">
	<tr height="30">
		<td height="35" colspan="6" bgcolor="4DB848" class="tabdata" align=center><strong> <%tcWebApi_get("String_Entry","QosCgiRules","s")%> </strong></td>

		<td height="35" colspan="1" bgcolor="FF9933" class="tabdata" align=center>

		<strong> <%tcWebApi_get("String_Entry","QosCgiActions","s")%> </strong></td>
		</tr>
		<tr>
			<td class="tabdata" rowspan=2 align=center bgcolor="4DB848">#</td>
			<td class="tabdata" rowspan=2 align=center bgcolor="4DB848"> <%tcWebApi_get("String_Entry","QosCgiActive","s")%> </td>
			<td class="tabdata" rowspan=2 align=center bgcolor="4DB848"> <%tcWebApi_get("String_Entry","QosCgiApplicationText","s")%> </td> 
			<td class="tabdata" align=center bgcolor="4DB848"> <%tcWebApi_get("String_Entry","QosCgiDestination","s")%> </td>
			<td class="tabdata" align=center bgcolor="4DB848"> <%tcWebApi_get("String_Entry","QosCgiSource","s")%> </td>
			<td class="tabdata" rowspan=2 align=center bgcolor="4DB848"> <%tcWebApi_get("String_Entry","QosCgiProtocolID","s")%> </td>
			<!--cindy delete
			<td class="tabdata" rowspan=2 align=center bgcolor="4DB848"> <%tcWebApi_get("String_Entry","QosCgiVLANID","s")%> </td>
			-->
			<!--<td class="tabdata" rowspan=2 align=center bgcolor="4DB848"><div> <%tcWebApi_get("String_Entry","QosCgiIPPTOS","s")%> </div><div> <%tcWebApi_get("String_Entry","QosCgiDSCP","s")%> </div></td> wang delete-->
			<!--cindy delete
			<td class="tabdata" rowspan=2 align=center bgcolor="4DB848"> <%tcWebApi_get("String_Entry","QosCgi8021p","s")%> </td>
			<td rowspan=2 align=center class="tabdata" bgcolor="FF9933"><div> <%tcWebApi_get("String_Entry","QosCgiIPPTOS","s")%> </div><div> <%tcWebApi_get("String_Entry","QosCgiDSCP","s")%> </div><div> <%tcWebApi_get("String_Entry","QosCgiRemarking","s")%> </div></td>
			<td rowspan=2 class="tabdata" align=center bgcolor="FF9933"><div> <%tcWebApi_get("String_Entry","QosCgi8021p","s")%> </div><div> <%tcWebApi_get("String_Entry","QosCgiRemarking","s")%> </div></td>
			-->
			<td rowspan=2 class="tabdata" align=center bgcolor="FF9933"> <%tcWebApi_get("String_Entry","QosCgiQueue","s")%> </td>			
		</tr>
		<tr>
			<td class="tabdata" align=center bgcolor="4DB848"><div style="display:none"> <%tcWebApi_get("String_Entry","QosCgiMAC","s")%> </div><div> <%tcWebApi_get("String_Entry","QosCgiIPMask","s")%> </div><div> <%tcWebApi_get("String_Entry","QosCgiPortRange","s")%> </div></td>
			<td class="tabdata" align=center bgcolor="4DB848"><div style="display:none"> <%tcWebApi_get("String_Entry","QosCgiMAC","s")%> </div><div> <%tcWebApi_get("String_Entry","QosCgiIPMask","s")%> </div><div> <%tcWebApi_get("String_Entry","QosCgiPortRange","s")%> </div></td>
		</tr>
		<%tcWebApi_Get("GUITemp_Entry0","qosTempAttr","h")%>
		<%if tcWebApi_staticGet("GUITemp_Entry0","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">0</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry0","Active","s")%>"))</script></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry0","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry0","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry0","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry0","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry0","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry0","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry0","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry0","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry0","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry0","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry1","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">1</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry1","Active","s")%>"))</script></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry1","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry1","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry1","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry1","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry1","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry1","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry1","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry1","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry1","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry1","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry2","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">2</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry2","Active","s")%>"))</script></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry2","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry2","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry2","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry2","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry3","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">3</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry3","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry3","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry3","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry3","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry3","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry3","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry3","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry3","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry3","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry3","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry3","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry4","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">4</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry4","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry4","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry4","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry4","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry4","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry4","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry4","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry4","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry4","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry4","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry4","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry5","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">5</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry5","Active","s")%>"))</script></td>
 	    <td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry5","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry5","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry5","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry5","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry5","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry5","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry5","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry5","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry5","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry5","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry6","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">6</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry6","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry6","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry6","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry6","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry6","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry6","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry6","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry6","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry6","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry6","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry6","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry7","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">7</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry7","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry7","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry7","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry7","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry7","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry7","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry7","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry7","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry7","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry7","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry7","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry8","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">8</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry8","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry8","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry8","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry8","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry8","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry8","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry8","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry8","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry8","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry8","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry8","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry9","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">9</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry9","Active","s")%>"))</script></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry9","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>--> 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry9","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry9","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry9","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry9","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry9","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry9","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry9","dscp_remark","s")%></td>	
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry9","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry9","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry10","Active","h") <> "N/A" then%>
		<tr>
		<td height="24" align="center" class="tabdata" bgcolor="4DB848">10</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry10","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry10","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry10","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry10","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry10","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry10","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry10","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry10","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry10","dscp_remark","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry10","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry10","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry11","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">11</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry11","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry11","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry11","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry11","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry11","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry11","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry11","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry11","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry11","dscp_remark","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry11","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry11","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry12","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">12</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry12","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry12","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry12","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry12","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry12","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry12","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry12","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry12","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry12","dscp_remark","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry12","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry12","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry13","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">13</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry13","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry13","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry13","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry13","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry13","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry13","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry13","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry13","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry13","dscp_remark","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry13","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry13","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry14","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">14</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry14","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry14","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry14","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry14","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry14","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry14","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry14","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry14","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry14","dscp_remark","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry14","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry14","queue","s")%></td>		
		</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry15","Active","h") <> "N/A" then%>
		<tr>
		<td align="center" class="tabdata" bgcolor="4DB848">15</td>
		<td align="center" class="tabdata" bgcolor="4DB848"><script>document.writeln(getStr("<%tcWebApi_staticGet("GUITemp_Entry15","Active","s")%>"))</script></td>
 		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("QoS_Entry15","Application","s")%> </td>
 		<!--<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry2","phyports","s")%> </td>-->
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry15","Des","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry15","Src","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry15","proID","s")%></td>
			<!--cindy delete
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry15","vlanID","s")%></td>
		<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry15","dscp","s")%></td>
	 	<td align="center" class="tabdata" bgcolor="4DB848"><%tcWebApi_staticGet("GUITemp_Entry15","dotp","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry15","dscp_remark","s")%></td>
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry15","dotp_remark","s")%></td>
			-->
		<td align="center" class="tabdata" bgcolor="FF9933"><%tcWebApi_staticGet("GUITemp_Entry15","queue","s")%></td>		
		</tr>
		<%end if%>
		</table>
		</td>
		</tr>
	</table>


	
	<table width="820" height="15" class="orange" cellpadding="0" cellspacing="0">
	<tr><td height="10" valign="baseline" class="tabdata"><FONT color="#8c8c8c"><%tcWebApi_get("String_Entry","QosListNote","s")%></FONT></td>
	</tr>
	<tr><td valign="baseline" class="orange"> </td>
	</tr>
	</table>

</td>
</tr>
</table>

</div>
</body>
</html>
