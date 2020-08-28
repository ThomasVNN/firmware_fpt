<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<style  type="text/css">
*{color:  #404040;}

.list li{
       list-style-type:none;
	margin-top:10px;
	text-align:left;
	padding-left:19px;
	padding-bottom:5px;
	padding-top:3px;	
	background:url(/next.gif) no-repeat left 5px;

}

#li_style{
       list-style-type:none;
	margin-top:10px;
	text-align:left;
	padding-left:19px;
	padding-bottom:5px;
	padding-top:3px;	
	background:url(/next.gif) no-repeat left 5px;

}

.li_none{
       list-style-type:none;
	margin-top:10px;
	text-align:left;
	padding-left:19px;
	padding-bottom:5px;
	padding-top:3px;	


}


#main_table li a{

    font-size:12px;
    color:#38a7dc;

}
#main_table ul
{
margin-left:0;
padding-left:0;
align:left;

}

.maintitle{
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11pt;
	font-weight: bold;
	text-align:left;
	color: #999999;

}
</style>


</head>

<body>

<table id="main_table" style="margin-left:140px; margin-top:60px;">
<tr>
<td width="300" class="maintitle"><%tcWebApi_get("String_Entry","HelpIndexStatusText","s")%> </td>
<td width="300"  class="maintitle"><%tcWebApi_get("String_Entry","NavigationAccSetupText","s")%> </td>
</tr>

<tr>
<td class="list">
<ul>
<li><a href="/cgi-bin/help_status.asp#Device_Info" target="main"><%tcWebApi_get("String_Entry","HelpIndexDevInfoText","s")%></a></li>
<li><a href="/cgi-bin/help_status.asp#System_Log" target="main"><%tcWebApi_get("String_Entry","HelpIndexSysLogText","s")%></a></li>
<li><a href="/cgi-bin/help_status.asp#Statistics" target="main"><%tcWebApi_get("String_Entry","HelpIndexStatsText","s")%></a></li>
</ul>
</td>

<td  class="list"><ul>
<li><a href="/cgi-bin/help_interface.asp#Internet_Settings" target="main"><%tcWebApi_get("String_Entry","HelpIndexInteSetText","s")%></a></li>
<li><a href="help_interface.asp#LAN_Settings" target="main"><%tcWebApi_get("String_Entry","HelpIndexLANSetText","s")%></a></li>
  <% if tcWebApi_get("Info_WLan","isExist","h") = "N/A" then%>
  <!--div></div-->
  <%else%>
<li><a href="help_interface.asp#Wireless_LAN_Settings" target="main"><%tcWebApi_get("String_Entry","HelpIndexWLANSetText","s")%></a></li>
  <%end if%>
 </ul>
</td>
</tr>


<tr><td colspan="2" height="10">&nbsp;</td></tr>
<tr>
<td class="maintitle"><%tcWebApi_get("String_Entry","NavigationAccAdvancedText","s")%></td>
<td class="maintitle"><%tcWebApi_get("String_Entry","HelpIndexAccManageText","s")%></td>
</tr>
<tr>
<td  class="list"><ul>
<li><a href="/cgi-bin/help_advanced.asp#Firewall" target="main"><%tcWebApi_get("String_Entry","HelpIndexFirewallText","s")%> </a></li>
<li><a href="/cgi-bin/help_advanced.asp#Routing" target="main"><%tcWebApi_get("String_Entry","HelpIndexRoutingText","s")%> </a></li>
<li><a href="/cgi-bin/help_advanced.asp#NAT" target="main"><%tcWebApi_get("String_Entry","HelpIndexNATText","s")%></a></li>
<li><a href="/cgi-bin/help_advanced.asp#QoS" target="main"><%tcWebApi_get("String_Entry","HelpIndexQoSText","s")%></a></li>
<li><a href="/cgi-bin/help_advanced.asp#VLAN" target="main"><%tcWebApi_get("String_Entry","HelpIndexVLANText","s")%></a></li>
<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") <> "Yes" then%>
<%if tcWebApi_get("WebCustom_Entry","isCwmpVDSLSupport","h") <> "Yes" then%> 
<li><a href="/cgi-bin/help_advanced.asp#ADSL" target="main"><%tcWebApi_get("String_Entry","HelpIndexADSLText","s")%></a></li>
<%end if%>
<%if tcWebApi_get("WebCustom_Entry","isCwmpVDSLSupport","h") = "Yes" then%> 
<li><a href="/cgi-bin/help_advanced.asp#VDSL" target="main"><%tcWebApi_get("String_Entry","HelpIndexVDSLText","s")%></a></li>
<%end if%>  
<%end if%> 
<ul>
</td>

<td  class="list">
<ul>
<li><a href="/cgi-bin/help_access.asp#ACL" target="main"><%tcWebApi_get("String_Entry","HelpIndexACLText","s")%></a></li>
<li><a href="/cgi-bin/help_access.asp#IP_Filter" target="main"><%tcWebApi_get("String_Entry","HelpIndexIPFilterText","s")%></a></li>
<li><a href="/cgi-bin/help_access.asp#SNMP" target="main"><%tcWebApi_get("String_Entry","HelpIndexSNMPText","s")%></a></li>
<li><a href="/cgi-bin/help_access.asp#UPnP" target="main"><%tcWebApi_get("String_Entry","HelpIndexUPnPText","s")%></a></li>
<li><a href="/cgi-bin/help_access.asp#DDNS" target="main"><%tcWebApi_get("String_Entry","HelpIndexDDNSText","s")%> </a></li>
</ul>
</td>
</tr>
<tr><td colspan="2" height="10">&nbsp;</td></tr>
<tr>
<td class="maintitle"><%tcWebApi_get("String_Entry","HelpIndexMaintenText","s")%></td>
<td class="maintitle"><%tcWebApi_get("String_Entry","HelpIndexQuickText","s")%></td>
</tr>
<tr>
<td  class="list">
<ul>
<li><a href="/cgi-bin/help_maintenance.asp#Administration" target="main"><%tcWebApi_get("String_Entry","HelpIndexAdminText","s")%></a></li>
<li><a href="/cgi-bin/help_maintenance.asp#Time_Zone" target="main"><%tcWebApi_get("String_Entry","HelpIndexTimeZoneText","s")%></a> </li>
<li><a href="/cgi-bin/help_maintenance.asp#Firmware" target="main"><%tcWebApi_get("String_Entry","HelpIndexFirmwareText","s")%></a></li>
<li><a href="/cgi-bin/help_maintenance.asp#SysRestart" target="main"><%tcWebApi_get("String_Entry","HelpIndexSysRestartText","s")%></a></li>
<li><a href="/cgi-bin/help_maintenance.asp#Diagnostics" target="main"><%tcWebApi_get("String_Entry","HelpIndexDiagnText","s")%></a></li>
</ul>
</td>

<td><ul>
<li id="li_style"><a href="/cgi-bin/help_quickstart.asp#quick_start" target="main"><%tcWebApi_get("String_Entry","HelpIndexQuickText","s")%></a></li>
<li class="li_none">&nbsp;</li>
<li class="li_none">&nbsp;</li>
<li class="li_none">&nbsp;</li>
<li class="li_none">&nbsp;</li>
</ul></td>
</tr>
<tr><td colspan="2" height="10">&nbsp;</td></tr>


<% IF tcWebApi_get("dynDisp_Entry","MainMaskBit5","h") = "1" THEN%>
<tr>
<td class="maintitle">
<%tcWebApi_get("String_Entry","NavigationVoipStatusText","s")%></td>
<td>&nbsp;</td>
</tr>
<tr>
<td  class="list">
<ul>
<li><a href="/cgi-bin/help_voip.asp#Basic" target="main"><%tcWebApi_get("String_Entry","NavigationVoipBasicText","s")%></a></li>
<li><a href="/cgi-bin/help_voip.asp#Call_Control" target="main"><%tcWebApi_get("String_Entry","NavigationVoipCallText","s")%></a>/<li>
<li><a href="/cgi-bin/help_voip.asp#Media" target="main"><%tcWebApi_get("String_Entry","NavigationVoipMediaText","s")%></a></li>
<li><a href="/cgi-bin/help_voip.asp#Speed_Dial" target="main"><%tcWebApi_get("String_Entry","NavigationVoipDialText","s")%></a></li>
<li><a href="/cgi-bin/help_voip.asp#Advanced" target="main"><%tcWebApi_get("String_Entry","NavigationVoipAdvancedText","s")%></a></li>
</ul>
</td>
<td>&nbsp;</td>
</tr>
<%end if%>
</table>                                                           
  
<div id="cpright">
<table border="0" cellpadding="0" cellspacing="0">
  <tr height="32px">
	<td width="20px">&nbsp;</td>
	<td width="250px">&nbsp;</td>
	<td width="372px"></td>
  </tr>
  <%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
	<tr>
	<td align=center colSpan=3><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%></font></td>
	</tr>
  <%end if%>
</table>
</div>
</body>
</html>        
