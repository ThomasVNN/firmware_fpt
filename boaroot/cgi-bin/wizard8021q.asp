<%
	if request_Form("wanVCFlag") = "1" then
		tcWebApi_set("WebCurSet_Entry","wan_pvc","wan_VC")
	else
		tcWebApi_set("Timezone_Entry","TZ","uiViewdateTZ")
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
		<script language="JavaScript" src="/wanfunc.js"></script>
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
				if((document.wz8021qform.wan_8021q.value == 1) && (document.wz8021qform.disp_wan_8021q.value==1))
				{
					document.wz8021qform.wan8021qFlag.value=1;
				}
				
				//wang add start, check the range of vlanID.
				if(document.wz8021qform.wan_dot1q[0].checked)
				{
					var value = document.wz8021qform.wan_vid.value;
				
					if(!isNumeric(value))
					{
						alert("<%tcWebApi_get("String_Entry","WANJS6Text","s")%>");
						return -1;			
					}

					if(parseInt(value) > 4095  || parseInt(value) < 0)
					{
						alert("<%tcWebApi_get("String_Entry","WANJS6Text","s")%>");
						return -1;
					}
				}
				
				document.wz8021qform.action = "/cgi-bin/wizardConType.asp"
			  	document.wz8021qform.submit();
			}

			function doVCChange() 
			{
				document.wz8021qform.wanVCFlag.value = 1;
				document.wz8021qform.submit();
				return;
			}

			function doLoad()
			{
				<% if tcWebApi_get("WebCustom_Entry", "isdot1pSupport", "h") = "Yes" then %>			
					wan8021PCheck();
				<%end if%>	
				
				wan8021QCheck();
			}

			function wan8021QCheck() 
			{
				var form=document.wz8021qform;
				
				if((form.wan_8021q.value == 1) && (form.disp_wan_8021q.value==1))
				{
					if(!form.wan_dot1q[0].checked)
					{
						wanVidOper(0);//disabled vlan id controls
					}
				}
			}

			function wanVidOper(onOff)
			{
				var value;

				if(onOff != 1)
					value = true;
				else
					value = false;

				document.wz8021qform.wan_vid.disabled=value;
				
				if (document.wz8021qform.isdot1pSupport.value == "Yes") 
				{
					document.wz8021qform.wan_dot1pRemark.disabled=value;		
					if ((value == false) && (document.wz8021qform.wan_dot1pRemark.selectedIndex == 0))
						document.wz8021qform.wan_dot1p.disabled=false;
					else
						document.wz8021qform.wan_dot1p.disabled=true;
				}
			}

			function wan8021PCheck()
			{
				var value;
					 		
				if(document.wz8021qform.wan_dot1pRemark.selectedIndex==1)
					value = true;
				else
					value = false;
				
				if (document.wz8021qform.isdot1pSupport.value == "Yes")
					document.wz8021qform.wan_dot1p.disabled=value;			
			}
		</script>
	</head>

	<body topmargin="10" onload="doLoad();" leftmargin="0">
		<form name="wz8021qform" method="post">
			<INPUT TYPE="HIDDEN" NAME="wanVCFlag" VALUE="0">
			<INPUT TYPE="HIDDEN" NAME="wan8021qFlag" VALUE="0">
			<INPUT TYPE="HIDDEN" NAME="isdot1pSupport" VALUE="<%tcWebApi_get("WebCustom_Entry","isdot1pSupport","s")%>">
			<INPUT type="HIDDEN" NAME="wan_8021q" value="<% if tcWebApi_get("Info_dot1q","wan_8021q","h") = "1" then asp_write("1") else asp_write("0") end if %>" >
			<INPUT type="HIDDEN" NAME="disp_wan_8021q" value="<% if tcWebApi_get("Info_dot1q","disp_wan_8021q","h") = "1" then asp_write("1") else asp_write("0") end if %>" >
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
				  			<% tcWebApi_get("String_Entry","XponInfoText","s") %>
				  		<%Else%>
				  			<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then tcWebApi_get("String_Entry","AdslVdslInfoText","s")%>/<%end if tcWebApi_get("String_Entry","AdslInfoText","s")%>
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
			    		<td width="500" bgcolor="#FFFFFF" class="headline">&nbsp; 
						<% tcWebApi_get("String_Entry","HelpIndexQuickText","s") %> - <% tcWebApi_get("String_Entry","Wizard8021qText","s") %> 			    
			    		</td>
			  	</tr>
			</table>

			<table width="500" border="0" align="center" cellpadding="2" cellspacing="0" bgcolor="#FFFFFF">
			  	<tr>
			    		<td width="40">&#12288;</td>
			    		<td colspan="2" class="tabdata">
						<% tcWebApi_get("String_Entry","Wizard8021qInfoText","s") %>
			      			<input type="hidden" name="wzExitFlag">  
			    		</td>
			  	</tr>

			  	<tr>
			    		<td></td>
			    		<td></td>
			    		<td></td>
			  	</tr>

			  	<tr style="display:none">
			    		<td width="40" height="40">&#12288;</td>
			    		<td width="150" class="tabdata" align="left"><div align=left><font color="#000000"><B><%tcWebApi_get("String_Entry","WANWANText","s")%></B></font></div></td>
					<td class="tabdata" align=left>
						<SELECT NAME="wan_VC" SIZE="1" onChange="doVCChange()">
							<OPTION value="0" <% if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "0" then asp_Write("selected")
								elseif tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "8" then asp_Write("selected")
								elseif tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "9" then asp_Write("selected")
								elseif tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "10" then asp_Write("selected")
								end if %>>0
								
								<!--wang only use one wan port 20190927
								<OPTION value="1" <% if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "1" then asp_Write("selected") end if %>>1
								<OPTION value="2" <% if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "2" then asp_Write("selected") end if %>>2
								<OPTION value="3" <% if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "3" then asp_Write("selected") end if %>>3
								<!--wang
								<OPTION value="4" <% if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "4" then asp_Write("selected") end if %>>4
								<OPTION value="5" <% if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "5" then asp_Write("selected") end if %>>5
								<OPTION value="6" <% if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "6" then asp_Write("selected") end if %>>6
								<OPTION value="7" <% if tcWebApi_get("WebCurSet_Entry","wan_pvc","h") = "7" then asp_Write("selected") end if %>>7
								-->
						</SELECT>
					</td>
			  	</tr>
			  
			  	<tr>
			    		<td width="40" height="40">&#12288;</td>
			    		<td width="150" class="tabdata" align="left"><div align=left><font color="#000000"><B><%tcWebApi_get("String_Entry","WAN8021qText","s")%></B></font></div></td>
					<td class="tabdata" align=left>
						<INPUT value="Yes" type=radio name=wan_dot1q onclick="wanVidOper(1)" <% if tcWebApi_get("Wan_PVC","dot1q","h") = "Yes" then asp_Write("checked")end if %> ><FONT color=#000000><%tcWebApi_get("String_Entry","WAN8021q3Text","s")%></FONT>
						<INPUT value="No" type=radio name=wan_dot1q onclick="wanVidOper(0)" <% if tcWebApi_get("Wan_PVC","dot1q","h") = "No" then asp_Write("checked")end if if tcWebApi_get("Wan_PVC","dot1q","h") = "N/A" then asp_Write("checked") end if  %> ><FONT color=#000000><%tcWebApi_get("String_Entry","WAN8021q4Text","s")%></FONT>
					</td>
			  	</tr>
			  
			  	<tr>
			    		<td width="40" height="40">&#12288;</td>
			    		<td width="150" class="tabdata" align="left"><div align=left><font color="#000000"><B><%tcWebApi_get("String_Entry","WANVLANIDText","s")%></B></font></div></td>
					<td class="tabdata" align=left>
						<INPUT maxLength=5 size=5 name="wan_vid" VALUE="<%if tcWebApi_get("Wan_PVC","VLANID","h") <> "N/A" then tcWebApi_get("Wan_PVC","VLANID","s") else asp_Write("0") end if%>" ><FONT color=#000000><%tcWebApi_get("String_Entry","WANVLANIDrangeText","s")%></FONT>
					</td>
			  	</tr>
  
			  	<% if tcWebApi_get("WebCustom_Entry", "isdot1pSupport", "h") = "Yes" then %>
			  		<tr>
			    			<td width="40" height="40">&#12288;</td>
			    			<td width="150" class="tabdata" align="left"><div align=left><font color="#000000"><B><%tcWebApi_get("String_Entry","WAN8021pText","s")%></B></font></div></td>
						<td class="tabdata" align=left>
							<SELECT NAME="wan_dot1pRemark" SIZE="1" onChange="wan8021PCheck()" >
								<option value="Remark"  <% if tcWebApi_get("Wan_PVC","DOT1PREMARK","h") = "Remark" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WAN8021pRemark0Text","s")%>
								<option value="Transparent"  <% if tcWebApi_get("Wan_PVC","DOT1PREMARK","h") = "Transparent" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WAN8021pRemark1Text","s")%>
							</SELECT>
							<INPUT maxLength=2 size=2 name="wan_dot1p" VALUE="<%if tcWebApi_get("Wan_PVC","DOT1P","h") <> "N/A" then tcWebApi_get("Wan_PVC","DOT1P","s") else asp_Write("0") end if%>" ><FONT color=#000000><%tcWebApi_get("String_Entry","WAN8021prangeText","s")%></FONT></TD>
						</td>
			  		</tr>
			  	<%end if%>
			</table>

			<table width="500" height="40" border="0" align="center" cellpadding="0" cellspacing="0" class="orange">
				<tr>
				    	<td class="orange">
				        	<div id="button0" align="right" style="width:500px">
				          		<input name="BackBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonBackText","s") %>" class="tabdata" onClick="javascript:window.location='/cgi-bin/wizardTZ.asp'"  >
				          	  	<input name="NextBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonNextText","s") %>" class="tabdata" onClick="uiSave()">
				          	  	<input name="ExitBtn" type="button" width="50" class="button1" value="<% tcWebApi_get("String_Entry","ButtonExitText","s") %>" class="tabdata" onClick="ExitWizard()">
				        	</div>
				        </td>
				</tr>
			</table>
		</form>
	</body>
</html>        
