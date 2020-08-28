<%
	tcWebApi_set("WebCurSet_Entry","dev_pvc","DvInfo_PVC")
	tcWebApi_set("WebCurSet_Entry","dev_pvc_ext","DvInfo_PVC_Ext")
	If Request_Form("Saveflag")="1" then
		tcWebApi_set("DeviceInfo_PVC","DispConnBtnType","DipConnFlag")
		If Request_Form("Dipflag")="1" then
			tcWebApi_set("DeviceInfo_PVC","DispBtnType","Dipflag")
			tcWebApi_commit("DeviceInfo_PVC")
		elseif Request_Form("Dipflag")="2" then
			tcWebApi_set("DeviceInfo_PVC","DispBtnType","Dipflag")
			tcWebApi_commit("DeviceInfo_PVC")
		elseif Request_Form("Dipflag")="3" then
			tcWebApi_set("DeviceInfo_PVC","DispBtnType","Dipflag")
			tcWebApi_set("DeviceInfo_PVC","IP6DispBtnType","Dipflag")
			tcWebApi_commit("DeviceInfo_PVC")
		elseif Request_Form("Dipflag")="4" then
			tcWebApi_set("DeviceInfo_PVC","DispBtnType","Dipflag")
			tcWebApi_set("DeviceInfo_PVC","IP6DispBtnType","Dipflag")
			tcWebApi_commit("DeviceInfo_PVC")
		END If 
		If Request_Form("DipConnFlag")="1" then
			tcWebApi_set("DeviceInfo_PVC","DispConnBtnType","DipConnFlag")
			tcWebApi_commit("DeviceInfo_PVC");
		elseif Request_Form("DipConnFlag")="2" then
			tcWebApi_set("DeviceInfo_PVC","DispConnBtnType","DipConnFlag")
			tcWebApi_commit("DeviceInfo_PVC");
		END If 
		
		tcWebApi_set("Info_Dongle","ManualDialUp","DongleConnFlag")	
		If Request_Form("DongleConnFlag")="1" then
			tcWebApi_set("Info_Dongle","ManualDialUp","DongleConnFlag")
			tcWebApi_commit("Dongle_Entry");
		elseif Request_Form("DongleConnFlag")="2" then
			tcWebApi_set("Info_Dongle","ManualDialUp","DongleConnFlag")
			tcWebApi_commit("Dongle_Entry");
		END If 	
	elseif Request_Form("Saveflag")="2" then
		if tcWebApi_get("WebCustom_Entry","isXponDASANSupported","h") = "Yes" then
			tcWebApi_set("GUI_Entry0","RefreshTime","RefreshTimeSel")
			tcWebApi_commit("GUI_Entry0");
			tcWebApi_Save();
		END If 
	END If 	  	
	If Request_Form("SaveModeflag")="1" then
	tcWebApi_set("Mode_Entry", "WorkMode","workingmode")
	tcWebApi_set("GPON_ONU", "OnuType","workingmode")
	tcWebApi_commit("GPON_ONU");
	tcWebApi_commit("Mode_Entry");
	tcWebApi_Save();
	END If 
	If Request_Form("ReconnectPPPoEflag")="1" then
	tcWebApi_set("Wan_PVC","USERNAME","wan_PPPUsername")
	tcWebApi_set("Wan_PVC","PASSWORD","wan_PPPPassword")
	tcWebApi_commit("Wan_PVC");
	tcWebApi_Save();
	END if


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<META NAME="GENERATOR" Content="Microsoft Developer Studio">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<style  type="text/css">
*{
   color:  #404040;
}

</style>

<script language="JavaScript">
function doSave() {
	document.DvInfo_Form.submit();
}

function onSubmmit()
{
	if(document.DvInfo_Form.workingmode.value != '<% tcWebApi_get("GPON_ONU","OnuType","s") %>')
		{
		if( confirm("<%tcWebApi_get("String_Entry","WorkingConfirm","s")%>"))
		{
		  document.DvInfo_Form.SaveModeflag.value = 1;
	          document.DvInfo_Form.submit();
}
		}		
          else
               alert("<%tcWebApi_get("String_Entry","WorkingAlert","s")%>");		
}

//wang add for reconnect PPPoE 2017101010
function onClickreconnetPPPoE()
{
	if( confirm("<%tcWebApi_get("String_Entry","WANPppoeReconnect1Text","s")%>"))
	{
		document.DvInfo_Form.ReconnectPPPoEflag.value = 1;
		document.DvInfo_Form.submit();
	}
}
//end

//cindy add for refresh button start 11/04
function Reload(){
//wang modify start for refresh button will change pppoe ip sometimes.
//window.location.reload();

document.location.href="/cgi-bin/status_deviceinfo.asp";
//end
}
//cindy add for refresh button end 11/04
function renewrelease(ip){
  document.DvInfo_Form.Dipflag.value = ip;
  document.DvInfo_Form.Saveflag.value = 1;
  document.DvInfo_Form.DipConnFlag.value = 0;
  document.DvInfo_Form.submit();  
}
function reconnect(flag){
  document.DvInfo_Form.DipConnFlag.value = flag;
  document.DvInfo_Form.Saveflag.value = 1;
  document.DvInfo_Form.submit();  
}
function dongle_reconnect(flag){
  document.DvInfo_Form.DongleConnFlag.value = flag;
  document.DvInfo_Form.Saveflag.value = 1;
  document.DvInfo_Form.submit();  
}
<%if tcWebApi_get("WebCustom_Entry","isC5HENSFUSupported","h") = "Yes" then%>
function fwver()
{
	var tempbuf = '<% tcWebApi_get("DeviceInfo","FwVer","s") %>';
	var FwVer = '';
	if(tempbuf.indexOf('Fw') >=0)
	{
		FwVer = tempbuf.substr(tempbuf.indexOf('w') + 1);
	}
	document.write(FwVer);
}
<%end if%>
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

<%if tcwebApi_get("WebCustom_Entry", "isC2TrueSupported", "h")="Yes" Then %>
self.setTimeout("self.location.reload(true);",10000);
<%end if%>
<%if tcwebApi_get("WebCustom_Entry", "isCZGeneralSupported", "h")="Yes" Then %>
self.setTimeout("window.location='/cgi-bin/status_deviceinfo.asp';",10000);
<%end if%>

<%if tcwebApi_get("WebCustom_Entry", "isXponDASANSupported", "h")="Yes" Then %>
function doUpdateRefreshTime(){
	  document.DvInfo_Form.Saveflag.value = 2;
	  document.DvInfo_Form.submit(); 
}
var refreshTime='<%If tcWebApi_get("GUI_Entry0","RefreshTime","h") <> "N/A" Then tcWebApi_get("GUI_Entry0","RefreshTime","s") Else asp.write("0") end if%>';
if(refreshTime>0){
	self.setTimeout("window.location='/cgi-bin/status_deviceinfo.asp';",refreshTime*1000);
}
<%end if%>
</script>
</HEAD>
<BODY>
<FORM METHOD="POST" ACTION="/cgi-bin/status_deviceinfo.asp" name="DvInfo_Form">
<div id="pagestyle"><!--cindy add for border 11/28-->
<!--TABLE1 start -->
<div id="contenttype">
<div id="block1">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<INPUT TYPE="HIDDEN" NAME="Saveflag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="Dipflag" VALUE="0">
<tr style="height:25px;width:100%;background:#e6e6e6;">
<td width="20px">&nbsp; </td>
<td width="250px" align="left" class="title-main"><%tcWebApi_get("String_Entry","DeviceInformationText","s")%></td>
<td class="tabdata" valign="middle"><%if tcwebApi_get("WebCustom_Entry", "isXponDASANSupported", "h")="Yes" Then %>
<div align="right" ><%tcWebApi_get("String_Entry","DeviceInfoRefreshTimeText","s")%>:<SELECT NAME="RefreshTimeSel" SIZE="1" onChange="doUpdateRefreshTime()">
<OPTION value=0 <% if tcWebApi_get("GUI_Entry0","RefreshTime","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","DeviceInfoRefreshTime0Text","s")%></OPTION>
<OPTION value=5 <% if tcWebApi_get("GUI_Entry0","RefreshTime","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","DeviceInfoRefreshTime1Text","s")%></OPTION>
<OPTION value=10 <% if tcWebApi_get("GUI_Entry0","RefreshTime","h") = "10" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","DeviceInfoRefreshTime2Text","s")%></OPTION>
<OPTION value=30 <% if tcWebApi_get("GUI_Entry0","RefreshTime","h") = "30" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","DeviceInfoRefreshTime3Text","s")%></OPTION>
<OPTION value=60 <% if tcWebApi_get("GUI_Entry0","RefreshTime","h") = "60" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","DeviceInfoRefreshTime4Text","s")%></OPTION></SELECT>  
</div><% else %> <%end if%></td></tr>
</table>

<table width="620" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DeviceWorkingMode","s")%></td>
<td align=left class="tabdata">
<!--wang delete 20171107 for FPT ask to delete SFU mode
<INPUT TYPE="HIDDEN" NAME="SaveModeflag" VALUE="0">
	<SELECT NAME="workingmode" SIZE="1">
		<OPTION value="1" <% if tcWebApi_get("GPON_ONU","OnuType","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","SFUMode","s")%>
		<OPTION value="2" <% if tcWebApi_get("GPON_ONU","OnuType","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","HGUMode","s")%>
	</SELECT>

	&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" onclick="onSubmmit()" value="<%tcWebApi_get("String_Entry","NavigationMainSaveText","s")%>">
wang end -->
<!--only use HGU mode-->
<%If tcWebApi_get("GPON_ONU","OnuType","h")  = "2" Then tcWebApi_get("String_Entry","HGUMode","s") end if%>  
</td>
</tr>
<!--cindy add modelname information 12/04-->
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DeviceXPONModelNameText","s")%></td>
<td align=left class="tabdata"><%tcWebApi_get("GPON_ONU","ModelName","s")%></td>
</tr>
<!--cindy add modelname information 12/04-->


<%if tcWebApi_get("WebCustom_Entry","isHwSwVerSupported","h") = "Yes" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceHWVerText","s")%>  </td>
<td align=left class="tabdata"><%If tcWebApi_get("String_Entry","DeviceHWVerValue","h") <> "N/A" Then tcWebApi_get("String_Entry","DeviceHWVerValue","s") end if%> </td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DeviceSWVerText","s")%></td>
<td align=left class="tabdata"><%If tcWebApi_get("String_Entry","DeviceSWVerValue","h") <> "N/A" Then tcWebApi_get("String_Entry","DeviceSWVerValue","s") end if%> </td>
</tr>

<%if tcWebApi_get("WebCustom_Entry","isC5HENSFUSupported","h") = "Yes" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DeviceFirmwareVSText1","s")%></td>
<td align=left class="tabdata">
<script language="JavaScript">
	fwver(); 
</script>    
</td>
</tr>
<%end if%>
<%else%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceFirmwareVSText","s")%></td>
<td align=left class="tabdata"><%If tcWebApi_get("DeviceInfo","FwVer","h") <> "N/A" Then tcWebApi_staticGet("DeviceInfo","FwVer","s") end if%></td>
</tr>
<%end if%>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceHardwareVSText","s")%></td>
<td align=left class="tabdata">
<%If tcWebApi_get("GPON_ONU","HardwareVersion","h") <> "N/A" Then tcWebApi_get("GPON_ONU","HardwareVersion","s") end if%>
</td>
</tr>

<!--Foxconn alan add start for show UpTimp (20170915) -->
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><font color="#000000"><%tcWebApi_get("String_Entry","DeviceUpTimeText","s")%></font></td>
<td align=left class="tabdata">
<%If tcWebApi_get("DeviceInfo","UpTimeD","h") <> "N/A" Then tcWebApi_get("DeviceInfo","UpTimeD","s") end if%> Days 
<%If tcWebApi_get("DeviceInfo","UpTimeH","h") <> "N/A" Then tcWebApi_get("DeviceInfo","UpTimeH","s") end if%> Hours 
<%If tcWebApi_get("DeviceInfo","UpTimeM","h") <> "N/A" Then tcWebApi_get("DeviceInfo","UpTimeM","s") end if%> Minutes
</td>
</tr>
<!-- Foxconn alan add end -->


<!--Foxconn alan add start for RAM size -->
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><font color="#000000"><%tcWebApi_get("String_Entry","DeviceRAMSizeText","s")%></font></td>
<td align=left class="tabdata"><%If tcWebApi_get("DeviceInfo","RAMSize","h") <> "N/A" Then tcWebApi_get("DeviceInfo","RAMSize","s") end if%></td>
</tr>
<!-- Foxconn alan add end -->
<!--Foxconn alan add start for MemUsage and CpuUsage -->
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><font color="#000000"><%tcWebApi_get("String_Entry","DeviceMemUsageText","s")%></font></td>
<td align=left class="tabdata"><%If tcWebApi_get("DeviceInfo","MemUsage","h") <> "N/A" Then tcWebApi_get("DeviceInfo","MemUsage","s") end if%>%</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><font color="#000000"><%tcWebApi_get("String_Entry","DeviceCPUUsageText","s")%></font></td>
<td align=left class="tabdata"><%If tcWebApi_get("DeviceInfo","CpuUsage","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CpuUsage","s") end if%>%(all); 
<%If tcWebApi_get("DeviceInfo","CpuUsage0","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CpuUsage0","s") end if%>%(0); 
<%If tcWebApi_get("DeviceInfo","CpuUsage1","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CpuUsage1","s") end if%>%(1); 
<%If tcWebApi_get("DeviceInfo","CpuUsage2","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CpuUsage2","s") end if%>%(2); 
<%If tcWebApi_get("DeviceInfo","CpuUsage3","h") <> "N/A" Then tcWebApi_get("DeviceInfo","CpuUsage3","s") end if%>%(3)
</td>
</tr>
<!-- Foxconn alan add end -->
<!--Foxconn alan add start for NatSession -->
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><font color="#000000"><%tcWebApi_get("String_Entry","DeviceNatSessionText","s")%></font></td>
<td align=left class="tabdata"><%If tcWebApi_get("DeviceInfo","NatSession","h") <> "N/A" Then tcWebApi_get("DeviceInfo","NatSession","s") end if%></td>
</tr>
<!-- Foxconn alan add end -->

<%if tcWebApi_get("WebCustom_Entry","isHDVerModNameDisplay","h") = "Yes" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceHDVerText","s")%> </td>
<td align=left class="tabdata"><%If tcWebApi_get("GPON_ONU","Version","h") <> "N/A" Then tcWebApi_get("GPON_ONU","Version","s") end if%></td>
</tr>
<%end if%>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceMACAddressText","s")%></td>
<td align=left class="tabdata" style="text-transform:uppercase">
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
<% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "8" then%>
	<% if tcWebApi_staticGet("DeviceInfo_PVC","WanMac","h") <> "N/A" then tcWebApi_staticGet("DeviceInfo_PVC","WanMac","s") 
	elseif tcWebApi_staticGet("Info_Ether","mac","h") <> "N/A" then tcWebApi_staticGet("Info_Ether","mac","s") end if%>  
<% elseif tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "9" then%>	
	<% if tcWebApi_staticGet("DeviceInfo_PVC","WanMac","h") <> "N/A" then tcWebApi_staticGet("DeviceInfo_PVC","WanMac","s") 
	elseif tcWebApi_staticGet("Info_Ether","mac","h") <> "N/A" then tcWebApi_staticGet("Info_Ether","mac","s") end if%>  
<% elseif tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "10" then%>	
	<% if tcWebApi_staticGet("DeviceInfo_PVC","WanMac","h") <> "N/A" then tcWebApi_staticGet("DeviceInfo_PVC","WanMac","s") 
	elseif tcWebApi_staticGet("Info_Ether","mac","h") <> "N/A" then tcWebApi_staticGet("Info_Ether","mac","s") end if%>  
	<%else%>
	<%If tcWebApi_get("Info_Ether","mac","h") <> "N/A" Then tcWebApi_staticGet("Info_Ether","mac","s") end if%>   
<%end if%>	
<%else%>
<%If tcWebApi_get("Info_Ether","mac","h") <> "N/A" Then tcWebApi_staticGet("Info_Ether","mac","s") end if%>   
<%end if%>
</td>
</tr>
</table>
</div><!--cindy add for device status border 12/04-->

<div id="block1"><!--cindy add for id="block1" 12/04-->
<!--TABLE3(XPON) start -->
<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<INPUT TYPE="HIDDEN" NAME="style" VALUE="0">
<tr style="height:25px;width:100%;background:#e6e6e6;">
<td width="250px" align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","DeviceXPONTest","s")%></td>
</tr>
</table>
<% end if %>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"> <%tcWebApi_get("String_Entry","DeviceXPONLinkStateText","s")%> </td>
<td align=left class="tabdata"><%If tcWebApi_get("XPON_Common","trafficStatus","h") = "up" Then tcWebApi_get("String_Entry","DeviceXPONupText","s")
			  else  
			  	tcWebApi_get("String_Entry","DeviceXPONdownText","s") 
			  end if%>
</td>
</tr>

<!--wang hide GPON Firmware Ver on GUI follow FPT's sugestion 20180123-->
<%if tcWebApi_get("WebCustom_Entry", "isC1ZYSupported", "h") <> "Yes" then%>
<tr style="display:none" height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceXPONFirmwareVerText","s")%></td>
<td align=left class="tabdata">			
<%if tcWebApi_get("WebCustom_Entry","isC1HGUSupported","h") = "Yes" then
				tcWebApi_staticGet("GPON_ONU","Version","s")
			 else	
			  	if tcWebApi_get("XPON_LinkCfg","LinkSta","h") = "1" then
			  		tcWebApi_staticGet("GPON_ONU","Version","s")
			  	elseif tcWebApi_get("XPON_LinkCfg","LinkSta","h") = "2" then
			  		tcWebApi_staticGet("EPON_ONU","FWVer","s")
			  	else
			  		tcWebApi_get("String_Entry","DeviceXPONNAText","s")
			  	end if
			  end if%>
</td>
</tr>
<% end if %>
<!-- hide end -->
<!-- Foxconn alan remove start
	<%if tcWebApi_get("WebCustom_Entry", "isC1ZYSupported", "h") <> "Yes" then%>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right>
		  <%tcWebApi_get("String_Entry","DeviceXPONModeText","s")%>  </div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata" colspan="3">
			<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") = "1" Then tcWebApi_get("String_Entry","DeviceXPONLSGPONText","s")
			elseif tcWebApi_get("XPON_LinkCfg","LinkSta","h") = "2" Then tcWebApi_get("String_Entry","DeviceXPONLSEPONText","s")
			Else 
				tcWebApi_get("String_Entry","DeviceXPONLSAutoDetectText","s")
			end if%>
</td>
</tr>
<%end if%>
Foxconn alan remove end -->
<%if tcWebApi_get("WebCustom_Entry","isXPONSNLoadIDDisplay","h") = "Yes" then%>
	
<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") = "1" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceXPONSNText","s")%></td>
<td align=left class="tabdata"><%tcWebApi_get("GPON_ONU","SerialNumber","s")%></td>
</tr>	
<%end if%>
	
<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") = "2" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceXPONLOIDText","s")%></td>
<td align=left class="tabdata"><%tcWebApi_get("EPON_LOIDAuth","LOID0","s")%></td>
</tr>	
<%end if%>

<%end if%>
	
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"> <%tcWebApi_get("String_Entry","DeviceXPONRxPowerText","s")%></td>
<td align=left class="tabdata">		
			<script language="JavaScript">
			<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") <> "0"  Then%>
				document.write((Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>))/10000)/(Math.log(10))*100)/10)+" <%tcWebApi_get("String_Entry","DeviceXPONdBmText","s")%>");
			<%else%> 
				<%if tcWebApi_get("WebCustom_Entry","isCHSSupported","h") = "Yes"  Then%>
					document.write((Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "RxPower", "s")%>))/10000)/(Math.log(10))*100)/10)+" <%tcWebApi_get("String_Entry","DeviceXPONdBmText","s")%>");
				<%else%>
					document.write("<%tcWebApi_get("String_Entry","DeviceXPONNAText","s")%>"); 
				<%End If%>
			<%End If%>
		</script>
</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"> <%tcWebApi_get("String_Entry","DeviceXPONTxPowerText","s")%></td>
<td align=left class="tabdata">	
			<script language="JavaScript">
			<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") <> "0"  Then%>
				document.write((Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>))/10000)/(Math.log(10))*100)/10)+" <%tcWebApi_get("String_Entry","DeviceXPONdBmText","s")%>");
			<%else%>
				<%if tcWebApi_get("WebCustom_Entry","isCHSSupported","h") = "Yes"  Then%>
					document.write((Math.round(Math.log((Number(<%tcWebApi_get("Info_PonPhy", "TxPower", "s")%>))/10000)/(Math.log(10))*100)/10)+" <%tcWebApi_get("String_Entry","DeviceXPONdBmText","s")%>");
				<%else%> 
					document.write("<%tcWebApi_get("String_Entry","DeviceXPONNAText","s")%>");
				<%End If%>
			<%End If%>
		</script>
</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"> <%tcWebApi_get("String_Entry","DeviceXPONTxBiasText","s")%></td>
<td align=left class="tabdata">	
			<script language="JavaScript">
			<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") <> "0"  Then%>
				document.write((Number(<%tcWebApi_get("Info_PonPhy", "TxBiasCurrent", "s")%>)*2/1000)+" <%tcWebApi_get("String_Entry","DeviceXPONmAText","s")%>");
			<%else%>
				<%if tcWebApi_get("WebCustom_Entry","isCHSSupported","h") = "Yes"  Then%>
					document.write((Number(<%tcWebApi_get("Info_PonPhy", "TxBiasCurrent", "s")%>)*2/1000)+" <%tcWebApi_get("String_Entry","DeviceXPONmAText","s")%>");
				<%else%> 
					document.write("<%tcWebApi_get("String_Entry","DeviceXPONNAText","s")%>"); 
				<%End If%>
			<%End If%>
		</script>
</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceXPONSupplyVoltageText","s")%></td>
<td align=left class="tabdata">		
			<script language="JavaScript">
			<%if tcWebApi_get("XPON_LinkCfg","LinkSta","h") <> "0"  Then%>
				document.write((Number(<%tcWebApi_get("Info_PonPhy", "SupplyVoltage", "s")%>)/10000)+" <%tcWebApi_get("String_Entry","DeviceXPONVText","s")%>");
			<%else%>
				<%if tcWebApi_get("WebCustom_Entry","isCHSSupported","h") = "Yes"  Then%>
					document.write((Number(<%tcWebApi_get("Info_PonPhy", "SupplyVoltage", "s")%>)/10000)+" <%tcWebApi_get("String_Entry","DeviceXPONVText","s")%>");
				<%else%>
					document.write("<%tcWebApi_get("String_Entry","DeviceXPONNAText","s")%>");
				<%End If%> 
			<%End If%>
		</script>
</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceXPONTemperatureText","s")%></td>
<td align=left class="tabdata">		
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
</tr>

<%else%>
<% if tcWebApi_get("WebCurSet_Entry","dev_pvc","h") <> "10" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%><%tcWebApi_get("String_Entry","XdslText","s")%><%else%><%tcWebApi_get("String_Entry","DeviceADSLText","s")%><%end if%></td>
  <td width="150"><hr noshade></td>
  <td width="10" ><hr noshade></td>
  <td colspan="3"><hr noshade></td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"> <%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%><%tcWebApi_get("String_Entry","DeviceXDSLFirmwareVerText","s")%><%else%><%tcWebApi_get("String_Entry","DeviceADSLFirmwareVerText","s")%><%end if%> </td>
<td align=left class="tabdata"><%If tcWebApi_get("Info_Adsl","fwVer","h") <> "N/A" then tcWebApi_staticGet("Info_Adsl","fwVer","s") end if%>     </td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"> <%tcWebApi_get("String_Entry","DeviceLineStateText","s")%></td>
<td align=left class="tabdata">
<%If tcWebApi_staticGet("Info_Adsl","lineState","h") = "up" then tcWebApi_get("String_Entry","DeviceADSLupText","s")
  elseif tcWebApi_staticGet("Info_Adsl","lineState","h") = "down" then tcWebApi_get("String_Entry","DeviceADSLdownText","s") 
  elseif tcWebApi_staticGet("Info_Adsl","lineState","h") = "wait for init" then tcWebApi_get("String_Entry","DeviceADSLwaitText","s") 
  elseif tcWebApi_staticGet("Info_Adsl","lineState","h") = "initializing" then tcWebApi_get("String_Entry","DeviceADSLinitText","s")
  else  tcWebApi_get("String_Entry","DeviceADSLdownText","s")
end if%>
</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceModulationText","s")%></td>
<td align=left class="tabdata"><%tcWebApi_staticGet("Info_Adsl","Opmode","s")%></td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceAnnexModeText","s")%></td>
<td align=left class="tabdata"><%tcWebApi_get("Info_Adsl","AdslType","s")%></td>
</tr>

<tr>
<td class="light-orange">&nbsp;</td>
<td class="light-orange"></td>
<td class="tabdata"><hr noshade class="light-orange-line"></td>
<td class="tabdata"><hr noshade class="light-orange-line"></td>
<td class="tabdata" colspan="3"><hr noshade class="light-orange-line"></td>
</tr>

<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right></div></td>
<td class="tabdata"></td><td width="80" align=center class="tabdata"><%tcWebApi_get("String_Entry","DeviceDownstreamText","s")%>  </td>
<td width="80" align=center class="tabdata"> <%tcWebApi_get("String_Entry","DeviceUpstreamText","s")%>  </td>
<td width="280">&nbsp;</td>
</tr>

<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","DeviceSNRMarginText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","SNRMarginDown","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","SNRMarginUp","s")%></td>
<td class="tabdata"></td>
</tr>
<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right><%tcWebApi_get("String_Entry","DeviceLineAttenuationText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","AttenDown","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","AttenUp","s")%></td>
<td width="280" class="tabdata"></td>
</tr>
<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right><%tcWebApi_get("String_Entry","DeviceDataRateText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","DataRateDown","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","DataRateUp","s")%></td>
<td width="280" class="tabdata"></td>
</tr>
<tr>
<% if tcWebApi_staticGet("WebCustom_Entry","isAdslShowMaxRate","h") = "Yes" then %>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","DeviceMaxRateText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","AttainDown","s")%>&nbsp;<%tcWebApi_get("String_Entry","DeviceMaxRateUnitText","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","AttainUp","s")%>&nbsp;<%tcWebApi_get("String_Entry","DeviceMaxRateUnitText","s")%></td>
<td width="280" class="tabdata"></td>
</tr>
<%end if%>
<% if tcWebApi_staticGet("WebCustom_Entry","isAdslShowTxpower","h") = "Yes" then %>
<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right><%tcWebApi_get("String_Entry","DevicePowerText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","PowerDown","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","PowerUp","s")%></td>
<td width="280" class="tabdata"></td>
</tr>
<%end if%>
<% if tcWebApi_staticGet("WebCustom_Entry","isAdslShowCRC","h") = "Yes" then %>
<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right><%tcWebApi_get("String_Entry","DeviceCRCText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","CRCDown","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Adsl","CRCUp","s")%></td>
<td width="280" class="tabdata"></td>
</tr>
<%end if%>
<% if tcWebApi_get("WebCustom_Entry","isSNMPSupported","h") = "Yes" then %>
<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right><%tcWebApi_get("String_Entry","DeviceESText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_get("Info_Showtime","ESDown","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Showtime","ESUp","s")%></td>
<td class="tabdata"></td>
</tr>
<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right><%tcWebApi_get("String_Entry","DeviceSESText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Showtime","SESDown","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Showtime","SESUp","s")%></td>
<td class="tabdata"></td>
</tr>
<%if tcWebApi_get("WebCustom_Entry","havePtm","h") <> "Yes" then%>
<tr>
<td class="light-orange"></td>
<td class="light-orange"></td>
<td class="tabdata"><div align=right><%tcWebApi_get("String_Entry","DeviceUASText","s")%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Showtime","UASDown","s")%></td>
<td width="80" align=center class="tabdata"><%tcWebApi_staticGet("Info_Showtime","UASUp","s")%></td>
<td class="tabdata"></td>
</tr>
<%end if%>
<% end if %>
<%end if%>
<%end if%>
</table>
</div><!--cindy add for id="block1" 12/04-->

<div id="block1"><!--cindy add for id="block1" 12/04-->
<!--TABLE1 ipv4 sub-title  start -->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr style="height:25px;width:100%;background:#e6e6e6;">
<td width="250px" align=left  class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","DeviceLANIPv4statusText","s")%></td>
</tr>
</table>
<!--TABLE1 ipv4 sub-title  start -->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td width="20px">&nbsp; </td>
<td width="250px" align=left  class="tabdata">  <%tcWebApi_get("String_Entry","DeviceIPAddressText","s")%></td>
<td align=left class="tabdata"><%If tcWebApi_staticGet("Info_Ether","ip","h") <> "N/A" Then tcWebApi_staticGet("Info_Ether","ip","s") end if%> </td>
</tr>
<tr height="30px">
<td width="20px">&nbsp; </td>
<td width="250px" align=left  class="tabdata"><%tcWebApi_get("String_Entry","DeviceSubnetMaskText","s")%></td>
<td align=left class="tabdata"><%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" Then tcWebApi_staticGet("Lan_Entry","netmask","s") end if%></td>
</tr>

<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
<tr height="30px">
<td width="20px">&nbsp; </td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","LANDHCPText","s")%></td>
<td align=left class="tabdata"><%If tcWebApi_get("Lan_Dhcp","type","h") = "1" Then tcWebApi_get("String_Entry","LANDHCP1Text","s") 
elseif tcWebApi_staticGet("Lan_Dhcp","type","h") = "2" Then tcWebApi_get("String_Entry","LANDHCP2Text","s") 
else tcWebApi_get("String_Entry","LANDHCP0Text","s") end if%></td>
</tr>
<%end if%>
</table>

<!--cindy add lan ipv4 DNS 03/06-->
<%if tcWebApi_get("Lan_Dhcp","type","h")="1" then %>
	<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
		<%if tcWebApi_get("Dhcpd_Common","type","h")="0" then %>
			<tr height="30px">
				<td width="20px">&nbsp; </td>
				<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","LANDNSSERVERTEXT","s")%></td>
				<td align=left class="tabdata"><%tcWebApi_get("Lan_Entry","IP","s")%></td>
			</tr>
		<% else %>
			<tr height="30px">
				<td width="20px">&nbsp; </td>
				<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","LANPrimaryDNSText","s")%></td>
				<td align=left class="tabdata"><%tcWebApi_get("Dhcpd_Common","Primary_DNS","s")%></td>
			</tr>

			<tr height="30px">
				<td width="20px">&nbsp; </td>
				<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","LANSecondaryDNSText","s")%></td>
				<td align=left class="tabdata"><%tcWebApi_get("Dhcpd_Common","Secondary_DNS","s")%></td>
			</tr>
		<% end if %>
	</table>
<% end if %>
<!--cindy add lan ipv4 DNS 03/06-->

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
<% if tcWebApi_staticGet("Info_Ether","isIPv6Supported","h") = "Yes" then %>

<tr style="height:25px;width:100%;background:#e6e6e6;">
<td align=left  class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","DeviceLANIPv6statusText","s")%></td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td width="20px">&nbsp; </td>
<td width="250px" align=left  class="tabdata"><%tcWebApi_get("String_Entry","DeviceLinkLocalIPText","s")%></td>
<td class="tabdata" align=left><%If tcWebApi_staticGet("DeviceInfo_LanIP6","LinkLocal","h") <> "N/A" Then tcWebApi_Get("DeviceInfo_LanIP6","LinkLocal","s") end if%> </td>
</tr>

<tr height="30px">
<td width="20px">&nbsp; </td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DeviceManuGlobalIPText","s")%></td>
<td align=left class="tabdata"><!--wang 20180104<%If tcWebApi_staticGet("DeviceInfo_LanIP6","ManualGlobal","h") <> "N/A" Then tcWebApi_Get("DeviceInfo_LanIP6","ManualGlobal","s") end if%></td>-->
<% tcWebApi_staticGet("DeviceInfo_LanIP6","ManualGlobal","s") %></td>
</tr>

<tr height="30px">
<td width="20px">&nbsp; </td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceDynaGlobalIPText","s")%></td>
<td align=left class="tabdata"><!--wang 20180104<%If tcWebApi_staticGet("DeviceInfo_LanIP6","DynamicGlobal0","h") <> "N/A" Then tcWebApi_Get("DeviceInfo_LanIP6","DynamicGlobal0","s") end if%></td>-->
<% tcWebApi_staticGet("DeviceInfo_LanIP6","DynamicGlobal0","s") %></td>
</tr>

<% If tcWebApi_staticGet("DeviceInfo_LanIP6","DynamicGlobal1","h") <> "N/A" Then %>
<!--wang modify it 20180104-->
<tr height="30px">  
<td width="20px">&nbsp; </td>
<td width="250px" align=left class="tabdata"></td>
<td align=left class="tabdata"><% tcWebApi_staticGet("DeviceInfo_LanIP6","DynamicGlobal1","s")%></td>
</tr>
<!--
<td class="light-orange">&nbsp;</td>
<td class="tabdata"><div align=right></div></td>
<td class="tabdata"><div align=center>:</div></td>
<td class="tabdata"><% tcWebApi_staticGet("DeviceInfo_LanIP6","DynamicGlobal1","s") %></td>
</tr> -->
<% end if %>

<tr height="30px">
<td width="20px">&nbsp; </td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DeviceDHCPServerText","s")%></td>
<td align=left class="tabdata"><%If tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" Then tcWebApi_get("String_Entry","LANDHCPv6Server1Text","s") else tcWebApi_get("String_Entry","LANDHCPv6Server0Text","s") end if%></td>
</tr>
<% end if %>
<% end if %>

<%if tcwebApi_get("WebCustom_Entry","is3GDongleSupport","h")="Yes" then%>
</table>
<!--TABLE1 end -->


<!--TABLE_ start -->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr>
<td width="30">&nbsp; </td>
<td width="150" height="15"></td>
<td  colspan="3" valign="middle"  class="title-main"><%tcWebApi_get("String_Entry","Dongle3GText","s")%></td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr>
<td class="light-orange">&nbsp;</td><td class="light-orange"></td><td class="tabdata"><div align=right>
<INPUT TYPE="HIDDEN" NAME="DongleConnFlag" VALUE="0">
  <%tcWebApi_get("String_Entry","DongleDeviceText","s")%>      </div></td><td class="tabdata" ><div align=center>:</div></td><td class="tabdata">
<%tcWebApi_get("Info_Dongle","Device","s")%>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
		<%If tcWebApi_get("Dongle_Entry","CONNECTION","h") = "Connect_Manually" then%>
        		<%If tcWebApi_staticGet("Info_Dongle","IP","h") <> "N/A" Then%>
        			<input type="button" name="DongleDisconnect" value="<%tcWebApi_get("String_Entry","ButtonDisconnectText","s")%>" onClick="dongle_reconnect(2)" >
        		<%else %>
        			<INPUT TYPE="button" NAME="DongleConnect" VALUE="<%tcWebApi_get("String_Entry","ButtonConnecttText","s")%>" onClick="dongle_reconnect(1)" >  		
			<%End if%>
		<%End if%>		
</td>
</tr>

<!--TABLE_  sub-title  start -->
<tr>
<td width="200">&nbsp; </td>
<td width="10">&nbsp; </td>
<td class="title-sub" width="150" style="padding-left:25px"> <%tcWebApi_get("String_Entry","DongleIPv4Text","s")%></td>
<td width="10">&nbsp;</td>
<td>&nbsp;</td>
</tr>
<!--TABLE_ sub-title  start -->

<tr>
<td class="light-orange">&nbsp;</td><td class="light-orange"></td><td class="tabdata"><div align=right>
  <%tcWebApi_get("String_Entry","DongleStatusText","s")%>      </div></td><td class="tabdata" ><div align=center>:</div></td><td class="tabdata">
<%tcWebApi_staticGet("Info_Dongle","Status","s")%>
</td></tr>

<tr>
<td class="light-orange">&nbsp;</td><td class="light-orange"></td><td class="tabdata"><div align=right>
  <%tcWebApi_get("String_Entry","DongleIPAddressText","s")%>  </div></td><td class="tabdata"><div align=center>:</div></td><td class="tabdata">
<%tcWebApi_staticGet("Info_Dongle","IP","s")%>       
</td></tr>

<tr>
<td class="light-orange">&nbsp;</td><td class="light-orange">&nbsp;</td><td class="tabdata"><div align=right>
  <%tcWebApi_get("String_Entry","DongleMaskText","s")%>  </div></td><td class="tabdata"><div align=center>:</div></td><td class="tabdata">
<%tcWebApi_staticGet("Info_Dongle","SubMask","s")%>  	  
</td></tr>

<tr>
<td class="light-orange">&nbsp;</td><td class="light-orange"></td><td class="tabdata"><div align=right>
  <%tcWebApi_get("String_Entry","DongleGatewayText","s")%>  </div></td><td class="tabdata"><div align=center>:</div></td><td class="tabdata">
<%tcWebApi_staticGet("Info_Dongle","DefGW","s")%>	
</td>
</tr>

<tr>
<td class="light-orange">&nbsp;</td><td class="light-orange"></td><td class="tabdata"><div align=right>
  <%tcWebApi_get("String_Entry","DongleDNSText","s")%>  </div></td><td class="tabdata"><div align=center>:</div></td><td class="tabdata">
<% if tcWebApi_get("Dproxy_Entry","type","h") = "1" then %>
<%tcWebApi_staticGet("Dproxy_Entry","Primary_DNS","s")%>
<%else%>
<%tcWebApi_staticGet("Info_Dongle","DNSIP","s")%>
<%end if%>
</tr>
<%end if%>
<%if tcWebApi_get("DeviceInfo", "isSFU", "h") = "Yes" then%>
<%else%>
</table>
<!--TABLE_ end -->
</div><!--cindy add for id="block1" 12/04-->


<div id="block1">
<!--TABLE2(WAN) start -->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr style="height:25px;width:100%;background:#e6e6e6;">
<td width="250px" align=left class="title-main" style="padding-left:20px;">
<%tcWebApi_get("String_Entry","DeviceWANText","s")%></td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<INPUT TYPE="HIDDEN" NAME="IPv6PrivacyAddrsSupportedFlag" value="<%tcWebApi_get("WebCustom_Entry","isIPv6PrivacyAddrsSupported","s")%>" >

<!--cindy delete 12/04
<tr>
<td class="light-orange">&nbsp;</td>
<td class="light-orange">&nbsp;</td>
<td class="tabdata"><div align=right>
<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then%>
	<%tcWebApi_get("String_Entry","NavigationInterfaceText","s")%>
<%else%>
	<%tcWebApi_get("String_Entry","DeviceVirtualCircuitText","s")%>
<%end if%>  </div></td>
<td class="tabdata"><div align=center>:</div></td>
<td class="tabdata" color="gray">
<SELECT NAME="DvInfo_PVC" SIZE="1" onChange="doSave()">
<%if tcWebApi_get("WebCustom_Entry", "haveXPON", "h") = "Yes" then%>
		<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
		<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
		<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
		<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
		<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
		<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
		<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
		<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
<%else%>
<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") = "Yes" then%>
<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
<%else%>
	<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
		<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
		<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
		<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
		<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
		<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
		<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
		<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
		<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
	<%end if%>
	<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
		<OPTION value="8" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "8" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC8Text","s")%>
	<%end if%>
	<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
		<OPTION value="10" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "10" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC10Text","s")%>
	<%end if%>

<%end if%>
<%end if%>
</SELECT>
</td>
</tr>
-->

<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
<% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "8" then%>
	<tr><td class="light-orange">&nbsp;</td><td class="light-orange">&nbsp;</td><td class="tabdata"><div align=right>
	  <%tcWebApi_get("String_Entry","DeviceServiceText","s")%>  </div></td><td class="tabdata"><div align=center>:</div></td>
	<td class="tabdata">
	<SELECT NAME="DvInfo_PVC_Ext" SIZE="1" onChange="doSave()">
		<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "0" then asp_Write("selected") end if %>>0
		<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "1" then asp_Write("selected") end if %>>1
		<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "2" then asp_Write("selected") end if %>>2
		<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "3" then asp_Write("selected") end if %>>3
		<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "4" then asp_Write("selected") end if %>>4
		<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "5" then asp_Write("selected") end if %>>5
		<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "6" then asp_Write("selected") end if %>>6
		<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "7" then asp_Write("selected") end if %>>7
	</SELECT></td></tr></tr>
<%end if%>
<%end if%>
<%end if%>

<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
<% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc","h") = "10" then%>
	<tr><td class="light-orange">&nbsp;</td><td class="light-orange">&nbsp;</td><td class="tabdata"><div align=right>
	  <%tcWebApi_get("String_Entry","DeviceServiceText","s")%>  </div></td><td class="tabdata"><div align=center>:</div></td>
	<td class="tabdata">
	<SELECT NAME="DvInfo_PVC_Ext" SIZE="1" onChange="doSave()">
		<OPTION value="0" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "0" then asp_Write("selected") end if %>>0
		<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "1" then asp_Write("selected") end if %>>1
		<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "2" then asp_Write("selected") end if %>>2
		<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "3" then asp_Write("selected") end if %>>3
		<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "4" then asp_Write("selected") end if %>>4
		<OPTION value="5" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "5" then asp_Write("selected") end if %>>5
		<OPTION value="6" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "6" then asp_Write("selected") end if %>>6
		<OPTION value="7" <% if tcWebApi_staticGet("WebCurSet_Entry","dev_pvc_ext","h") = "7" then asp_Write("selected") end if %>>7
	</SELECT></td></tr></tr>
<%end if%>
<%end if%>
<%end if%>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">
<%tcWebApi_get("String_Entry","DeviceConnectionTypeText","s")%></td>
<td align=left class="tabdata"><INPUT TYPE="HIDDEN" NAME="DipConnFlag" VALUE="0">
        <% if tcWebApi_get("DeviceInfo_PVC","connType","h") <> "" then tcWebApi_staticGet("DeviceInfo_PVC","connType","s")  end if %>
        &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
		<%If tcWebApi_staticGet("DeviceInfo_PVC","DispConnBtnType","h") <> "0" then%>
        	<%If tcWebApi_staticGet("DeviceInfo_PVC","Status","h") = "1" Then%>
        	<input type="button" class="button1" name="Disconnect" value="<%tcWebApi_get("String_Entry","ButtonDisconnectText","s")%>" onClick="reconnect(2)" >
        	<%elseif tcWebApi_staticGet("DeviceInfo_PVC","IP6Status","h") = "1" Then%>
        	<input type="button" class="button1" name="Disconnect" value="<%tcWebApi_get("String_Entry","ButtonDisconnectText","s")%>" onClick="reconnect(2)" > 
        	<%else %>
        	<INPUT TYPE="button" class="button1" NAME="Connect" VALUE="<%tcWebApi_get("String_Entry","ButtonConnecttText","s")%>" onClick="reconnect(1)" >  		
			<%End if%>
		<%End if%>
</td>
</tr>

<%If tcWebApi_staticGet("DeviceInfo_PVC","DispPPPconn","h") <> "0" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">
<%tcWebApi_get("String_Entry","DevicePPPconnectiontimeText","s")%></td>
<td class="tabdata">
<%tcWebApi_staticGet("DeviceInfo_PVC","pppConnTime","s")%>	
</td>
</tr>
<%end if%>

<!--wang add start for display pppoe username 20171007-->
<%IF tcWebApi_staticGet("Wan_PVC","ISP","h") = "2" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DevicePPPoEUsernameText","s")%></td>
<td align=left class="tabdata">  <% if tcWebApi_get("Wan_PVC","USERNAME","h") <> "" then tcWebApi_staticGet("Wan_PVC","USERNAME","s")  end if %></td>
  </tr>

<tr height="30px">
<INPUT TYPE="HIDDEN" NAME="ReconnectPPPoEflag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="wan_PPPUsername" value="<%tcWebApi_get("Wan_PVC","USERNAME","s")%>" >
<INPUT TYPE="HIDDEN" NAME="wan_PPPPassword" value="<%tcWebApi_get("Wan_PVC","PASSWORD","s")%>" >
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","WANPppoeReconnectText","s")%></td>
<td align=left class="tabdata">
     <input type="button" name="pppoe_Reconnect" class="button2" onclick="onClickreconnetPPPoE();" value="<%tcWebApi_get("String_Entry","WANPppoeReconnect0Text","s")%>">
 </td>
</tr>
<%end if%>
<!--end -->
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<!--TABLE2  ipv4 sub-title  start -->
<%If tcWebApi_staticGet("Wan_PVC","ISP","h") <> "3" then%>  <!--wang add 20180123-->
<%If tcWebApi_staticGet("Wan_PVC","IPVERSION","h") <> "IPv6" then%>
<tr style="height:25px;width:100%;background:#e6e6e6;">
<td width="250px" align=left class="title-main" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","DeviceWANIPv4statusText","s")%></td>
</tr>
<!--TABLE2  ipv4 sub-title  end -->
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DeviceStatusText","s")%></td>
<td align=left class="tabdata">
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

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceWANIPAddressText","s")%></td>
<td align=left class="tabdata">
	<%tcWebApi_staticGet("DeviceInfo_PVC","WanIP","s")%></td>     		
</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceWANSubnetMaskText","s")%></td>
<td align=left class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","WanSubMask","s")%></td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
	<td width="250px" align=left class="tabdata">
<%if tcWebApi_get("WebCustom_Entry","isWanDNSEachPVC","h") = "Yes" then%>
  <%tcWebApi_get("String_Entry","DeviceWANGatewayText","s")%></td>
	<td align=left class="tabdata"><%  tcWebApi_staticGet("DeviceInfo_PVC","gateway","s") %>
<%else%>
        <%tcWebApi_get("String_Entry","DeviceWANDefaultGatewayText","s")%></td>
	<td align=left class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","WanDefGW","s")%>
<%end if%>	
</td>
</tr>

<%if tcwebApi_get("WebCustom_Entry","isWanDNSEachPVC","h") = "Yes" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","WANIPv4PrimaryDNSTest","s")%></td>
<td align=left class="tabdata"><%  tcWebApi_staticGet("DeviceInfo_PVC","DNSIP","s") %></td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","WANIPv4SecondaryDNSTest","s")%></td>
<td align=left class="tabdata"><% tcWebApi_staticGet("DeviceInfo_PVC","SECDNSIP","s") %></td>
</tr>
<% else %>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  
<%if tcwebApi_get("WebCustom_Entry","isShow2DNS","h") = "Yes" then%>
<%tcWebApi_get("String_Entry","WANIPv4PrimaryDNSServerTest","s")%>
<% else %> 
<%tcWebApi_get("String_Entry","DeviceWANDNSServerText","s")%>
<% end if %>
</td>
<td align=left class="tabdata">
<script language="JavaScript" type="text/JavaScript">
var artIpver = ["<% tcWebApi_staticGet("Wan_PVC0","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC1","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC2","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC3","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC4","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC5","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC6","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC7","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC8","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC9","IPVERSION","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC10","IPVERSION","s") %>"];

/***wang modify, for primary dns can't be display on web 20180104 ***/
//	var pvc_index = parseInt(document.DvInfo_Form.DvInfo_PVC.value);
	var pvc_index = 0;
/***wang add end ****/

	var strtype = "<% tcWebApi_get("Dproxy_Entry","type","s") %>";
	var strPriDNS = "<% tcWebApi_staticGet("Dproxy_Entry","Primary_DNS","s") %>";
	var strDevDNS = "<% tcWebApi_staticGet("DeviceInfo_PVC","DNSIP","s") %>";
	
	if (("IPv6" == artIpver[pvc_index]) || ("N/A" == artIpver[pvc_index]))
		document.writeln("N/A");
	else{
		//Foxconn alan remove for Wan DNS
		/*
		if (strtype == "1") {
			document.writeln(strPriDNS);
		}
		else{
		*/
			document.writeln(strDevDNS);
		//}	
	}	
</script>
</td>
</tr>

<%if tcwebApi_get("WebCustom_Entry","isShow2DNS","h") = "Yes" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","WANIPv4SecondaryDNSServerTest","s")%></td>
<td align=left class="tabdata">
<script language="JavaScript" type="text/JavaScript">

	var strSecDNS = "<% tcWebApi_staticGet("Dproxy_Entry","Secondary_DNS","s") %>";
	var strSecDevDNS = "<% tcWebApi_staticGet("DeviceInfo_PVC","SECDNSIP","s") %>";
	
	if (("IPv6" == artIpver[pvc_index]) || ("N/A" == artIpver[pvc_index]))
		document.writeln("N/A");
	else{
		//Foxconn alan remove for Wan DNS
		/*
		if (strtype == "1") {
			document.writeln(strSecDNS);
		}
		else{
		*/
			document.writeln(strSecDevDNS);
		//}	
	}	
</script>
</td>
</tr>
<%end if%>

<%end if%>
<%end if%> <!--wang 20180123-->
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
<% if tcWebApi_staticGet("Info_Ether","isIPv6Supported","h") = "Yes" then %>
<%If tcWebApi_staticGet("Wan_PVC","IPVERSION","h") <> "IPv4" then%><!--wang add 20180123-->
<!--TABLE2  ipv6 sub-title  start -->
<tr style="height:25px;width:100%;background:#e6e6e6;">
<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","DeviceWANIPv6statusText","s")%></td>
</tr>
<!--TABLE2  ipv6 sub-title  end -->
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceStatusText","s")%> </td>
<td align=left class="tabdata">
<%
if tcWebApi_staticGet("GUI_Entry0","Custom","h") = "C9" then
    If tcWebApi_staticGet("DeviceInfo_PVC","IP6Status","h") = "3" Then
	asp_Write("ADSL CONNECTION FAILURE")
    elseif tcWebApi_staticGet("DeviceInfo_PVC","IP6Status","h") = "5" Then 
	asp_Write("PPP up") 
    elseif tcWebApi_staticGet("DeviceInfo_PVC","IP6Status","h") = "4" Then  
	asp_Write("PPP down")
    elseif tcWebApi_staticGet("DeviceInfo_PVC","IP6Status","h") = "2" Then
	asp_Write("PPP USERNAME/PASSWORD INVALID")
    elseif tcWebApi_staticGet("DeviceInfo_PVC","IP6Status","h") = "1" Then
	asp_Write("Connected")
    else asp_Write("Not Connected") 
    end if
else
    If tcWebApi_staticGet("DeviceInfo_PVC","IP6Status","h") = "1" Then asp_Write("Connected") else asp_Write("Not Connected") end if
end if
%>
</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceWANIPAddressText","s")%></td>
<td align=left class="tabdata">
<script language="JavaScript" type="text/JavaScript">
	var str_IP6 = "<%tcWebApi_get("DeviceInfo_PVC","IP6WanIP","s")%>";
	if("N/A" != str_IP6){
		var str_ip6value = str_IP6;
		var vlen = str_IP6.indexOf('/');
		if(vlen != -1){
			str_ip6value = str_IP6.substring(0, vlen);
		}
		document.writeln(str_ip6value);
	}
	else{
		document.writeln(str_IP6);
	}
	</script>  		
</td>
</tr>

<%if tcWebApi_get("WebCustom_Entry","isIPv6PrivacyAddrsSupported","h") = "Yes" then%>
<% If tcWebApi_staticGet("DeviceInfo_PVC","IP6SecWanIP","h") <> "N/A" Then %>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata">  <%tcWebApi_get("String_Entry","DeviceSECWANIPAddressText","s")%></td>
<td align=left class="tabdata">
<script language="JavaScript" type="text/JavaScript">
	var str_IP6 = "<%tcWebApi_get("DeviceInfo_PVC","IP6SecWanIP","s")%>";
	if("N/A" != str_IP6){
		var str_ip6value = str_IP6;
		var vlen = str_IP6.indexOf('/');
		if(vlen != -1){
			str_ip6value = str_IP6.substring(0, vlen);
		}
		document.writeln(str_ip6value);
	}
	else{
		document.writeln(str_IP6);
	}
</script>  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
</td>
</tr>
<%end if%>
<%End if%>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceWANPrefixLengthText","s")%></td>
<td align=left class="tabdata">
<script language="JavaScript" type="text/JavaScript">
	if("N/A" != str_IP6){
		var str_prelen = "64";
		var plen = str_IP6.indexOf('/');
		if(plen != -1){
			str_prelen = str_IP6.substring(1+plen, 3+plen);
		}
		document.writeln(str_prelen);
	}
	else{
		document.writeln(str_IP6);
	}
</script>
</td>
</tr>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceWANDefaultGatewayText","s")%></td>
<td align=left class="tabdata">
<%tcWebApi_staticGet("DeviceInfo_PVC","IP6WanDefGW","s")%>	
</td>
	</tr>
	
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","WANIPv6PrimaryDNSServerTest","s")%></td>
<td align=left class="tabdata">
<%tcWebApi_staticGet("DeviceInfo_PVC","IP6DNSIP","s")%>
		</td>
</tr>

<%if tcwebApi_get("WebCustom_Entry","isShowIP62DNS","h") = "Yes" then%>
<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","WANIPv6SecondaryDNSServerTest","s")%></td>
		<td align=left class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","IP6SECDNSIP","s")%></td>
	</tr>
	<% end if %>

<tr height="30px">
<td width="20px">&nbsp;</td>
<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","DeviceWANPrefixDelegationText","s")%></td>
<td align=left class="tabdata"><%tcWebApi_staticGet("DeviceInfo_PVC","IP6PreDelegation","s")%>	</td>
	</tr>

	<% end if %>
<%end if%><!-- end ("Wan_PVC","IPVERSION","h") <> "IPv4" -->
<%end if%>
	<%end if%>
<%end if%><!--wang end  ("Wan_PVC","ISP","h") <> "3" -->
</table>
</div><!--id="block1" 12/04-->
<!--TABLE2(WAN) end -->


<div id="button0">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
	<tr height="25px">		
		<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;"><%tcWebApi_get("String_Entry","WANPppoeRefresh0Text","s")%></td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
<tr height="40px">
<td width="250px" align=left class="tabdata" style="padding-left:20px;">
<input type="button" class="button1" onclick="Reload()" value="<%tcWebApi_get("String_Entry","ButtonRefresh0Text","s")%>">
</td>
</tr>
</table>
</div><!-- id="button0"-->
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

</form>    
</BODY>
</HTML>
