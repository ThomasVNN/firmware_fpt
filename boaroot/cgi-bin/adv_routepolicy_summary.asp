<html>
<head>
<title>Schedule</title>
<meta http-equiv="Content-Type" content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<link rel="stylesheet" href="/style.css" type="text/css">


<style  type="text/css">

*{color:  #404040;}

table td
{
margin:5 0;padding:5 0;
}
</style>


<script language="JavaScript">
//0:active;1:mac;2:staIP;3:endIP;4:protocol;5:staPort;6:endPort;7:TOS;8:wanIndex;11:startDstIP;12:endDstIP;13:ethertype
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) <> "Yes" then %>
var PolicyInfo=[
['<%tcWebApi_get("RoutePolicy_Entry0","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","Ethertype","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry1","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","Ethertype","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry2","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","Ethertype","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry3","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","Ethertype","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry4","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","Ethertype","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry5","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","Ethertype","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry6","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","Ethertype","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry7","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","Ethertype","s")%>']
];
<% else %>
var PolicyInfo=[
['<%tcWebApi_get("RoutePolicy_Entry0","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","Ethertype","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","Type","s")%>','<%tcWebApi_get("RoutePolicy_Entry0","URL","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry1","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","Ethertype","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","Type","s")%>','<%tcWebApi_get("RoutePolicy_Entry1","URL","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry2","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","Ethertype","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","Type","s")%>','<%tcWebApi_get("RoutePolicy_Entry2","URL","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry3","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","Ethertype","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","Type","s")%>','<%tcWebApi_get("RoutePolicy_Entry3","URL","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry4","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","Ethertype","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","Type","s")%>','<%tcWebApi_get("RoutePolicy_Entry4","URL","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry5","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","Ethertype","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","Type","s")%>','<%tcWebApi_get("RoutePolicy_Entry5","URL","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry6","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","Ethertype","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","Type","s")%>','<%tcWebApi_get("RoutePolicy_Entry6","URL","s")%>'],
['<%tcWebApi_get("RoutePolicy_Entry7","Active","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","srcMac","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","startIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","endIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","Protocol","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","startSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","endSrcPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","startDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","endDstPort","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","TOS","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","PolicyPVC","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","startDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","endDstIP","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","Ethertype","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","Type","s")%>','<%tcWebApi_get("RoutePolicy_Entry7","URL","s")%>']
];
function printURLTable()
{
	var strtemp = "";
	var i=0;
	for(i=0;i<PolicyInfo.length;i++){
		if(PolicyInfo[i][14] == 0)
		{
			strtemp+='<tr>';
			strtemp+='<td><div align="center">'+GetIndex(i)+'</div></td>'
			strtemp+='<td><div align="center">'+GetActive(i)+'</div></td>'
			strtemp+='<td><div align="center">'+GetPolicyInfo(i) +'</div></td>'
			strtemp+='<td><div align="center">'+GetWanIndex(i)+'</div></td>'
			strtemp+="</tr>";
		}
	}
	document.write(strtemp);
}
<% end if %>
function printPolicyTable()
{
	var strtemp = "";
	var i=0;
	for(i=0;i<PolicyInfo.length;i++){
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
		if(PolicyInfo[i][14] == 1)
		{
<% end if %>
			strtemp+='<tr>';
			strtemp+='<td><div align="center">'+GetIndex(i)+'</div></td>'
			strtemp+='<td><div align="center">'+GetActive(i)+'</div></td>'
			strtemp+='<td><div align="center">'+GetMACAndIP(i) +'</div></td>'
			strtemp+='<td><div align="center">'+GetDstIP(i) +'</div></td>'
			strtemp+='<td><div align="center">'+GetEthertype(i) +'</div></td>'
			strtemp+='<td><div align="center">'+GetProtocol(i) +'</div></td>'
			strtemp+='<td><div align="center">'+GetSrcPortRange(i) +'</div></td>'
			strtemp+='<td><div align="center">'+GetDstPortRange(i) +'</div></td>'
			strtemp+='<td><div align="center">'+GetTOS(i) +'</div></td>'
			strtemp+='<td><div align="center">'+GetWanIndex(i)+'</div></td>'
			strtemp+="</tr>";
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
		}
<% end if %>
	}
	document.write(strtemp);
}
function GetIndex(i)
{
	return i+1;
}
function GetActive(i)
{
	var activeYes='<%tcWebApi_get("String_Entry","RtPolicySummaryActiveYesText","s")%>';
	var activeNo='<%tcWebApi_get("String_Entry","RtPolicySummaryActiveNoText","s")%>';
	if(PolicyInfo[i][0] == '1')
		return activeYes;
	else
		return activeNo;
}
function GetMACAndIP(i){
	var srcmac=PolicyInfo[i][1];
	var srcStaIP=PolicyInfo[i][2];
	var srcEndIP=PolicyInfo[i][3];
	var ret=srcmac;
	if(srcStaIP != "" && srcEndIP!=""){
		if(ret != ""){
			ret+="<br>";
		}
		ret += srcStaIP+"/"+srcEndIP;
	}
	if(ret==""){
		ret="&nbsp;";
	}
	return ret;
}
function GetDstIP(i){
	var DstStaIP=PolicyInfo[i][11];
	var DstEndIP=PolicyInfo[i][12];
	var ret="";
	if(DstStaIP != "" && DstEndIP!=""){
		ret = DstStaIP+"/"+DstEndIP;
	}
	if(ret == "N/A~N/A" ||ret==""){
		ret="&nbsp;";
	}
	return ret;
}

function GetEthertype(i)
{
	var ethIP='<%tcWebApi_get("String_Entry","RtPolicySummaryEthertypeIPText","s")%>';
	var ethARP='<%tcWebApi_get("String_Entry","RtPolicySummaryEthertypeARPText","s")%>';
	var ethIPv6='<%tcWebApi_get("String_Entry","RtPolicySummaryEthIPv6Text","s")%>';
	var ethPPPoE='<%tcWebApi_get("String_Entry","RtPolicySummaryEthPPPoEText","s")%>';
	if(PolicyInfo[i][13] == '0')
		return ethIP;
	else if(PolicyInfo[i][13] == '1')
		return ethARP;
	else if(PolicyInfo[i][13] == '2')
		return ethIPv6;
	else if(PolicyInfo[i][13] == '3')
		return ethPPPoE;
	else
		return '-';
}
function GetProtocol(i)
{
	var porTCP='<%tcWebApi_get("String_Entry","RtPolicySummaryProtocolTCPText","s")%>';
	var porUDP='<%tcWebApi_get("String_Entry","RtPolicySummaryProtocolUDPText","s")%>';
	if(PolicyInfo[i][4] == '0')
		return porTCP;
	else if(PolicyInfo[i][4] == '1')
		return porUDP;
	else
		return '-';
}
function GetSrcPortRange(i){
	var ret="-";
	if(PolicyInfo[i][4]!="" && PolicyInfo[i][5] != "" && PolicyInfo[i][6] != "")
		ret = PolicyInfo[i][5]+"&nbsp;~&nbsp;"+PolicyInfo[i][6];
	return ret;		
}
function GetDstPortRange(i){
	var ret="-";
	if(PolicyInfo[i][4]!="" && PolicyInfo[i][7] != "" && PolicyInfo[i][8] != "")
		ret = PolicyInfo[i][7]+"&nbsp;~&nbsp;"+PolicyInfo[i][8];
	return ret;	
}
function GetTOS(i)
{
	var ret = PolicyInfo[i][9];
	if( ret == 'N/A' || ret == '')
		ret='&nbsp;';
	return ret;
}
function GetWanIndex(i)
{
	var ret = PolicyInfo[i][10];
	if( ret == 'N/A' || ret == '')
		ret='&nbsp;';
	else
		ret='WAN'+ret;
	return ret;
}
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
function GetPolicyInfo(i)
{
	var ret=PolicyInfo[i][15];
	if( ret == 'N/A' || ret == '')
		ret='&nbsp;';
	return ret;
}
<% end if %>
</script>
</head>
<body>
	<form>
	<table width="760" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="760" height="5" valign="baseline" class="orange"></td>
	</tr>
</table>
<table border="0" width="760" cellspacing="0" cellpadding="0">
	<tr>
		<td width="200" height="50" align="center" valign="middle" bgcolor="#FFFFFF"><div align="left"><img src="/logo.png" width="160" height="100"></div></td>
		<td width="560" align="right" valign="bottom" bgcolor="#FFFFFF" class="model">
			<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%><%tcWebApi_get("String_Entry","AdslVdslInfoText","s")%>/<%end if%><%tcWebApi_get("String_Entry","AdslInfoText","s")%>
		</td>
	</tr>
</table>
<table width="760" height="2" border="0" cellpadding="0" cellspacing="0" class="orange">
	<tr>
		<td width="760" valign="baseline" class="orange"></td>
	</tr>
</table>
<table width="760" border="0" cellpadding="0" cellspacing="0" color="#FF9933">
	<tr>
		<td width="760" height="35"  bgcolor="#FFFFFF" class="headline"><%tcWebApi_get("String_Entry","RtPolicySummaryText","s")%></td>
	</tr>
	<tr><td>
</table>
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
<table width="500"  border="1" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC">
	<tr>
		<td class="tableTitle" width=60 ><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryRuleIndexText","s")%> </div></td>
		<td class="tableTitle" width=60 ><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryActiveText","s")%> </div></td>
		<td class="tableTitle" width=200 ><div align="center"> <%tcWebApi_get("String_Entry","RtPolicyURLText","s")%> </div></td>
		<td class="tableTitle" width=90 ><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryInterfaceText","s")%> </div></td>
	</tr>
	<script language="JavaScript">
		printURLTable();
	</script>
</table>
  <table width="760" height="15" border="0" cellpadding="0" cellspacing="0" class="orange">
	<tr>
		<td width="760" height="10" valign="baseline" bgcolor="#FFFFFF"></td>
	</tr>
	<tr>
		<td width="760" valign="baseline" class="orange"></td>
	</tr>
</table>
<br>
<% end if %>
<table width="760"  border="1" cellpadding="1" cellspacing="0" bordercolor="#CCCCCC">
	<tr>
		<td class="tableTitle" width=60 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryRuleIndexText","s")%> </div></td>
		<td class="tableTitle" width=60 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryActiveText","s")%> </div></td>
		<td class="tableTitle" width=200><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummarySrcMacText","s")%> </div></td>
		<td class="tableTitle" width=200 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryDstIPText","s")%> </div></td>
		<td class="tableTitle" width=90 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryEthertypeText","s")%> </div></td>
		<td class="tableTitle" width=90 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryProtocolText","s")%> </div></td>
		<td class="tableTitle" width=160 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummarySrcPortRangeText","s")%> </div></td>
		<td class="tableTitle" width=160 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryDstPortRangeText","s")%> </div></td>
		<td class="tableTitle" width=90 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryTOSText","s")%> </div></td>
		<td class="tableTitle" width=90 rowspan=2><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummaryInterfaceText","s")%> </div></td>
	</tr>
	<tr>
		<td class="tableTitle"><div align="center"> <%tcWebApi_get("String_Entry","RtPolicySummarySrcIPRangeText","s")%> </div></td>
	</tr>
	<script language="JavaScript">
		printPolicyTable();
	</script>
			</table>
  <table width="760" height="15" border="0" cellpadding="0" cellspacing="0" class="orange">
	<tr>
		<td width="760" height="10" valign="baseline" bgcolor="#FFFFFF"></td>
	</tr>
	<tr>
		<td width="760" valign="baseline" class="orange"></td>
	</tr>
</table>
</form>
</body>
</html>
