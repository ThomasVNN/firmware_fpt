
<%
If Request_Form("Cwmpflag")="1" then 
	TCWebApi_set("Cwmp_Entry", "Active", "CWMP_Active")
	TCWebApi_set("Cwmp_Entry", "acsUrl", "CWMP_ACSURL")
	TCWebApi_set("Cwmp_Entry", "acsUserName", "CWMP_ACSUserName")
	TCWebApi_set("Cwmp_Entry", "acsPassword", "CWMP_ACSPassword")
	TCWebApi_set("Cwmp_Entry", "conReqPath", "CWMP_ConnectionRequestPath")
	TCWebApi_set("Cwmp_Entry", "conReqUserName", "CWMP_ConnectionRequestUserName")
	TCWebApi_set("Cwmp_Entry", "conReqPassword", "CWMP_ConnectionRequestPassword")
	
	TCWebApi_set("Cwmp_Entry", "periodActive", "CWMP_PeriodActive")
	TCWebApi_set("Cwmp_Entry", "periodInterval", "CWMP_PeriodInterval")
	if tcwebApi_get("WebCustom_Entry","isTR69BindPVC","h") = "Yes" then
	TCWebApi_set("Cwmp_Entry", "BindActive", "CWMP_BindActive")
	IF Request_Form("CWMP_BindActive")="Yes" then
	TCWebApi_set("Cwmp_Entry", "wan_PVC", "bind_PVC")
	end if
	end if
	tcWebApi_commit("Cwmp_Entry")
End if

If Request_Form("Mirrorflag")="1" then 
	TCWebApi_set("Mirror_Entry", "Active", "Mirror_Active")
	tcWebApi_commit("Mirror_Entry");
End if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css" tppabs="/style.css">

<style  type="text/css">

*{color:  #404040;}

#wrapper{
margin:50px auto;
width:680px;
background:#FFFFFF;
padding:10px 3px;
}
</style>

<script language="javascript" src="/general.js"></script>
<script language="JavaScript">
function cwmpinit(){
//cindy add start
window.history.replaceState('object','CWMP Management','/tr069');
document.title="CWMP Management";
//cindy add end
	if(document.CWMP_form.elements[0].checked) 
		cwmpSwitch(1);
	else
		cwmpSwitch(0);	
		
	if(document.CWMP_form.CWMPLockFlag.value == 1)
		doCWMPLock();
}

function cwmpSwitch(on_off)
{
	if(on_off == 0){
		for(i = 2; i < 11; i++){
			document.CWMP_form.elements[i].disabled = true;}
		<%if tcwebApi_get("WebCustom_Entry","isTR69BindPVC","h") = "Yes" then%>
			for(i = 11; i < 14; i++)
			document.CWMP_form.elements[i].disabled = true;
		<%end if%>	
	
	}		
	else{
		for(i = 2; i < 11; i++){
			document.CWMP_form.elements[i].disabled = true;//cindy modify false=>true 0825
}
		if(document.CWMP_form.CWMP_PeriodActive[1].checked)
			document.CWMP_form.elements[10].disabled = true;
		<%if tcwebApi_get("WebCustom_Entry","isTR69BindPVC","h") = "Yes" then%>
			for(i = 11; i < 14; i++)
				document.CWMP_form.elements[i].disabled = true;//cindy modify false=>true 0825
			if(document.CWMP_form.CWMP_BindActive[1].checked) 
				document.CWMP_form.elements[13].disabled = true;
		<%end if%>
	}
}
function cwmpPeriodSwitch(on_off)
{
	if(on_off == 0)
			document.CWMP_form.elements[10].disabled = true;
	else
			document.CWMP_form.elements[10].disabled = true;//cindy modify false=>true 0825
}

function isNumeric(s)
{
  var len= s.length;
  var ch;
  if(len==0)
    return false;
  for( i=0; i< len; i++)
  {
    ch= s.charAt(i);
    if( ch > '9' || ch < '0')
    {
      return false;
    }
  }
  return true;
}

function cwmpNumValidCheck()
{
	var value1;
/*	
	value1 = document.CWMP_form.CWMP_ConnectionRequestPort.value;
	if(!isNumeric(value1)){
		alert("The connection request port should be interger!");
		return false;
	}
	else{
		if(Number(value1) > 65535 || Number(value1) < 1){
			alert("The connection request port should be 1-65535!");
			return false;
		}
	}
*/
	value1 = document.CWMP_form.CWMP_PeriodInterval.value;
	if(!document.CWMP_form.elements[8].checked)
		return true;
	if(!isNumeric(value1)){
		alert("<%tcWebApi_get("String_Entry","CwmpJS0Text","s")%>");
		return false;
	}
	else{
		if(Number(value1) > 999999 || Number(value1) < 1){
			alert("<%tcWebApi_get("String_Entry","CwmpJS1Text","s")%>");
			return false;
		}
	}
	
	return true;
}

function StringCheck(val)
{
    re = /^[^\s]+$/;
    if( re.test(val) )
        return true;
    else
        return false;
}

function cwmpStringValidCheck()
{
	var value1;
	var value2 = null;
	var url = /^https*:\/\/\w+/;
	var path = /^\/\w+/;

	value1 = document.CWMP_form.CWMP_ACSURL.value;
	if(value1 == "") {
		alert("<%tcWebApi_get("String_Entry","CwmpJS2Text","s")%>");
		return false;
	}

	if(!StringCheck(value1)){
		alert("<%tcWebApi_get("String_Entry","CwmpJS5Text","s")%>");
		return false;
	}
	else{	
		if(StringCheck(value1)){
			value2 = value1.match(url);
			if(value2 == null){
				alert("<%tcWebApi_get("String_Entry","CwmpJS3Text","s")%>");
				return false;
			}
			if(chineseCheck(document.CWMP_form.CWMP_ACSURL, "ACSURLId"))
			{
				return false;
			}
		}
	}
	
	if(chineseCheck(document.CWMP_form.CWMP_ACSUserName, "ACSUserNameId"))
	{
		return false;
	}
	if(chineseCheck(document.CWMP_form.CWMP_ACSPassword, "ACSPasswordId"))
	{
		return false;
	}
	if(chineseCheck(document.CWMP_form.CWMP_ConnectionRequestUserName, "CWMPConnectionRequestUserNameId"))
	{
		return false;
	}
	if(chineseCheck(document.CWMP_form.CWMP_ConnectionRequestPassword, "CWMPConnectionRequestPasswordId"))
	{
		return false;
	}
	/* value1 = document.CWMP_form.CWMP_ACSUserName.value;
	if(!StringCheck(value1)){
		alert("Username for logining ACS should not be empty!");
		return false;
	}
	
	value1 = document.CWMP_form.CWMP_ACSPassword.value;
	if(!StringCheck(value1)){
		alert("Password for logining ACS should not be empty!");
		return false;
	}
	*/
	
	value1 = document.CWMP_form.CWMP_ConnectionRequestPath.value;
    /*	
	if(!StringCheck(value1)){
		alert("Connection request path should not be empty!");
		return false;
	}
	else{
	*/
	if(StringCheck(value1)){
		value2 = value1.match(path);
		if(value2 == null){
			alert("<%tcWebApi_get("String_Entry","CwmpJS4Text","s")%>");
			return false;
		}
	}
	/*
	value1 = document.CWMP_form.CWMP_ConnectionRequestUserName.value;
	if(!StringCheck(value1)){
		alert("Username for Connection request should not be empty!");
		return false;
	}
	
	value1 = document.CWMP_form.CWMP_ConnectionRequestPassword.value;
	if(!StringCheck(value1)){
		alert("Password for Connection request should not be empty!");
		return false;
	}
	*/
	return true;
}
//Luke add for Mirror function 20170824
function mirrorSave()
{
	document.CWMP_form.Mirrorflag.value=1;	
	document.CWMP_form.submit();
}
//Luke add for Mirror function end
function cwmpSave()
{
	if(document.CWMP_form.elements[0].checked){
		if(!cwmpNumValidCheck())
			return false;
		if(!cwmpStringValidCheck())
			return false;
		<%if tcwebApi_get("WebCustom_Entry","isTR69BindPVC","h") = "Yes" then%>
		if(!cwmpBindPVCCheck())
			return false;
		<%end if%>
	}
	
	document.CWMP_form.Cwmpflag.value=1;	
	document.CWMP_form.submit();

}
function doCWMPLock()
{
	for(i = 0; i < document.forms[0].elements.length; i++)
	{	
		document.forms[0].elements[i].disabled = true;
	}
}
<%if tcwebApi_get("WebCustom_Entry","isTR69BindPVC","h") = "Yes" then%>
function cwmpBindSwitch(onOff){
	 		
	if(onOff == 0)
		document.CWMP_form.bind_PVC.disabled = true;
	else
		document.CWMP_form.bind_PVC.disabled = false;
}

function cwmpBindPVCCheck()
{
var form=document.CWMP_form; 
if(form.CWMP_BindActive[1].checked)
	return true;
 var activePVC = ["<% tcWebApi_staticGet("Wan_PVC0","Active","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC1","Active","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC2","Active","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC3","Active","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC4","Active","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC5","Active","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC6","Active","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC7","Active","s") %>"];
 var ispPVC = ["<% tcWebApi_staticGet("Wan_PVC0","ISP","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC1","ISP","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC2","ISP","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC3","ISP","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC4","ISP","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC5","ISP","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC6","ISP","s") %>",
					"<% tcWebApi_staticGet("Wan_PVC7","ISP","s") %>"];
	var pvc_index = parseInt(document.CWMP_form.bind_PVC.value);
	if(activePVC[pvc_index]!="Yes")
	{
		alert("<%tcWebApi_get("String_Entry","CwmpBindText1","s")%>")
		return false;
	}
	if(ispPVC[pvc_index]=="3")
	{
		alert("<%tcWebApi_get("String_Entry","CwmpBindText2","s")%>")
		return false;
	}
	return true;
}

<%end if%>

</script>
</head>
<body onload="cwmpinit()">

<form name="CWMP_form" method="post" ACTION="/cgi-bin/access_cwmp.asp" >
<div id="wrapper">
<!--cindy delete 0819
<table width="760px" border="0"  cellpadding="0" cellspacing="0">
<tr><td height="40px"  colspan="5"></td></tr>
<tr><td width="10">&nbsp; </td>
<td width="140" height="15">      	
</td>
<td  colspan="3" valign="middle"  class="title-main"><%if tcwebApi_get("WebCustom_Entry","isC1HGUSupported","h") = "Yes" then%>
      	<%tcWebApi_get("String_Entry","TR69SetupText","s")%>
      	<% else %>
      	<%tcWebApi_get("String_Entry","CwmpSetupText","s")%> 
      	<% end if %></td>
</tr>
</table>
-->

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr style="display:none" height="30px">
		<td class="tabdata" align=left>
    <%if tcwebApi_get("WebCustom_Entry","isC1HGUSupported","h") = "Yes" then%>
    <%tcWebApi_get("String_Entry","TR69Text","s")%>
    <% else %>
    <%tcWebApi_get("String_Entry","CwmpText","s")%>
    <% end if %>
    	    </td>
    <td class="tabdata">
      <input name="CWMP_Active" type="radio" value="Yes" <%if tcWebApi_get("Cwmp_Entry", "Active", "h") = "Yes" then asp_Write("checked") end if%> onclick="cwmpSwitch(1)">
       <%tcWebApi_get("String_Entry","CwmpActivatedText","s")%> 
	  <input name="CWMP_Active" type="radio" value="No" <%if tcWebApi_get("Cwmp_Entry", "Active", "h") = "No" then asp_Write("checked") elseif tcWebApi_get("Cwmp_Entry", "Active", "h") = "N/A" then asp_Write("checked") end if%> onclick="cwmpSwitch(0)">
   	   <%tcWebApi_get("String_Entry","CwmpDeactivatedText","s")%> 
     </td>
  </tr>
</table>
  
<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
		<td width="250px" align="left" class="title-main" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpACSLoginInfoText","s")%>
		</td>
</tr>
</table>

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<div id="ACSURLId"><%tcWebApi_get("String_Entry","CwmpURLText","s")%></div>
		</td>
 	<td align=left class="tabdata">
 		<input disabled="true" name="CWMP_ACSURL" type="text" value="<%if tcWebApi_get("Cwmp_Entry", "acsUrl", "h") <> "N/A" then tcWebApi_get("Cwmp_Entry", "acsUrl", "s") end if%>" size="64" maxlength="256">
	</td>
 </tr>
 	
 <tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<div  id="ACSUserNameId"> <%tcWebApi_get("String_Entry","CwmpUserNameText","s")%></div>
		</td>
 	<td align=left class="tabdata">
 		<input disabled="true" name="CWMP_ACSUserName" type="text" value="<%if tcWebApi_get("Cwmp_Entry", "acsUserName", "h") <> "N/A" then tcWebApi_get("Cwmp_Entry",  "acsUserName", "s") end if%>" size="32" maxlength="256">
	</td>
 </tr>
	 
 <tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<div  id="ACSPasswordId"> <%tcWebApi_get("String_Entry","CwmpPasswordText","s")%></div>
		</td>
 	<td align=left class="tabdata">
 		<input disabled="true" name="CWMP_ACSPassword" type="text" value="<%if tcWebApi_get("Cwmp_Entry", "acsPassword", "h") <> "N/A" then tcWebApi_get("Cwmp_Entry", "acsPassword", "s") end if%>" size="32" maxlength="256">
	</td>
 </tr>
</table>
 
<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
		<td width="250px" align="left" class="title-main" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpConnInfoText","s")%>
		</td>
</tr>
</table>

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpPathText","s")%>
		</td>
 	<td align=left class="tabdata">
 		<input disabled="true" name="CWMP_ConnectionRequestPath" type="text" value="<%if tcWebApi_get("Cwmp_Entry", "conReqPath", "h") <> "N/A" then tcWebApi_get("Cwmp_Entry", "conReqPath", "s") end if%>" size="63" maxlength="256">
	</td>
 </tr>

<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<div id="CWMPConnectionRequestUserNameId"><%tcWebApi_get("String_Entry","CwmpUserNameText","s")%></div>
		</td>
 	<td align=left class="tabdata">
 		<input disabled="true" name="CWMP_ConnectionRequestUserName" type="text" value="<%if tcWebApi_get("Cwmp_Entry", "conReqUserName", "h") <> "N/A" then tcWebApi_get("Cwmp_Entry", "conReqUserName", "s") end if%>" size="32" maxlength="256">
	</td>
 </tr>

 <tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<div id="CWMPConnectionRequestPasswordId"><%tcWebApi_get("String_Entry","CwmpPasswordText","s")%></div>
		</td>
 	<td align=left class="tabdata">
 		<input disabled="true" name="CWMP_ConnectionRequestPassword" type="text" value="<%if tcWebApi_get("Cwmp_Entry", "conReqPassword", "h") <> "N/A" then tcWebApi_get("Cwmp_Entry", "conReqPassword" ,"s") end if%>" size="32" maxlength="256">
	</td>
 </tr>
</table>

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
		<td width="250px" align="left" class="title-main" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpPeriodicConfigText","s")%>
		</td>
</tr>
</table>
  
<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
  <tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpPeriodicInfoText","s")%>
		</td>
 	<td align=left class="tabdata">
 		<input name="CWMP_PeriodActive" disabled="true" value="Yes" type="radio" <%if tcWebApi_get("Cwmp_Entry", "periodActive", "h") = "Yes" then asp_Write("checked") end if%> onclick="cwmpPeriodSwitch(1)">
  	    <%tcWebApi_get("String_Entry","CwmpActivatedText","s")%>
 	  &nbsp;&nbsp;&nbsp;&nbsp;<input name="CWMP_PeriodActive" disabled="true" value="No" type="radio" <%if tcWebApi_get("Cwmp_Entry", "periodActive", "h") = "No" then asp_Write("checked") elseif tcWebApi_get("Cwmp_Entry", "periodActive", "h") = "N/A" then asp_Write("checked") end if%> onclick="cwmpPeriodSwitch(0)">
 		<%tcWebApi_get("String_Entry","CwmpDeactivatedText","s")%>
	</td>
 </tr>
  
   <tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpIntervalText","s")%>
		</td>
 	<td align=left class="tabdata">
 		<input disabled="true" type="text" name="CWMP_PeriodInterval" value="<%if tcWebApi_get("Cwmp_Entry", "periodInterval", "h") <> "N/A" then tcWebApi_get("Cwmp_Entry", "periodInterval", "s") end if%>" size="9" maxlength="9" >
	</td>
 </tr>
</table>

<%if tcwebApi_get("WebCustom_Entry","isTR69BindPVC","h") = "Yes" then%>

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
		<td width="250px" align="left" class="title-main" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpBindText","s")%>
		</td>
	</tr>
</table>

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpBindStatusText","s")%>
		</td>
 	<td align=left class="tabdata">
 		 <input name="CWMP_BindActive" value="Yes" type="radio" <%if tcWebApi_get("Cwmp_Entry", "BindActive", "h") = "Yes" then asp_Write("checked") end if%> onclick="cwmpBindSwitch(1)">
  		<%tcWebApi_get("String_Entry","CwmpActivatedText","s")%>
 	  &nbsp;&nbsp;&nbsp;&nbsp;<input name="CWMP_BindActive" value="No" type="radio" <%if tcWebApi_get("Cwmp_Entry", "BindActive", "h") = "No" then asp_Write("checked") elseif tcWebApi_get("Cwmp_Entry", "BindActive", "h") = "N/A" then asp_Write("checked") end if%> onclick="cwmpBindSwitch(0)">
 		<%tcWebApi_get("String_Entry","CwmpDeactivatedText","s")%>
	</td>
 </tr>

	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpBindIndexText","s")%>
		</td>
	<td align=left class="tabdata">
	<select name="bind_PVC" size="1" >
          <option value="0" <% if tcWebApi_get("Cwmp_Entry","wan_PVC","h") = "0" then asp_Write("selected") end if %>>PVC_0 
          <option value="1" <% if tcWebApi_get("Cwmp_Entry","wan_PVC","h") = "1" then asp_Write("selected") end if %>>PVC_1 
          <option value="2" <% if tcWebApi_get("Cwmp_Entry","wan_PVC","h") = "2" then asp_Write("selected") end if %>>PVC_2 
          <option value="3" <% if tcWebApi_get("Cwmp_Entry","wan_PVC","h") = "3" then asp_Write("selected") end if %>>PVC_3 
          <option value="4" <% if tcWebApi_get("Cwmp_Entry","wan_PVC","h") = "4" then asp_Write("selected") end if %>>PVC_4 
          <option value="5" <% if tcWebApi_get("Cwmp_Entry","wan_PVC","h") = "5" then asp_Write("selected") end if %>>PVC_5 
          <option value="6" <% if tcWebApi_get("Cwmp_Entry","wan_PVC","h") = "6" then asp_Write("selected") end if %>>PVC_6 
          <option value="7" <% if tcWebApi_get("Cwmp_Entry","wan_PVC","h") = "7" then asp_Write("selected") end if %>>PVC_7 
        </select>
	</td>
	</tr>
</table>

	<%end if%>


<!--Foxconn Luke add for Mirror function  20170824-->

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
		<td width="250px" align="left" class="title-main" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpMirrorFunctionText","s")%>
		</td>
	</tr>
</table>

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpMirrorText","s")%>
		</td>
	 	<td align=left class="tabdata">
	 		<input name="Mirror_Active" value="Yes" type="radio" <%if tcWebApi_get("Mirror_Entry", "Active", "h") = "Yes" then asp_Write("checked") end if%> >
  			<%tcWebApi_get("String_Entry","CwmpActivatedText","s")%>
			&nbsp;&nbsp;&nbsp;&nbsp;<input name="Mirror_Active" value="No" type="radio" <%if tcWebApi_get("Mirror_Entry", "Active", "h") = "No" then asp_Write("checked") elseif tcWebApi_get("Mirror_Entry", "Active", "h") = "N/A" then asp_Write("checked") end if%> >
 			<%tcWebApi_get("String_Entry","CwmpDeactivatedText","s")%>
		</td>
 	</tr>
</table>
<!--Foxconn Luke add for mirror function end -->

 <div id="button0">
<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px">
		<td width="250px" align="left" class="title-main" style="padding-left:20px;">
			<%tcWebApi_get("String_Entry","CwmpMirror0Text","s")%>
		</td>
   </tr>
</table>

<table width="680" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" align="center">
    <tr height="40px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;">
	<input name="CWMPLockFlag" type="HIDDEN" value="<%if tcWebApi_get("Cwmp_Entry", "CWMPLockFlag", "h") <> "N/A" then tcWebApi_get("Cwmp_Entry", "CWMPLockFlag", "s") else asp_write("0") end if%>">
		<INPUT TYPE="HIDDEN" NAME="Cwmpflag" VALUE="0">
		<!--cindy delete 0817
		<input name="cwmp_apply" type="button" value="<%tcWebApi_get("String_Entry","ButtonApplyText","s")%>" onClick="cwmpSave()" class="sbutton">
      	<input type="reset"  name="cwmp_cancel" value="<%tcWebApi_get("String_Entry","ButtonCancelText","s")%>">
      	-->
		<!--Foxconn Luke add for mirror function 20170824 -->	
		<INPUT TYPE="HIDDEN" NAME="Mirrorflag" VALUE="0">
	 	 	<input name="mirror_save" type="button"  class="button1" value="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="mirrorSave()" class="sbutton">
		<!--Foxconn Luke add for mirror function end -->
	</td>
  </tr>
  </table>
  </div>
</div>
</form>
</body>
</html>        
