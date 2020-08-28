<%
if request_Form("Tcpdump_flag") = "1" then
	TCWebApi_set("Tcpdump_Pcap","TcpdumpInterface","TcpdumpInterface")
	TCWebApi_set("Tcpdump_Pcap","TcpdumpStart","TcpdumpStart")
	TCWebApi_set("Tcpdump_Pcap","TcpdumpPcapNum","TcpdumpPcapNum")

	tcWebApi_commit("Tcpdump_Pcap")
end if

if request_Form("Tcpdump_flag") = "2" then
	TCWebApi_set("Tcpdump_Pcap","TcpdumpStart","TcpdumpStart")
	TCWebApi_set("Tcpdump_Pcap","Tcpdumpclean","Tcpdumpclean")

	tcWebApi_commit("Tcpdump_Pcap")
end if
%>
<html><head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<script type='text/javascript' src="/jsl.js" tppabs="http://192.168.1.1/js/jsl.js"></script>
<style type="text/css">
</style>

<script language="JavaScript">
function save_tcpdump_settings() {

	var TcpdumpPcapNumValue=document.Tcpdump_Form.TcpdumpPcapNum.value;
	document.Tcpdump_Form.Tcpdump_flag.value="1";
	document.Tcpdump_Form.TcpdumpStart.value="Start";
	if(TcpdumpPcapNumValue<=0){
		alert("PcapNum can not be null ! ");
		return false;
	}

	document.Tcpdump_Form.submit();
	return true;
}
	
function clean_tcpdump_settings() {
	alert("tcpdump start");
	document.Tcpdump_Form.Tcpdump_flag.value="2";
	document.Tcpdump_Form.TcpdumpStart.value="Stop";
	document.Tcpdump_Form.Tcpdumpclean.value="Yes";
	document.Tcpdump_Form.submit();
	return true;
}
function backup_tcpdump_settings()
{
var cfg='/Tcpdump.cap';
/*
if(	document.Tcpdump_Form.Stat_Radio.value==1)
{
cfg = '/log.log';
}
if(document.Tcpdump_Form.Stat_Radio.value==2)
{
cfg = '/syslog.log';
}
*/

	var code = 'location.assign("' + cfg + '")';
	eval(code);
}



</script>

</head><body>
<FORM METHOD="POST" ACTION="/cgi-bin/tools_tcpdump.asp" name="Tcpdump_Form">

<table width="760" border="0" align=center cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td height="5" class="light-orange" colspan="5">&nbsp;</td></tr>
	<tr>
		<td width="150" height="30" class="title-main">
		<font color="#FFFFFF"><%tcWebApi_get("String_Entry","StatisticsTrafficText","s")%></font></td>
		<td width="10" class="black">&nbsp;</td>
		<td width="150"></td><td width="10"></td>
		<td width="440"></td></tr>
		<tr><td></td></tr>
	<tr>
		<td class="light-orange"></td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right>
		<font color="#000000"><%tcWebApi_get("String_Entry","StatisticsInterfaceText","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<SELECT NAME="TcpdumpInterface" SIZE="1" >
				<OPTION value="br0" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "br0" then asp_Write("selected") end if %> >All
				<OPTION value="eth0.1" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "eth0.1" then asp_Write("selected") end if %> >Ethernet1
				<OPTION value="eth0.2" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "eth0.2" then asp_Write("selected") end if %> >Ethernet2
				<OPTION value="eth0.3" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "eth0.3" then asp_Write("selected") end if %>  >Ethernet3
				<OPTION value="eth0.4" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "eth0.4" then asp_Write("selected") end if %>  >Ethernet4
				<OPTION value="ra0" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "ra0" then asp_Write("selected") end if %>  >WLAN
				<OPTION value="rai0" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "rai0" then asp_Write("selected") end if %> >WLAN 5G
				<OPTION value="pon" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "pon" then asp_Write("selected") end if %>  >PON
				</SELECT>

		</td></tr>
	<tr>
		<td class="light-orange"></td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right>
		<font color="#000000"><%tcWebApi_get("String_Entry","NavigationTcpDumpMaxPcapText","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
        <INPUT TYPE="TEXT" NAME="TcpdumpPcapNum" SIZE="9" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Tcpdump_Pcap","TcpdumpPcapNum","h") <> "N/A" then tcWebApi_get("Tcpdump_Pcap","TcpdumpPcapNum","s") end if%>" >

		</td></tr>
	<tr>
		<td class="light-orange"></td>
		<td class="light-orange"></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;
		</td></tr>
		</table>
		<table width="760" border="0" align=center cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">



</tr>


<tr>
<td width="160" class="black" height="42" >&nbsp;</td><td width="160" class="orange">&nbsp;</td><td width="440" class="orange">
		<INPUT TYPE="SUBMIT" NAME="StatRefresh" VALUE="<%tcWebApi_get("String_Entry","NavigationTcpDumpstartText","s")%>" onClick='save_tcpdump_settings()'>
			<INPUT TYPE="HIDDEN" NAME="TcpdumpStart" VALUE="Start">
			<INPUT TYPE="HIDDEN" NAME="Tcpdump_flag" VALUE="1">
<INPUT TYPE="SUBMIT" NAME="StatClean" VALUE="<%tcWebApi_get("String_Entry","NavigationTcpDumpcleanText","s")%>" onClick='clean_tcpdump_settings()'>
			<INPUT TYPE="HIDDEN" NAME="Tcpdumpclean" VALUE="No">
<input type="button" value="<%tcWebApi_get("String_Entry","NavigationTcpDumpBackupText","s")%>" onClick='backup_tcpdump_settings()'>

</td>

</tr>


<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
<tr>
<td align=center colSpan=3><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%></font></td>
</tr>
<%end if%>
</table>
</form></body></html>
