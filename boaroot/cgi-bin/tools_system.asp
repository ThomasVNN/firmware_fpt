<%
	If Request_Form("rebootFlag0") = "1"  Then 
		TCWebApi_set("System_Entry","reboot_type","restoreFlag0") 
		tcWebApi_CommitWithoutSave("System_Entry")
	End If	

	If Request_Form("rebootFlag1") = "1"  Then 
		TCWebApi_set("System_Entry","reboot_type","restoreFlag1") 
		tcWebApi_CommitWithoutSave("System_Entry")
	End If

	If Request_Form("rebootFlag2") = "1"  Then 
		TCWebApi_set("System_Entry","reboot_type","restoreFlag2") 
		tcWebApi_CommitWithoutSave("System_Entry")
	End If
	
%>

<!--
If you execute doRefresh() and then reload webpage, doRefresh() will be disabled.
Therefore, execute doRefresh() after webpage reloads.
-->
<%if tcwebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then%>
	<%If Request_Form("RestartBtn0") = tcWebApi_get("String_Entry","ButtonRebootText","h")  Then%>
		<script language="JavaScript">
			setTimeout("doRefresh()",70000);
		</script>
	<%End If%>

	<%If Request_Form("rebootFlag1") ="1"  Then%>
	
		<script language="JavaScript">
			setTimeout("doRefresh()",70000);
		</script>
	<%End If%>

	<%If Request_Form("RestartBtn2") = tcWebApi_get("String_Entry","ButtonRestore1Text","h")  Then%>
		<script language="JavaScript">
			setTimeout("doRefresh()",70000);
		</script>
	<%End If%>
<%End If%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<%if tcwebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then%>	
		<head>
			<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
			<meta http-equiv=Content-Script-Type content=text/javascript>
			<meta http-equiv=Content-Style-Type content=text/css>
			<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
			<link rel="stylesheet" href="/style.css" type="text/css">

			<style  type="text/css">
				*{color:  #404040;}

			</style>

			<script language="JavaScript">
				function restart0()
				{
					alert("<%tcWebApi_get("String_Entry","SystemJS0Text","s")%>");
					document.tools_System_Restore.rebootFlag0.value=1;
					document.tools_System_Restore.submit();
				}

				function restart1()
				{
					if(confirm("<%tcWebApi_get("String_Entry","SystemJS3Text","s")%>"))
					{
					alert("<%tcWebApi_get("String_Entry","SystemJS1Text","s")%>");
					document.tools_System_Restore.rebootFlag1.value=1;
					document.tools_System_Restore.submit();
				}
				}
					
//<!--cindy add new button to restore default config file but keep user data-->						
				function restart2()
				{
					alert("<%tcWebApi_get("String_Entry","SystemJS1Text","s")%>");
					document.tools_System_Restore.rebootFlag2.value=1;
					document.tools_System_Restore.submit();
				}
//<!--cindy add new button to restore default config file but keep user data-->						
				function doRefresh()
				{
	                            alert("<%tcWebApi_get("String_Entry","SystemJS2Text","s")%>");
					var mydate = new Date();
					mydate.setTime(mydate.getTime() - 1);
					<%if tcwebApi_get("WebCustom_Entry","isSupportLogout","h")="Yes" then%>
						document.cookie = "uid=del;path=/; expires=" + mydate.toGMTString(); 
						document.cookie = "psw=del;path=/; expires=" + mydate.toGMTString(); 
					<%else%>
						document.cookie = "SESSIONID=; expires=" + mydate.toGMTString(); 
					<%end if%>
					window.top.location.href = "../";    
				}
			</script>
		</head>

		<body>
			<FORM METHOD="POST" ACTION="/cgi-bin/tools_system.asp" name="tools_System_Restore">
				<INPUT TYPE="HIDDEN" NAME="testFlag" VALUE="0">
				<div id="pagestyle"><!--cindy add for border 11/28-->
					<div id="contenttype">    <!--gleaf-->
						<div id="block1">
							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
								<tr height="25px">
									<td  align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","SystemRestart1Text","s")%></td>
								</tr>
							</table>

							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
								<tr height="30px">
									<td width="20px">&nbsp;</td>
									<td align=left class="tabdata">
										<INPUT TYPE="HIDDEN" NAME="rebootFlag0" value="0">
										<INPUT TYPE="HIDDEN" NAME="restoreFlag0" value="1">
							    			<INPUT TYPE="SUBMIT" NAME="RestartBtn0" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonRebootText","s")%>" onClick="restart0();">	    			
									</td>								
								</tr>
							</table>
						</div>

						<div id="block1">
							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
								<tr height="25px">
									<td  align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","SystemRestart2Text","s")%></td>
								</tr>
							</table>
							
							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">	
								<tr height="30px">
									<td width="20px">&nbsp;</td>
									<td align=left class="tabdata">
										<INPUT TYPE="HIDDEN" NAME="rebootFlag1" value="0">
										<INPUT TYPE="HIDDEN" NAME="restoreFlag1" value="2">
							    			<INPUT TYPE="SUBMIT" NAME="RestartBtn1" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonRestore0Text","s")%>" onClick="restart1();">
									</td>								
								</tr>
							</table>
						</div>
<!--cindy add new button to restore default config file but keep user data-->						
						<div id="button0">
							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
								<tr height="25px">
									<td  align=left class="title-maintest" style="padding-left:20px;">
											<%tcWebApi_get("String_Entry","SystemRestart3Text","s")%>
									</td>
								</tr>
							</table>
							
							<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">	
								<tr height="30px">
									<td width="20px">&nbsp;</td>
									<td align=left class="tabdata">
										<INPUT TYPE="HIDDEN" NAME="rebootFlag2" value="0">
										<INPUT TYPE="HIDDEN" NAME="restoreFlag2" value="4">
							    			<INPUT TYPE="SUBMIT" NAME="RestartBtn2" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonRestore1Text","s")%>" onClick="restart2();">
									</td>								
								</tr>
							</table>
						</div>
<!--cindy add new button to restore default config file but keep user data-->						
					</div>   <!--gleaf-->
				</div>

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
	<%end if%>

	<%if tcwebApi_get("WebCustom_Entry","isC2TrueSupported","h")="Yes" then%>
		<%if TCWebApi_get("System_Entry","reboot_type","h") ="0"  then%>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
				<meta http-equiv=Content-Script-Type content=text/javascript>
				<meta http-equiv=Content-Style-Type content=text/css>
				<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
				<link rel="stylesheet" href="/style.css" type="text/css">
				<script language="JavaScript">
					function restart()
					{
						if(document.tools_System_Restore.C2UserMode.value ==0)
						{
							if(document.tools_System_Restore.restoreFlag[0].checked)
								alert("<%tcWebApi_get("String_Entry","SystemJS0Text","s")%>");
							if(document.tools_System_Restore.restoreFlag[1].checked)
								alert("<%tcWebApi_get("String_Entry","SystemJS1Text","s")%>");
						}
						else
						{
							if(document.tools_System_Restore.restoreFlag.value == 1)
								alert("<%tcWebApi_get("String_Entry","SystemJS0Text","s")%>");
						}
						document.tools_System_Restore.rebootFlag.value=1;
						document.tools_System_Restore.submit();
					}
				</script>

				<style  type="text/css">
					*{color:  #404040;}

					table td
					{
						margin:5 0;padding:5 0;
					}

					input     
					{
						font-family:  Arial; 
						font-size: 12px; 
						text-decoration: none;
					}

					td.tabdata 
					{
					    	font-size: 13px;
					    	font-family: Arial,Helvetica,sans-serif;
					}

					tr.tabdata 
					{
					    	font-size: 13px;
					    	font-family: Arial,Helvetica,sans-serif;
					}

					input[type=submit],
					input[type=reset],
					input[type=button]
					{
						filter:chroma(color=#000000);
					}

					button::-moz-focus-inner,
					input[type="reset"]::-moz-focus-inner,
					input[type="button"]::-moz-focus-inner,
					input[type="submit"]::-moz-focus-inner,
					input[type="file"] > input[type="button"]::-moz-focus-inner 
					{
						border: none;
					}

					.title-main 
					{
						font-family: Arial, Helvetica, sans-serif;
						font-size:  15px;
						font-weight: bold;
						text-align:left;
						color: #38a7dc;
				       }

				       body{background:#FFF;}

					#pagestyle
					{
						background-color:#e6e6e6;
						width:640px;
						margin:20px 50px;
						float:left;
						padding:20px;
						border:1px solid #e6e6e6;
						box-shadow:#666 0px 3px 4px;
						-moz-box-shadow:#666 0px 3px 4px;
						-moz-border-radius:10px;
						-webkit-border-radius:10px;
						border-radius:10px;
						behavior:url(/PIE.htc);
						outline:0;
					}

					#block1
					{
						background-color:#fff;
						width:640px;
						margin-bottom:10px;
						padding:15px 0;
						border:0;
						-moz-border-radius:10px;
						-webkit-border-radius:10px;
						border-radius:10px;
						behavior:url(/PIE.htc);
					}

					#block1 input[type="button"]:hover
					{
						display:inline-block;
						background:#1a6f98;
						color:#fff;
						outline:0;
					}
					
					#block1 input[type="submit"]:hover
					{
						display:inline-block;
						background:#1a6f98;
						color:#fff;
						outline:0;
					}

					.button1
					{
						display:inline-block;
						cursor:pointer;
						color:#fff;
						font:bold 15px Arial,Verdana,sans-serif;
						margin:5px;
						padding:7px 14px;
						line-height:normal;
						*overflow:visible ;
						text-align:center;
						text-decoration:none;
						position:relative;
						background:#38a7dc;
						-moz-border-radius:8px;
						-webkit-border-radius:8px;
						border-radius:8px;
						behavior:url(/PIE.htc);
						border:1px solid #38a7dc;
						outline:0;
					}

					button::-moz-focus-inner,
					input[type="button"]::-moz-focus-inner { border:none; padding:0; }
				</style>
			</head>

			<body>
				<FORM METHOD="POST" ACTION="/cgi-bin/tools_system.asp" name="tools_System_Restore">
					<INPUT TYPE="HIDDEN" NAME="testFlag" VALUE="0">
					<Input type="hidden" name="C2UserMode" value="<%if tcWebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then asp_write("0") else asp_write("1") end if%>">
					<div id="pagestyle">
						<div id="contenttype">   <!--gleaf-->
							<div id="block1">
								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
									<tr height="25px">
										<td width="20px">&nbsp;</td>
										<td align="left" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","SystemRestart1Text","s")%></td>
									</tr>
								</table>

								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									     	<td align=left class="tabdata">
									     		<INPUT TYPE="HIDDEN" NAME="rebootFlag0" value="0">
											<INPUT TYPE="HIDDEN" NAME="restoreFlag0" value="1">
								    			<INPUT TYPE="SUBMIT" NAME="RestartBtn0" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonRebootText","s")%>" onClick="restart0();">
										</td>
									</tr>
								</table>
							</div>

							<%if tcWebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then%>
								<div id="block1">
									<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
										<tr height="25px">
											<td width="20px">&nbsp;</td>
											<td align="left" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","SystemRestart2Text","s")%></td>
										</tr>
									</table>

									<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
										<tr height="30px">
											<td width="20px">&nbsp;</td>
											<td align=left class="tabdata">
												<INPUT TYPE="HIDDEN" NAME="rebootFlag1" value="0">
												<INPUT TYPE="HIDDEN" NAME="restoreFlag1" value="2">
									    			<INPUT TYPE="SUBMIT" NAME="RestartBtn1" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonRestoreText","s")%>" onClick="restart1();">
											</td>								
										</tr>
									</table>
								</div>
							<%end if%>
						</div>    <!--gleaf-->
					</div>
				</form>
			</body>
		<%else%>
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
				<meta http-equiv=Content-Script-Type content=text/javascript>
				<meta http-equiv=Content-Style-Type content=text/css>
				<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
				<link rel="stylesheet" href="/style.css" type="text/css">
				<style type="text/css">
					.num 
					{
						color: #FF9933;
						font-size: 8.0pt;
						font-weight: bold;
					    	font-family: Arial,Helvetica, sans-serif;
					}
					
					input     
					{
						font-family:  Arial; 
						font-size: 12px; 
						text-decoration: none;
					}

					td.tabdata 
					{
					    	font-size: 13px;
					    	font-family: Arial,Helvetica,sans-serif;
					}

					tr.tabdata 
					{
					    	font-size: 13px;
					    	font-family: Arial,Helvetica,sans-serif;
					}

					.title-main 
					{
						font-family: Arial, Helvetica, sans-serif;
						font-size:  15px;
						font-weight: bold;
						text-align:left;
						color: #38a7dc;
				       }

				       body{background:#FFF;}

					#pagestyle
					{
						background-color:#e6e6e6;
						width:640px;
						margin:20px 50px;
						float:left;
						padding:20px;
						border:1px solid #e6e6e6;
						box-shadow:#666 0px 3px 4px;
						-moz-box-shadow:#666 0px 3px 4px;
						-moz-border-radius:10px;
						-webkit-border-radius:10px;
						border-radius:10px;
						behavior:url(/PIE.htc);
						outline:0;
					}

					#block1
					{
						background-color:#fff;
						width:640px;
						margin-bottom:10px;
						padding:15px 0;
						border:0;
						-moz-border-radius:10px;
						-webkit-border-radius:10px;
						border-radius:10px;
						behavior:url(/PIE.htc);
					}

					.orange 
					{
						background-color: #FFFFFF;
					}
				</style>
				
				<script language="JavaScript">
					var pchar = "|";
					var maxchars = 100;
					var delay_time = 1000;
					var charcount = 0;  
					
					function Init()
					{
						var formName = document.forms[0];
						if (charcount < maxchars)
						{
							charcount ++;
							formName.progress.value = makeStr(charcount,pchar);
							formName.percent.value=Math.floor(charcount/maxchars*100);
							setTimeout("Init()",delay_time);		
						}
						else
						{
							window.top.location.href = "../"; 
						} 
					}
					
					function makeStr(strSize, fillChar)
					{
						var temp = "";
						for (i=0; i < strSize ; i ++)
							temp = temp + fillChar;
						return temp;
					}
				</script>
					
				<style  type="text/css">
					*{color:  #404040;}

					table td
					{
						margin:5 0;padding:5 0;
					}

				</style>
			</head>
			
			<body onLoad="Init();">
				<FORM METHOD="POST" ACTION="/cgi-bin/tools_system.asp" name="tools_System_Restore">
					<div id="pagestyle">
						<div id="contenttype">   <!--gleaf-->
							<div id="block1">
								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
									<tr height="25px" style="background-color:#e6e6e6;">
										<td width="20px">&nbsp;</td>
										<td width="250px" align="left" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","SystemRestartText","s")%></td>
									</tr>
								</table>

								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td colspan="2" align=left class="tabdata"><font color=red><%tcWebApi_get("String_Entry","SystemRebootText","s")%></td>
									</tr>

									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td colspan="2" align=left class="tabdata"><input type="text" class="num" name="progress" size="55" value=""></td>
									</tr>

									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td colspan="2" align=left class="tabdata"><input type="text" name="percent" size="2" value=""></td>
									</tr>
								</table>
								
								<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
									<tr>	
										<td width="20" height="42" >&nbsp;</td>
										<td width="250" class="orange">&nbsp;</td>
										<td width="370" class="orange"></td>
									</tr>
								</table>
							</div>
						</div>  <!--gleaf-->
					</div>
				</form>
			</body>
		<%end if%>
	<%end if%>
</html>

