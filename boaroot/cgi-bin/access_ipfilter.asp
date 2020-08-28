<%
if request_Form("Duplicate")="1" then
	TCWebAPI_unset("IpMacFilter_Entry")
	TCWebAPI_commit("IpMacFilter_Entry")
	tcWebApi_set("IpMacFilter_Common","Duplicate","NoDup")
end if
/*select a rule*/	
if request_Form("RuleTypeChange") = "0" then
	TCWebAPI_set("WebCurSet_Entry","ipfilter_id","RuleIndexSEL")
	tcwebApi_set("GUITemp_Entry0","IndexTmp","RuleIndexSEL")
/*add a rule*/
elseif request_Form("RuleTypeChange") = "1" then
	if request_Form("c2Support") <> "1" then
		TCWebAPI_set("IpMacFilter_Common","ListType","RuleTypeSEL")
	end if
	tcwebApi_set("GUITemp_Entry0","IndexTmp","RuleIndexSEL")
	TCWebAPI_set("WebCurSet_Entry","ipfilter_id","RuleIndexSEL")
	/*remove original data*/
	TCWebAPI_unset("IpMacFilter_Entry")
	
  TCWebAPI_set("IpMacFilter_Entry","Active","RuleActiveRDO")

if tcWebApi_get("WebCustom_Entry","isCZGeneralSupported","h") = "Yes" then
	TCWebAPI_set("IpMacFilter_Entry","RuleType","FILTERRuleTypeSEL")
	if request_Form("FILTERRuleTypeSEL") = "MAC" then
		TCWebAPI_set("IpMacFilter_Entry","Direction","RuleTypeMacDirection")
		TCWebAPI_set("IpMacFilter_Entry","Interface","RuleTypeMacInterface")
	else
		if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then
			if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then
				if tcWebApi_get("WebCustom_Entry", "filter_interface", "h") = "PVC8" then
					TCWebAPI_set("IpMacFilter_Entry","Interface","ServiceID")
				elseif tcWebApi_get("WebCustom_Entry", "filter_interface", "h") = "PVC9" then	
					TCWebAPI_set("IpMacFilter_Entry","Interface","ServiceID")
				elseif tcWebApi_get("WebCustom_Entry", "filter_interface", "h") = "PVC10" then	
					TCWebAPI_set("IpMacFilter_Entry","Interface","ServiceID")
				else	
					TCWebAPI_set("IpMacFilter_Entry","Interface","InterfaceSEL")
				end if	
			else
				TCWebAPI_set("IpMacFilter_Entry","Interface","InterfaceSEL")
			end if
		else
			TCWebAPI_set("IpMacFilter_Entry","Interface","InterfaceSEL")
		end if		
	TCWebAPI_set("IpMacFilter_Entry","Direction","DirectionSEL")
	end if
else
if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then
	if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then
		if tcWebApi_get("WebCustom_Entry", "filter_interface", "h") = "PVC8" then
			TCWebAPI_set("IpMacFilter_Entry","Interface","ServiceID")
		elseif tcWebApi_get("WebCustom_Entry", "filter_interface", "h") = "PVC9" then	
			TCWebAPI_set("IpMacFilter_Entry","Interface","ServiceID")
		elseif tcWebApi_get("WebCustom_Entry", "filter_interface", "h") = "PVC10" then	
			TCWebAPI_set("IpMacFilter_Entry","Interface","ServiceID")
		else	
			TCWebAPI_set("IpMacFilter_Entry","Interface","InterfaceSEL")
		end if	
	else
		TCWebAPI_set("IpMacFilter_Entry","Interface","InterfaceSEL")
	end if
else
	TCWebAPI_set("IpMacFilter_Entry","Interface","InterfaceSEL")
end if		

  TCWebAPI_set("IpMacFilter_Entry","Direction","DirectionSEL")
 	TCWebAPI_set("IpMacFilter_Entry","RuleType","FILTERRuleTypeSEL")
end if
 	
  TCWebAPI_set("IpMacFilter_Entry","SrcIPAddr","SrcIPTXT")
  TCWebAPI_set("IpMacFilter_Entry","SrcIPMask","SrcMaskTXT")
  TCWebAPI_set("IpMacFilter_Entry","SrcPort","SrcPortTXT")
  TCWebAPI_set("IpMacFilter_Entry","DesIPAddr","DestIPTXT")
  TCWebAPI_set("IpMacFilter_Entry","DesIPMask","DestMaskTXT")
  TCWebAPI_set("IpMacFilter_Entry","DesPort","DestPortTXT")
  if request_Form("DSCPFLT") = "Yes" then
  TCWebAPI_set("IpMacFilter_Entry","DSCP","DSCPTXT")
  end if
  TCWebAPI_set("IpMacFilter_Entry","Protocol","ProtocolSEL")

  TCWebAPI_set("IpMacFilter_Entry","MacAddr","MacAddrTXT")  

  /*commit changes*/
  TCWebAPI_commit("IpMacFilter_Entry")
/*remove a rule*/
elseif request_Form("RuleTypeChange") = "2" then
	TCWebAPI_unset("IpMacFilter_Entry")
	TCWebAPI_commit("IpMacFilter_Entry")
/*change ruletype*/
elseif request_Form("RuleTypeChange") = "3" then
	TCWebAPI_set("WebCurSet_Entry","ipfilter_id","RuleIndexSEL")
	tcwebApi_set("GUITemp_Entry0","IndexTmp","RuleIndexSEL")
	TCWebAPI_set("IpMacFilter_Entry","RuleType","FILTERRuleTypeSEL")
	
  /*commit changes*/
end if  

if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then
if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then
if request_Form("RuleTypeChange") = "5" then
  	TCWebAPI_set("WebCustom_Entry","filter_interface","InterfaceSEL")
end if
end if
end if




%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<META http-equiv=Content-Script-Type content=text/javascript>
<META http-equiv=Content-Style-Type content=text/css>
<META http-equiv=Content-Type content="text/html; charset=&#10;<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css" >

<style  type="text/css">

*{color:  #404040;}

</style>

<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<SCRIPT language=javascript>

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

function tableShow(id,header,data,keyIndex){
			var html = ["<table width=615 border=0 cellpadding=1 cellspacing=0  bordercolor=#a6a6a6 bgcolor=#FFFFFF > "];
	// 1.generate table header
	html.push("<tr hight=42>");
			for(var i =0; i<header.length; i++){
			html.push("<td width=" + header[i][0] + " align=center class=tabdata>" +"<strong>"+ header[i][1] +"</strong>"+ "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
				for(var i =0; i<data.length; i++){
					if(data[i][keyIndex] != "N/A"){
			html.push("<tr height=42>");
						for(var j=0; j<data[i].length; j++){
				html.push("<td align=center class=topborderstyle>" + data[i][j] + "</td>");
			}
			html.push("</tr>");
		}
	}
	html.push("</table>");
	document.getElementById(id).innerHTML = html.join('');
}

<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then%>
function doVCChange(){
	document.forms[0].RuleTypeChange.value = 5;
	document.forms[0].submit();
	return;
}
<%End If%>
<%End If%>

function doIndexChange()
{
	document.forms[0].RuleTypeChange.value = 0;
	document.forms[0].submit();
	return;
}

function doAdd()
{
	document.forms[0].RuleTypeChange.value = 1;
	<%if tcwebApi_get("WebCustom_Entry","isC2TrueSupported","h") = "Yes" then %>
	document.forms[0].c2Support.value = 1;
	<%end if%>
	
}

function doDel()
{
	document.forms[0].RuleTypeChange.value = 2;
}

function doChangeRuleType()
{	
	if(document.IPFILTERform.FILTERRuleTypeSEL.selectedIndex == 0)
	{
		document.getElementById("divMac").style.display="none";
		document.getElementById("divIP").style.display="";		
	}
	else
	{
		document.getElementById("divIP").style.display="none";
		document.getElementById("divMac").style.display="";
	}
	return;
	
}

function doCancel()
{
	document.forms[0].RuleTypeChange.value = 4;
	javascript:window.location='access_ipfilter.asp'
}
	
function switchFilterType(object)
{
	var index = object.selectedIndex;
	switch(index)
	{
		/*case 1:
			window.location='access_appfilter.asp';
			break;
			*/
		case 1:
			window.location='access_URLfilter.asp';
			break;
	}
}

function isValidIpAddr(ip1,ip2,ip3,ip4)
{
	<%if tcwebApi_get("WebCustom_Entry","isCZGeneralSupported","h") = "Yes" then %>
	if(ip1==0 || ip4==255 || ip1==127)
	<%else%>
	if(ip1==0 || ip4==255 || ip1==127 || ip4==0)
	<%end if%>
	{
		if(ip1==0 && ip2==0 && ip3==0 && ip4==0)
			return true;
		else
			return false;
	}
	return true;	
}

function unValidIP(Address)
{
	var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits;
	var i;

	var test=0;
	var point=-1;
	while(test!=-1)
	{
		point++;
		test=Address.indexOf(".",test+1);	
	}

	if(point<3)
	{
		alert("<%tcWebApi_get("String_Entry","FilterJS0Text","s")%>");
		return true;
	}

	if(address == null) 
	{ 
		alert("<%tcWebApi_get("String_Entry","FilterJS0Text","s")%>");
		return true;
	}
	else
	{
		digits = address[0].split(".");
		for(i=0; i < 4; i++)
		{
			if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223))
			{ 
				alert("<%tcWebApi_get("String_Entry","FilterJS1Text","s")%>" + Address);
				return true;
			}
		}
		return false;
	}
}

function unValidMask(Mask)
{
	var mask = Mask.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits;
	var bMask = 0;
	var watch = false;
	var i;
  
	var test=0;
	var point=-1;
	while(test!=-1)
	{
		point++;
		test=Mask.indexOf(".",test+1);	
	}
	
	if(point<3)
	{
		alert("<%tcWebApi_get("String_Entry","FilterJS2Text","s")%>");
		return true;
	}

	if(mask == null)
	{ 
		alert("<%tcWebApi_get("String_Entry","FilterJS2Text","s")%>");
		return true;
	}

	digits = mask[0].split(".");
	for(i=0; i < 4; i++)
	{
		if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ))
		{
			alert("<%tcWebApi_get("String_Entry","FilterJS2Text","s")%>");
			return true;
		}
		bMask = (bMask << 8) | Number(digits[i]);
	}
	if ((Number(digits[0]) == 0) && (Number(digits[1]) == 0)
		&& (Number(digits[2]) == 0) && (Number(digits[3]) == 0))
	{
		alert("<%tcWebApi_get("String_Entry","FilterJS2Text","s")%>");
		return true;	
	}
	bMask = bMask & 0x0FFFFFFFF;
 /*wang solve 0.0.0.1 or 255.255.255.1\129\193\225\241\249\253 can be saved*/
	if(((bMask & 0x01)== 1) && ((bMask & 0x0FFF) != 0x0FFF ))
	{
	      alert("<%tcWebApi_get("String_Entry","FilterJS2Text","s")%>");
	      return true;
	}
	for(i=0; i<32; i++)
	{
		if((watch==true) && ((bMask & 0x1)==0))
		{
			alert("<%tcWebApi_get("String_Entry","FilterJS2Text","s")%>");
			return true;
		}
		bMask = bMask >> 1;
		if((bMask & 0x01) == 1)
		{
			watch=true;
		}
	}
	return false;
}
//amy add start 2017-12-15.
/*
function IpfilterOnOff(off)
{
	if(off)
		{
		document.IPFILTERform.InterfaceSEL.disabled=true;
		document.IPFILTERform.DirectionSEL.disabled=true;
		<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
		<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then%>
			<%if tcWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8" then%>
				document.IPFILTERform.ServiceID.disabled=true;
			<%end if%>
			<% if  tcWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10" then%>
				document.IPFILTERform.ServiceID.disabled=true;
			<%end if%>
		<%end if%>
		<%end if%>
		document.IPFILTERform.FILTERRuleTypeSEL.disabled=true;
		if(document.IPFILTERform.FILTERRuleTypeSEL.selectedIndex == 0){
			document.IPFILTERform.SrcIPTXT.disabled=true;
			document.IPFILTERform.SrcMaskTXT.disabled=true;
			document.IPFILTERform.SrcPortTXT.disabled=true;
			document.IPFILTERform.DestIPTXT.disabled=true;
			document.IPFILTERform.DestMaskTXT.disabled=true;
			document.IPFILTERform.DestPortTXT.disabled=true;
			<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then%>
				document.IPFILTERform.DSCPTXT.disabled=true;
			<%end if%>
			document.IPFILTERform.ProtocolSEL.disabled=true;
			}
		else
			document.IPFILTERform.MacAddrTXT.disabled=true;	
			
		}
	else
		{
		document.IPFILTERform.InterfaceSEL.disabled=false;
		document.IPFILTERform.DirectionSEL.disabled=false;
		<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
		<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then%>
			<%if tcWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8" then%>
				document.IPFILTERform.ServiceID.disabled=false;
			<%end if%>
			<% if  tcWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10" then%>
				document.IPFILTERform.ServiceID.disabled=false;
			<%end if%>
		<%end if%>
		<%end if%>
		document.IPFILTERform.FILTERRuleTypeSEL.disabled=false;
		if(document.IPFILTERform.FILTERRuleTypeSEL.selectedIndex == 0){
			document.IPFILTERform.SrcIPTXT.disabled=false;
			document.IPFILTERform.SrcMaskTXT.disabled=false;
			document.IPFILTERform.SrcPortTXT.disabled=false;
			document.IPFILTERform.DestIPTXT.disabled=false;
			document.IPFILTERform.DestMaskTXT.disabled=false;
			document.IPFILTERform.DestPortTXT.disabled=false;
			<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then%>
				document.IPFILTERform.DSCPTXT.disabled=false;
			<%end if%>
			document.IPFILTERform.ProtocolSEL.disabled=false;
			}
		else
			document.IPFILTERform.MacAddrTXT.disabled=false;	
		}
		
}
*/
function IpfilterOnOff(off){

	if(off)
	{
		document.getElementById("rule_active").style.display="none";
		document.getElementById("divMac").style.display="none";
		document.getElementById("divIP").style.display="none";
	}

	else
		{
		document.getElementById("rule_active").style.display="";
		if(document.IPFILTERform.FILTERRuleTypeSEL.selectedIndex == 0)
			{
			document.getElementById("divMac").style.display="none";
			document.getElementById("divIP").style.display="";
			}
		else
			{
			document.getElementById("divMac").style.display="";
			document.getElementById("divIP").style.display="none";
			}
		}


}
//amy add end 2017-12-15.

function IPFilterinit()
{
	if(document.IPFILTERform.FULL.value.length != 0){
		alert(document.IPFILTERform.FULL.value);
	}
	if(document.IPFILTERform.Duplicate.value==1){
		alert("<%tcWebApi_get("String_Entry","URLfilterDuplicateUrl","s")%>");
		document.IPFILTERform.submit();
	}
/*	if(document.IPFILTERform.FILTERRuleTypeSEL.selectedIndex == 0){
//		document.getElementById("divIP").style.display="";
		document.getElementById("divMac").style.display="none";
		}
	else{
	//	document.getElementById("divMac").style.display="";
		document.getElementById("divIP").style.display="none";	//amy removed 2017-12-15.
		}
		if(document.IPFILTERform.RuleActiveRDO[0].checked)
		IpfilterOnOff(0);
	else
		IpfilterOnOff(1);
	*///amy removed 20180331
}

function validateInput()
{
	var RuleActiveRDO = document.IPFILTERform.RuleActiveRDO;
	for(i=0; i<RuleActiveRDO.length; i++)
	{
		if(RuleActiveRDO[i].checked == true)
		{
			RDOValue = RuleActiveRDO[i].value;
			break;
		}
	}
	
	var InterfaceSEL = document.IPFILTERform.InterfaceSEL;
	for(i=0; i<InterfaceSEL.length; i++)
	{
		if(InterfaceSEL[i].selected == true)
		{
			InterfaceValue = InterfaceSEL[i].value;
			break;
		}
	}
	
	var DirectionSEL = document.IPFILTERform.DirectionSEL;
	for(i=0; i<DirectionSEL.length; i++)
	{
		if(DirectionSEL[i].selected == true)
		{
			DirectionValue = DirectionSEL[i].value;
			break;
		}
	}
	
	var ProtocolSEL = document.IPFILTERform.ProtocolSEL;
	for(i=0; i<ProtocolSEL.length; i++)
	{
		if(ProtocolSEL[i].selected == true)
		{
			ProtocolValue = ProtocolSEL[i].value;
			break;
		}
	}
	
	SrcIPData = [
		"<%tcWebApi_get("IpMacFilter_Entry0","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry1","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry2","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry3","SrcIPAddr","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry4","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry5","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry6","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry7","SrcIPAddr","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry8","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry9","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry10","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry11","SrcIPAddr","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry12","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry13","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry14","SrcIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry15","SrcIPAddr","s")%>",
	]
	DestIPData = [
		"<%tcWebApi_get("IpMacFilter_Entry0","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry1","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry2","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry3","DesIPAddr","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry4","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry5","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry6","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry7","DesIPAddr","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry8","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry9","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry10","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry11","DesIPAddr","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry12","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry13","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry14","DesIPAddr","s")%>","<%tcWebApi_get("IpMacFilter_Entry15","DesIPAddr","s")%>",
	]
	SrcMaskData = [
		"<%tcWebApi_get("IpMacFilter_Entry0","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry1","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry2","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry3","SrcIPMask","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry4","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry5","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry6","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry7","SrcIPMask","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry8","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry9","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry10","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry11","SrcIPMask","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry12","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry13","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry14","SrcIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry15","SrcIPMask","s")%>",
	]
	DestMaskData = [
		"<%tcWebApi_get("IpMacFilter_Entry0","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry1","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry2","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry3","DesIPMask","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry4","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry5","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry6","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry7","DesIPMask","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry8","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry9","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry10","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry11","DesIPMask","s")%>",
		"<%tcWebApi_get("IpMacFilter_Entry12","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry13","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry14","DesIPMask","s")%>","<%tcWebApi_get("IpMacFilter_Entry15","DesIPMask","s")%>",
	]
		    	
	RuleType = document.IPFILTERform.FILTERRuleTypeSEL.selectedIndex;
	switch(RuleType)
	{
		case 0:
			IP = document.IPFILTERform.SrcIPTXT.value;
			if(unValidIP(IP)){
				return false;
	    }

			if(IP != "0.0.0.0" && unValidMask(document.IPFILTERform.SrcMaskTXT.value))
			{
				return false;
			}
			/*wang ip = 0.0.0.0 subnet =0.0.0.0*/
			if(IP == "0.0.0.0" && document.IPFILTERform.SrcMaskTXT.value != "0.0.0.0")
			{
                            alert("If IP is 0.0.0.0,subnet mask must be 0.0.0.0");
				return false;
			}
			/*wang ip = x.x.x.0 or x.x.0.0 or x.0.0.0 but subnet !=255.255.255.255*/
			var last1 = IP.split(".")[IP.split(".").length-1];   //last1 is equal to the  fourth group of ip.
			if((last1 == 0) && (document.IPFILTERform.SrcMaskTXT.value.split(".")[3] == 255))
			{
				alert("<%tcWebApi_get("String_Entry","FilterJS2Text","s")%>");
				return false;
			}
			SrcPort = parseInt(document.IPFILTERform.SrcPortTXT.value);
			if(isNaN(SrcPort) || SrcPort < 0 || SrcPort > 65535){
				alert("<%tcWebApi_get("String_Entry","FilterJS3Text","s")%>");
				return false;
			}

			IP = document.IPFILTERform.DestIPTXT.value;
			if(unValidIP(IP)){
				return false;
			}
			
			if(IP != "0.0.0.0" && unValidMask(document.IPFILTERform.DestMaskTXT.value))
			{
				return false;
			}
			/*wang ip = 0.0.0.0 subnet =0.0.0.0*/
			if(IP == "0.0.0.0" && document.IPFILTERform.DestMaskTXT.value != "0.0.0.0")
			{
                            alert("If IP is 0.0.0.0,subnet mask must be 0.0.0.0");
				return false;
			}
			/*wang ip = x.x.x.0 or x.x.0.0 or x.0.0.0 but subnet !=255.255.255.255*/
			var last1 = IP.split(".")[IP.split(".").length-1]; 
			if((last1 == 0) && (document.IPFILTERform.DestMaskTXT.value.split(".")[3] == 255))
			{
				alert("<%tcWebApi_get("String_Entry","FilterJS2Text","s")%>");
				return false;
			}
			DestPort = parseInt(document.IPFILTERform.DestPortTXT.value);
			if(isNaN(DestPort) || DestPort < 0 || DestPort > 65535)
			{	
				alert("<%tcWebApi_get("String_Entry","FilterJS3Text","s")%>");
				return false;
			}
			if (document.IPFILTERform.DSCPFLT.value == "Yes") {
				dscp = parseInt(document.IPFILTERform.DSCPTXT.value);
				if(isNaN(dscp) || dscp < 0 || dscp > 64)
				{	
					alert("<%tcWebApi_get("String_Entry","FilterJS6Text","s")%>");
					return false;
				}
			}
      for(var i=0; i<16; i++)
	    {
	    	if(document.IPFILTERform.RuleTypeSEL.value != "<%tcWebApi_get("IpMacFilter_Common","ListType","s")%>")
	    		break;
	    	if(tableData[i][1]=="N/A")
	    		continue;
	    	if(RDOValue !=tableData[i][1])
	    		continue;
	    	if(InterfaceValue!=tableData[i][2])
	    		continue;
	    	if(DirectionValue!=tableData[i][3])
	    		continue;
	    	if(document.IPFILTERform.SrcIPTXT.value!=SrcIPData[i])
	    		continue;
	    	if(document.IPFILTERform.SrcMaskTXT.value!=SrcMaskData[i])
	    		continue;
	    	if(document.IPFILTERform.DestIPTXT.value!=DestIPData[i])
	    		continue;
	    	if(document.IPFILTERform.DestMaskTXT.value!=DestMaskData[i])
	    		continue;
	    	if(document.IPFILTERform.SrcPortTXT.value!=tableData[i][7])
	    		continue;
	    	if(document.IPFILTERform.DestPortTXT.value!=tableData[i][8])
	    		continue;
	    	<%if tcWebApi_get("WebCustom_Entry","isDSCPSupported","h") = "Yes" then%>
	    	if(document.IPFILTERform.DSCPTXT.value!=tableData[i][9])
	    		continue;
	    	if(ProtocolValue==tableData[i][10]){
	    		alert("the rule has been set !");
	    		return false;
	    	}
	    	<%else%>
	    	if(ProtocolValue==tableData[i][9]){
	    		alert("the rule has been set !");
	    		return false;
	    	}
	    	<%end if%>
	    }
			
			break;
		case 1:
			if(document.IPFILTERform.MacAddrTXT.value.length==0)
			{
	    		return false;
	    }
	    for(var i=0; i<16; i++)
	    {
	    	if(document.IPFILTERform.RuleTypeSEL.value != "<%tcWebApi_get("IpMacFilter_Common","ListType","s")%>")
	    		break;
	    	if(tableData[i][1]=="N/A")
	    		continue;
	    	if(RDOValue !=tableData[i][1])
	    		continue;
	    	<%if tcWebApi_get("WebCustom_Entry","isDSCPSupported","h") = "Yes" then%>
	    	if(document.IPFILTERform.DSCPTXT.value!=tableData[i][9])
	    		continue;
	    	<%end if%>
	    	<%if tcwebApi_get("WebCustom_Entry","isCZGeneralSupported","h") <> "Yes" then %>
	    	if(InterfaceValue!=tableData[i][2])
	    		continue;
	    	if(DirectionValue!=tableData[i][3])
	    		continue;
	    	<%end if%>
	    	if(document.IPFILTERform.MacAddrTXT.value==tableData[i][6]){
	    		alert("the rule has been set !");
	    		return false;
	    	}
	    }
			break;
	}
	showSpin();//cindy add
	return true;
}

function blockMask(index)
{
	switch(index)
	{
		case 0:
			IP = document.IPFILTERform.SrcIPTXT;
			mask = document.IPFILTERform.SrcMaskTXT;
			break;
		case 1:
			IP = document.IPFILTERform.DestIPTXT;
			mask = document.IPFILTERform.DestMaskTXT;
			break;
	}
	/*wang */
	var addr1 = IP.value.split(".")[0];
	var addr4 = IP.value.split(".")[3];
	if(addr4 != 0) 
                {  mask.value = "255.255.255.255";}
	else if(IP.value == "0.0.0.0")
	{
		mask.value = "0.0.0.0";
	}
	else if(addr1 < 128 && addr1  > 0)
	{
		mask.value = "255.0.0.0";
	}
       else if(addr1 < 192 && addr1 > 127)
	{
	mask.value="255.255.0.0";
	}
	else if(addr1 < 224 && addr1  > 191)
	{
      		mask.value = "255.255.255.0";
	}
	else
	{       mask.disabled = false;       }
             //wang add end    
}

function doHexCheck(c)
{
  if ( (c >= "0") && (c <= "9") )
    return 1;
  else if ( (c >= "A") && (c <= "F") )
    return 1;
  else if ( (c >= "a") && (c <= "f") )
    return 1;

  return -1;
}

function doMACcheck(object)
{
	var szAddr = object.value;
	var len = szAddr.length;

	if(len==0)
	{
		alert("<%tcWebApi_get("String_Entry","FilterJS4Text","s")%>");
		return;
	}

	if(len==12)
	{
		var newAddr = "";
		var i = 0;

		for(i=0; i<len; i++)
		{
			var c = szAddr.charAt(i);

			if(doHexCheck(c) < 0)
			{
				alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
				object.focus();
				return;
			}
			if((i == 2)||(i == 4)||(i == 6)||(i == 8)||(i == 10))
			{
				newAddr = newAddr + ":";
			}
			newAddr = newAddr + c;
		}
		object.value = newAddr;
		return;
	}
	else if ( len == 17 )
	{
		var i = 2;
		var c0 = szAddr.charAt(0);
		var c1 = szAddr.charAt(1);

		if ((doHexCheck(c0) < 0)||(doHexCheck(c1) < 0))
		{
			alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
			object.focus();
			return;
		}

		i = 2;
		while (i<len)
		{
			var c0 = szAddr.charAt(i);
			var c1 = szAddr.charAt(i+1);
			var c2 = szAddr.charAt(i+2);

			if ((c0 != ":")||(doHexCheck(c1)<0)||(doHexCheck(c2)<0))
			{
				alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
				object.focus();
				return;
			}
			i = i + 3;
		}
		if((szAddr == "00:00:00:00:00:00") || (szAddr.toUpperCase() == "FF:FF:FF:FF:FF:FF"))
		{
			alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
			object.focus();
			return;
		}
		return; 
	}
	else
	{
		alert("<%tcWebApi_get("String_Entry","FilterJS5Text","s")%>");
		object.focus();
		return;
	}
}

</SCRIPT>

<META content="MSHTML 6.00.2900.3059" name=GENERATOR>
</HEAD>
			
<BODY onload="IPFilterinit();">
<FORM name=IPFILTERform action=/cgi-bin/access_ipfilter.asp method=post>
			<div id="pagestyle"><!--cindy add for border 11/28-->
				<div id="contenttype">
				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">

						<tr height="25px" class="bgcolor">

							<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterTypeText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						<tr height="30px">
	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterTypeSelectionText","s")%></td>
						     	<td align=left class="tabdata">
							<SELECT name=FILTERTYPE_index onchange=switchFilterType(this) size=1>
								<OPTION SELECTED><%tcWebApi_get("String_Entry","IPFilterIPMACFilterText","s")%>
								<OPTION><%tcWebApi_get("String_Entry","IPFilterURLFilterText","s")%>
							</SELECT> 
							</td>
						</tr>
						</table>
					</div>
					
					<%if tcwebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then %>
						<div id="block1">
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
							<tr height="25px" class="bgcolor">

								<td width="250px" align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterRuleTypeText","s")%></td>
							</tr>
						</table>
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterRuleTypeSelectionText","s")%></td>
							     	<td align=left class="tabdata">
									<SELECT name=RuleTypeSEL size=1>
										<OPTION VALUE="Black" <%if TCWebAPI_get("IpMacFilter_Common", "ListType", "h") = "Black" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterBlackListText","s")%>
										<OPTION VALUE="White" <%if TCWebAPI_get("IpMacFilter_Common", "ListType", "h") = "White" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterWhiteListText","s")%>
									</SELECT> 
								</td>
							</tr>
						</table>
					</div>
					<% end if%>

	


				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">					
						<tr height="25px" class="bgcolor">							
							<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterRuleEditingText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						<tr height="30px">
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterRuleIndexText","s")%></td>
						     	<td align=left class="tabdata">
								<SELECT name=RuleIndexSEL onchange="doIndexChange();" size=1>
									<OPTION VALUE="0" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "0" then asp_Write("selected") end if %>>1
									<OPTION VALUE="1" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "1" then asp_Write("selected") end if %>>2
									<OPTION VALUE="2" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "2" then asp_Write("selected") end if %>>3
									<OPTION VALUE="3" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "3" then asp_Write("selected") end if %>>4
									<OPTION VALUE="4" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "4" then asp_Write("selected") end if %>>5
									<OPTION VALUE="5" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "5" then asp_Write("selected") end if %>>6
									<OPTION VALUE="6" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "6" then asp_Write("selected") end if %>>7
									<OPTION VALUE="7" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "7" then asp_Write("selected") end if %>>8
									<OPTION VALUE="8" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "8" then asp_Write("selected") end if %>>9
									<OPTION VALUE="9" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "9" then asp_Write("selected") end if %>>10
									<OPTION VALUE="10" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "10" then asp_Write("selected") end if %>>11
									<OPTION VALUE="11" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "11" then asp_Write("selected") end if %>>12
									<OPTION VALUE="12" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "12" then asp_Write("selected") end if %>>13
									<OPTION VALUE="13" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "13" then asp_Write("selected") end if %>>14
									<OPTION VALUE="14" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "14" then asp_Write("selected") end if %>>15
									<OPTION VALUE="15" <%if TCWebAPI_get("WebCurSet_Entry", "ipfilter_id", "h") = "15" then asp_Write("selected") end if %>>16
								</SELECT> 
							</td>
						</tr>

						<tr height="30px">						    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","FilterCgiActive","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT TYPE="RADIO" name="RuleActiveRDO" VALUE="Yes" onClick="IpfilterOnOff(0)"
						     		
								<%if TCWebAPI_get("IpMacFilter_Entry", "Active", "h") = "Yes" then asp_write("checked") end if %>> 
									<%tcWebApi_get("String_Entry","IPFilterYesText","s")%>  
									
								&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" name="RuleActiveRDO" VALUE="No" onClick="IpfilterOnOff(1)"
								
								<%if TCWebAPI_get("IpMacFilter_Entry", "Active", "h") = "No" then asp_write("checked")%>
								<%elseif TCWebAPI_get("IpMacFilter_Entry", "Active", "h") = "N/A" then asp_write("checked") end if %>> 
									<%tcWebApi_get("String_Entry","IPFilterNoText","s")%>
							</td>
						</tr>	
						</table>
					<!--amy mocified start 0313-->
					<%if TCWebAPI_get("IpMacFilter_Entry", "Active", "h") = "Yes" then %>
						<div id="rule_active">
					<% else %>
						<div id="rule_active" style="display:none;">
					<% end if %>
					<!--amy modified end 0313-->
					
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
					<%if tcWebApi_get("WebCustom_Entry","isCZGeneralSupported","h") = "Yes" then%>
							<tr height="30px">
	
								    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterRuleTypeText","s")%></td>
								     	<td align=left class="tabdata">
										<SELECT name=FILTERRuleTypeSEL onchange="doChangeRuleType()" size=1>
											<OPTION VALUE="IP" <%if TCWebAPI_get("IpMacFilter_Entry", "RuleType", "h") = "IP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterIPText","s")%>
											<OPTION VALUE="MAC" <%if TCWebAPI_get("IpMacFilter_Entry", "RuleType", "h") = "MAC" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterMACText","s")%>
										</SELECT>
									</td>
								</tr>						
								<tr height="30px" style="display:none" >

								    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterInterfaceText","s")%></td>
								     	<td align=left class="tabdata">
								<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
										<SELECT name=InterfaceSEL size=1 onchange="doVCChange();">
											<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then%>
											<OPTION VALUE="PVC0" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC0" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC0Text","s")%>
											<!--wang only use one wan port 20190927
											<OPTION VALUE="PVC1" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC1" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC1Text","s")%>
											<OPTION VALUE="PVC2" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC2" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC2Text","s")%>
											<OPTION VALUE="PVC3" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC3" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC3Text","s")%>
											<!--wang
											<OPTION VALUE="PVC4" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC4" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC4Text","s")%>
											<OPTION VALUE="PVC5" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC5" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC5Text","s")%>
											<OPTION VALUE="PVC6" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC6" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC6Text","s")%>
											<OPTION VALUE="PVC7" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC7" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC7Text","s")%>
											-->
											<%end if%>

											<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
											<OPTION VALUE="PVC0" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC0" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC0Text","s")%>
											<!--wang only use one wan port 20190927
											<OPTION VALUE="PVC1" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC1" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC1Text","s")%>
											<OPTION VALUE="PVC2" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC2" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC2Text","s")%>
											<OPTION VALUE="PVC3" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC3" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC3Text","s")%>
											<!--wang
											<OPTION VALUE="PVC4" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC4" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC4Text","s")%>
											<OPTION VALUE="PVC5" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC5" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC5Text","s")%>
											<OPTION VALUE="PVC6" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC6" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC6Text","s")%>
											<OPTION VALUE="PVC7" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC7" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC7Text","s")%>
											-->
											<%end if%>

											<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
											<OPTION VALUE="PVC8" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC8Text","s")%>
											<%end if%>

											<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
											<OPTION VALUE="PVC10" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC10Text","s")%>
											<%end if%>
										</SELECT> 
									</td>
								</tr>		
									<%else%><!--else if  tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") <> "Yes"-->		
										<SELECT name=InterfaceSEL size=1>
											<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then%>
											<OPTION VALUE="PVC0" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC0" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC0Text","s")%>
											<!--wang only use one wan port 20190927
											<OPTION VALUE="PVC1" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC1" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC1Text","s")%>
											<OPTION VALUE="PVC2" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC2" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC2Text","s")%>
											<OPTION VALUE="PVC3" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC3" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC3Text","s")%>
											<!--wang
											<OPTION VALUE="PVC4" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC4" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC4Text","s")%>
											<OPTION VALUE="PVC5" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC5" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC5Text","s")%>
											<OPTION VALUE="PVC6" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC6" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC6Text","s")%>
											<OPTION VALUE="PVC7" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC7" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC7Text","s")%>
											-->
											<%end if%>

											<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
											<OPTION VALUE="PVC0" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC0" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC0Text","s")%>
											<!--wang only use one wan port 20190927
											<OPTION VALUE="PVC1" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC1" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC1Text","s")%>
											<OPTION VALUE="PVC2" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC2" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC2Text","s")%>
											<OPTION VALUE="PVC3" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC3" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC3Text","s")%>
											<!--wang
											<OPTION VALUE="PVC4" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC4" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC4Text","s")%>
											<OPTION VALUE="PVC5" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC5" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC5Text","s")%>
											<OPTION VALUE="PVC6" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC6" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC6Text","s")%>
											<OPTION VALUE="PVC7" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC7" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC7Text","s")%>
											-->
											<%end if%>

											<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
											<OPTION VALUE="PVC8" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC8" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC8Text","s")%>
											<%end if%>

											<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
											<OPTION VALUE="PVC10" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC10" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC10Text","s")%>
											<%end if%>
										</SELECT> 
									</td>
								</tr>
							<%end if%><!--end if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes"-->

								<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
								<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then%>
								<%if tcWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8" then%>
											<tr height="30px">
											    	
											    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","FilterServiceText","s")%></td>
											     	<td align=left class="tabdata">
													<SELECT name=ServiceID size=1>
														<OPTION VALUE="PVC8_0" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_0" then asp_write("selected") end if %>>0
														<OPTION VALUE="PVC8_1" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_1" then asp_write("selected") end if %>>1
														<OPTION VALUE="PVC8_2" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_2" then asp_write("selected") end if %>>2
														<OPTION VALUE="PVC8_3" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_3" then asp_write("selected") end if %>>3
														<OPTION VALUE="PVC8_4" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_4" then asp_write("selected") end if %>>4
														<OPTION VALUE="PVC8_5" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_5" then asp_write("selected") end if %>>5
														<OPTION VALUE="PVC8_6" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_6" then asp_write("selected") end if %>>6
														<OPTION VALUE="PVC8_7" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_7" then asp_write("selected") end if %>>7
													</SELECT>
												</td>
											</tr>
								<%end if%>

									<%if tcWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10" then%>
											<tr height="30px">
											    	
											    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","FilterServiceText","s")%></td>
											     	<td align=left class="tabdata">
													<SELECT name=ServiceID size=1>
														<OPTION VALUE="PVC10_0" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_0" then asp_write("selected") end if %>>0
														<OPTION VALUE="PVC10_1" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_1" then asp_write("selected") end if %>>1
														<OPTION VALUE="PVC10_2" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_2" then asp_write("selected") end if %>>2
														<OPTION VALUE="PVC10_3" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_3" then asp_write("selected") end if %>>3
														<OPTION VALUE="PVC10_4" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_4" then asp_write("selected") end if %>>4
														<OPTION VALUE="PVC10_5" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_5" then asp_write("selected") end if %>>5
														<OPTION VALUE="PVC10_6" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_6" then asp_write("selected") end if %>>6
														<OPTION VALUE="PVC10_7" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_7" then asp_write("selected") end if %>>7
													</SELECT>
												</td>
											</tr>
									<%end if%>
							<%end if%>
							<%end if%>

								<tr height="30px">
								    	
								    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterDirectionText","s")%></td>
								     	<td align=left class="tabdata">
									<SELECT name=DirectionSEL size=1>
										<OPTION VALUE="Both" <%if TCWebAPI_get("IpMacFilter_Entry", "Direction", "h") = "Both" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterDirectionIndex0Text","s")%>
										<OPTION VALUE="Incoming" <%if TCWebAPI_get("IpMacFilter_Entry", "Direction", "h") = "Incoming" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterDirectionIndex1Text","s")%>
										<OPTION VALUE="Outgoing" <%if TCWebAPI_get("IpMacFilter_Entry", "Direction", "h") = "Outgoing" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterDirectionIndex2Text","s")%>
									</SELECT>
									</td>
								</tr>	
								
								</table>
							</div><!--end div-rule_active-->
					<!--amy modified start 0313-->
					<%if TCWebAPI_get("IpMacFilter_Entry", "Active", "h") = "Yes" then %>
						<% if TCWebAPI_get("IpMacFilter_Entry", "RuleType", "h") = "IP"  then %>
							<div id="divIP">
						<% else %>
							<div id="divIP" style="display:none;">
						<% end if %>
					<% else %>
						<div id="divIP" style="display:none;">
					<% end if %>
					<!-- amy modified end 0313-->
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
							<tr height="30px">						  
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterSouIPAddrText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT name=SrcIPTXT onblur=blockMask(0); maxLength=15 size=15 VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "SrcIPAddr", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "SrcIPAddr", "s") else asp_Write("0.0.0.0") end if %>">
									<%tcWebApi_get("String_Entry","IPFilterSouIPAddrComText","s")%>
								</td>
							</tr>

							<tr height="30px">	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterSubnetMaskText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT maxLength=15 size=15 name=SrcMaskTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "SrcIPMask", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "SrcIPMask", "s") else asp_Write("0.0.0.0") end if %>" > 
								</td>
							</tr>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterPortNumberText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT maxLength=7 size=8 name=SrcPortTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "SrcPort", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "SrcPort", "s") else asp_Write("0") end if %>" >
										<%tcWebApi_get("String_Entry","IPFilterMarkText","s")%>
								</td>
							</tr>

							
						</table>
					

					
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >							
							<tr height="30px">							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterDestIPAddrText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT onblur=blockMask(1); maxLength=15 size=15 name=DestIPTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "DesIPAddr", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "DesIPAddr", "s") else asp_Write("0.0.0.0") end if %>" >
									<%tcWebApi_get("String_Entry","IPFilterSouIPAddrComText","s")%>
								</td>
							</tr>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterSubnetMaskText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT maxLength=15 size=15 name=DestMaskTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "DesIPMask", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "DesIPMask", "s") else asp_Write("0.0.0.0") end if %>" > 
								</td>
							</tr>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterPortNumberText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT maxLength=7 size=8 name=DestPortTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "DesPort", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "DesPort", "s") else asp_Write("0") end if %>" >
									<%tcWebApi_get("String_Entry","IPFilterMark1Text","s")%> 
								</td>
							</tr>						
						</table>
					

					
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
							
								<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then%>
								<tr height="30px">
								    	
								    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterDSCPText","s")%></td>
								     	<td align=left class="tabdata">
								     		<INPUT maxLength=7 size=8 name=DSCPTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "DSCP", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "DSCP", "s") else asp_Write("0") end if %>" >
								<%tcWebApi_get("String_Entry","IPFilterDSCPNoteText","s")%> 
									</td>
								</tr>
							<%end if%>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterProtocolText","s")%></td>
							     	<td align=left class="tabdata">
									<SELECT size=1 name=ProtocolSEL>
										<OPTION VALUE="TCP" <%if TCWebAPI_get("IpMacFilter_Entry", "Protocol", "h") = "TCP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterTCPText","s")%>
										<OPTION VALUE="UDP" <%if TCWebAPI_get("IpMacFilter_Entry", "Protocol", "h") = "UDP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterUDPText","s")%>
										<OPTION VALUE="ICMP" <%if TCWebAPI_get("IpMacFilter_Entry", "Protocol", "h") = "ICMP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterICMPText","s")%>
									</SELECT>
								</td>
							</tr>

							
						</table>
					
					
				</div>	<!--divIP-->	
				
				<!--amy modified start 0313-->
				<%if TCWebAPI_get("IpMacFilter_Entry", "Active", "h") = "Yes" then %>
					<%if TCWebAPI_get("IpMacFilter_Entry", "RuleType", "h") = "MAC" then %>
						<div id="divMac">
					<% else %>
						<div id="divMac" style="display:none;">
					<% end if %>
				<% else %>
					<div id="divMac" style="display:none;">
				<% end if %>
				<!--amy modified end 0313-->
				
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						

						<tr height="30px">
						    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterMACAddressText","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT name=MacAddrTXT onblur=doMACcheck(this) maxLength=17 size=17 value="<%if TCWebAPI_get("IpMacFilter_Entry", "MacAddr", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "MacAddr", "s") else asp_Write("") end if %>">  
							</td>
						</tr>


					</table>

				</div>
				</div>
		<%else%><!--else if tcWebApi_get("WebCustom_Entry","isCZGeneralSupported","h") <> "Yes"-->
							<tr height="30px" style="display:none">							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterInterfaceText","s")%></td>
							     	<td align=left class="tabdata">
						<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
								<SELECT name=InterfaceSEL size=1 onchange="doVCChange();">
									<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then%>
									<OPTION VALUE="PVC0" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC0" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC0Text","s")%>
									<!--wang only use one wan port 20190927
									<OPTION VALUE="PVC1" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC1" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC1Text","s")%>
									<OPTION VALUE="PVC2" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC2" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC2Text","s")%>
									<OPTION VALUE="PVC3" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC3" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC3Text","s")%>
									<!--wang
									<OPTION VALUE="PVC4" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC4" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC4Text","s")%>
									<OPTION VALUE="PVC5" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC5" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC5Text","s")%>
									<OPTION VALUE="PVC6" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC6" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC6Text","s")%>
									<OPTION VALUE="PVC7" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC7" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC7Text","s")%>
									-->
									<%end if%>

									<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
									<OPTION VALUE="PVC0" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC0" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC0Text","s")%>
									<!--wang only use one wan port 20190927
									<OPTION VALUE="PVC1" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC1" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC1Text","s")%>
									<OPTION VALUE="PVC2" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC2" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC2Text","s")%>
									<OPTION VALUE="PVC3" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC3" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC3Text","s")%>
									<!--wang
									<OPTION VALUE="PVC4" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC4" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC4Text","s")%>
									<OPTION VALUE="PVC5" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC5" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC5Text","s")%>
									<OPTION VALUE="PVC6" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC6" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC6Text","s")%>
									<OPTION VALUE="PVC7" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC7" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC7Text","s")%>
									-->
									<%end if%>

									<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
									<OPTION VALUE="PVC8" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC8Text","s")%>
									<%end if%>

									<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
									<OPTION VALUE="PVC10" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC10Text","s")%>
									<%end if%>
								</SELECT> 
													</td>
												</tr>

														<%else%><!-- else if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") <> "Yes"  -->		
								<SELECT name=InterfaceSEL size=1>
									<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then%>
									<OPTION VALUE="PVC0" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC0" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC0Text","s")%>
									<!--wang only use one wan port 20190927
									<OPTION VALUE="PVC1" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC1" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC1Text","s")%>
									<OPTION VALUE="PVC2" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC2" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC2Text","s")%>
									<OPTION VALUE="PVC3" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC3" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC3Text","s")%>
									<!--wang
									<OPTION VALUE="PVC4" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC4" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC4Text","s")%>
									<OPTION VALUE="PVC5" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC5" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC5Text","s")%>
									<OPTION VALUE="PVC6" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC6" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC6Text","s")%>
									<OPTION VALUE="PVC7" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC7" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC7Text","s")%>
									-->
									<%end if%>

									<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
									<OPTION VALUE="PVC0" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC0" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC0Text","s")%>
									<!--wang only use one wan port 20190927
									<OPTION VALUE="PVC1" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC1" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC1Text","s")%>
									<OPTION VALUE="PVC2" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC2" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC2Text","s")%>
									<OPTION VALUE="PVC3" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC3" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC3Text","s")%>
									<!--wang
									<OPTION VALUE="PVC4" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC4" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC4Text","s")%>
									<OPTION VALUE="PVC5" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC5" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC5Text","s")%>
									<OPTION VALUE="PVC6" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC6" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC6Text","s")%>
									<OPTION VALUE="PVC7" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC7" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterPVC7Text","s")%>
									-->
									<%end if%>

									<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
									<OPTION VALUE="PVC8" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC8" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC8Text","s")%>
									<%end if%>

									<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
									<OPTION VALUE="PVC10" <%if TCWebAPI_get("IpMacFilter_Entry", "Interface", "h") = "PVC10" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","StaticRoutePVC10Text","s")%>
									<%end if%>
								</SELECT> 
								</td>
							</tr>
									<%end if%><!--end if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" -->

								<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
									<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") <> "Yes" then%>
										<%if tcWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8" then%>
										<tr height="30px">
										    	
										    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","FilterServiceText","s")%></td>
										     	<td align=left class="tabdata">
												<SELECT name=ServiceID size=1>
													<OPTION VALUE="PVC8_0" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_0" then asp_write("selected") end if %>>0
													<OPTION VALUE="PVC8_1" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_1" then asp_write("selected") end if %>>1
													<OPTION VALUE="PVC8_2" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_2" then asp_write("selected") end if %>>2
													<OPTION VALUE="PVC8_3" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_3" then asp_write("selected") end if %>>3
													<OPTION VALUE="PVC8_4" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_4" then asp_write("selected") end if %>>4
													<OPTION VALUE="PVC8_5" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_5" then asp_write("selected") end if %>>5
													<OPTION VALUE="PVC8_6" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_6" then asp_write("selected") end if %>>6
													<OPTION VALUE="PVC8_7" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC8_7" then asp_write("selected") end if %>>7
												</SELECT>
											</td>
										</tr>
										<%end if%>

										<%if tcWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10" then%>
										<tr height="30px">
										    	
										    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","FilterServiceText","s")%></td>
										     	<td align=left class="tabdata">
											<SELECT name=ServiceID size=1>
												<OPTION VALUE="PVC10_0" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_0" then asp_write("selected") end if %>>0
												<OPTION VALUE="PVC10_1" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_1" then asp_write("selected") end if %>>1
												<OPTION VALUE="PVC10_2" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_2" then asp_write("selected") end if %>>2
												<OPTION VALUE="PVC10_3" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_3" then asp_write("selected") end if %>>3
												<OPTION VALUE="PVC10_4" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_4" then asp_write("selected") end if %>>4
												<OPTION VALUE="PVC10_5" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_5" then asp_write("selected") end if %>>5
												<OPTION VALUE="PVC10_6" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_6" then asp_write("selected") end if %>>6
												<OPTION VALUE="PVC10_7" <%if TCWebAPI_get("WebCustom_Entry", "filter_interface", "h") = "PVC10_7" then asp_write("selected") end if %>>7
											</SELECT>
											</td>
										</tr>
										<%end if%>
									<%end if%>
								<%end if%>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterDirectionText","s")%></td>
							     	<td align=left class="tabdata">
								<SELECT name=DirectionSEL size=1>
									<OPTION VALUE="Both" <%if TCWebAPI_get("IpMacFilter_Entry", "Direction", "h") = "Both" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterDirectionIndex0Text","s")%>
									<OPTION VALUE="Incoming" <%if TCWebAPI_get("IpMacFilter_Entry", "Direction", "h") = "Incoming" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterDirectionIndex1Text","s")%>
									<OPTION VALUE="Outgoing" <%if TCWebAPI_get("IpMacFilter_Entry", "Direction", "h") = "Outgoing" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterDirectionIndex2Text","s")%>
								</SELECT>
								</td>
							</tr>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterRuleTypeText","s")%></td>
							     	<td align=left class="tabdata">
								<SELECT name=FILTERRuleTypeSEL onchange="doChangeRuleType()" size=1>
									<OPTION VALUE="IP" <%if TCWebAPI_get("IpMacFilter_Entry", "RuleType", "h") = "IP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterIPText","s")%>
									<OPTION VALUE="MAC" <%if TCWebAPI_get("IpMacFilter_Entry", "RuleType", "h") = "MAC" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterMACText","s")%>
								</SELECT>
								</td>
							</tr>
	
					</table>
					</div><!--end div-rule_active-->
					
					<!--amy modified start 0313-->
					<%if TCWebAPI_get("IpMacFilter_Entry", "Active", "h") = "Yes" then %>
						<% if TCWebAPI_get("IpMacFilter_Entry", "RuleType", "h") = "IP"  then %>
							<div id="divIP">
						<% else %>
							<div id="divIP" style="display:none;">
						<% end if %>
					<% else %>
						<div id="divIP" style="display:none;">
					<% end if %>
					<!-- amy modified end 0313-->

						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
							

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterSouIPAddrText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT name=SrcIPTXT onblur=blockMask(0); maxLength=15 size=15 VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "SrcIPAddr", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "SrcIPAddr", "s") else asp_Write("0.0.0.0") end if %>">
								<%tcWebApi_get("String_Entry","IPFilterSouIPAddrComText","s")%>
								</td>
							</tr>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterSubnetMaskText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT maxLength=15 size=15 name=SrcMaskTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "SrcIPMask", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "SrcIPMask", "s") else asp_Write("0.0.0.0") end if %>" >
								</td>
							</tr>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterPortNumberText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT maxLength=7 size=8 name=SrcPortTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "SrcPort", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "SrcPort", "s") else asp_Write("0") end if %>" >
									<%tcWebApi_get("String_Entry","IPFilterMarkText","s")%>
								</td>
							</tr>

							
						</table>
					

					
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
							

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterDestIPAddrText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT onblur=blockMask(1); maxLength=15 size=15 name=DestIPTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "DesIPAddr", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "DesIPAddr", "s") else asp_Write("0.0.0.0") end if %>" >
									<%tcWebApi_get("String_Entry","IPFilterSouIPAddrComText","s")%>
								</td>
							</tr>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterSubnetMaskText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT maxLength=15 size=15 name=DestMaskTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "DesIPMask", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "DesIPMask", "s") else asp_Write("0.0.0.0") end if %>" >
								</td>
							</tr>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterPortNumberText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT maxLength=7 size=8 name=DestPortTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "DesPort", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "DesPort", "s") else asp_Write("0") end if %>" >
									<%tcWebApi_get("String_Entry","IPFilterMark1Text","s")%>
								</td>
							</tr>

						</table>
					

					
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
							
						
								<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then%>
								<tr height="30px">
								    	
								    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterDSCPText","s")%></td>
								     	<td align=left class="tabdata">
								     		<INPUT maxLength=7 size=8 name=DSCPTXT VALUE="<%if TCWebAPI_get("IpMacFilter_Entry", "DSCP", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "DSCP", "s") else asp_Write("0") end if %>" >
										<%tcWebApi_get("String_Entry","IPFilterDSCPNoteText","s")%>
									</td>
								</tr>
								<%end if%>

							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterProtocolText","s")%></td>
							     	<td align=left class="tabdata">
									<SELECT size=1 name=ProtocolSEL>
										<OPTION VALUE="TCP" <%if TCWebAPI_get("IpMacFilter_Entry", "Protocol", "h") = "TCP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterTCPText","s")%>
										<OPTION VALUE="UDP" <%if TCWebAPI_get("IpMacFilter_Entry", "Protocol", "h") = "UDP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterUDPText","s")%>
										<OPTION VALUE="ICMP" <%if TCWebAPI_get("IpMacFilter_Entry", "Protocol", "h") = "ICMP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","IPFilterICMPText","s")%>
									</SELECT>
								</td>
							</tr>

							
						</table>
					
				</div><!--end divIp-->
				
				<!--amy modified start 0313-->
				<%if TCWebAPI_get("IpMacFilter_Entry", "Active", "h") = "Yes" then %>
					<%if TCWebAPI_get("IpMacFilter_Entry", "RuleType", "h") = "MAC" then %>
						<div id="divMac">
					<% else %>
						<div id="divMac" style="display:none;">
					<% end if %>
				<% else %>
					<div id="divMac" style="display:none;">
				<% end if %>
				<!--amy modified end 0313-->
				
					
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
					
						<tr height="30px">
						    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterMACAddressText","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT name=MacAddrTXT onblur=doMACcheck(this) maxLength=17 size=17 value="<%if TCWebAPI_get("IpMacFilter_Entry", "MacAddr", "h") <> "N/A" then TCWebAPI_get("IpMacFilter_Entry", "MacAddr", "s") else asp_Write("") end if %>">
							</td>
						</tr>						
					</table>
				</div>

				</div>

		<%end if%><!---end   if tcWebApi_get("WebCustom_Entry","isCZGeneralSupported","h") ="Yes" --->

				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">					

  
						<tr height="25px" class="bgcolor">
							
							<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterListingText","s")%></td>
						</tr>
					</table>
					
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata"  >	
						<tr >
	
						    	<td colspan="2" align=left class="tabdata">
		<!--
			<iframe src="/cgi-bin/access_ipfilterlist.cgi" frameborder="0" width="560" height="200"></iframe>
			-->
			
					<%if tcwebApi_get("IpMacFilter_Common","Duplicate","h")<>"Yes" then %>
							<div id=ipmacList ></div>
							<script language=JavaScript>
							    var tableHeader = [
											["40","<%tcWebApi_get("String_Entry","FilterCgiIndex","s")%>"],
											["46","<%tcWebApi_get("String_Entry","FilterCgiActive","s")%>"],
										//	["62","<%tcWebApi_get("String_Entry","FilterCgiInterface","s")%>"],//amy removed 2018-01-13.
											["64","<%tcWebApi_get("String_Entry","FilterCgiDirection","s")%>"],
											["93","<%tcWebApi_get("String_Entry","FilterCgiSrcAddress","s")%>" + "<%tcWebApi_get("String_Entry","FilterCgiMask","s")%>"],
											["93","<%tcWebApi_get("String_Entry","FilterCgiDestAddress","s")%>" + "<%tcWebApi_get("String_Entry","FilterCgiMask","s")%>"],
											["87","<%tcWebApi_get("String_Entry","FilterCgiMacAddress","s")%>"],
											["33","<%tcWebApi_get("String_Entry","FilterCgiSrcPort","s")%>"],
											["34","<%tcWebApi_get("String_Entry","FilterCgiDestPort","s")%>"],
										<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>
											["34","<%tcWebApi_get("String_Entry","IPFilterDSCPText","s")%>"],
										<%end if%>
											["60","<%tcWebApi_get("String_Entry","FilterCgiProtocol","s")%>"]
											];

								var tableData = [
									<%if TCWebAPI_get("IpMacFilter_Entry0", "RuleType", "h") = "MAC" then %>
											["1", "<%tcWebApi_get("IpMacFilter_Entry0", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry0", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry0", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%> "N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry0", "RuleType", "h") = "IP" then %>
											["1", "<%tcWebApi_get("IpMacFilter_Entry0", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry0", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry0", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry0", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry0", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry0", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry0", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry0", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry0", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry0", "Protocol","s")%>"],
									<%else%>
											["1", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry1", "RuleType", "h") = "MAC" then %>
											["2","<%tcWebApi_get("IpMacFilter_Entry1", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry1", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry1", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry1", "RuleType", "h") = "IP" then %>
											["2","<%tcWebApi_get("IpMacFilter_Entry1", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry1", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry1", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry1", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry1", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry1", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry1", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry1", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry1", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry1", "Protocol","s")%>"],
									<%else%>
											["2", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry2", "RuleType", "h") = "MAC" then %>
											["3", "<%tcWebApi_get("IpMacFilter_Entry2", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry2", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry2", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry2", "RuleType", "h") = "IP" then %>
											["3", "<%tcWebApi_get("IpMacFilter_Entry2", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry2", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry2", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry2", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry2", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry2", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry2", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry2", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry2", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry2", "Protocol","s")%>"],
									<%else%>
											["3", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry3", "RuleType", "h") = "MAC" then %>
											["4", "<%tcWebApi_get("IpMacFilter_Entry3", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry3", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry3", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry3", "RuleType", "h") = "IP" then %>
											["4", "<%tcWebApi_get("IpMacFilter_Entry3", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry3", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry3", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry3", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry3", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry3", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry3", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry3", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry3", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry3", "Protocol","s")%>"],
									<%else%>
											["4", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry4", "RuleType", "h") = "MAC" then %>
											["5", "<%tcWebApi_get("IpMacFilter_Entry4", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry4", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry4", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry4", "RuleType", "h") = "IP" then %>
											["5", "<%tcWebApi_get("IpMacFilter_Entry4", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry4", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry4", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry4", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry4", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry4", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry4", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry4", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry4", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry4", "Protocol","s")%>"],
									<%else%>
											["5", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry5", "RuleType", "h") = "MAC" then %>
											["6", "<%tcWebApi_get("IpMacFilter_Entry5", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry5", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry5", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry5", "RuleType", "h") = "IP" then %>
											["6", "<%tcWebApi_get("IpMacFilter_Entry5", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry5", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry5", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry5", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry5", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry5", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry5", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry5", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry5", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry5", "Protocol","s")%>"],
									<%else%>
											["6", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry6", "RuleType", "h") = "MAC" then %>
											["7", "<%tcWebApi_get("IpMacFilter_Entry6", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry6", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry6", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry6", "RuleType", "h") = "IP" then %>
											["7", "<%tcWebApi_get("IpMacFilter_Entry6", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry6", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry6", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry6", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry6", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry6", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry6", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry6", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry6", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry6", "Protocol","s")%>"],
									<%else%>
											["7", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry7", "RuleType", "h") = "MAC" then %>
											["8", "<%tcWebApi_get("IpMacFilter_Entry7", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry7", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry7", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry7", "RuleType", "h") = "IP" then %>
											["8", "<%tcWebApi_get("IpMacFilter_Entry7", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry7", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry7", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry7", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry7", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry7", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry7", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry7", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry7", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry7", "Protocol","s")%>"],
									<%else%>
											["8", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry8", "RuleType", "h") = "MAC" then %>
											["9", "<%tcWebApi_get("IpMacFilter_Entry8", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry8", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry8", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry8", "RuleType", "h") = "IP" then %>
											["9", "<%tcWebApi_get("IpMacFilter_Entry8", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry8", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry8", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry8", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry8", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry8", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry8", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry8", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry8", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry8", "Protocol","s")%>"],
									<%else%>
											["9", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry9", "RuleType", "h") = "MAC" then %>
											["10", "<%tcWebApi_get("IpMacFilter_Entry9", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry9", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry9", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry9", "RuleType", "h") = "IP" then %>
											["10", "<%tcWebApi_get("IpMacFilter_Entry9", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry9", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry9", "SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry9", "SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry9", "DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry9", "DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry9", "SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry9", "DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry9", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry9", "Protocol","s")%>"],
									<%else%>
											["10", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry10", "RuleType", "h") = "MAC" then %>
											["11", "<%tcWebApi_get("IpMacFilter_Entry10", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry10", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry10", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry10", "RuleType", "h") = "IP" then %>
											["11", "<%tcWebApi_get("IpMacFilter_Entry10", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry10", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry10","SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry10","SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry10","DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry10","DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry10","SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry10","DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry10", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry10","Protocol","s")%>"],
									<%else%>
											["11", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry11", "RuleType", "h") = "MAC" then %>
											["12", "<%tcWebApi_get("IpMacFilter_Entry11", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry11", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry11", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry11", "RuleType", "h") = "IP" then %>
											["12", "<%tcWebApi_get("IpMacFilter_Entry11", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry11", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry11","SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry11","SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry11","DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry11","DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry11","SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry11","DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry11", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry11","Protocol","s")%>"],
									<%else%>
											["12", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry12", "RuleType", "h") = "MAC" then %>
											["13", "<%tcWebApi_get("IpMacFilter_Entry12", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry12", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry12", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry12", "RuleType", "h") = "IP" then %>
											["13", "<%tcWebApi_get("IpMacFilter_Entry12", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry12", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry12","SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry12","SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry12","DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry12","DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry12","SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry12","DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry12", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry12","Protocol","s")%>"],
									<%else%>
											["13", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry13", "RuleType", "h") = "MAC" then %>
											["14", "<%tcWebApi_get("IpMacFilter_Entry13", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry13", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry13", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry13", "RuleType", "h") = "IP" then %>
											["14", "<%tcWebApi_get("IpMacFilter_Entry13", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry13", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry13","SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry13","SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry13","DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry13","DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry13","SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry13","DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry13", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry13","Protocol","s")%>"],
									<%else%>
											["14", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry14", "RuleType", "h") = "MAC" then %>
											["15", "<%tcWebApi_get("IpMacFilter_Entry14", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry14", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry14", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%elseif TCWebAPI_get("IpMacFilter_Entry14", "RuleType", "h") = "IP" then %>
											["15", "<%tcWebApi_get("IpMacFilter_Entry14", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry14", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry14","SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry14","SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry14","DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry14","DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry14","SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry14","DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry14", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry14","Protocol","s")%>"],
									<%else%>
											["15", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"],
									<%end if%>
											
									<%if TCWebAPI_get("IpMacFilter_Entry15", "RuleType", "h") = "MAC" then %>
											["16", "<%tcWebApi_get("IpMacFilter_Entry15", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry15", "Direction","s")%>","N/A","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry15", "MacAddr","s")%>","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"]
									<%elseif TCWebAPI_get("IpMacFilter_Entry15", "RuleType", "h") = "IP" then %>
											["16", "<%tcWebApi_get("IpMacFilter_Entry15", "Active","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry15", "Direction","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry15","SrcIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry15","SrcIPMask","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry15","DesIPAddr","s")%>" + "/<br>" + "<%tcWebApi_staticGet("IpMacFilter_Entry15","DesIPMask","s")%>","N/A","<%tcWebApi_staticGet("IpMacFilter_Entry15","SrcPort","s")%>","<%tcWebApi_staticGet("IpMacFilter_Entry15","DesPort","s")%>",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"<%tcWebApi_staticGet("IpMacFilter_Entry15", "DSCP","s")%>",<%end if%>"<%tcWebApi_staticGet("IpMacFilter_Entry15","Protocol","s")%>"]
									<%else%>
											["16", "N/A","N/A","N/A","N/A","N/A","N/A","N/A",<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") = "Yes" then %>"N/A",<%end if%>"N/A"]
									<%end if%>	
											];
										
									for(var i=0;i<tableData.length;i++)
									{
											if(tableData[i][1]=="Yes")
											{
												tableData[i][1]="<%tcWebApi_get("String_Entry","IPFilterYesText","s")%>";
											}
											else if(tableData[i][1]=="No")	
											{
												tableData[i][1]="<%tcWebApi_get("String_Entry","IPFilterNoText","s")%>";
											}	
											
											if(tableData[i][2]=="Both")
											{
												tableData[i][2]="<%tcWebApi_get("String_Entry","IPFilterDirectionIndex0Text","s")%>";
											}	
											else if(tableData[i][2]=="Incoming")
											{
												tableData[i][2]="<%tcWebApi_get("String_Entry","IPFilterDirectionIndex1Text","s")%>";
											}	
											else if(tableData[i][2]=="Outgoing")
											{
												tableData[i][2]="<%tcWebApi_get("String_Entry","IPFilterDirectionIndex2Text","s")%>";
											}	
									}
								tableShow('ipmacList',tableHeader,tableData,1);
							</script>
						<%end if%>
						    	</td>							     
						</tr>


					</table>
					
				</div>

				<div id="button0">
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
						<tr height="25px">
							<td align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","IPFilterSaveDelText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						<tr height="40px">
			
							<td width="250px" align=left class="tabdata" style="padding-left:20px;">
								<INPUT type=hidden name=c2Support VALUE="0">
								<INPUT type=hidden name=FULL>
								<INPUT type=hidden name=RuleTypeChange VALUE="0">
								<%if tcwebApi_get("WebCustom_Entry","isCZGeneralSupported","h") = "Yes" then %>
								<INPUT type=hidden name=RuleTypeMacDirection VALUE="Incoming">
								<INPUT type=hidden name=RuleTypeMacInterface VALUE="Lan">
								<%end if%>
								<INPUT type="hidden" name="Duplicate" VALUE="<%if tcwebApi_get("IpMacFilter_Common","Duplicate","h")="Yes" then asp_write("1") else asp_write("0") end if%>">
								<Input type="hidden" name="NoDup" value="No">
								<INPUT type=hidden name=DSCPFLT VALUE="<%if TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "h") <> "N/A" then TCWebAPI_get("WebCustom_Entry", "isDSCPSupported", "s") else asp_Write("No") end if %>">
								<INPUT type="submit" class="button1" value=<%tcWebApi_get("String_Entry","ButtonSaveText","s")%> name=IpFilterApply onclick="doAdd();return validateInput();">
							
							
							
								<INPUT type="submit" class="button1" value=<%tcWebApi_get("String_Entry","ButtonDeleteText","s")%> name=IpFilterDelete onclick="doDel();"> 
							
							
							
								<INPUT type="reset" style="display:none" class="button1" value=<%tcWebApi_get("String_Entry","ButtonCancelText","s")%> name=IpFilterCancel onclick="doCancel();" > 
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
</FORM>
</BODY>
</HTML>
