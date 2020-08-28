<%
tcWebApi_set("WebCurSet_Entry","diag_pvc","Test_PVC")
tcWebApi_set("WebCurSet_Entry","diag_pvc_ext","Test_PVC_Ext")
tcWebApi_set("DNSRedirect_Entry","PingorTracertDNS","PingorTracertDNS")
tcWebApi_set("WebCurSet_Entry","diag_pvc","Test_PVC")
tcWebApi_set("WebCurSet_Entry","diag_pvc_ext","Test_PVC_Ext")
if tcWebApi_get("WebCustom_Entry","isTracertSupported","h") = "Yes" then
	TCWebApi_set("Diagnostic_PVC","TracertEn","TracertEnable")
end if
if request_Form("DNSTest_Flag") = "1" then
tcWebApi_commit("Diagnostic_PVC")
end if
%>






<html><head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" href="/style.css" tppabs="http://192.168.1.1/css/style.css" type="text/css">
<script language="JavaScript" src="/val.js"></script>
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
<script language="JavaScript">



function traceroute_dns()
{
//tcWebApi_set("Diagnostic_PVC","TracertEn","tracert_dns")
//uptime ji shi 
	 setDisplay('WaitMsgTracert', 1);        

	document.RedirectDNS_Form.PingorTracertDNS.value = 1;
	document.RedirectDNS_Form.DNSTest_Flag.value = 1;
	document.RedirectDNS_Form.TracertEnable.value = 1;

	document.RedirectDNS_Form.submit();
	return ;
}
	
	function RefeshForTracert()
	{
		var str1="Wait";
		//var str2=document.RedirectDNS_Form.tracert_result.value;
		var str2 = "<%TCWebApi_get("Diagnostic_PVC","TracertResult","s")%>";
		if(str1 == str2){
			alert("refesh");
			setTimeout("RefeshForTracert()",5000);
			document.location.href="/cgi-bin/DNS_redirect.asp";
		}
	}
function ping_dns(){
		document.RedirectDNS_Form.PingorTracertDNS.value = 2;
	document.RedirectDNS_Form.DNSTest_Flag.value = 1;

		document.RedirectDNS_Form.submit();
	return true;
}

<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>
function transTemperature(temperature){
	var temp = Number(temperature);
	if (temp >= Math.pow(2, 15)){
		return -Math.round((Math.pow(2, 16)-temp)/256);
	}else{
		return Math.round(temp/256);
	}
}
<%end if%>

</script>


</head>
<% if tcWebApi_get("WebCustom_Entry","isTracertSupported","h") = "Yes" then %>
<body onLoad="setTimeout('RefeshForTracert()',5000);">
<%else%>
	<body>
<%end if%>
<FORM METHOD="POST" ACTION="/cgi-bin/DNS_redirect.asp" name="RedirectDNS_Form">

<table width="760px" border="0"  cellpadding="0" cellspacing="0">
<tr><td height="40px"  colspan="5"></td></tr>
<tr><td width="10" valign="right" >&nbsp; </td>
<td width="150" height="15" class="title-main"><%tcWebApi_get("String_Entry","TestDiagnosticText","s")%> </td>
<td  colspan="3" valign="middle" style="padding-right:20"><hr style="height:1px;border:none;border-top:1px solid #38A7DC;" /></td>
</tr>
</table>
<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td width="100" class="light-orange" height="42" >&nbsp;</td>
<td width="60" >STATUS:</td>
<td width="100" >

<%if tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "1" then%>
		<script language="JavaScript" type="text/JavaScript">
		var strTracertResult = "<%TCWebApi_get("Diagnostic_PVC","TracertResult","s")%>";
		if(strTracertResult == "Fail")
			document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font></div>');
		else if(strTracertResult == "PASS")
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font></div>');
			else	if(strTracertResult == "Wait")
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn3Text","s")%></strong></font></div>');
		</script>
<%end if%>

<%if tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "2" then%>
		<script language="JavaScript" type="text/JavaScript">
		var strpingdns = "<%TCWebApi_get("Diagnostic_PVC","PingPriDNS","s")%>";
		if(strpingdns == "Fail")
			document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font></div>');
		else if(strpingdns == "PASS")
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font></div>');
		else
			document.writeln('<div align=center><font face="Arial" color="green"><strong>' +strpingdns+ '</strong></font></div>');
		</script>
<%end if%>

</td>
<td>&nbsp;</td>

</tr>
</table>


	<table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">



	<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata"	>
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDeviceNameText","s")%></font>
		</td><td width="100" class="tabdata"><% tcWebApi_get("GPON_ONU","EquipmentId","s")%></td>
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestInternetWANText","s")%></font>
		</td>
		<td width="150" class="tabdata">
		
<%
if tcWebApi_get("GUI_Entry0","Custom","h") = "C9" then
    If tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "3" Then
	tcWebApi_get("String_Entry","DeviceInfoPVC0Text","s")
    elseif tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "5" Then 
	tcWebApi_get("String_Entry","DeviceInfoPVC1Text","s")
    elseif tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "4" Then  
	tcWebApi_get("String_Entry","DeviceInfoPVC2Text","s")
    elseif tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "2" Then
	tcWebApi_get("String_Entry","DeviceInfoPVC3Text","s")
    elseif tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "1" Then
	tcWebApi_get("String_Entry","DeviceConnectedText","s")
    else tcWebApi_get("String_Entry","DeviceDisConnectedText","s")
    end if
else
    If tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "1" Then tcWebApi_get("String_Entry","DeviceConnectedText","s") else tcWebApi_get("String_Entry","DeviceDisConnectedText","s") end if
end if
%>
		</td>
	</tr>


	<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestSerialNumberText","s")%></font>
		</td>
		<td width="100" class="tabdata"><% tcWebApi_get("GPON_ONU","SerialNumber","s")%>
		</td>	
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestGatewayIPv4Text","s")%></font>
		</td>
		<td width="150" class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","WanDefGW","s")%>
		</td>
	</tr>



		<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestHardwareVersionText","s")%></font>
		</td>
		<td width="100" class="tabdata"><% tcWebApi_get("GPON_ONU","Version","s")%>
		</td>
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestGatewayIPv6Text","s")%></font>
		</td>
		<td width="150" class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","IP6WanDefGW","s")%>
		</td>	

	</tr>
	

		<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestSoftwareVersionText","s")%></font>
		</td>
		<td width="100" class="tabdata"><% tcWebApi_get("DeviceInfo","FwVer","s")%>
		</td>
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">		
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDNSIPv4Text","s")%></font>

		</td>
		<td width="150" class="tabdata">

		<script language="JavaScript" type="text/JavaScript">


	var strtype = "<% tcWebApi_get("Dproxy_Entry","type","s") %>";
	var strPriDNS = "<% tcWebApi_staticGet("Dproxy_Entry","Primary_DNS","s") %>";
	var strDevDNS = "<% tcWebApi_staticGet("DeviceInfo_PVC","DNSIP","s") %>";
	
	
		if (strtype == "1") {
			document.writeln(strPriDNS);
		}
		else{
			document.writeln(strDevDNS);
		}	
		
</script>
		

		</td>		
	</tr>


		<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestTransmittedPowerText","s")%></font>
		</td>
		<td width="100" class="tabdata"><script language="JavaScript">
			<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") <> "0"  Then%>
				document.write((Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>))/10000)/(Math.log(10))*100)/10)+" <%tcWebApi_get("String_Entry","DNSTestdBmText","s")%>");
			<%else%>
				<%if tcWebApi_get("WebCustom_Entry","isCHSSupported","h") = "Yes"  Then%>
					document.write((Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>))/10000)/(Math.log(10))*100)/10)+" <%tcWebApi_get("String_Entry","DNSTestdBmText","s")%>");
				<%else%> 
					document.write("<%tcWebApi_get("String_Entry","DNSTestNAText","s")%>");
				<%End If%>
			<%End If%>
		</script>		
		</td>
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDNSIPv6Text","s")%></font>
		</td>
		<td width="150" class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","IP6DNSIP","s")%>

		</td>
	</tr>



		<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestRecievedText","s")%></font>
		</td>
		<td width="100" class="tabdata"><script language="JavaScript">
			<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") <> "0"  Then%>
				document.write((Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>))/10000)/(Math.log(10))*100)/10)+" <%tcWebApi_get("String_Entry","DNSTestdBmText","s")%>");
			<%else%> 
				<%if tcWebApi_get("WebCustom_Entry","isCHSSupported","h") = "Yes"  Then%>
					document.write((Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>))/10000)/(Math.log(10))*100)/10)+" <%tcWebApi_get("String_Entry","DNSTestdBmText","s")%>");
				<%else%>
					document.write("<%tcWebApi_get("String_Entry","DNSTestNAText","s")%>"); 
				<%End If%>
			<%End If%>
		</script>	
		</td>
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestWiFiClientsText","s")%></font>
		</td>
		<td width="150" class="tabdata"><% tcWebApi_get("DNSRedirect_Entry","WiFiClients","s")%>
		</td>	

	</tr>




		<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestTemperatureText","s")%></font>
		</td>
		<td width="100" class="tabdata">
			<script language="JavaScript">
				<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") <> "0"  Then %>
					document.write(transTemperature(<%tcWebApi_get("Info_PonPhy", "Temperature", "s")%>)+" <%tcWebApi_get("String_Entry","DeviceXPONTemCText","s")%>");					
				<%else%>
					<%if tcWebApi_get("WebCustom_Entry","isCHSSupported","h") = "Yes"  Then%>
						document.write(transTemperature(<%tcWebApi_get("Info_PonPhy", "Temperature", "s")%>)+" <%tcWebApi_get("String_Entry","DeviceXPONTemCText","s")%>");					
					<%else%>
						document.write("<%tcWebApi_get("String_Entry","DeviceXPONNAText","s")%>");
					<%End If%> 
			<%End If%>
			</script>	
		</td>
		
<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDHCPClientsText","s")%></font>
		</td>
		<td width="150" class="tabdata"><% tcWebApi_get("DhcpLease","LeaseNum","s")%>
		</td>
	</tr>



		<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDeviceRunningTimeText","s")%></font>
		</td>
		<td width="100" class="tabdata"><%tcWebApi_get("DNSRedirect_Entry","CurentTime","s")%>
		</td>
		
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
	</tr>


		<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestCPUText","s")%></font>
		</td>
		<td width="100" class="tabdata">  
<%If tcWebApi_get("DeviceInfo","CpuUsage","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CpuUsage","s") end if%>%     

		</td>
		
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
	</tr>

		<tr>
		<td width="100">&nbsp;</td>
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestRAMText","s")%></font>
		</td>
		<td width="100" class="tabdata"><%If tcWebApi_get("DeviceInfo","MemUsage","h") <> "N/A" Then tcWebApi_get("DeviceInfo","MemUsage","s") end if%>%   
		</td>
		
		<td width="60">&nbsp;</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
	</tr>

	</table>
	




			
<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td width="160" class="light-orange" height="42" >&nbsp;</td>
<td width="160" >&nbsp;</td>
<td width="440"  align="center" id="buttoncolor">
<input type="button" class="button1" value="<%tcWebApi_get("String_Entry","DNSTestPingDNSText","s")%>" onClick="ping_dns();">


<INPUT TYPE="HIDDEN" NAME="Test_PVC" VALUE="<% tcWebApi_get("WebCurSet_Entry","diag_pvc","s") %>">


<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
<%if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "8" then%>
<INPUT TYPE="HIDDEN" NAME="Test_PVC_Ext" VALUE="<%  tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","s") %>" >
<%end if%>
<%end if%>
<%end if%>
<INPUT TYPE="HIDDEN" NAME="DNSTest_Flag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="TracertEnable" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="PingorTracertDNS" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="tracert_result" VALUE="<%TCWebApi_get("Diagnostic_PVC","TracertResult","s")%>">
<input type="button" class="button1" value="<%tcWebApi_get("String_Entry","DNSTestTraceRouteDNSText","s")%>" onClick="traceroute_dns();">

</td>
</tr>
</table>

<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td>&nbsp;</td>
		<td class="tabdata">
			<DIV id="WaitMsgTracert"><font color="#FF0000" size="-1"> <%tcWebApi_get("String_Entry","TestWaitTracertText","s")%></font></DIV>
			<script language="JavaScript" type="text/JavaScript">
<% if tcWebApi_get("Diagnostic_PVC","TracertResult","h") = "Wait" then %>
				setDisplay('WaitMsgTracert', 1);
<%else%>
				setDisplay('WaitMsgTracert', 0);
<%end if%>
			</script>
		</td>
		<td class="tabdata">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
</table>

<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">	
<%if tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "1" then%>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td>
			<script language="JavaScript" type="text/JavaScript">
			document.writeln("<iframe src='/cgi-bin/getTracentDNSResult.cgi' frameborder='0' width='700' height='400' ></iframe>" );
			</script>
		</td>
	</tr>
<%else%>
	<%if tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "2" then%>

	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td>
			<script language="JavaScript" type="text/JavaScript">
			document.writeln("<iframe src='/cgi-bin/getPingDnsResult.cgi' frameborder='0' width='700' height='400' ></iframe>" );
			</script>
		</td>
	</tr>
	<%else%>
		<tr>
			<td class="light-orange">&nbsp;</td>
			<td class="light-orange"></td>
			<td>
				<script language="JavaScript" type="text/JavaScript">
				document.writeln("<iframe frameborder='0' width='700' height='400' ></iframe>" );
				</script>
			</td>
		</tr>
	<%End If%>	
<%End If%>	
</table>


<div  align="left">

<table border="0" width="760" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
  <tbody><tr>
    
    <td width="240" height="80" valign="middle" style="padding-left:100px;">
    
    <div align="left">
  
	<img src="/logo.png" tppabs="logo.png" width="160" height="100">
	
	</div></td>


	<td>
<table>
<tr>
<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestFPTSupport1Text","s")%></font>

</tr>
<tr>
	<td align="right" valign="bottom" class="top_lang">	
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestFPTNorthText","s")%></font>
	</td>

	<td align="right" valign="bottom" class="top_lang">	
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestFPTMiddleText","s")%></font>
	</td>
	<td align="right" valign="bottom" class="top_lang">	
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestSourthText","s")%></font>
	</td>

</tr>

<tr>
	<td align="right" valign="bottom" class="top_lang">	
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestFPTNorthTelText","s")%></font>
	</td>

	<td align="right" valign="bottom" class="top_lang">	
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestFPTMiddleTelText","s")%></font>
	</td>
	<td align="right" valign="bottom" class="top_lang">	
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestSourthTelText","s")%></font>
	</td>

</tr>

</table>

</td>
	
	</tr>
</tbody></table>

	
</div>
</FORM>
</body>
</html>


