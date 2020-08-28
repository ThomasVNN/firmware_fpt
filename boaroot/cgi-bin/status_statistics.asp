<%
if Request_form("Stat_Radio") <> "" then
	tcWebApi_set("WebCurSet_Entry","statis_type","Stat_Radio")
	if  tcwebApi_get("WebCustom_Entry","isCZGeneralSupported","h") = "Yes" then
	If Request_Form("clearFlag")="1" Then
		tcWebApi_commit("WebCurSet_Entry")
	End If
	end if
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<script type='text/javascript' src="/jsl.js" tppabs="http://192.168.1.1/js/jsl.js"></script>

<style  type="text/css">
*{color:  #404040;}

</style>

<script language="JavaScript">
<%if tcwebApi_get("WebCustom_Entry", "isCZGeneralSupported", "h")="Yes" Then%>
function uiSave() {
	document.Stat_Form.clearFlag.value=1;
	document.Stat_Form.submit();
	return;
}
<%end if%>

function Reload(){
window.location.reload();

}
</script>

</head><body>
<FORM METHOD="POST" ACTION="/cgi-bin/status_statistics.asp" name="Stat_Form">
<div id="pagestyle"><!--cindy add for border 11/28-->
<div id="contenttype">
<%if tcwebApi_get("WebCustom_Entry", "isCZGeneralSupported", "h")="Yes" Then%>
<INPUT TYPE="HIDDEN" NAME="clearFlag" VALUE="0">
<%end if%>
<div id="block1"><!--cindy add for id="block1" 12/05-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">

<tr height="25px" style="width:100%;background:#e6e6e6;">
<td width="250px" align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","StatisticsTrafficText","s")%></td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr height="30px">
<td width="20px">&nbsp; </td>
<td width="250px" align=left class="tabdata" style="font-size:13px;"><%tcWebApi_get("String_Entry","StatisticsInterfaceText","s")%></td>
<td align=left class="tabdata">

<select name="Stat_Radio" size="1" onchange="document.Stat_Form.submit()">
<option value="0" <%If tcWebApi_get("WebCurSet_Entry","statis_type","h") = "0" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StatisticsEthernetText","s")%> 

		<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
<option value="1" <%If tcWebApi_get("WebCurSet_Entry","statis_type","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StatisticsXDSLText","s")%> 
		<%elseif tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
<option value="1" <%If tcWebApi_get("WebCurSet_Entry","statis_type","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StatisticsADSLText","s")%> 
		<%end if%>
		
<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
<% If tcWebApi_get("Info_WLan","isExist","h") = "On" Then%>
<option value="2" <%If tcWebApi_get("WebCurSet_Entry","statis_type","h") = "2" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StatisticsWLANText","s")%> 
<% End If%>

<% If tcWebApi_get("Info_WLan11ac","isExist","h") = "On" Then%>
<option value="3" <%If tcWebApi_get("WebCurSet_Entry","statis_type","h") = "3" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","Statistics5gWLANText","s")%> 
<% End If%>
<% end if %> 

		<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then%>
<option value="4" <%If tcWebApi_get("WebCurSet_Entry","statis_type","h") = "4" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StatisticsPonText","s")%> 
		<%end if%>
</select>
</td>
</tr>

	<tr>
<td colspan="3" align=center style="padding-top:20px;padding-bottom:20px;">		
<table width="560" border="1" cellpadding="0" cellspacing="0" bordercolor="#cccccc" bgcolor="#FFFFFF">		
	       <tr class="tabdata">
	<td width="190" class="model"><div align=center> <%tcWebApi_get("String_Entry","StatisticsTransmitText","s")%> </div></td>
		<td width="110">&nbsp;</td>
	<td width="190" class="model"><div align=center><%tcWebApi_get("String_Entry","StatisticsReceiveText","s")%> </div></td>
		<td>&nbsp;</td>
		</tr>  
<% If tcwebApi_get("WebCustom_Entry", "isCZGeneralSupported", "h")="Yes" Then %>
<% If tcWebApi_get("WebCurSet_Entry","statis_type","h") = "1" Then %>
		<tr>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsPDUsText","s")%></td>
<td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Adsl","outPkts","s") end if %></div></td>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRePDUsText","s")%></td>
<td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Adsl","inPkts","s") end if %></div></td>
</tr>
		<tr>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsErrCountsText","s")%></td>
<td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Adsl","outDiscards","s") end if %></div></td>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReErrCountsText","s")%></td>
<td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Adsl","inDiscards","s") end if %></div></td>
</tr>
 		<%if tcwebApi_get("WebCustom_Entry", "isCZTMSupported", "h")="Yes" Then %>
		<tr class="tabdata">
<td width="190" class="model"><div align=center> <%tcWebApi_get("String_Entry","StatisticAdslDownstreamText","s")%> </div></td>
		<td width="110">&nbsp;</td>
<td width="190" class="model"><div align=center> <%tcWebApi_get("String_Entry","StatisticAdslUpstreamText","s")%> </div></td>
<td>&nbsp;</td>
</tr>
		<tr>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownRateText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","DataRateDown","s") %></div></td>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpRateText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","DataRateUp","s") %></div></td>
</tr>
		<tr>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownSNRMText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","SNRMarginDown","s") %></div></td>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpSNRMText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","SNRMarginUp","s") %></div></td>
</tr>
		<tr>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownAttenText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","AttenDown","s") %></div></td>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpAttenText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","AttenUp","s") %></div></td>
</tr>
		<tr>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownPowerText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","PowerDown","s") %></div></td>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpPowerText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","PowerUp","s") %></div></td>
</tr>
		<tr>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownCRCText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","CRCDown","s") %></div></td>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpCRCText","s")%></td>
<td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","CRCUp","s") %></div></td>
</tr>
		<%end if%>

<% Elseif tcWebApi_get("WebCurSet_Entry","statis_type","h") = "2" Then %>
		<tr>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxPacketsText","s")%></td>
<td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan","wlanTxPackets","s") end if %></div></td>
<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxPacketsText","s")%></td>
<td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan","wlanRxPackets","s") end if %></div></td>
</tr>
		<tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxBytesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan","wlanTxBytes","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxBytesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan","wlanRxBytes","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxErrorsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan","wlanTxErrFrames","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxErrorsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan","wlanRxErrFrames","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxDropsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan","wlanTxDropFrames","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxDropsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan","wlanRxDropFrames","s") end if %></div></td></tr>

<% Elseif tcWebApi_get("WebCurSet_Entry","statis_type","h") = "3" Then %>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxPacketsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan11ac","wlanTxPackets","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxPacketsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan11ac","wlanRxPackets","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxBytesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan11ac","wlanTxBytes","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxBytesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan11ac","wlanRxBytes","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxErrorsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan11ac","wlanTxErrFrames","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxErrorsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan11ac","wlanRxErrFrames","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxDropsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan11ac","wlanTxDropFrames","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxDropsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_WLan11ac","wlanRxDropFrames","s") end if %></div></td></tr>

<% Else %>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrFramesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","txFrames","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReFramesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","rxFrames","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrMulticastText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","outMulticastPkts","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReMulticastText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","inMulticastPkts","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrtotaltBytesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","outOctets","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRetotaltBytesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","inOctets","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrCollisionText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","txCollisionCnt","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsCRCErrorsText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","rxCrcErr","s") end if %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrErrorFramesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","outErrors","s") end if %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReUDsizeFramesText","s")%></td><td class='tabdata'><div align='center'><% if Request_Form("clearFlag")="1" then asp_Write("0") else tcWebApi_get("Info_Ether","txUnderRunCnt","s") end if %></div></td></tr>

<% End If %>
<% Else %>
<% If tcWebApi_get("WebCurSet_Entry","statis_type","h") = "1" Then %>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsPDUsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","outPkts","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRePDUsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","inPkts","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsErrCountsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","outDiscards","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReErrCountsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","inDiscards","s") %></div></td></tr>
 		<%if tcwebApi_get("WebCustom_Entry", "isCZTMSupported", "h")="Yes" Then %>
		<tr class="tabdata">
		<td width="190" class="model"><div align=center>
		 <%tcWebApi_get("String_Entry","StatisticAdslDownstreamText","s")%> </div></td>
		<td width="110">&nbsp;</td>
		<td width="190" class="model"><div align=center>
		 <%tcWebApi_get("String_Entry","StatisticAdslUpstreamText","s")%> </div></td>
		<td>&nbsp;</td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownRateText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","DataRateDown","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpRateText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","DataRateUp","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownSNRMText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","SNRMarginDown","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpSNRMText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","SNRMarginUp","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownAttenText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","AttenDown","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpAttenText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","AttenUp","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownPowerText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","PowerDown","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpPowerText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","PowerUp","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslDownCRCText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","CRCDown","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticAdslUpCRCText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Adsl","CRCUp","s") %></div></td></tr>
		<%end if%>
<% Elseif tcWebApi_get("WebCurSet_Entry","statis_type","h") = "2" Then %>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan","wlanTxFrames","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan","wlanRxFrames","s") %></div></td></tr>
		<tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxErrorsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan","wlanTxErrFrames","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxErrorsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan","wlanRxErrFrames","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxDropsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan","wlanTxDropFrames","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxDropsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan","wlanRxDropFrames","s") %></div></td></tr>
<% Elseif tcWebApi_get("WebCurSet_Entry","statis_type","h") = "3" Then %>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxPacketsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan11ac","wlanTxPackets","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxPacketsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan11ac","wlanRxPackets","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxBytesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan11ac","wlanTxBytes","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxBytesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan11ac","wlanRxBytes","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxErrorsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan11ac","wlanTxErrFrames","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxErrorsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan11ac","wlanRxErrFrames","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxDropsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan11ac","wlanTxDropFrames","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxDropsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_WLan11ac","wlanRxDropFrames","s") %></div></td></tr>


<% ElseIf tcWebApi_get("WebCurSet_Entry","statis_type","h") = "4" Then %>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxPacketsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","TxFrameCnt","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxPacketsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","RxFrameCnt","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxBytesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","TxFrameLen","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxBytesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","RxFrameLen","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrMulticastText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","TxMulticastCnt","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReMulticastText","s")%></td><td class='tabdata'><div align='center'><%tcWebApi_get("Info_PonWanStats","RxMulticastCnt","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxBCFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","TxBroadcastCnt","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRxBCFramesText","s")%></td><td class='tabdata'><div align='center'><%tcWebApi_get("Info_PonWanStats","RxBroadcastCnt","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrCollisionText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","TxDropCnt","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsCRCErrorsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","RxCrcCnt","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTxUDsizeFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","TxLess64Cnt","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReUDsizeFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_PonWanStats","RxLess64Cnt","s") %></div></td></tr>

<% Else %>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","txFrames","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","rxFrames","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrMulticastText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","outMulticastPkts","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReMulticastText","s")%></td><td class='tabdata'><div align='center'><%tcWebApi_get("Info_Ether","inMulticastPkts","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrtotaltBytesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","outOctets","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsRetotaltBytesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","inOctets","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrCollisionText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","txCollisionCnt","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsCRCErrorsText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","rxCrcErr","s") %></div></td></tr>
		<tr>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsTrErrorFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","outErrors","s") %></div></td>
			<td class='tabdata'>&nbsp;&nbsp;<%tcWebApi_get("String_Entry","StatisticsReUDsizeFramesText","s")%></td><td class='tabdata'><div align='center'><% tcWebApi_get("Info_Ether","txUnderRunCnt","s") %></div></td></tr>

<% End If %>
<% End If %>
</table></td>
</tr>
</table>
</div><!--cindy add for id="block1" 12/05-->

<div id="button0">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
	<tr height="25px">		
		<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;"><%tcWebApi_get("String_Entry","StatisticSetRefreshbuttonText","s")%></td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr height="30px">
<td align=left class="tabdata" style="padding-left:20px;">
<INPUT TYPE="button"  NAME="StatRefresh" class="button1" onclick="Reload()" VALUE="<%tcWebApi_get("String_Entry","ButtonRefresh0Text","s")%>">
              <%if tcwebApi_get("WebCustom_Entry", "isCZGeneralSupported", "h")="Yes" Then%>
		<INPUT TYPE="BUTTON" NAME="StatClear" VALUE="<%tcWebApi_get("String_Entry","ButtonClearText","s")%>" onClick="uiSave()">
<%end if%>
</td>
</tr>
</table>
</div><!--cindy add for id="button0" 12/05-->
</div><!--id="contenttype"-->
</div><!--cindy add for border 11/28-->

	<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
               <table width="690" border="0" cellpadding="0" cellspacing="0">
	        	<tr height="30">
				<td width="20">&nbsp;</td>
				<td width="250">&nbsp;</td>
				<td width="420"></td>
			</tr>	
			<tr>
				<td align=center colSpan=3 style="background-color:transparent; font-family: Arial,Helvetica,sans-serif;"><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%> </font></td>
			</tr>
			<tr height="10">
				<td width="20">&nbsp;</td>
				<td width="250">&nbsp;</td>
				<td width="420"></td>
			</tr>			
		</table>
	<%end if%>
</form></body></html>
