<%
If Request_Form("Auth_Flag")="1" then 
	If Request_Form("Epon_Flag")="1" then 
		If Request_Form("Auth_ModleFlag")="1" then 
			TCWebApi_set("EPON_ONU1","VendorID","VendorID1")
			TCWebApi_set("Info_Ether","mac","macaddr1")
			TCWebApi_set("EPON_ONU1","HWVer","HWVer1")
			TCWebApi_set("EPON_ONU1","SWVer","SWVer1")
			TCWebApi_set("EPON_ONU1","Model","VendorType1")
			TCWebApi_set("EPON_ONU1","Auth_Modle","Auth_Modle")
			tcWebApi_commit("EPON_ONU1")
		elseif Request_Form("Auth_ModleFlag")="2" then 
			TCWebApi_set("EPON_ONU2","VendorID","VendorID2")
			TCWebApi_set("Info_Ether","mac","macaddr2")
			TCWebApi_set("EPON_ONU2","HWVer","HWVer2")
			TCWebApi_set("EPON_ONU2","SWVer","SWVer2")
			TCWebApi_set("EPON_ONU2","Model","VendorType2")
			TCWebApi_set("EPON_ONU2","Auth_Modle","Auth_Modle")
			tcWebApi_commit("EPON_ONU2")
		elseif Request_Form("Auth_ModleFlag")="3" then 
			TCWebApi_set("EPON_ONU3","VendorID","VendorID3")
			TCWebApi_set("Info_Ether","mac","macaddr3")
			TCWebApi_set("EPON_ONU3","HWVer","HWVer3")
			TCWebApi_set("EPON_ONU3","SWVer","SWVer3")
			TCWebApi_set("EPON_ONU3","Model","VendorType3")
			TCWebApi_set("EPON_ONU3","Auth_Modle","Auth_Modle")
			tcWebApi_commit("EPON_ONU3")
		elseif Request_Form("Auth_ModleFlag")="4" then 
			TCWebApi_set("EPON_ONU4","VendorID","VendorID4")
			TCWebApi_set("Info_Ether","mac","macaddr4")
			TCWebApi_set("EPON_ONU4","HWVer","HWVer4")
			TCWebApi_set("EPON_ONU4","SWVer","SWVer4")
			TCWebApi_set("EPON_ONU4","Model","VendorType4")
			TCWebApi_set("EPON_ONU4","Auth_Modle","Auth_Modle")
			tcWebApi_commit("EPON_ONU4")
		end if
			TCWebApi_set("EPON_ONU","VendorID","v_VendorID")
			TCWebApi_set("Info_Ether","mac","macaddr")
			TCWebApi_set("EPON_ONU","HWVer","v_HWVer")
			TCWebApi_set("EPON_ONU","SWVer","v_SWVer")
			TCWebApi_set("EPON_ONU","Model","v_VendorType")
			TCWebApi_set("EPON_ONU","Auth_Modle","Auth_Modle")
			tcWebApi_commit("Info_devDefInf")
			tcWebApi_commit("EPON_ONU")
			tcWebApi_commit("Info_Ether")
	end if
	If Request_Form("Gpon_Flag")="1" then 
			TCWebApi_set("GPON_ONU","VendorId","VendorID_GPON")
			TCWebApi_set("GPON_ONU","SerialNumber","macaddr")
			TCWebApi_set("GPON_ONU","EquipmentId","VendorType_GPON")
			tcWebApi_commit("GPON_ONU")
	end if
end if
%>

<!--
If you execute doRefresh() and then reload webpage, doRefresh() will be disabled.
Therefore, execute doRefresh() after webpage reloads.
-->

<html><head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="/style.css" tppabs="/style.css">

<script language="JavaScript" src="/val.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
<script language="JavaScript">
var Mode = '<% tcWebApi_get("XPON_LinkCfg","Mode","s") %>';
function Auth_modle_Save()
{
	if(Mode == 2)
	{
		var Modleindex = document.AUTH_form.Auth_Modle.selectedIndex;
		if(Modleindex == 0)
		{
				if(document.AUTH_form.v_Auth_Modle.value == 0){		
					document.AUTH_form.v_VendorID.value = document.AUTH_form.VendorID1.value;
					document.AUTH_form.v_VendorType.value = document.AUTH_form.VendorType1.value;
					document.AUTH_form.v_HWVer.value = document.AUTH_form.HWVer1.value;
					document.AUTH_form.v_SWVer.value = document.AUTH_form.SWVer1.value;
				}
				else{
					document.AUTH_form.VendorID1.value = document.AUTH_form.v_VendorID.value;
					document.AUTH_form.VendorType1.value = document.AUTH_form.v_VendorType.value;
					document.AUTH_form.HWVer1.value = document.AUTH_form.v_HWVer.value;
					document.AUTH_form.SWVer1.value = document.AUTH_form.v_SWVer.value;
				}
		}
		else if(Modleindex == 1)
		{
			if(document.AUTH_form.v_Auth_Modle.value == 0){		
					document.AUTH_form.v_VendorID.value = document.AUTH_form.VendorID2.value;
					document.AUTH_form.v_VendorType.value = document.AUTH_form.VendorType2.value;
					document.AUTH_form.v_HWVer.value = document.AUTH_form.HWVer2.value;
					document.AUTH_form.v_SWVer.value = document.AUTH_form.SWVer2.value;
				}
				else{
					document.AUTH_form.VendorID2.value = document.AUTH_form.v_VendorID.value;
					document.AUTH_form.VendorType2.value = document.AUTH_form.v_VendorType.value;
					document.AUTH_form.HWVer2.value = document.AUTH_form.v_HWVer.value;
					document.AUTH_form.SWVer2.value = document.AUTH_form.v_SWVer.value;
				}
		}
		else if(Modleindex == 2)
		{
			if(document.AUTH_form.v_Auth_Modle.value == 0){		
					document.AUTH_form.v_VendorID.value = document.AUTH_form.VendorID3.value;
					document.AUTH_form.v_VendorType.value = document.AUTH_form.VendorType3.value;
					document.AUTH_form.v_HWVer.value = document.AUTH_form.HWVer3.value;
					document.AUTH_form.v_SWVer.value = document.AUTH_form.SWVer3.value;
				}
				else{
					document.AUTH_form.VendorID3.value = document.AUTH_form.v_VendorID.value;
					document.AUTH_form.VendorType3.value = document.AUTH_form.v_VendorType.value;
					document.AUTH_form.HWVer3.value = document.AUTH_form.v_HWVer.value;
					document.AUTH_form.SWVer3.value = document.AUTH_form.v_SWVer.value;
				}
		}
		else
		{
				if(document.AUTH_form.v_Auth_Modle.value == 0){	
					document.AUTH_form.v_VendorID.value = document.AUTH_form.VendorID4.value;
					document.AUTH_form.v_VendorType.value = document.AUTH_form.VendorType4.value;
					document.AUTH_form.v_HWVer.value = document.AUTH_form.HWVer4.value;
					document.AUTH_form.v_SWVer.value = document.AUTH_form.SWVer4.value;
				}
				else{
					document.AUTH_form.VendorID4.value = document.AUTH_form.v_VendorID.value;
					document.AUTH_form.VendorType4.value = document.AUTH_form.v_VendorType.value;
					document.AUTH_form.HWVer4.value = document.AUTH_form.v_HWVer.value;
					document.AUTH_form.SWVer4.value = document.AUTH_form.v_SWVer.value;
				}
		}
		
		if(Modleindex == 0)
		{
			document.AUTH_form.Auth_ModleFlag.value=1;
		}
		else if(Modleindex == 1)
		{
			document.AUTH_form.Auth_ModleFlag.value=2;
		}
		else if(Modleindex == 2)
		{
			document.AUTH_form.Auth_ModleFlag.value=3;
		}
		else
		{
			document.AUTH_form.Auth_ModleFlag.value=4;
		}
		document.AUTH_form.Epon_Flag.value=1;
	}
	else if(Mode ==1)
	{
		document.AUTH_form.Gpon_Flag.value=1;
	}
		document.AUTH_form.Auth_Flag.value=1;
		document.AUTH_form.submit();
}

function modlechange()
{
		var modleindex =document.AUTH_form.Auth_Modle.selectedIndex;
		var modlevalue = "";
		document.AUTH_form.v_Auth_Modle.value = -1;
		switch(modleindex)
		{
			case 0:
				modlevalue = "<% If TCWebApi_get("EPON_ONU1","Auth_Modle","h") <> "N/A" then TCWebApi_get("EPON_ONU1","Auth_Modle","s") end if%>";
				if(modlevalue == "Normal_Modle") document.AUTH_form.v_Auth_Modle.value = 0;
				VendorID0.style.display = '';
				VendorID1.style.display = 'none';
				VendorID2.style.display = 'none';
				VendorID3.style.display = 'none';
				VendorType0.style.display = '';
				VendorType1.style.display = 'none';
				VendorType2.style.display = 'none';
				VendorType3.style.display = 'none';
				HWVer0.style.display = '';
				HWVer1.style.display = 'none';
				HWVer2.style.display = 'none';
				HWVer3.style.display = 'none';
				SWVer0.style.display = '';
				SWVer1.style.display = 'none';
				SWVer2.style.display = 'none';
				SWVer3.style.display = 'none';
				macaddr0.style.display = '';
				macaddr1.style.display = 'none';
				macaddr2.style.display = 'none';
				macaddr3.style.display = 'none';
				break;
			case 1:
				modlevalue = "<% If TCWebApi_get("EPON_ONU2","Auth_Modle","h") <> "N/A" then TCWebApi_get("EPON_ONU2","Auth_Modle","s") end if%>";
				if(modlevalue == "HWTC_Modle") document.AUTH_form.v_Auth_Modle.value = 0;
				VendorID0.style.display = 'none';
				VendorID1.style.display = '';
				VendorID2.style.display = 'none';
				VendorID3.style.display = 'none';
				VendorType0.style.display = 'none';
				VendorType1.style.display = '';
				VendorType2.style.display = 'none';
				VendorType3.style.display = 'none';
				HWVer0.style.display = 'none';
				HWVer1.style.display = '';
				HWVer2.style.display = 'none';
				HWVer3.style.display = 'none';
				SWVer0.style.display = 'none';
				SWVer1.style.display = '';
				SWVer2.style.display = 'none';
				SWVer3.style.display = 'none';
				macaddr0.style.display = 'none';
				macaddr1.style.display = '';
				macaddr2.style.display = 'none';
				macaddr3.style.display = 'none';
				break;
			case 2:
				modlevalue = "<% If TCWebApi_get("EPON_ONU3","Auth_Modle","h") <> "N/A" then TCWebApi_get("EPON_ONU3","Auth_Modle","s") end if%>";
				if(modlevalue == "ZTE_Modle") document.AUTH_form.v_Auth_Modle.value = 0;
				VendorID0.style.display = 'none';
				VendorID1.style.display = 'none';
				VendorID2.style.display = '';
				VendorID3.style.display = 'none';
				VendorType0.style.display = 'none';
				VendorType1.style.display = 'none';
				VendorType2.style.display = '';
				VendorType3.style.display = 'none';
				HWVer0.style.display = 'none';
				HWVer1.style.display = 'none';
				HWVer2.style.display = '';
				HWVer3.style.display = 'none';
				SWVer0.style.display = 'none';
				SWVer1.style.display = 'none';
				SWVer2.style.display = '';
				SWVer3.style.display = 'none';
				macaddr0.style.display = 'none';
				macaddr1.style.display = 'none';
				macaddr2.style.display = '';
				macaddr3.style.display = 'none';
				break;
			case 3:
				modlevalue = "<% If TCWebApi_get("EPON_ONU4","Auth_Modle","h") <> "N/A" then TCWebApi_get("EPON_ONU4","Auth_Modle","s") end if%>";
				if(modlevalue == "Special_Modle") document.AUTH_form.v_Auth_Modle.value = 0;
				VendorID0.style.display = 'none';
				VendorID1.style.display = 'none';
				VendorID2.style.display = 'none';
				VendorID3.style.display = '';
				VendorType0.style.display = 'none';
				VendorType1.style.display = 'none';
				VendorType2.style.display = 'none';
				VendorType3.style.display = '';
				HWVer0.style.display = 'none';
				HWVer1.style.display = 'none';
				HWVer2.style.display = 'none';
				HWVer3.style.display = '';
				SWVer0.style.display = 'none';
				SWVer1.style.display = 'none';
				SWVer2.style.display = 'none';
				SWVer3.style.display = '';
				macaddr0.style.display = 'none';
				macaddr1.style.display = 'none';
				macaddr2.style.display = 'none';
				macaddr3.style.display = '';
				break;	
			default:
				break;
			
		}
}

function tableshow()
{
	if(Mode == 1)
	{
		document.getElementById('eponmode').style.display = 'none';
		document.getElementById('gponmode').style.display = '';
	}
	else if(Mode == 2)
	{
		document.getElementById('eponmode').style.display = '';
		document.getElementById('gponmode').style.display = 'none';
	}
}

function PageLoad()
{
	tableshow();
	if(Mode == 2)
		modlechange();	
}
</script>
</head>
<body onload="PageLoad();">
<FORM METHOD="POST" ACTION="/cgi-bin/authmode_setting.asp" name="AUTH_form">
	<table width="760" border="0" align=center cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="eponmode">
	<tr>
		<td width="150" height="30" class="title-main"><font color="#FFFFFF">
			<% tcWebApi_get("String_Entry","PonAuthJS17Text","s") %>
			</font></td>
		<td width="10" class="black">&nbsp;</td>
		<td width="150"></td>
		<td width="10" ></td>
		<td width="440"></td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000"><%tcWebApi_get("String_Entry","PonAuthJS16Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<input type="hidden" name="v_VendorID" value="<% If TCWebApi_get("EPON_ONU","VendorID","h") <> "N/A" then TCWebApi_get("EPON_ONU","VendorID","s") end if%>">
		<input type="hidden" name="v_VendorType" value="<% If TCWebApi_get("EPON_ONU","Model","h") <> "N/A" then TCWebApi_get("EPON_ONU","Model","s") end if%>">
		<input type="hidden" name="v_HWVer" value="<% If TCWebApi_get("EPON_ONU","HWVer","h") <> "N/A" then TCWebApi_get("EPON_ONU","HWVer","s") end if%>">
		<input type="hidden" name="v_SWVer" value="<% If TCWebApi_get("EPON_ONU","SWVer","h") <> "N/A" then TCWebApi_get("EPON_ONU","SWVer","s") end if%>">
		<input type="hidden" name="v_Auth_Modle" value="N/A">
		<input type="hidden" name="Auth_Flag" value="0">
		<INPUT TYPE="HIDDEN" NAME="Auth_ModleFlag" VALUE="0">
		<input type="hidden" name="Epon_Flag" value="0">
		<input type="hidden" name="Gpon_Flag" value="0">
		<td class="tabdata">
			<SELECT NAME="Auth_Modle" SIZE="1" MAXLENGTH="15" onchange="modlechange()">
				<option value="Normal_Modle" <% if tcWebApi_get("EPON_ONU","Auth_Modle","h") = "Normal_Modle"  then asp_Write("selected") end if %>><%If tcWebApi_get("String_Entry","PonAuthJS19Text","h") <> "N/A" then tcWebApi_get("String_Entry","PonAuthJS19Text","s") end if%></option>
				<option value="HWTC_Modle" <% if tcWebApi_get("EPON_ONU","Auth_Modle","h") = "HWTC_Modle"  then asp_Write("selected") end if %>><%If tcWebApi_get("String_Entry","PonAuthJS20Text","h") <> "N/A" then tcWebApi_get("String_Entry","PonAuthJS20Text","s") end if%></option>
				<option value="ZTE_Modle" <% if tcWebApi_get("EPON_ONU","Auth_Modle","h") = "ZTE_Modle"  then asp_Write("selected") end if %>><%If tcWebApi_get("String_Entry","PonAuthJS21Text","h") <> "N/A" then tcWebApi_get("String_Entry","PonAuthJS21Text","s") end if%></option>
				<option value="Special_Modle" <% if tcWebApi_get("EPON_ONU","Auth_Modle","h") = "Special_Modle"  then asp_Write("selected") end if %>><%If tcWebApi_get("String_Entry","PonAuthJS22Text","h") <> "N/A" then tcWebApi_get("String_Entry","PonAuthJS22Text","s") end if%></option>
				</SELECT>
		</td>
	</tr>
	<tr>		
		<td width="150" height="25" class="light-orange"></td>
		<td width="10" class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000">
			<%tcWebApi_get("String_Entry","PonAuthJS18Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata" id="VendorID0">
		  <INPUT TYPE="TEXT" NAME="VendorID1" SIZE="30" MAXLENGTH="24" VALUE="<% If TCWebApi_get("EPON_ONU1","VendorID","h") <> "N/A" then TCWebApi_get("EPON_ONU1","VendorID","s") end if%>" >
		</td>
		<td class="tabdata" id="VendorID1">
			<INPUT TYPE="TEXT" NAME="VendorID2" SIZE="30" MAXLENGTH="24" VALUE="<% TCWebApi_get("EPON_ONU2","VendorID","h")%>" >
		</td>
		<td class="tabdata" id="VendorID2">
			<INPUT TYPE="TEXT" NAME="VendorID3" SIZE="30" MAXLENGTH="24" VALUE="<% TCWebApi_get("EPON_ONU3","VendorID","h")%>" >
		</td>
		<td class="tabdata" id="VendorID3">
			<INPUT TYPE="TEXT" NAME="VendorID4" SIZE="30" MAXLENGTH="24" VALUE="<% If TCWebApi_get("EPON_ONU4","VendorID","h") <> "N/A" then TCWebApi_get("EPON_ONU4","VendorID","s") end if%>" >
		</td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000"><%tcWebApi_get("String_Entry","PonAuthJS11Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata" id="VendorType0">
			<INPUT TYPE="TEXT" NAME="VendorType1" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("EPON_ONU1","Model","h") <> "N/A" then TCWebApi_get("EPON_ONU1","Model","s") end if%>" ></td>
		<td class="tabdata" id="VendorType1">	
			<INPUT TYPE="TEXT" NAME="VendorType2" SIZE="30" MAXLENGTH="15" VALUE="<% TCWebApi_get("EPON_ONU2","Model","h")%>" ></td>
		<td class="tabdata" id="VendorType2">	
			<INPUT TYPE="TEXT" NAME="VendorType3" SIZE="30" MAXLENGTH="15" VALUE="<% TCWebApi_get("EPON_ONU3","Model","h")%>" ></td>
		<td class="tabdata" id="VendorType3">	
			<INPUT TYPE="TEXT" NAME="VendorType4" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("EPON_ONU4","Model","h") <> "N/A" then TCWebApi_get("EPON_ONU4","Model","s") end if%>" >
		</td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000"><%tcWebApi_get("String_Entry","PonAuthJS12Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata" id="macaddr0">
			<INPUT TYPE="TEXT" NAME="macaddr1" SIZE="30" MAXLENGTH="15" VALUE="<% if TCWebApi_get("Info_Ether","mac","h") <> "N/A" then TCWebApi_get("Info_Ether","mac","s") end if%>" ></td>
		<td class="tabdata" id="macaddr1">
			<INPUT TYPE="TEXT" NAME="macaddr2" SIZE="30" MAXLENGTH="15" VALUE="<%TCWebApi_get("Info_Ether","mac","h")%>" ></td>
		<td class="tabdata" id="macaddr2">
			<INPUT TYPE="TEXT" NAME="macaddr3" SIZE="30" MAXLENGTH="15" VALUE="<%TCWebApi_get("Info_Ether","mac","h")%>" ></td>
		<td class="tabdata" id="macaddr3">
			<INPUT TYPE="TEXT" NAME="macaddr4" SIZE="30" MAXLENGTH="15" VALUE="<% if TCWebApi_get("Info_Ether","mac","h") <> "N/A" then TCWebApi_get("Info_Ether","mac","s") end if%>" >
		</td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000"><%tcWebApi_get("String_Entry","PonAuthJS13Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata" id="HWVer0">
			<INPUT TYPE="TEXT" NAME="HWVer1" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("EPON_ONU1","HWVer","h") <> "N/A" then TCWebApi_get("EPON_ONU1","HWVer","s") end if%>" ></td>
		<td class="tabdata" id="HWVer1">
			<INPUT TYPE="TEXT" NAME="HWVer2" SIZE="30" MAXLENGTH="15" VALUE="<% TCWebApi_get("EPON_ONU2","HWVer","h")%>" ></td>
		<td class="tabdata" id="HWVer2">
			<INPUT TYPE="TEXT" NAME="HWVer3" SIZE="30" MAXLENGTH="15" VALUE="<% TCWebApi_get("EPON_ONU3","HWVer","h")%>" ></td>
		<td class="tabdata" id="HWVer3">
			<INPUT TYPE="TEXT" NAME="HWVer4" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("EPON_ONU4","HWVer","h") <> "N/A" then TCWebApi_get("EPON_ONU4","HWVer","s") end if%>" >
		</td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000"><%tcWebApi_get("String_Entry","PonAuthJS14Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata" id="SWVer0">
			<INPUT TYPE="TEXT" NAME="SWVer1" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("EPON_ONU1","SWVer","h") <> "N/A" then TCWebApi_get("EPON_ONU1","SWVer","s") end if%>" ></td>
		<td class="tabdata" id="SWVer1">	
			<INPUT TYPE="TEXT" NAME="SWVer2" SIZE="30" MAXLENGTH="15" VALUE="<%TCWebApi_get("EPON_ONU2","SWVer","h")%>" ></td>
		<td class="tabdata" id="SWVer2">	
			<INPUT TYPE="TEXT" NAME="SWVer3" SIZE="30" MAXLENGTH="15" VALUE="<%TCWebApi_get("EPON_ONU3","SWVer","h")%>" ></td>
		<td class="tabdata" id="SWVer3">	
			<INPUT TYPE="TEXT" NAME="SWVer4" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("EPON_ONU4","SWVer","h") <> "N/A" then TCWebApi_get("EPON_ONU4","SWVer","s") end if%>" >
		</td>
	</tr>
</table>
	<table width="760" border="0" align=center cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" id="gponmode">
	<tr>
		<td width="150" height="30" class="title-main"><font color="#FFFFFF">
			<% tcWebApi_get("String_Entry","PonAuthJS17Text","s") %>
			</font></td>
		<td width="10" class="black">&nbsp;</td>
		<td width="150"></td>
		<td width="10" ></td>
		<td width="440"></td>
	</tr>
	<tr>		
		<td width="150" height="25" class="light-orange"></td>
		<td width="10" class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000">
			<%tcWebApi_get("String_Entry","PonAuthJS18Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
		  <INPUT TYPE="TEXT" NAME="VendorID_GPON" SIZE="30" MAXLENGTH="24" VALUE="<% If TCWebApi_get("GPON_ONU","VendorId","h") <> "N/A" then TCWebApi_get("GPON_ONU","VendorId","s") end if%>" >
		</td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000"><%tcWebApi_get("String_Entry","PonAuthJS11Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<INPUT TYPE="TEXT" NAME="VendorType_GPON" SIZE="30" MAXLENGTH="15" VALUE="<% If TCWebApi_get("GPON_ONU","EquipmentId","h") <> "N/A" then TCWebApi_get("GPON_ONU","EquipmentId","s") end if%>" ></td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right><font color="#000000"><%tcWebApi_get("String_Entry","PonAuthJS24Text","s")%></font></div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<INPUT TYPE="TEXT" NAME="SerialNum_GPON" SIZE="30" MAXLENGTH="15" VALUE="<% if TCWebApi_get("GPON_ONU","SerialNumber","h") <> "N/A" then TCWebApi_get("GPON_ONU","SerialNumber","s") end if%>" ></td>
	</tr>
</table>
	<table width="760" border="0" align=center cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
	<td width="160" class="light-orange">&nbsp;</td><td width="160">&nbsp;</td><td width="440"></td></tr>
  <tr>
    <td width="160" class="black" height="42" >&nbsp;</td><td width="160" class="orange">&nbsp;</td><td width="440" class="orange">
		<INPUT TYPE="HIDDEN" NAME="AuthFlag" VALUE="0">
		<INPUT TYPE="SUBMIT" NAME="SaveBtn" VALUE="<%tcWebApi_get("String_Entry","ButtonApplyText","s")%>" onClick="Auth_modle_Save();">	
	</td>
</tr>
<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
	<tr>
	<td align=center colSpan=3><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%></font></td>
	</tr>
<%end if%>
</table></form>
</body></html>
