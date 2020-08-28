<%
	tcWebApi_unset("Wan_PVC")
	tcWebApi_set("Wan_PVC","ISP","TypeFlag")
	tcWebApi_set("Wan_PVC","Active","wan_VCStatus")
	
	if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then
		tcWebApi_set("Wan_PVC","QOS","ATM_QoS")
		tcWebApi_set("Wan_PVC","PCR","ATM_PCR")
		tcWebApi_set("Wan_PVC","SCR","ATM_SCR")
		tcWebApi_set("Wan_PVC","MBS","ATM_MBS")
	end if

	tcWebApi_set("Wan_PVC","NATENABLE","wan_NAT")
	tcWebApi_set("Wan_PVC","DEFAULTROUTE","wan_DefaultRoute")
	tcWebApi_set("Wan_PVC","MTU","wan_TCPMTU")
	tcWebApi_set("Wan_PVC","RIPVERSION","wan_RIP")
	tcWebApi_set("Wan_PVC","DIRECTION","wan_RIP_Dir")
	tcWebApi_set("Wan_PVC","IGMP","wan_IGMP")
	tcWebApi_set("Wan_PVC","IPVERSION","wan_IPVERSION")

	If Request_Form("TypeFlag")= "0" Then
		if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then
			tcWebApi_set("Wan_PVC","VPI","wzDHCP_VPI")
			tcWebApi_set("Wan_PVC","VCI","wzDHCP_VCI")
			tcWebApi_set("Wan_PVC","ENCAP","uiViewEncaps")
		end if
	End If

	If Request_Form("TypeFlag")= "1" Then
		if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then
			tcWebApi_set("Wan_PVC","VPI","wzDHCP_VPI")
			tcWebApi_set("Wan_PVC","VCI","wzDHCP_VCI")
			tcWebApi_set("Wan_PVC","ENCAP","uiViewEncaps")
		end if
	 	tcWebApi_set("Wan_PVC","IPADDR","wzStatic_IPaddr")
		tcWebApi_set("Wan_PVC","NETMASK","wzStatic_SubMask")
		tcWebApi_set("Wan_PVC","GATEWAY","wzStatic_GatewayAdd")
		tcWebApi_set("Wan_PVC","ENCAP","uiViewEncaps")
	End If

	If Request_Form("TypeFlag")= "2" Then
		tcWebApi_set("Lan_Dhcp","type","enableLanDHCP")
		tcWebApi_set("Wan_PVC","USERNAME","uiViewUserNameMark")
		tcWebApi_set("Wan_PVC","PASSWORD","uiViewPasswordMark")
		
		if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then
			tcWebApi_set("Wan_PVC","VPI","wzDHCP_VPI")
			tcWebApi_set("Wan_PVC","VCI","wzDHCP_VCI")
			tcWebApi_set("Wan_PVC","ENCAP","uiViewEncaps")
		end if
		
		if tcWebApi_get("WebCustom_Entry","isISPWizard","h") = "Yes" then
			If Request_Form("WAN_MTU_SAVE")= "11" Then
				tcWebApi_set("Wan_PVC","MTU","pppmtu")
			end if
		end if
		
		tcWebApi_set("Wan_PVC","CONNECTION","wan_ConnectSelect")
		tcWebApi_set("Wan_PVC","CLOSEIFIDLE","wan_IdleTimeT")
		tcWebApi_set("Wan_PVC","MSS","wan_TCPMSS")
		tcWebApi_set("Wan_PVC","PPPGETIP","wan_PPPGetIP")
		tcWebApi_set("Wan_PVC","IPADDR","wan_StaticIPaddr")
		tcWebApi_set("Wan_PVC","NETMASK","wan_StaticIPSubMask")
		tcWebApi_set("Wan_PVC","GATEWAY","wan_StaticIpGateway")
	End If

	If Request_Form("TypeFlag")= "3" Then
		tcWebApi_set("Lan_Dhcp","type","disLanDHCP")
		if tcWebApi_get("Wan_Common","TransMode","h") = "ATM" then
			tcWebApi_set("Wan_PVC","VPI","wzDHCP_VPI")
			tcWebApi_set("Wan_PVC","VCI","wzDHCP_VCI")
			tcWebApi_set("Wan_PVC","ENCAP","uiViewEncaps")
		end if
	End If

	If tcWebApi_get("Info_Ether","isIPv6Supported","h") = "Yes" Then 
		tcWebApi_set("Wan_PVC","IPADDR6","wan_IPv6Addr")			
		tcWebApi_set("Wan_PVC","PREFIX6","wan_IPv6Prefix")
		tcWebApi_set("Wan_PVC","DEFGATEWAY6","wan_IPv6DefGw")
		tcWebApi_set("Wan_PVC","MLDproxy","wan_MLD1")	
		
		If Request_Form("TypeFlag")= "2" Then
			tcWebApi_set("Wan_PVC","PPPv6Mode","PPPDHCPv6Mode_Flag")
		End If
		
		tcWebApi_set("Wan_PVC","PPPv6PD","PPPIPv6PDRadio2")
		
		If Request_Form("TypeFlag")= "0" Then
			tcWebApi_set("Wan_PVC","EnableDynIPv6","DynIPv6EnableRadio")
		End If
	End if
	
	tcWebApi_set("Wan_PVC","dot1q","wan_dot1q")
	
	if tcWebApi_get("WebCustom_Entry", "isWiz8021qSupported", "h") = "Yes" then
		tcWebApi_set("Wan_PVC","VLANID","wan_vid")
		
		if tcWebApi_get("WebCustom_Entry","isdot1pSupport","h") = "Yes" then
			tcWebApi_set("Wan_PVC","DOT1PREMARK","wan_dot1pRemark")
			tcWebApi_set("Wan_PVC","DOT1P","wan_dot1p")
		end if
	end if
	
	tcWebApi_set("Wan_PVC","BridgeInterface","wan_BridgeInterface1")
	tcWebApi_set("Wan_PVC","AUTHEN", "PPPAuthen")
	tcWebApi_set("Wan_PVC","RIPVERSION","wan_RIP1")
	tcWebApi_set("Wan_PVC","DIRECTION","wan_RIP_Dir1")
	tcWebApi_set("Wan_PVC","IGMPproxy","wan_IGMP1")
	
	if tcWebApi_get("WebCustom_Entry","isC1HGUSupported","h") = "Yes" then	
		tcWebApi_set("Wan_PVC","ENCAP","hidEncap")
	end if
%>

<html>
	<head>
		<title></title>
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="/style.css" type="text/css">
		<script type='text/javascript' src="/jsl.js"></script>
		<style type="text/css"></style>
		<script>
			function ExitWizard()
			{
			    	if (confirm("<% tcWebApi_get("String_Entry","LoginFailJS0Text","s") %>")) 
			    	{
					window.parent.close();
				}
			}

			function uiSave() 
			{
				document.wzCompleteform.submit();
			}
		</script>
	</head>

	<body topmargin="10" leftmargin="0">
		<form name="wzCompleteform" method="post" ACTION="/cgi-bin/wizardclose.asp">
			<table width="500" border="0" align="center" cellpadding="0" cellspacing="0">
			  	<tr>
			    		<td width="500" height="5" valign="baseline" class="orange"></td>
			  	</tr>
			</table>

			<table border="0" width="500" align="center" cellspacing="0" cellpadding="0">
			  	<tr>
			    		<td width="200" height="50" align="center" valign="middle" bgcolor="#FFFFFF"><div align="left"><img src="/logo.png" width="160" height="100"></div></td>
			    		<td width="300" height="50" align="right" valign="bottom" bgcolor="#FFFFFF" class="model">
				   		<%If tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" Then%>
				   			<%tcWebApi_get("String_Entry","XponInfoText","s")%>
				   		<%Else%>
				  			<%tcWebApi_get("String_Entry","AdslInfoText","s")%>
				   		<%End If%>
					</td>
			  	</tr>
			  	
			  	<tr>
			    		<td width="500" colspan="2" class="orange"> </td>
			  	</tr>
			</table>

			<table width="500" height="2" border="0" align="center" cellpadding="0" cellspacing="0" class="orange">
			  	<tr>
			    		<td class="orange"> </td>
			  	</tr>
			</table>

			<table width="500" height="35" border="0" align="center" cellpadding="0" cellspacing="0" color="#FF9933">
			  	<tr>
			    		<td width="500" bgcolor="#FFFFFF" class="headline"><div align="left">&nbsp;    
			    			<%tcWebApi_get("String_Entry","WizardCompleteText","s")%>    
			    		</td>
			  	</tr>
			</table>

			<table width="500" border="0" align="center" cellpadding="2" cellspacing="0" bgcolor="#FFFFFF">
			  	<tr>
			    		<td width="40">&nbsp;</td>
			    		<td colspan="2" class="tabdata">        
			        		<%tcWebApi_get("String_Entry","WizardComQueryInfoText","s")%>               
			        		<input type="hidden" name="wzExitFlag">			        
			    		</td>
			  	</tr>

			  	<!--<tr>
				    	<td></td>
				    	<td></td>
				    	<td></td>
			  	</tr>
			  	
			  	<tr>
			    		<td width="40">&nbsp;</td>
			    		<td width="150" class="tabdata" align="right">&nbsp;</td>
			    		<td width="310" class="tabdata" align="left">&nbsp;</td>
			  	</tr>
			  	
			  	<tr>
				    	<td width="40">&nbsp;</td>
				    	<td width="150" class="tabdata" align="right">&nbsp;</td>
				    	<td class="tabdata" align="left">&nbsp;</td>
				</tr>
				
				<tr>
				    	<td height="25"></td>
				</tr>-->
			</table>

			<table width="500" height="40" border="0" align="center" cellpadding="0" cellspacing="0" class="orange">
				<tr>
				    	<td class="tabdata" >
				        	<div id="button0" align="right" style="width:500px">
				          		<input name="BackBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonBackText","s") %>" onClick="javascript:history.go(<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%><%If Request_Form("TypeFlag")= "0" Then%>-2<%else%>-1<%end if%><%else%>-1<%end if%>);">    <!--gleaf modified-->
				          		<!--<input name="BackBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonBackText","s") %>" onClick="javascript:history.go(<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%><%If Request_Form("TypeFlag")= "0" Then%>-2<%elseif Request_Form("TypeFlag")= "3" Then%>-2<%else%>-1<%end if%><%else%>-1<%end if%>);">-->

				        	  	<input name="NextBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonNextText","s") %>" onClick="uiSave()">
					  		<input name="ExitBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonExitText","s") %>" onClick="ExitWizard()">
				        	</div>
				        </td>
				</tr>
			</table>
		</form>
	</body>
</html>        
