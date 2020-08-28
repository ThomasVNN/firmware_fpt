<%
If Request_Form("fwFlag")="1" then 
	tcWebApi_set("Firewall_Entry","firewall_status","firewallEnable") 
	tcWebApi_set("Firewall_Entry","spi_status","spiEnable")
	tcWebApi_commit("Firewall_Entry")

	TCWebApi_set("Lan_Access","wanaccesstelnet","telnetradio")
        TCWebApi_set("Lan_Access","wanaccessssh","sshradio")
        TCWebApi_set("Account_Entry0","remote_user","remote_username")
        TCWebApi_set("Account_Entry0","remote_pwd","remote_password")
	tcWebApi_commit("Lan_Access")
	tcWebApi_commit("Account_Entry0")
End if
	If Request_Form("saveAccessflag")="1" Then
        	TCWebApi_set("Lan_Access","wanAccessLanWeb","wanAccessLanWebRadio")
		tcWebApi_commit("Lan_Access")
		TCWebApi_save()
        	
        End If

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<META http-equiv=Content-Script-Type content=text/javascript>
<META http-equiv=Content-Style-Type content=text/css>
<META http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>" ;>
<LINK rel="stylesheet" type="text/css" href="/style.css">
<style  type="text/css">

*{color:  #404040;}

</style>

<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->

<SCRIPT language="JavaScript">

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

function fwSave(){
//foxconn cindy add for FPT new requirement,add Remote Security Account when remote function enable 2020/01/10
	var value1 = document.fw_form.wanAccessLanWebRadio;
	var value2 = document.fw_form.telnetradio;
	var value3 = document.fw_form.sshradio;
	var username = document.fw_form.remote_username.value;
	var password = document.fw_form.remote_password.value;
	if(value1[0].checked||value2[0].checked||value3[0].checked)
	{
		if(username==""||password=="")
		{
			alert("<%tcWebApi_get("String_Entry","RemoteAccount3Text","s")%>");
			return;
		}
		
		if(username.length>32||username.length<8||password.length>32||password.length<8)
		{
			alert("<%tcWebApi_get("String_Entry","RemoteAccount4Text","s")%>");
			return;
		}

		for(var i = 0; i < username.length; i ++ )
		{
		  	 var ascNum = username.charCodeAt(i);
		   	//ascNUM : 59 ->semicolon(;)
			
		   	if (ascNum < 33 || ascNum > 126 || ascNum == 59)
			{
	   			alert("<%tcWebApi_get("String_Entry","RemoteAccount5Text","s")%>");
				return -1;
			}
		}

		for(var i = 0; i < password.length; i ++ )
		{
		  	 var ascNum = password.charCodeAt(i);
		   	//ascNUM : 59 ->semicolon(;)
			
		   	if (ascNum < 33 || ascNum > 126 || ascNum == 59)
			{
	   			alert("<%tcWebApi_get("String_Entry","RemoteAccount6Text","s")%>");
				return;
			}
		}

	}
//foxconn cindy add for FPT new requirement,add Remote Security Account when remote function enable 2020/01/10
	
showSpin();//cindy add 
  document.fw_form.fwFlag.value=1;
  document.fw_form.submit();
}

function enableWanAccessLanWeb()
{
	if( confirm("<%tcWebApi_get("String_Entry","LANWarnText","s")%>"))
	{
		document.fw_form.saveAccessflag.value=1;
	}
	else{
		document.fw_form.wanAccessLanWebRadio[1].checked = true;
		document.fw_form.saveAccessflag.value=1;
	}
}

function disableWanAccessLanWeb()
{
	document.fw_form.saveAccessflag.value=1;
}

//foxconn cindy add for FPT new requirement,add Remote Security Account when remote function enable 2020/01/10
function ShowAccount()
{
	var value1 = document.fw_form.wanAccessLanWebRadio;
	var value2 = document.fw_form.telnetradio;
	var value3 = document.fw_form.sshradio;
	if(value1[0].checked||value2[0].checked||value3[0].checked)
		document.getElementById("Account_div").style.display = "";
	else
		document.getElementById("Account_div").style.display = "none";
}
//foxconn cindy add for FPT new requirement,add Remote Security Account when remote function enable 2020/01/10

</SCRIPT>

<META content="MSHTML 6.00.2900.3059" name=GENERATOR></HEAD>
<BODY onLoad="ShowAccount();">
<FORM name="fw_form" action="/cgi-bin/adv_firewall.asp" method=post>
<div id="pagestyle"><!--cindy add for border 11/28-->
	<div id="contenttype">
	<div id="block1">
		<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;" >
		<tr height="25px" class="bgcolor" >	
			<td  align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","FirewallText","s")%></td>
		</tr>
		</table>
		
		<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","FirewallText","s")%></td>
			<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="firewallEnable"  VALUE="1"  <% If TCWebApi_get("Firewall_Entry","firewall_status","h") = "1" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","FirewallEnabledText","s")%>			     		
			&nbsp;&nbsp;&nbsp; <INPUT TYPE="RADIO" NAME="firewallEnable"  VALUE="0"   <% If TCWebApi_get("Firewall_Entry","firewall_status","h") = "0" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","FirewallDisabledText","s")%> 
			</td>
		</tr>
		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","FirewallSPIText","s")%></td>
			<td align=left class="tabdata">
				<INPUT TYPE="RADIO" NAME="spiEnable" VALUE="1" <% if tcWebApi_get("Firewall_Entry","spi_status","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","FirewallEnabledText","s")%>
				&nbsp;&nbsp;&nbsp; <INPUT TYPE="RADIO" NAME="spiEnable" VALUE="0" <% if tcWebApi_get("Firewall_Entry","spi_status","h") = "0" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","FirewallDisabledText","s")%>
			</td>
		</tr>
		</table>
		
		<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
		<tr height="30px">
		
		<td  align=left class="tabdata" style="padding-left:20px;">
			<div style="color:#F36F22;">
	
			<img class="forattention" src="/exclamation.gif">
			
			<%tcWebApi_get("String_Entry","FirewalCommentIText","s")%></div>
		</td>
		</tr>
		</table>
	</div>

	<div id="block1">
		<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata"  style="margin:5px 0px;">
		<tr height="25px" class="bgcolor">
			<td align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","WANAccessLANWEB0Text","s")%></td>
		</tr>
		</table>
		
		<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","WANAccessLANWEB1Text","s")%></td>
			<td align=left class="tabdata">
				<INPUT TYPE="HIDDEN" NAME="saveAccessflag" VALUE="0">
				<INPUT TYPE="RADIO" NAME="wanAccessLanWebRadio" VALUE="Yes" onClick="enableWanAccessLanWeb(),ShowAccount();" <%If tcWebApi_get("Lan_Access","wanAccessLanWeb","h") = "Yes" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WANAccessLANWEBYesText","s")%> 
				&nbsp;&nbsp;&nbsp; <INPUT TYPE="RADIO" NAME="wanAccessLanWebRadio" VALUE="No" onClick="disableWanAccessLanWeb(),ShowAccount();" <%If tcWebApi_get("Lan_Access","wanAccessLanWeb","h") = "No" then asp_Write("checked") elseif  tcWebApi_get("Lan_Access","wanAccessLanWeb","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WANAccessLANWEBNoText","s")%> 
			</td>	
		</tr>
		<!--cindy add start about telnet 05/22-->
		<tr height="30px" style="display:none;">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","TelnetAccessText","s")%></td>
			<td align=left class="tabdata">
				<INPUT TYPE="RADIO" NAME="telnetradio" VALUE="1" onClick="ShowAccount();"  <%If tcWebApi_get("Lan_Access","wanaccesstelnet","h") = "1" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WANAccessLANWEBYesText","s")%> 
				&nbsp;&nbsp;&nbsp; <INPUT TYPE="RADIO" NAME="telnetradio" VALUE="0" onClick="ShowAccount();" <%If tcWebApi_get("Lan_Access","wanaccesstelnet","h") = "0" then asp_Write("checked") elseif  tcWebApi_get("Lan_Access","wanaccesstelnet","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WANAccessLANWEBNoText","s")%> 
			</td>	
		</tr>
		<!--cindy add end about telnet 05/22-->
		
		<!--cindy add start about SSH 05/22-->
		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","SSHAccessText","s")%></td>
			<td align=left class="tabdata">
				<INPUT TYPE="RADIO" NAME="sshradio" VALUE="1" onClick="ShowAccount();"  <%If tcWebApi_get("Lan_Access","wanaccessssh","h") = "1" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WANAccessLANWEBYesText","s")%> 
				&nbsp;&nbsp;&nbsp; <INPUT TYPE="RADIO" NAME="sshradio" VALUE="0" onClick="ShowAccount();" <%If tcWebApi_get("Lan_Access","wanaccessssh","h") = "0" then asp_Write("checked") elseif  tcWebApi_get("Lan_Access","wanaccessssh","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WANAccessLANWEBNoText","s")%> 
			</td>	
		</tr>
		<!--cindy add end about SSH 05/22-->
		</table>
	</div>

<!--//foxconn cindy add for FPT new requirement,add Remote Security Account when remote function enable 2020/01/10-->
	<div id="block1">
		<div id="Account_div">
		<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata"  style="margin:5px 0px;">
		<tr height="25px" class="bgcolor">
			<td align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","RemoteAccountText","s")%></td>
		</tr>
		</table>
		
		<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","RemoteAccount0Text","s")%></td>
			<td align=left class="tabdata">
				<input type="text" name="remote_username" size="30"  maxlength="32" value=<% if tcWebApi_get("Account_Entry0","remote_user","h") <> "N/A" then tcWebApi_get("Account_Entry0","remote_user","s") end if %>>
				<%tcWebApi_get("String_Entry","RemoteAccount2Text","s")%>
			</td>	
		</tr>
		
		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","RemoteAccount1Text","s")%></td>
			<td align=left class="tabdata">
				<input type="password" name="remote_password" size="30"  maxlength="32" value=<% if tcWebApi_get("Account_Entry0","remote_pwd","h") <> "N/A" then tcWebApi_get("Account_Entry0","remote_pwd","s") end if %>>
				<%tcWebApi_get("String_Entry","RemoteAccount2Text","s")%>
			</td>	
		</tr>
		</table>
		</div>
	</div>
<!--//foxconn cindy add for FPT new requirement,add Remote Security Account when remote function enable 2020/01/10-->

	<div id="button0">
	<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;" >
	<tr height="25px">
			<td  align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%></td>
		</tr>
	</table>
	
	<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
	<tr height="40px">
		<td colspan="2" align=left class="tabdata" style="padding-left:20px;">
		<INPUT TYPE="HIDDEN" NAME="fwFlag" VALUE="0">
    		<INPUT TYPE="BUTTON" NAME="SaveBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="fwSave();">
    		</td>
    		<td width="20px"></td>
    		<td><INPUT onClick="javascript:window.location='adv_firewall.asp'" type=button value=<%tcWebApi_get("String_Entry","ButtonCancelText","s")%> name=firewall_cancel style="display:none;">
		</td>
		<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
</tr>
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
</FORM></BODY></HTML>
