<%
tcWebApi_set("WebCurSet_Entry","diag_pvc","Test_PVC")
tcWebApi_set("WebCurSet_Entry","dev_pvc","DvInfo_PVC")
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
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" href="/style.css" tppabs="http://192.168.1.1/css/style.css" type="text/css">
<script language="JavaScript" src="/val.js"></script>
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>

<style>

body
{
background:#bfefff;
}

#buttoncolor input:hover
{
display:inline-block;
background:#1a6f98;
color:#fff;
outline:0;
}

td.tabdata {
    font-size: 13px;
    font-family: Arial,Helvetica,sans-serif;
    color: #404040;
}

.button1
{
display:inline-block;
cursor:pointer;
color:#fff;
font:bold 14px Arial,Verdana,sans-serif;
margin:5px;
padding:7px 14px;
line-height:normal;
*overflow:visible ;
text-align:center;
text-decoration:none;
position:relative;
background:#38a7dc;
border:1px solid #38a7dc;
outline:0;
}

</style>

<script language="JavaScript">

function doSave() {
	document.RedirectDNS_Form.submit();
}


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
<FORM METHOD="POST" ACTION="/cgi-bin/portal.asp" name="RedirectDNS_Form">
<table width="760px" border="0"  cellpadding="0" cellspacing="0" align="center">
<tr><td height="40px"  colspan="5"></td></tr>
<tr><!--<td width="10" valign="right" >&nbsp; </td>

<td width="150" height="15" class="title-main"><%tcWebApi_get("String_Entry","TestDiagnosticText","s")%> </td>
<td  colspan="3" valign="middle" style="padding-right:20"><hr style="height:1px;border:none;border-top:1px solid #38A7DC;" /></td>
-->
</tr>




</table>
<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
<tr>
<td width="100" class="light-orange" height="42" >&nbsp;</td>
<td width="50"  style="font-size:20px;font-weight:bold;">Status:</td>
<td width="560"  style="font-size:20px;font-weight:bold;">
	

<%if tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "5" then%>
	<%if tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "1" then%>
		<script language="JavaScript" type="text/JavaScript">
		var strTracertResult1 = "<%TCWebApi_get("Diagnostic_PVC","TracertResult","s")%>";
		alert("strTracertResult1="+strTracertResult1);
		if(strTracertResult1 == "Fail")
			document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","DNSTestStatus3Text","s")%></strong></font></div>');
		else if(strTracertResult1 == "PASS")
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","DNSTestStatus2Text","s")%></strong></font></div>');
        </script>
	<%elseif tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "2" then%>
		<script language="JavaScript" type="text/JavaScript">
		var strpingdns1 = "<%TCWebApi_get("Diagnostic_PVC","PingPriDNS","s")%>";
		alert("strpingdns1="+strpingdns1);

		if(strpingdns1 == "Fail")
			document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","DNSTestStatus3Text","s")%></strong></font></div>');
		else if(strpingdns1 == "PASS")
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","DNSTestStatus2Text","s")%></strong></font></div>');
        </script>
		
	<%else%>
			<script language="JavaScript" type="text/JavaScript">
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","DNSTestStatus2Text","s")%></strong></font></div>');
			</script>
	<%end if%>

<%elseif tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "1" then%>
	<%if tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "1" then%>
		<script language="JavaScript" type="text/JavaScript">
		var strTracertResult2 = "<%TCWebApi_get("Diagnostic_PVC","TracertResult","s")%>";
		alert("strTracertResult2="+strTracertResult2);

		if(strTracertResult2 == "Fail")
			document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","DNSTestStatus3Text","s")%></strong></font></div>');
		else if(strTracertResult2 == "PASS")
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","DNSTestStatus2Text","s")%></strong></font></div>');
		</script>
	<%elseif tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "2" then%>
		<script language="JavaScript" type="text/JavaScript">
		var strpingdns2 = "<%TCWebApi_get("Diagnostic_PVC","PingPriDNS","s")%>";
		alert("strpingdns2="+strpingdns2);
		if(strpingdns2 == "Fail")
			document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","DNSTestStatus3Text","s")%></strong></font></div>');
		else if(strpingdns2 == "PASS")
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","DNSTestStatus2Text","s")%></strong></font></div>');
		</script>
	<%else%>
			<script language="JavaScript" type="text/JavaScript">
			document.writeln('<div align=center><font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","DNSTestStatus2Text","s")%></strong></font></div>');
			</script>
	<%end if%>
<%elseif tcWebApi_get("XPON_Common","trafficStatus","h") = "up" then%>
		<script language="JavaScript" type="text/JavaScript">
		document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","DNSTestStatus4Text","s")%></strong></font></div>');
		</script>	
		<%else%>
		<script language="JavaScript" type="text/JavaScript">
		document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","DNSTestStatus1Text","s")%></strong></font></div>');
		</script>

<%end if%>


</td>
<td width="50" class="tabdata" style="display:none;"><div align=right>
<%tcWebApi_get("String_Entry","NavigationInterfaceText","s")%></div></td>
<td class="tabdata" color="gray" style="display:none;">
<SELECT NAME="DvInfo_PVC" SIZE="1" onChange="doSave()">
<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>
		<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
		<!--wang only use one wan port 20190927
		<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
		<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
		<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
		<!--wang
		<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
		<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
		<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
		<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
		-->
<%else%>
<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") = "Yes" then%>
<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
<!--wang only use one wan port 20190927
<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
<!--wang
<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
-->
<%else%>
	<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
		<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
		<!--wang only use one wan port 20190927
		<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
		<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
		<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
		<!--wang
		<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
		<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
		<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
		<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
		-->
	<%end if%>
	<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
		<OPTION value="8" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "8" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC8Text","s")%>
	<%end if%>
	<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
		<OPTION value="10" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "10" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC10Text","s")%>
	<%end if%>

<%end if%>
<%end if%>
</SELECT></td>
</tr>
</table>


	<table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">



	<tr>
		<td width="100">&nbsp;</td>
				<td width="5" style="background-color:#00CC00">&nbsp;</td>		

		<td width="200" class="tabdata"	>
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDeviceNameText","s")%></font>
		</td><td width="100" class="tabdata"><% tcWebApi_get("GPON_ONU","Description","s")%></td>
		<td width="60">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		

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
	tcWebApi_get("DeviceInfo_PVC","WanIP","s")
    else tcWebApi_get("String_Entry","DeviceDisConnectedText","s")
    end if
else
    If tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "1" Then tcWebApi_get("DeviceInfo_PVC","WanIP","s") else tcWebApi_get("String_Entry","DeviceDisConnectedText","s") end if
end if
%>
		</td>
	</tr>


	<tr>
		<td width="100">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestSerialNumberText","s")%></font>
		</td>
		<td width="100" class="tabdata"><% tcWebApi_get("GPON_ONU","SerialNumber","s")%>
		</td>	
		<td width="60">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestGatewayIPv4Text","s")%></font>
		</td>
		<td width="150" class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","WanDefGW","s")%>
		</td>
	</tr>



		<tr>
		<td width="100">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestHardwareVersionText","s")%></font>
		</td>
		<td width="100" class="tabdata"><% tcWebApi_get("GPON_ONU","HardwareVersion","s")%>
		</td>
		<td width="60">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestGatewayIPv6Text","s")%></font>
		</td>
		<td width="150" class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","IP6WanDefGW","s")%>
		</td>	

	</tr>
	

		<tr>
		<td width="100">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestSoftwareVersionText","s")%></font>
		</td>
		<td width="100" class="tabdata"><% tcWebApi_get("DeviceInfo","FwVer","s")%>
		</td>
		<td width="60">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="150" class="tabdata">		
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDNSIPv4Text","s")%></font>

		</td>
		<td width="150" class="tabdata">

		<script language="JavaScript" type="text/JavaScript">


	var strtype = "<% tcWebApi_get("Dproxy_Entry","type","s") %>";
	var strPriDNS = "<% tcWebApi_staticGet("DeviceInfo_PVC","DNSIP","s") %>";
	var strDevDNS = "<% tcWebApi_staticGet("DeviceInfo_PVC","SECDNSIP","s") %>";
	document.writeln(strPriDNS+","+strDevDNS);
		
</script>
		

		</td>		
	</tr>


		<tr>
		<td width="100">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
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
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDNSIPv6Text","s")%></font>
		</td>
		<td width="150" class="tabdata">
		
		<script language="JavaScript" type="text/JavaScript">


	var strPriDNS = "<%tcWebApi_staticGet("DeviceInfo_PVC","IP6DNSIP","s")%>";
	var strDevDNS = "<%tcWebApi_staticGet("DeviceInfo_PVC","IP6SECDNSIP","s")%>";
	document.writeln(strPriDNS+","+strDevDNS);
		
</script>

		

		</td>
	</tr>



		<tr>
		<td width="100">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
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
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestWiFiClientsText","s")%></font>
		</td>
		<td width="150" class="tabdata"><% tcWebApi_get("DNSRedirect_Entry","WiFiClients","s")%>
		</td>	

	</tr>




		<tr>
		<td width="100">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
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
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="150" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDHCPClientsText","s")%></font>
		</td>
		<td width="150" class="tabdata"><% tcWebApi_get("DhcpLease","LeaseNum","s")%>
		</td>
	</tr>



		<tr>
		<td width="100">&nbsp;</td>
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		
		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestDeviceRunningTimeText","s")%></font>
		</td>
		<td width="100" class="tabdata"><%tcWebApi_get("DNSRedirect_Entry","CurentTime","s")%>
		</td>
		
		<td width="60">&nbsp;</td>		
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		

		<td width="150" class="tabdata">&nbsp;
		</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
	</tr>


		<tr>
		<td width="100">&nbsp;</td>		
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		

		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestCPUText","s")%></font>
		</td>
		<td width="100" class="tabdata">  
<%If tcWebApi_get("DeviceInfo","CpuUsage","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CpuUsage","s") end if%>%     

		</td>
		
		<td width="60">&nbsp;</td>		
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		

		<td width="150" class="tabdata">&nbsp;
		</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
	</tr>

		<tr>
		<td width="100">&nbsp;</td>		
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		

		<td width="200" class="tabdata">
		<font color="#000000"><%tcWebApi_get("String_Entry","DNSTestRAMText","s")%></font>
		</td>
		<td width="100" class="tabdata"><%If tcWebApi_get("DeviceInfo","MemUsage","h") <> "N/A" Then tcWebApi_get("DeviceInfo","MemUsage","s") end if%>%   
		</td>
		
		<td width="60">&nbsp;</td>		
		<td width="5" style="background-color:#00CC00">&nbsp;</td>		

		<td width="150" class="tabdata">&nbsp;
		</td>
		<td width="150" class="tabdata">&nbsp;
		</td>
	</tr>

	</table>
	




			
<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
<tr height="10px"><td>&nbsp;</td></tr>
<tr>
<td width="100" class="light-orange" height="42" >&nbsp;</td>

<td width="500" id="buttoncolor">
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
<td width="160" >&nbsp;</td>
</tr>
</table>

<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
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

<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">	
<%if tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "1" then%>
	<tr>
		<td class="light-orange"></td>
		<td>
			<script language="JavaScript" type="text/JavaScript">
			document.writeln("<iframe src='/cgi-bin/getTracentDNSResult.cgi' frameborder='0' width='760' height='400' ></iframe>" );
			//document.writeln("<textarea src='/cgi-bin/getTracentDNSResult.cgi' id="restrt" readonly="readonly" rows="16" cols="120"></textarea>" );
			</script>
		</td>
	</tr>
<%else%>
	<%if tcWebApi_get("DNSRedirect_Entry","PingorTracertDNS","h") = "2" then%>

	<tr>
		<td class="light-orange"></td>
		<td>
			<script language="JavaScript" type="text/JavaScript">
			document.writeln("<iframe src='/cgi-bin/getPingDnsResult.cgi' frameborder='0' width='760' height='400' ></iframe>" );
			</script>
		</td>
	</tr>
	<%else%>
		<tr>
			<td class="light-orange"></td>
			<td>
			<script language="JavaScript" type="text/JavaScript">
			document.writeln("<iframe frameborder='0' width='760' height='400' ></iframe>" );
			//document.writeln("<textarea  id="restrt" readonly="readonly" rows="16" cols="120"></textarea>" );
				</script>
					
			</td>
		</tr>
	<%End If%>	
<%End If%>	
</table>


<table border="0" width="760" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" align="center">
	<tbody>
	  	<tr>
	   	 	<td width="72" height="90">
	   	 	</td>
	   	 	<td width="160" height="100" style="padding-right:15px;">
	                	<div align="left">
					<img src="/logo.gif" tppabs="logo.gif" width="160" height="100">
				</div>
		  	</td>
		  <!--cindy add strart-->	
		  	<td width="270" height="100">
 				 <table style="border-collapse:collapse; border-spacing:0px 0px;">
					<tbody>
						<tr>
						        <td style="font-size:18px;font-weight:bold;font-family: Arial, Helvetica, sans-serif;"><%tcWebApi_get("String_Entry","DNSTestFPTSupport1Text","s")%></td>
						</tr>
						<tr>
						        <td style="font-size:17px;font-family: Arial, Helvetica, sans-serif;"><%tcWebApi_get("String_Entry","DNSTestFPTSupport2Text","s")%></td>
						</tr>
					</tbody>
				</table>
		  	</td>
		  	<td style="padding:0px 10px;" width="3px">
 				 <table style="border-collapse:collapse; border-spacing:0px 0px;">
					<tbody>
						<tr>
						        <td width="3" style="background-color:#d9d9d9">&nbsp;</td>
						</tr>
						<tr>
						        <td width="3" style="background-color:#d9d9d9">&nbsp;</td>
						</tr>
					</tbody>
				</table>
			</td>
		  	<td height="100" style="font-size:22px;font-weight:bold;color:#ff8c1a;font-family: Arial, Helvetica, sans-serif;">
			<%tcWebApi_get("String_Entry", "HotlineNumText", "s")%>
		  	</td>
		<!--cindy add end-->
		
<!--cindy delete		  	
		  	<td>
  				<table>
  					<tbody>
  						<tr>
				  			<td style="font-size:18px;font-weight:bold;">
				  				<%tcWebApi_get("String_Entry","DNSTestFPTSupport1Text","s")%></td>
				 			 <td  style="font-size:18px;font-weight:bold;">
				 				 &lt;<%tcWebApi_get("String_Entry","DNSTestFPTSupport2Text","s")%>&gt;</td>
				 		 </tr>
 					</tbody>
				 </table> 
 				 <table style="border-collapse:collapse; border-spacing:0px 0px;">
					<tbody>
						<tr>
						        <td width="5" style="background-color:#3366FF">&nbsp;</td>
						        <td width="180"><%tcWebApi_get("String_Entry","DNSTestFPTNorthText","s")%></td>
						        <td width="5" style="background-color:#FF3300">&nbsp;</td>
						        <td width="180"><%tcWebApi_get("String_Entry","DNSTestFPTMiddleText","s")%></td>
						        <td width="5" style="background-color:#00FF33">&nbsp;</td>
						        <td width="180"><%tcWebApi_get("String_Entry","DNSTestSourthText","s")%></td>

						</tr>

						<tr>
							  <td style="background-color:#3366FF">&nbsp;</td>
						        <td height="26" valign="middle" style="font-size:18px;font-weight:bold;"><%tcWebApi_get("String_Entry","DNSTestFPTNorthTelText","s")%></td>
						        <td style="background-color:#FF3300">&nbsp;</td>
						        <td style="font-size:18px;font-weight:bold;"><%tcWebApi_get("String_Entry","DNSTestFPTMiddleTelText","s")%></td>
						        <td style="background-color:#00FF33">&nbsp;</td>
						        <td style="font-size:18px;font-weight:bold;"><%tcWebApi_get("String_Entry","DNSTestSourthTelText","s")%></td>

						</tr>
					</tbody>
				</table>
			</td>
-->
		</tr>
	</tbody>
</table>

</FORM>
</body>
</html>


