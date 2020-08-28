<%
	if request_Form("postflag") = "1" then
		tcWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
		if tcWebApi_get("WebCustom_Entry","isXponDASANSupported","h") = "Yes" then
			tcWebApi_set("System_Entry","upgrade_os","upgradeOS")
		end if
		tcWebApi_CommitWithoutSave("System_Entry")
	end if	

	if request_Form("postflag0") = "1" then
		tcWebApi_set("System_Entry","upgrade_fw","HTML_HEADER_TYPE")
		if tcWebApi_get("WebCustom_Entry","isXponDASANSupported","h") = "Yes" then
			tcWebApi_set("System_Entry","upgrade_os","upgradeOS")
		end if
		tcWebApi_CommitWithoutSave("System_Entry")
	end if	
	
%>

<%if tcWebApi_get("System_Entry","upgrade_fw_status","h") <> "SUCCESS" then%>	
		<%If Request_Form("postflag") ="1"  Then%>
		
			<script language="JavaScript">
			setTimeout("sureupdate()",2000);
				function sureupdate()
				{
					var form=document.uiPostUpdateForm;
					
					form.uiStatus.value = "<%tcWebApi_get("String_Entry","UpdateJS3Text","s")%>";
				}

			</script>
		<%End If%>

		<%If Request_Form("postflag0") ="1"  Then%>
			<script language="JavaScript">
			setTimeout("sureupdate0()",2000);
				function sureupdate0()
				{
					var form=document.restoreForm;
					
					form.uiStatus0.value = "<%tcWebApi_get("String_Entry","UpdateJS3Text","s")%>";
				}

			</script>
		<%End If%>
		
<%End If%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<!-- page1 -->
	<%if tcWebApi_get("System_Entry","upgrade_fw_status","h") <> "SUCCESS" then%>	
		<head>
			<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
			<meta http-equiv=Content-Script-Type content=text/javascript>
			<meta http-equiv=Content-Style-Type content=text/css>
			<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
			<link rel="stylesheet" href="/style.css"  type="text/css">

			<style  type="text/css">
		
				body{color: #404040;}

				img.forattention
				{
					vertical-align:middle;										
				}
				
				.btn1
				{
					display:inline-block;
					cursor:pointer;
					color:#fff;
					font:15px Arial,Verdana,sans-serif;
					padding:0px 8px;
					height:20px;
					line-height:20px;
					*overflow:visible ;
					text-align:center;
					text-decoration:none;
					position:relative;
					background-color:#38a7dc;
					border:1px solid #38a7dc;
					outline:0;
				}

				label:hover
				{
					display:inline-block;
					background:#1a6f98;
					color:#fff;
					outline:0;
				}
				.InputTextWarning
				{
  					color:#CC0000;
  					border:0;
  				}

				#contenttype1
                                {
                                background-color: #FFFFFF;
				width:680px;
				padding:10px 3px 0px 3px;
				margin:0;
                                outline:0;
                                position:relative;
				border:1px solid #fff;
				-moz-border-radius:10px;
				-webkit-border-radius:10px;
				border-radius:10px;
				behavior:url(/PIE.htc);
}

				#contenttype2
                                {
                                 background-color: #FFFFFF;
                                 width:680px;
			  	 padding:0px 3px 10px 3px;
                                 margin:0;
                                 outline:0;
                                 position:relative;
                                 border:1px solid #fff;
                                 -moz-border-radius:10px;
                                 -webkit-border-radius:10px;
                                 border-radius:10px;
                                 behavior:url(/PIE.htc);
                                }

			</style>

			<script language="JavaScript" src="/general.js"></script>
			<script language="JavaScript">
		//cindy add for separate romfile and tclinux.bin

				function uiDoUpdate0()
				{
					var form=document.restoreForm;
					var string3 = form.tools_FW_UploadFile0.value.search(/romfile/);
					var string4 = form.tools_FW_UploadFile0.value.search(/VDSL_CO_romfile/);
					var string5 = form.tools_FW_UploadFile0.value.search(/tclinux/);
					
					if(form.tools_FW_UploadFile0.value=="") 
					{
						alert("<%tcWebApi_get("String_Entry","UpdateJS0Text","s")%>");
					}
					else if(form.fwNameChk.value == "Yes") 
					{
						if (form.upload_type0.value=="romfile")
							form.UG_filetype.value = "romfile";
					<%if tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "h") = "Yes" then%>
						else if (form.upload_type[2].selected)
							form.UG_filetype.value = "tclinux";
					<%else%>
						else if (form.upload_type0.value=="tclinux.bin")
							form.UG_filetype.value = "tclinux";
					<%end if%>
						else 
						{
							/* it will not come to here */
							alert("<%tcWebApi_get("String_Entry","UpdateJS1Text","s")%>");
							return;
						}
						form.uiStatus0.value = "<%tcWebApi_get("String_Entry","UpdateJS2Text","s")%>";
						form.postflag0.value = "1";
						form.submit();
					}
					else
					{
						if("<%tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "s")%>" == "Yes") 
						{
							if (((form.upload_type0.value=="romfile") && (string3 >= 0) && (string4 < 0)) || 
								((form.upload_type0.value=="tclinux.bin") && (string4 >= 0)) ||
								((form.upload_type[2].selected) && (string5 >= 0))) 
							
							{
								form.uiStatus0.value = "<%tcWebApi_get("String_Entry","UpdateJS2Text","s")%>";
								form.postflag0.value = "1";
								form.submit();
							}
							else
								alert("<%tcWebApi_get("String_Entry","UpdateJS1Text","s")%>");
						}
						else 
						{
							if (((form.upload_type0.value == "romfile") && (string3 >= 0)) || ((form.upload_type0.value == "tclinux.bin") && (string5 >= 0))) 
							{
								form.uiStatus0.value = "<%tcWebApi_get("String_Entry","UpdateJS2Text","s")%>";
								form.postflag0.value = "1";
								form.submit();
							}
							else
								alert("<%tcWebApi_get("String_Entry","UpdateJS1Text","s")%>");
						}
					}
				}

		//cindy add for separate romfile and tclinux.bin
				function uiDoUpdate()
				{
					var form=document.uiPostUpdateForm;
					var string3 = form.tools_FW_UploadFile.value.search(/romfile/);
					var string4 = form.tools_FW_UploadFile.value.search(/VDSL_CO_romfile/);
					var string5 = form.tools_FW_UploadFile.value.search(/tclinux/);

					if(form.tools_FW_UploadFile.value=="") 
					{
						alert("<%tcWebApi_get("String_Entry","UpdateJS0Text","s")%>");
					}
					else if(form.fwNameChk.value == "Yes") 
					{
						//if (form.upload_type[0].selected)
						if (form.upload_type.value=="romfile")//cindy add
							
							form.UG_filetype.value = "romfile";
						<%if tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "h") = "Yes" then%>
							else if (form.upload_type[2].selected)
								form.UG_filetype.value = "tclinux";
						<%else%>
							
							//else if (form.upload_type[1].selected)
							else if (form.upload_type.value=="tclinux.bin")//cindy add
								form.UG_filetype.value = "tclinux";
						<%end if%>
						else 
						{
							/* it will not come to here */
							alert("<%tcWebApi_get("String_Entry","UpdateJS1Text","s")%>");
							return;
						}
						form.uiStatus.value = "<%tcWebApi_get("String_Entry","UpdateJS2Text","s")%>";
						form.postflag.value = "1";
						form.submit();
					}
					else
					{
						if("<%tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "s")%>" == "Yes") 
						{
							//if (((form.upload_type[0].selected) && (string3 >= 0) && (string4 < 0)) || 
							//	((form.upload_type[1].selected) && (string4 >= 0)) ||
							//	((form.upload_type[2].selected) && (string5 >= 0))) 
							//cindy modify
							if (((form.upload_type.value=="romfile") && (string3 >= 0) && (string4 < 0)) || 
								((form.upload_type.value=="tclinux.bin") && (string4 >= 0)) ||
								((form.upload_type[2].selected) && (string5 >= 0))) 
							
							{
								form.uiStatus.value = "<%tcWebApi_get("String_Entry","UpdateJS2Text","s")%>";
								form.postflag.value = "1";
								form.submit();
							}
							else
								alert("<%tcWebApi_get("String_Entry","UpdateJS1Text","s")%>");
						}
						else 
						{
							//if (((form.upload_type.value == "1") && (string3 >= 0)) || ((form.upload_type.value == "4") && (string5 >= 0))) 
							if (((form.upload_type.value == "romfile") && (string3 >= 0)) || ((form.upload_type.value == "tclinux.bin") && (string5 >= 0))) 

							{
								form.uiStatus.value = "<%tcWebApi_get("String_Entry","UpdateJS2Text","s")%>";
								form.postflag.value = "1";
								form.submit();
							}
							else
								alert("<%tcWebApi_get("String_Entry","UpdateJS1Text","s")%>");
						}
					}
				}

				function backup_settings()
				{
					var cfg = '/cgi-bin/romfile.cfg';
					var code = 'location.assign("' + cfg + '")';
					eval(code);
				}

				function backup_vdsl_settings()
				{
					var cfg = '/VDSL_CO_romfile.cfg';
					var code = 'location.assign("' + cfg + '")';
					eval(code);
				}
				
				<%if tcwebApi_get("WebCustom_Entry", "isXponDASANSupported", "h")="Yes" Then %>
					//typeValue:1:romfile,4:tclinux.bin,5:VDSL CO romfile
					function onUploadTypeChange(typeValue)
					{
						if(typeValue==4)
							document.getElementById("updateBinTR").style.display="";
						else
							document.getElementById("updateBinTR").style.display="none";
					}
					
					function Init()
					{
						var formName=document.uiPostUpdateForm;
						var typeValue="";
						for(i=0;i<formName.upload_type.length;i++)
						{
							typeValue=formName.upload_type[i].value;
							formName.upload_type[i].onclick=Function("onUploadTypeChange("+typeValue+")");
							if(formName.upload_type[i].selected)
								onUploadTypeChange(typeValue);
						}
					}
				<%end if%>

				function handleFile()
				{
					var file = document.getElementById("xFile");
					var split_vars = file.value.split('\\');
					var fileName = document.getElementById("update_file_name");
					fileName.value = split_vars[split_vars.length-1];
				}

		//cindy add for separate romfile and tclinux.bin
				function handleFile0()
				{
					var file = document.getElementById("xFile0");
					var split_vars = file.value.split('\\');
					var fileName = document.getElementById("update_file_name0");
					fileName.value = split_vars[split_vars.length-1];
				}
		//cindy add for separate romfile and tclinux.bin
				
			</script>
		</head>
	
		<%if tcwebApi_get("WebCustom_Entry", "isXponDASANSupported", "h")="Yes" Then %>
			<body onload="Init()">
		<%else %>
			<body>
		<%end if%>
				<FORM ENCTYPE="multipart/form-data" METHOD="POST" name="uiPostUpdateForm">
					<INPUT TYPE="HIDDEN" NAME="postflag" VALUE="0">
					<INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="2">
					<%if tcWebApi_get("WebCustom_Entry", "isFwNameNoChk", "h") = "Yes" then%>
						<input type="hidden" name="UG_filetype" value="tclinux">
					<%end if%>

					<div id="pagestyle"><!--cindy add for border 11/28-->
						<div id="contenttype1">  <!--gleaf-->
							<div id="block1">
								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
									<tr height="25px" style="background-color:#e6e6e6;">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align="left" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","UpdateUpgradeText","s")%></td>
									</tr>
								</table>

								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UpdateNewFirmwareType","s")%></td>
									    	<td align=left class="tabdata">
			<!--cindy delete
									    		<select NAME="upload_type" SIZE="1">
									    			<%if tcwebApi_get("WebCustom_Entry","isThreeLevelChangePassWord","h") = "Yes" then%>	
									    				<%if TCWebAPI_get("WebCurSet_Entry", "CurrentAccess", "h") = "0" then%>
							                                                       	<option value="1" selected="selected"><%tcWebApi_get("String_Entry","UpdateRomfileText","s")%></option>    
											     			<%if tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "h") = "Yes" then%>
								                                                   <option ><%tcWebApi_get("String_Entry","UpdateVdslRomfileText","s")%></option>     
											     			<%end if%>
							                	                                   <option value="4"><%tcWebApi_get("String_Entry","UpdatebinText","s")%></option>	   
											     		<%else%>
											     			<option value="1" style="display:none"></option>
											     			<option value="4" selected="selected" style="display:none"><%tcWebApi_get("String_Entry","UpdatebinText","s")%></option>
											     		<%end if%>										     		
											     	<%elseif tcwebApi_get("WebCustom_Entry","isC5HENSFUSupported","h") = "Yes" then%>
											     		<option value="1"><%tcWebApi_get("String_Entry","UpdateRomfileText","s")%></option>
											     		<%if tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "h") = "Yes" then%>
											     			<option><%tcWebApi_get("String_Entry","UpdateVdslRomfileText","s")%></option>
											     		<%end if%>
											     		<option value="4" selected="selected"><%tcWebApi_get("String_Entry","UpdatebinText","s")%></option>										     		
											     	<%elseif tcwebApi_get("WebCustom_Entry","isC1HGUSupported","h") = "Yes" then%>
											     		<option value="1"><%tcWebApi_get("String_Entry","UpdateRomfileText","s")%></option>
								                                        <option value="4" selected="selected"><%tcWebApi_get("String_Entry","UpdateFwText","s")%></option>		 
											     	<%else%>
								                                        <option value="1" ><%tcWebApi_get("String_Entry","UpdateRomfileText","s")%></option>
											     		<%if tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "h") = "Yes" then%>
											     			<option><%tcWebApi_get("String_Entry","UpdateVdslRomfileText","s")%></option>
											     		<%end if%>
								                                          <option value="4" selected="selected"><%tcWebApi_get("String_Entry","UpdatebinText","s")%></option>
											     	<%end if%>
									     		</select>
									     	</td>
									</tr>

									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
										<td colspan="2" align=left class="tabdata">
											<img class="forattention" src="/exclamation.gif">
											<font color="#F36F22"><%tcWebApi_get("String_Entry","UpdateinfoText","s")%></font>
										</td>
									</tr>
		                                           -->
		
		                                           <!--cindy add start -->
					                     	                        <input type="text" name="upload_type" readonly value="tclinux.bin" style="border:0;">
				                                        	</td>
			                       	                         </tr>
	             	                                      <!--cindy add start -->
				
									<!--New Firmware Location -->
									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UpdateNewFirmwareText","s")%></td>
									     	<td align=left class="tabdata">
									     		<!--gleaf modified begin-->
									     		<!--<a href="javascript:;" class="a-upload">
												<INPUT TYPE="FILE" NAME="tools_FW_UploadFile" SIZE="30" MAXLENGTH="128">
											</a>-->
												
											<input id="update_file_name" type="text" disabled="disable" SIZE="12" MAXLENGTH="128" value="" style="width:80px;">&nbsp;
											<label class="btn1" for="xFile" style="height:20px;"><%tcWebApi_get("String_Entry","ButtonUploadFileText","s")%></label>
											<input type="file" id="xFile" name="tools_FW_UploadFile" style="position:absolute;clip:rect(0 0 0 0);" onchange="handleFile()">									
											<!--gleaf modified end-->
										</td>
									</tr>				
								
									<%if tcwebApi_get("WebCustom_Entry", "isXponDASANSupported", "h")="Yes" Then %>
										<tr height="30px" id="updateBinTR" style="display:none">
											<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UpdateUpgradeOSText","s")%></td>
											<td align=left class="tabdata">
												<input name="upgradeOS" type="radio" value="0" <% if tcWebApi_get("GPON_SoftImage0","Active","h") = "0" then asp_Write("CHECKED") end if %>><%tcWebApi_get("String_Entry","UpdateUpgradeOS1Text","s")%>
												<input name="upgradeOS" type="radio" value="1" <% if tcWebApi_get("GPON_SoftImage0","Active","h") = "1" then asp_Write("CHECKED") end if %>><%tcWebApi_get("String_Entry","UpdateUpgradeOS2Text","s")%>
											</td>
										</tr>
									<%end if%>

									<!--Status -->
									<tr height="30px">
										<td width="20px">&nbsp;</td>
										<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UpdateStatusText","s")%></td>
										<td align=left class="tabdata">
											<!--
											<INPUT TYPE="TEXT"  style="background-color:#ffffff;"NAME="uiStatus" SIZE="45" MAXLENGTH="55" readonly VALUE="<% if tcWebApi_get("System_Entry","upgrade_fw_status","h") = "NONE" then asp_Write("") elseif tcWebApi_get("System_Entry","upgrade_fw_status","h") = "FAIL" then tcWebApi_get("String_Entry","UpdateJS3Text","s") end if%>" class="InputTextWarning">
											-->
											
									<!--cindy add start 03/03-->
									<!--
									<%if tcWebApi_get("System_Entry","upgrade_fw_status","h") = "NONE" then%>	
											<INPUT TYPE="TEXT" NAME="uiStatus" SIZE="45" MAXLENGTH="55" readonly VALUE="" class="InputTextWarning">
									<% else %>
											<INPUT TYPE="TEXT"  NAME="uiStatus" SIZE="45" MAXLENGTH="55" readonly VALUE="<%tcWebApi_get("String_Entry","UpdateJS3Text","s")%>" class="InputTextWarning">
									<% end if %>
									-->
										<INPUT TYPE="TEXT" NAME="uiStatus" SIZE="45" MAXLENGTH="55" readonly VALUE="" class="InputTextWarning">
									<!--cindy add end 03/03-->
										</td>
									</tr>

									<!--<tr class="ccomment"height="30px">-->
									<tr height="30px">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align=left class="tabdata">
											<img class="forattention" src="/exclamation.gif">
											<font color="#F36F22"><%tcWebApi_get("String_Entry","UpdateCommentText","s")%></font>
										</td>
									</tr>
								</table>
							</div>

							<div id="block1">
								<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">	
									<tr height="25px">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","UpgradeText","s")%></td>
									</tr>
								</table>

								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
									<tr height="30px">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align=left class="tabdata">
											<INPUT TYPE="BUTTON" NAME="FW_apply" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonUpgradeText","s")%>" onClick="uiDoUpdate()"> 
											<INPUT type=hidden name="fwNameChk" VALUE="<%tcWebApi_get("WebCustom_Entry", "isFwNameNoChk", "s")%>">
										</td>								
									</tr>
								</table>
							</div>						
						</div>
					</div>
</form>
<FORM ENCTYPE="multipart/form-data" METHOD="POST" name="restoreForm">
	<INPUT TYPE="HIDDEN" NAME="postflag0" VALUE="0">
	<INPUT TYPE="HIDDEN" NAME="HTML_HEADER_TYPE" VALUE="2">
	<%if tcWebApi_get("WebCustom_Entry", "isFwNameNoChk", "h") = "Yes" then%>
		<input type="hidden" name="UG_filetype" value="tclinux">
	<%end if%>
		
<div id="pagestyle">
	<div id="contenttype2">
<!--cindy add for separate romfile and tclinux.bin-->
		<div id="block1">
			<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
				<tr height="25px" style="background-color:#e6e6e6;">
					<td width="20px">&nbsp;</td>
					<td colspan="2" align="left" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","RestoreconfigText0","s")%></td>
				</tr>
			</table>

			<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
				<tr height="30px">
					<td width="20px">&nbsp;</td>
					<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UpdateNewFirmwareType","s")%></td>
					<td align=left class="tabdata">
						<input type="text" name="upload_type0" readonly value="romfile" style="border:0;">
					</td>
				</tr>
				<!--New Firmware Location -->
				<tr height="30px">
					<td width="20px">&nbsp;</td>
					<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UpdateNewFirmwareText","s")%></td>
					<td align=left class="tabdata">												
						<input id="update_file_name0" type="text" disabled="disable" SIZE="12" MAXLENGTH="128" value="" style="width:80px;">&nbsp;
						<label class="btn1" for="xFile0" style="height:20px;"><%tcWebApi_get("String_Entry","ButtonUploadFileText","s")%></label>
						<input type="file" id="xFile0" name="tools_FW_UploadFile0" style="position:absolute;clip:rect(0 0 0 0);" onchange="handleFile0()">									
					</td>
				</tr>
				
			<%if tcwebApi_get("WebCustom_Entry", "isXponDASANSupported", "h")="Yes" Then %>
				<tr height="30px" id="updateBinTR" style="display:none">
					<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UpdateUpgradeOSText","s")%></td>
					<td align=left class="tabdata">
						<input name="upgradeOS" type="radio" value="0" <% if tcWebApi_get("GPON_SoftImage0","Active","h") = "0" then asp_Write("CHECKED") end if %>><%tcWebApi_get("String_Entry","UpdateUpgradeOS1Text","s")%>
						<input name="upgradeOS" type="radio" value="1" <% if tcWebApi_get("GPON_SoftImage0","Active","h") = "1" then asp_Write("CHECKED") end if %>><%tcWebApi_get("String_Entry","UpdateUpgradeOS2Text","s")%>
					</td>
				</tr>
			<%end if%>

			<!--Status -->
				<tr height="30px">
					<td width="20px">&nbsp;</td>
					<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UpdateStatusText","s")%></td>
					<td align=left class="tabdata">
						<!--cindy add start 03/03-->
						<!--
						<%if tcWebApi_get("System_Entry","upgrade_fw_status","h") = "NONE" then%>	
							<INPUT TYPE="TEXT" NAME="uiStatus0" SIZE="45" MAXLENGTH="55" readonly VALUE="" class="InputTextWarning">
						<% else %>
							<INPUT TYPE="TEXT"  NAME="uiStatus0" SIZE="45" MAXLENGTH="55" readonly VALUE="<%tcWebApi_get("String_Entry","UpdateJS3Text","s")%>" class="InputTextWarning">
						<% end if %>
						-->
							<INPUT TYPE="TEXT" NAME="uiStatus0" SIZE="45" MAXLENGTH="55" readonly VALUE="" class="InputTextWarning">
						<!--cindy add end 03/03-->
					</td>
				</tr>

				<!--<tr class="ccomment"height="30px">-->
				<tr height="30px">
					<td width="20px">&nbsp;</td>
					<td colspan="2" align=left class="tabdata">
						<img class="forattention" src="/exclamation.gif">
						<font color="#F36F22"><%tcWebApi_get("String_Entry","UpdateCommentText","s")%></font>
					</td>
				</tr>
			</table>
		</div>

		<div id="block1">
			<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">	
				<tr height="25px">
					<td width="20px">&nbsp;</td>
					<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","RestoreconfigText1","s")%></td>
				</tr>
			</table>

			<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
				<tr height="30px">
					<td width="20px">&nbsp;</td>
					<td colspan="2" align=left class="tabdata">
						<INPUT TYPE="BUTTON" NAME="FW_apply" class="button1" VALUE="<%tcWebApi_get("String_Entry","RestoreconfigText2","s")%>" onClick="uiDoUpdate0();"> 
						<INPUT type=hidden name="fwNameChk" VALUE="<%tcWebApi_get("WebCustom_Entry", "isFwNameNoChk", "s")%>">
					</td>								
				</tr>
			</table>
		</div>						

							<div id="button0">											
								<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">		
									<!--ROMFILE BACKUP -->
									<tr height="25px">
										<td width="20px">&nbsp;</td>
										<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","RomfileBackupText","s")%></td>
									</tr>
								</table>

								<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
									<%if tcwebApi_get("WebCustom_Entry","isThreeLevelChangePassWord","h") = "Yes" then%>
										<%if TCWebAPI_get("WebCurSet_Entry", "CurrentAccess", "h") = "0" then %>
											<tr height="30px">
											    	<td width="20px">&nbsp;</td>
											    	<td colspan="2" align=left class="tabdata">
											     		<input type="button" class="button1" value="<%tcWebApi_get("String_Entry","ButtonRomfileBakText","s")%>" onClick='backup_settings()'>
													<%if tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "h") = "Yes" then%>
															<input type="button" class="button1" value="<%tcWebApi_get("String_Entry","ButtonVdslRomfileBakText","s")%>" onClick='backup_vdsl_settings()'>
													<%end if%>
												</td>
											</tr>
										<%end if%>
									<%else%>
										<tr height="30px">
										    	<td width="20px">&nbsp;</td>
										    	<td colspan="2" align=left class="tabdata">
										     		<input type="button" class="button1" value="<%tcWebApi_get("String_Entry","ButtonRomfileBakText","s")%>" onClick='backup_settings()'>
												<%if tcWebApi_get("System_Entry", "upgrade_vdsl_co_romfile", "h") = "Yes" then%>
														<input type="button" class="button1" value="<%tcWebApi_get("String_Entry","ButtonVdslRomfileBakText","s")%>" onClick='backup_vdsl_settings()'>
												<%end if%>
											</td>
										</tr>
									<%end if%>
								</table>
							</div>
						</div>
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
			<!-- page1  end-->
	<%else%>
		<%if tcwebApi_get("WebCustom_Entry", "isC2TrueSupported","h")="Yes" then%>
			<!-- page2 start-->
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
				<meta http-equiv="Refresh" content="115"; url="tools_update.asp">
				<meta http-equiv=Content-Script-Type content=text/javascript>
				<meta http-equiv=Content-Style-Type content=text/css>
				<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
				<link rel="stylesheet" href="/style.css"  type="text/css">
				<style type="text/css">
					.num 
					{
						color: #FF9933;
						font-size: 8.0pt;
						font-weight: bold;
					    font-family: Arial,Helvetica, sans-serif;
					}
					
					*{color:#404040;}

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

				       .light-orange
					{
						background-color: #FFFFFF;
					}

					.orange 
					{
						background-color: #FFFFFF;
					}
				</style>
				
				<script>
					var pchar = "|";
					var maxchars = 110;
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
			</head>

			<BODY onLoad="Init()">
				<form METHOD="POST" name="UpgradingForm">
					<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
						<tr height="30px">
							<td width="20px">&nbsp;</td>
							<td width="250px" align="left" class="title-main"><%tcWebApi_get("String_Entry","UpdateUpgradeText","s")%></td>
						</tr>

						<tr>
							<td width="20px">&nbsp;</td>
							<td colspan="2" align="left" class="tabdata">
								<font color=red><%tcWebApi_get("String_Entry","UpdateSuccessfulMsgText","s")%></font>
							</td>
						</tr>
					</table>
					
					<table width="640px" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" "tabdata">
						<tr>
							<td width="20px" height="15" class="light-orange"></td>
							<td width="250px" class="light-orange">&nbsp;</td>
							<td width="370px">&nbsp;</td>
						</tr>
						
						<tr>
							<td width="20px" class="light-orange"></td>
							<td width="250px" class="light-orange">&nbsp;</td>
							<td width="370px"><div align=left><input type="text" class="num" name="progress" size="61" value=""></div></td>
						</tr>
						
						<tr>
							<td width="20px" height="2" class="light-orange"></td>
							<td width="250px" class="light-orange">&nbsp;</td>
							<td width="370px">&nbsp;</td>
						</tr>
						
						<tr>
							<td width="20px" class="light-orange"></td>
							<td width="250px" class="light-orange">&nbsp;</td>
							<td width="370px"><div align=left><input type="text" name="percent" size="2" value="">&nbsp;%</div></td>
						</tr>
						
						<tr>
							<td width="20px" height="15" class="light-orange"></td>
							<td width="250px" class="light-orange">&nbsp;</td>
							<td width="370px">&nbsp;</td>
						</tr>
					</table>
					
					<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" "tabdata">
						<tr>
							<td width="20px"  height="42" >&nbsp;</td>
							<td width="250px" class="orange">&nbsp;</td>
							<td width="370px" class="orange"></td>
						</tr>
					</table>
				</form>
			</BODY>
		<%else%>
			<!-- page3 -->
			<head>			
				<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
				<meta http-equiv="Refresh" content="115"; url="tools_update.asp">
				<script language="JavaScript" src="/general.js"></script>
				<style>
					body
					{
						background:#bfefff;
						margin:0px;
					}

					.warning
					{
						vertical-align:middle;
						font-family: Arial,Helvetica, sans-serif;
					 	color:red;
					 	font-size:18px;
					 	font-weight:bold;
					}
				</style>
			</HEAD>
			
			<BODY>
				<table width="690px" border="0"  cellpadding="0" cellspacing="0">
					<tr height="32px">
						<td width="80px">&nbsp;</td>
						<td width="250px">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>

					<tr height="30px">
						<td colspan="3" align="center">
							<img class="warning" src="/exclamation.gif" alt="">
							<font class="warning">							
								<%tcWebApi_get("String_Entry","UpdateSuccessfulMsgText","s")%>
								<!--<script language="javascript">
									document.writeln(_("UpdateSucc"));
								</script>-->
							</font>
						</td>
					</tr>

					<tr height="40px">
						<td colspan="3"></td>
					</tr>
				</table>
			</BODY>
		<%end if%>
	<%end if%>
</html>
