<%
	if request_Form("Tcpdump_flag") = "1" then
		TCWebApi_set("Tcpdump_Pcap","TcpdumpInterface","TcpdumpInterface")
		TCWebApi_set("Tcpdump_Pcap","TcpdumpStart","TcpdumpStart")
		TCWebApi_set("Tcpdump_Pcap","TcpdumpPcapNum","TcpdumpPcapNum")
		tcWebApi_commit("Tcpdump_Pcap")
	end if

	tcWebApi_set("WebCurSet_Entry","diag_pvc","Test_PVC")
	tcWebApi_set("WebCurSet_Entry","diag_pvc_ext","Test_PVC_Ext")
	TCWebApi_set("Diagnostic_PVC","PingOtherIPaddr","IP")
	TCWebApi_set("Diagnostic_PVC","PingOtherType","pingtest_type")
	tcWebApi_set("DNSRedirect_Entry","PingorTracertDNS","PingorTracertDNS")

	if tcWebApi_get("WebCustom_Entry","isTracertSupported","h") = "Yes" then
		TCWebApi_set("Diagnostic_PVC","TracertEn","tracert_enable")
		If Request_Form("tracert_enable") = "1" then
			TCWebApi_set("Diagnostic_PVC","TracertIPaddr","tracert_destaddr")
		end If
	end if

	If Request_Form("testFlag") = "1" then
		tcWebApi_commit("Diagnostic_PVC")
	elseif Request_Form("testFlag") = "2" then
		tcWebApi_unset("Diagnostic_PVC")
		tcWebApi_set("WebCurSet_Entry","dev_pvc","Test_PVC")
		tcWebApi_set("WebCurSet_Entry","dev_pvc_ext","Test_PVC_Ext")
	end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
		<link rel="stylesheet" href="/style.css" tppabs="http://192.168.1.1/css/style.css" type="text/css">

		<style  type="text/css">
			body{color:  #404040;}

		</style>
		
		<script language="JavaScript" src="/val.js"></script>
		<script language="JavaScript" src="/general.js"></script>
		<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
		<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
		<script type="text/javascript" src="/spin.js" ></script>
		<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
		<script language="JavaScript">
//<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
function showSpin(){
	var opts = {
		  lines: 8, // The number of lines to draw
		  length: 0, // The length of each line
		  width: 6, // The line thickness
		  radius: 7, // The radius of the inner circle
		  scale: 1, // Scales overall size of the spinner
		  corners: 1, // Corner roundness (0..1)
		  color: '#999999', // CSS color or array of colors
		  fadeColor: '#transparent', // CSS color or array of colors
		  speed: 1.1, // Rounds per second
		  rotate: 0, // The rotation offset
		  animation: 'spinner-line-fade-quick', // The CSS animation name for the lines
		  direction: 1, // 1: clockwise, -1: counterclockwise
		  zIndex: 2e9, // The z-index (defaults to 2000000000)
		  className: 'spinner', // The CSS class to assign to the spinner
		  top: '50%', // Top position relative to parent
		  left: '50%', // Left position relative to parent
		  shadow:false, // Box-shadow for the lines
		  position: 'absolute' // Element positioning
		};
	
var target = document.getElementById('firstDiv');
var spinner = new Spinner(opts).spin(target);
}
//<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
		
			function start_tcpdump_settings() 
			{
				var TcpdumpPcapNumValue=document.Test_Form.TcpdumpPcapNum.value;
				document.Test_Form.TcpdumpStart.value="Start";
				if(TcpdumpPcapNumValue<=0)
				{
			  		 alert("<%tcWebApi_get("String_Entry","NavigationTcpDumpText0","s")%>");
					return -1;
				}
				
				//cindy add start 0929
				if(TcpdumpPcapNumValue>2000)
				{
			  		 alert("<%tcWebApi_get("String_Entry","NavigationTcpDumpText1","s")%>");
					return -1;
				}
				//cindy add end 0929
				showSpin();//cindy add
				document.Test_Form.Tcpdump_flag.value=1;
				document.Test_Form.submit();
				return;
			}

			function backup_tcpdump_settings()
			{
			//foxconn cindy add to change tcpdump.cap into SN_interface.pcap
				var value;
				var interface;
				var serialnumber= "<% tcWebApi_get("GPON_ONU","SerialNumber","s") %>";
				if(document.Test_Form.TcpdumpInterface[0].selected)
					value="br0";
				else if(document.Test_Form.TcpdumpInterface[1].selected)
					value="eth1";
				else if(document.Test_Form.TcpdumpInterface[2].selected)
					value="eth2";
				else if(document.Test_Form.TcpdumpInterface[3].selected)
					value="eth3";
				else if(document.Test_Form.TcpdumpInterface[4].selected)
					value="eth4";
				else if(document.Test_Form.TcpdumpInterface[5].selected)
					value="wlan2.4g";
				else if(document.Test_Form.TcpdumpInterface[6].selected)
					value="wlan5g";
				else if(document.Test_Form.TcpdumpInterface[7].selected)
					value="pon";
				
				interface=value;
				
				var cfg='/cgi-bin/'+serialnumber+'_'+interface+'.pcap';
				//var cfg='/cgi-bin/Tcpdump.cap';
			//foxconn cindy add to change tcpdump.cap into SN_interface.pcap
				var code = 'location.assign("' + cfg + '")';
				eval(code);
			}

			function DoRefresh() 
			{
				document.Test_Form.testFlag.value = 2;
				document.Test_Form.submit();
			}
				
			function doTest()
			{
				if(document.Test_Form.pingtest_type[0].checked)
				{
				    	value = document.Test_Form.IP.value;
			    		if(inValidIPAddr(value))
					{
			        		return false;
			        	}
				}    
				document.Test_Form.testFlag.value = 1;
				document.Test_Form.submit();
			}
			
			function doReload() 
			{
			    	if(document.Test_Form.pingtest_type[0].checked)
				{
					document.Test_Form.pingtest_type.value = "Yes";
				}
				else
				{
					document.Test_Form.pingtest_type.value = "No";
				}
				document.Test_Form.submit();
				return;
		    	}
			
			<% if tcWebApi_get("WebCustom_Entry","isTracertSupported","h") = "Yes" then %>	    
				function doTracertTest()
				{
				       setDisplay('WaitMsgTracert', 1);        
				   	document.Test_Form.testFlag.value = 1;
				   	document.Test_Form.tracert_enable.value = 1;
					document.Test_Form.submit();
					return ;
				}
				
				function RefeshForTracert()
				{
					var str1="Wait";
					var str2=document.Test_Form.tracert_result.value;
					if(str1 == str2)
					{
						setTimeout("RefeshForTracert()",5000);
						document.location.href="/cgi-bin/tools_test.asp";
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
			<FORM METHOD="POST" ACTION="/cgi-bin/tools_test.asp" name="Test_Form">
				<div id="pagestyle"><!--cindy add for border 11/28-->
					<div id="contenttype">   <!--gleaf-->
						<div id="block1">
							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
								<INPUT TYPE="HIDDEN" NAME="testFlag" VALUE="0">
								<tr height="25px" style="background-color:#e6e6e6;">
									<td width="20px">&nbsp;</td>
									<td colspan="2" align="left" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","TestDiagnosticText","s")%></td>
								</tr>
							</table>

							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
								<tr height="30px" style="display:none">
								    	<td width="20px">&nbsp;</td>
								    	<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>
								    		<td width="340px" align=left class="tabdata"><%tcWebApi_get("String_Entry","TestXPONWanText","s")%></td>
								     		<td align=left class="tabdata">
											<SELECT NAME="Test_PVC" SIZE="1" onChange="DoRefresh()"  style="width:80px;">
											<OPTION value="0" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "0" then asp_Write("selected") end if %>> 0
											<!--wang only use one wan port 20190927
											<OPTION value="1" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "1" then asp_Write("selected") end if %>> 1
											<OPTION value="2" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "2" then asp_Write("selected") end if %>> 2
											<OPTION value="3" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "3" then asp_Write("selected") end if %>> 3
											<!--wang
											<OPTION value="4" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "4" then asp_Write("selected") end if %>> 4
											<OPTION value="5" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "5" then asp_Write("selected") end if %>> 5
											<OPTION value="6" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "6" then asp_Write("selected") end if %>> 6
											<OPTION value="7" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "7" then asp_Write("selected") end if %>> 7
											-->	
									<%else%>
										<td width="340px" align=left class="tabdata"><%tcWebApi_get("String_Entry","TestCircuitText","s")%></td>
								     		<td align=left class="tabdata">
								     			<SELECT NAME="Test_PVC" SIZE="1" onChange="DoRefresh()"  style="width:80px;">
												<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") = "Yes" then%>
													<OPTION value="0" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC0Text","s")%>
													<!--wang only use one wan port 20190927
													<OPTION value="1" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC1Text","s")%>
													<OPTION value="2" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC2Text","s")%>
													<OPTION value="3" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC3Text","s")%>
													<!--wang
													<OPTION value="4" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC4Text","s")%>
													<OPTION value="5" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC5Text","s")%>
													<OPTION value="6" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC6Text","s")%>
													<OPTION value="7" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC7Text","s")%>
													-->
												<%else%>
													<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
														<OPTION value="0" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC0Text","s")%>
														<!--wang only use one wan port 20190927
														<OPTION value="1" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC1Text","s")%>
														<OPTION value="2" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC2Text","s")%>
														<OPTION value="3" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC3Text","s")%>
														<!--wang
														<OPTION value="4" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC4Text","s")%>
														<OPTION value="5" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC5Text","s")%>
														<OPTION value="6" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC6Text","s")%>
														<OPTION value="7" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","TestPVC7Text","s")%>
														-->
													<%end if%>
													
													<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
														<OPTION value="8" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "8" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC8Text","s")%>
													<%end if%>
													
													<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
														<OPTION value="10" <% if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") = "10" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC10Text","s")%>
													<%end if%>
												<%end if%>
									<%end if%>
											</SELECT>
										</td>
								</tr>

								<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
									<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
										<%if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "8" then%>
											<tr height="30px">
											    	<td width="20px">&nbsp;</td>
											    	<td width="340px" align=left class="tabdata"><%tcWebApi_get("String_Entry","TestServiceText","s")%></td>
											     	<td align=left class="tabdata">
											     		<SELECT NAME="Test_PVC_Ext" SIZE="1" onChange="DoRefresh()"  style="width:80px;">
														<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "0" then asp_Write("selected") end if %>>0
														<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "1" then asp_Write("selected") end if %>>1
														<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "2" then asp_Write("selected") end if %>>2
														<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "3" then asp_Write("selected") end if %>>3
														<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "4" then asp_Write("selected") end if %>>4
														<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "5" then asp_Write("selected") end if %>>5
														<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "6" then asp_Write("selected") end if %>>6
														<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "7" then asp_Write("selected") end if %>>7
													</SELECT>
												</td>
											</tr>
										<%end if%>
									<%end if%>
								<%end if%>

								<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
									<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
										<%if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "10" then%>
											<tr height="30px">
											    	<td width="20px">&nbsp;</td>
											    	<td width="340px" align=left class="tabdata"><%tcWebApi_get("String_Entry","TestServiceText","s")%></td>
											     	<td align=left class="tabdata">
											     		<SELECT NAME="Test_PVC_Ext" SIZE="1" onChange="DoRefresh()"  style="width:80px;">
														<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "0" then asp_Write("selected") end if %>>0
														<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "1" then asp_Write("selected") end if %>>1
														<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "2" then asp_Write("selected") end if %>>2
														<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "3" then asp_Write("selected") end if %>>3
														<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "4" then asp_Write("selected") end if %>>4
														<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "5" then asp_Write("selected") end if %>>5
														<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "6" then asp_Write("selected") end if %>>6
														<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","diag_pvc_ext","h") = "7" then asp_Write("selected") end if %>>7
													</SELECT>
												</td>
											</tr>
										<%end if%>
									<%end if%>
								<%end if%>	

								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestconnectionText","s")%></td>
								     	<td align=left class="tabdata">
								     		<script language="JavaScript" type="text/JavaScript">
											var strlanconn = "<%TCWebApi_get("Diagnostic_PVC","EtherLanConn","s")%>";
											if(strlanconn == "Fail")
												document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
											else if(strlanconn == "PASS")
												document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
											else if(strlanconn == "Skipped")
												document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
											else
												document.writeln('<font face="Arial" color="green"><strong>' +strlanconn+ '</strong></font>');
										</script>
									</td>
								</tr>
													
								<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>
									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestPonMacText","s")%></td>
									     	<td align=left class="tabdata">
									     		<script language="JavaScript" type="text/JavaScript">
												var xponLinkStatus = "<%TCWebApi_get("Diagnostic_PVC","xPONLinkSta","s")%>";
												if(xponLinkStatus == "Fail")
													document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
												else if(xponLinkStatus == "PASS")
													document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
												else if(xponLinkStatus == "Skipped")
													document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
												else
													document.writeln('<font face="Arial" color="green"><strong>' +xponLinkStatus+ '</strong></font>');
											</script>
										</td>
									</tr>

									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestPonAppText","s")%></td>
									     	<td align=left class="tabdata">
									     		<script language="JavaScript" type="text/JavaScript">
												var xPONAppLinkStatus = "<%TCWebApi_get("Diagnostic_PVC","xPONAppLinkSta","s")%>";
												if(xPONAppLinkStatus == "Fail")
													document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
												else if(xPONAppLinkStatus == "PASS")
													document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
												else if(xPONAppLinkStatus == "Skipped")
													document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
												else
													document.writeln('<font face="Arial" color="green"><strong>' +xPONAppLinkStatus+ '</strong></font>');
											</script>
										</td>
									</tr>
								<%else%>
									<%if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") <> "10" then%>
										<tr height="30px">
										    	<td width="20px">&nbsp;</td>
										    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestSynchronizationText","s")%></td>
										     	<td align=left class="tabdata">
										     		<script language="JavaScript" type="text/JavaScript">
													var stradslsyn = "<%TCWebApi_get("Diagnostic_PVC","ADSLSyn","s")%>";
													if(stradslsyn == "Fail")
														document.writeln('<div align=center><font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font></div>');
													else if(stradslsyn == "PASS")
														document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
													else if(stradslsyn == "Skipped")
														document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
													else
														document.writeln('<font face="Arial" color="green"><strong>' +stradslsyn+ '</strong></font>');
												</script>
											</td>
										</tr>							
										
										<%if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") <> "8" then%>
											<%if tcWebApi_get("WebCurSet_Entry","diag_pvc","h") <> "9" then%>
												<tr height="30px">
												    	<td width="20px">&nbsp;</td>
												    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestpingText","s")%></td>
												     	<td align=left class="tabdata">
												     		<script language="JavaScript" type="text/JavaScript">
															var stratmoa = "<%TCWebApi_get("Diagnostic_PVC","ATMOAMSeg","s")%>";
															if(stratmoa == "Fail")
																document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
															else if(stratmoa == "PASS")
																document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
															else if(stratmoa == "Skipped")
																document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
															else
																document.writeln('<font face="Arial" color="green"><strong>' +stratmoa+ '</strong></font>');
														</script>
													</td>
												</tr>

												<tr height="30px">
												    	<td width="20px">&nbsp;</td>
												    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestendpingText","s")%></td>
												     	<td align=left class="tabdata">
												     		<script language="JavaScript" type="text/JavaScript">
															var stratmoaend = "<%TCWebApi_get("Diagnostic_PVC","ATMOAMEnd2End","s")%>";
															if(stratmoaend == "Fail")
																document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
															else if(stratmoaend == "PASS")
																document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
															else if(stratmoaend == "Skipped")
																document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
															else
																document.writeln('<font face="Arial" color="green"><strong>' +stratmoaend+ '</strong></font>');
														</script>
													</td>
												</tr>																						
											<%end if%>
										<%end if%>
									<%end if%>
								<%end if%>

								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestendPingDNS0Text","s")%>
										<%If tcWebApi_get("Dproxy_Entry","type","h") = "1" Then tcWebApi_get("Dproxy_Entry","Primary_DNS","s") 
										else tcWebApi_get("DeviceInfo_PVC","DNSIP","s") end if%>  ) 
								    	</td>
								     	<td align=left class="tabdata">
								     		<script language="JavaScript" type="text/JavaScript">
											var strpingdns = "<%TCWebApi_get("Diagnostic_PVC","PingPriDNS","s")%>";
											if(strpingdns == "Fail")
												document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
											else if(strpingdns == "PASS")
												document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
											else if(strpingdns == "Skipped")
												document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
											else
												document.writeln('<font face="Arial" color="green"><strong>' +strpingdns+ '</strong></font>');
										</script>
									</td>
								</tr>

								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestendPingyahooText","s")%></td>
								     	<td align=left class="tabdata">
								     		<script language="JavaScript" type="text/JavaScript">
											var strpingyahoo = "<%TCWebApi_get("Diagnostic_PVC","PingYahoo","s")%>";
											if(strpingyahoo == "Fail")
												document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
											else if(strpingyahoo == "PASS")
												document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
											else if(strpingyahoo == "Skipped")
												document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
											else
												document.writeln('<font face="Arial" color="green"><strong>' +strpingyahoo+ '</strong></font>');
										</script>
									</td>
								</tr>

								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="340px" align=left class="tabdata">&gt;&gt;<%tcWebApi_get("String_Entry","TestendPingotherText","s")%> 
										<INPUT TYPE="RADIO" NAME="pingtest_type" VALUE="Yes" <% if tcWebApi_get("Diagnostic_PVC","PingOtherType","h") = "Yes" then asp_Write("checked")end if %> onClick="doReload()">  
										<%tcWebApi_get("String_Entry","TestendPingother0Text","s")%> 
										
										<INPUT TYPE="RADIO" NAME="pingtest_type" VALUE="No"  <% if tcWebApi_get("Diagnostic_PVC","PingOtherType","h") = "No" then asp_Write("checked") elseif tcWebApi_get("Diagnostic_PVC","PingOtherType","h") = "N/A" then asp_Write("checked") end if %> onClick="doReload()">  
										<%tcWebApi_get("String_Entry","TestendPingother1Text","s")%> 
								    	</td>
								     	<td align=left class="tabdata">
								     		<script language="JavaScript" type="text/JavaScript">
											var strpingother = "<%TCWebApi_get("Diagnostic_PVC","PingOther","s")%>";
											if(strpingother == "Fail")
												document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
											else if(strpingother == "PASS")
												document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn0Text","s")%></strong></font>');
											else if(strpingother == "Skipped")
												document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
											else
												document.writeln('<font face="Arial" color="green"><strong>' +strpingother+ '</strong></font>');
										</script>
									</td>
								</tr>
								
								<% If tcWebApi_get("Diagnostic_PVC","PingOtherType","h") = "Yes" Then%>
									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td colspan="2" align=left class="tabdata">								    		
									    		<textarea name="ping_cmd" rows="7" readonly="readonly"  style="width:314px;background-color:#000000;font-size:15px;color: <%If tcWebApi_get("Diagnostic_PVC","PingOther","h") = "Fail" Then asp_Write("red;") else asp_Write("white;") end if%>"><%tcWebApi_get("Diagnostic_PVC","PingDetail","s")%></textarea>
									    	</td>
									</tr>

									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="314px" height="30px" class="tabdata" align=left>
						    					<input TYPE="TEXT" style="border:none;width:155px;font-size:13px" value="<%tcWebApi_get("String_Entry","TestIPText","s")%>">
						    					<input style="width:120px;font-size:13px;margin-left:35px" TYPE="TEXT" NAME="IP" SIZE="15" MAXLENGTH="15" VALUE="<%tcWebApi_get("Diagnostic_PVC","PingOtherIPaddr","s")%>" >
						    				</td>
						    				<td></td>
									</tr>	
								<% End If %>
							</table>

							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
								<tr height="25px">
									<td width="20px">&nbsp;</td>
									<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","DiagnosticTestText","s")%></td>
								</tr>
							</table>

							<table width="640px" border="0"  cellpadding="0" cellspacing="0" class="tabdata">
								<% if tcWebApi_get("WebCustom_Entry","isTracertSupported","h") = "Yes" then %>							
									<tr height="30px">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align=left class="tabdata">
											<INPUT TYPE="SUBMIT" NAME="TestBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonStartText","s")%>" onClick="doTest();">
										</td>								
									</tr>
								<%else%>
									<tr height="30px">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align=left class="tabdata">
											<INPUT TYPE="SUBMIT" NAME="TestBtn" class="button1"  VALUE="<%tcWebApi_get("String_Entry","ButtonStartText","s")%>" onClick="doTest();">
										</td>								
									</tr>

									<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
										<tr>
											<td align=center colSpan=3><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%> </td>
										</tr>
									<%end if%>
								<%end if%>	
							</table>
						</div>
						
						<% if tcWebApi_get("WebCustom_Entry","isTracertSupported","h") = "Yes" then %>
							<div id="block1">
								<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
									<tr height="25px" style="background-color:#e6e6e6;">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","TestTracertText","s")%></td>
									</tr>
								</table>

								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
									<% if tcWebApi_get("Diagnostic_PVC","TracertResult","h") = "Wait" then %>
										<tr height="30px">
										    	<td width="20px">&nbsp;</td>
										    	<td width="250px" align=left class="tabdata">
										    		<DIV id="WaitMsgTracert"><font color="#FF0000" size="-1"> <%tcWebApi_get("String_Entry","TestWaitTracertText","s")%></font></DIV>
												<script language="JavaScript" type="text/JavaScript">
													setDisplay('WaitMsgTracert', 1);												
												</script>
										    	</td>
										</tr>
									<%else%>
										<tr height="30px" style="display:none">
										    	<td width="20px">&nbsp;</td>
										    	<td width="250px" colspan="2" align=left class="tabdata">
										    		<DIV id="WaitMsgTracert"><font color="#FF0000" size="-1"> <%tcWebApi_get("String_Entry","TestWaitTracertText","s")%></font></DIV>
												<script language="JavaScript" type="text/JavaScript">
													setDisplay('WaitMsgTracert', 0);												
												</script>
										    	</td>
										</tr>
									<%end if%>

									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","TestDestAddrText","s")%></td>
									     	<td align=left class="tabdata" color="#F36F22">
									     		<INPUT TYPE="TEXT" NAME="tracert_destaddr" SIZE="30" MAXLENGTH="60" VALUE="<%If TCWebApi_get("Diagnostic_PVC","TracertIPaddr","h")  <> "N/A" then TCWebApi_get("Diagnostic_PVC","TracertIPaddr","s") else asp_Write("") end if%>" >

									     		<script language="JavaScript" type="text/JavaScript">
												var strTracertResult = "<%TCWebApi_get("Diagnostic_PVC","TracertResult","s")%>";
												if(strTracertResult == "Fail")
													document.writeln('<font face="Arial" color="red"><strong><%tcWebApi_get("String_Entry","EtherLanConn1Text","s")%></strong></font>');
												else	if(strTracertResult == "Skipped")
													document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn2Text","s")%></strong></font>');
												else	if(strTracertResult == "Wait")
													document.writeln('<font face="Arial" color="green"><strong><%tcWebApi_get("String_Entry","EtherLanConn3Text","s")%></strong></font>');
											</script>
										</td>
									</tr>
			
									<% if tcWebApi_get("Diagnostic_PVC","TracertResult","h") = "PASS" then %>
										<tr height="30px">
										    	<td width="20px">&nbsp;</td>
										    	<td colspan="2" align=left class="tabdata">
										    		<script language="JavaScript" type="text/JavaScript">
													document.writeln("<iframe src='/cgi-bin/getTracentResult.cgi' frameborder='0' width='500' ></iframe>" );
												</script>
										    	</td>
										</tr>
									<%end if%>
									
									<INPUT TYPE="HIDDEN" NAME="PingorTracertDNS" VALUE="0">	
									<INPUT TYPE="HIDDEN" NAME="tracert_enable" VALUE="0">
									<INPUT TYPE="HIDDEN" NAME="tracert_result" VALUE="<%TCWebApi_get("Diagnostic_PVC","TracertResult","s")%>">
								</table>

								<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
									<tr height="25px">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","TraceRouteTestText","s")%></td>
									</tr>
								</table>

								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
									<tr height="30px">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align=left class="tabdata">
											<INPUT TYPE="BUTTON" NAME="TestTracertBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonStartText","s")%>" onClick="doTracertTest();">
										</td>								
									</tr>
								</table>
							</div>
						<%end if%>

						<div id="block1">
							<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
								<tr height="25px" style="background-color:#e6e6e6;">
									<td width="20px">&nbsp;</td>
									<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","NavigationTcpDumpText","s")%></td>
								</tr>
							</table>

							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","StatisticsInterfaceText","s")%></td>
								     	<td align=left class="tabdata">
								     		<SELECT NAME="TcpdumpInterface" SIZE="1" >
											<OPTION value="br0" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "br0" then asp_Write("selected") end if %> >All
											<OPTION value="eth0.1" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "eth0.1" then asp_Write("selected") end if %> >Ethernet1
											<OPTION value="eth0.2" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "eth0.2" then asp_Write("selected") end if %> >Ethernet2
											<OPTION value="eth0.3" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "eth0.3" then asp_Write("selected") end if %>  >Ethernet3
											<OPTION value="eth0.4" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "eth0.4" then asp_Write("selected") end if %>  >Ethernet4
											<OPTION value="ra0" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "ra0" then asp_Write("selected") end if %>  >WLAN 2.4G
											<OPTION value="rai0" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "rai0" then asp_Write("selected") end if %> >WLAN 5G
											<OPTION value="pon" <% if tcWebApi_get("Tcpdump_Pcap","TcpdumpInterface","h") = "pon" then asp_Write("selected") end if %>  >PON
										</SELECT>
									</td>
								</tr>

								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","NavigationTcpDumpMaxPcapText","s")%></td>
								     	<td align=left class="tabdata">
								     		<INPUT TYPE="TEXT" NAME="TcpdumpPcapNum" SIZE="9" MAXLENGTH="4" VALUE="<%If tcWebApi_get("Tcpdump_Pcap","TcpdumpPcapNum","h") <> "N/A" then tcWebApi_get("Tcpdump_Pcap","TcpdumpPcapNum","s") end if%>" >
										<%tcWebApi_get("String_Entry","NavigationTcpDumpNoteText","s")%>
									</td>
								</tr>
							</table>
							
							<!--Foxconn alan add start for FPT test read tcpdump status (20171021-10.25)  -->
							<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="table-layout: fixed;">
								<tr height="30px">
								     	<td align=left class="tabdata">
	 									<div id="tcpdumpstatus"></div>	 								
										<script language=JavaScript>
											setInterval(loadDoc, 1000);
											//setTimeout(loadDoc,500);
											function loadDoc() 
											{
		  										var xmlhttp;
												if (window.XMLHttpRequest) 
												{
													// code for IE7+, Firefox, Chrome, Opera, Safari
			 										 xmlhttp=new XMLHttpRequest();
			 									}
												else
												{
													// code for IE6, IE5
			 										xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			  									}
								
		  										xmlhttp.onreadystatechange = function() 
												{
		   							 				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) 
													{
		      												document.getElementById("tcpdumpstatus").innerHTML =xmlhttp.responseText;
		    											}
		  										};
		  										xmlhttp.open("GET", "/cgi-bin/tcpdump_status.asp", true);
												xmlhttp.setRequestHeader('If-Modified-Since', '0');
		  										xmlhttp.send();
											}
										</script>
									</td>
								</tr>
							</table>
							<!-- Foxconn alan add end -->
						</div>
						
						<div id="button0">
							<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="table-layout: fixed; margin:5px 0px;">
								<tr height="25px">
									<td width="20px">&nbsp;</td>
									<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","TcpDumpTestText","s")%></td>
								</tr>
							</table>

							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
								<tr height="30px">
									<td width="20px">&nbsp;</td>
									<td width="250px" align=left>
										<INPUT TYPE="SUBMIT" NAME="TcpStart" class="button1" VALUE="<%tcWebApi_get("String_Entry","NavigationTcpDumpstartText","s")%>" onClick='start_tcpdump_settings()'>
										<INPUT TYPE="HIDDEN" NAME="TcpdumpStart" VALUE="Start">
										<INPUT TYPE="HIDDEN" NAME="Tcpdump_flag" VALUE="0">
										<INPUT TYPE="BUTTON"  class="button1" VALUE="<%tcWebApi_get("String_Entry","NavigationTcpDumpBackupText","s")%>" onClick='backup_tcpdump_settings()'>
									</td>
									<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
									<td >&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>   <!--gleaf-->
				</div><!--cindy add for border 11/28-->

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
			</form>
		</body>
</html>
