<%
if Request_Form("QOS_Flag")="5" then
	TCWebAPI_set("WebCurSet_Entry","qos_bandwidth_id","add_num")
	
	TCWebAPI_set("QosBandwidth_Entry","Qos_Description","QoS_Bandwidth_Control_Description")
	if Request_Form("MacAddFlag")="1" then
	TCWebAPI_set("QosBandwidth_Entry","Qos_Mac","QoS_Bandwidth_Control_Mac")
	else
	   TCWebAPI_set("QosBandwidth_Entry","Qos_Mac","QoS_Bandwidth_Control_mac_select")
	end if   
	TCWebAPI_set("QosBandwidth_Entry","Qos_Up","QoS_Bandwidth_Control_Up")	
	TCWebAPI_set("QosBandwidth_Entry","Qos_Down","QoS_Bandwidth_Control_Down")
	TCWebAPI_set("QosBandwidth_Entry","Qos_Num","add_num")
		
	TCWebAPI_commit("QosBandwidth_Entry")
end if

if Request_form("delnum") <> "" then
		tcWebApi_set("QosBandwidth_Common","deleteNum","delnum")
		TCWebAPI_commit("QosBandwidth_Common")
end if

request_Form("QosRuleIndex")

/*add a rule*/
if request_Form("QOS_Flag") = "0" then
	TCWebAPI_set("WebCurSet_Entry","qos_id","QosRuleIndex")
if request_Form("QosRuleActive") = "Yes" then
	TCWebAPI_unset("QoS_Entry")
end if
	/*add new data*/
	TCWebAPI_set("QoS_Common","Active","Qos_active")
	
	TCWebAPI_set("QoS_Common","QoSOptType","qoSOptType")
	TCWebAPI_set("QoS_Entry","Active","QosRuleActive")
	TCWebAPI_set("QoS_Entry","Application","QosApp")
	TCWebAPI_set("QoS_Entry","eth0.1","QosPhyPortEth0")
	if request_Form("QoS1PortFlag") <> "Yes" then
		TCWebAPI_set("QoS_Entry","eth0.2","QosPhyPortEth1")
		if request_Form("QoS2PortsFlag") <> "Yes" then
			TCWebAPI_set("QoS_Entry","eth0.3","QosPhyPortEth2")	
			TCWebAPI_set("QoS_Entry","eth0.4","QosPhyPortEth3")
		end if
	end if
/*
	TCWebAPI_set("QoS_Entry","usb0","QosPhyPortUsb0")
*/
	if request_Form("wlanISExist") = "On" then
		if TCWebAPI_get("WLan_Common","BssidNum","h") = "1" then
			TCWebAPI_set("QoS_Entry","ra0","QosPhyPortRa0")
		elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "2" then
			TCWebAPI_set("QoS_Entry","ra0","QosPhyPortWLANMssid0")
			if request_Form("UserMode")="1" then
				if request_Form("WlanPort_1")="Yes" then
					TCWebAPI_set("QoS_Entry","ra1","WlanPort_1")
				end if
			else
				TCWebAPI_set("QoS_Entry","ra1","QosPhyPortWLANMssid1")
			end if
		elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "3" then
			TCWebAPI_set("QoS_Entry","ra0","QosPhyPortWLANMssid0")
			if request_Form("UserMode")="1" then
				if request_Form("WlanPort_1")="Yes" then
					TCWebAPI_set("QoS_Entry","ra1","WlanPort_1")
				end if
				if request_Form("WlanPort_2")="Yes" then
					TCWebAPI_set("QoS_Entry","ra2","WlanPort_2")
				end if
			else
				TCWebAPI_set("QoS_Entry","ra1","QosPhyPortWLANMssid1")
				TCWebAPI_set("QoS_Entry","ra2","QosPhyPortWLANMssid2")
			end if
		elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "4" then
			TCWebAPI_set("QoS_Entry","ra0","QosPhyPortWLANMssid0")
			if request_Form("UserMode")="1" then
				if request_Form("WlanPort_1")="Yes" then
					TCWebAPI_set("QoS_Entry","ra1","WlanPort_1")
				end if
				if request_Form("WlanPort_2")="Yes" then
					TCWebAPI_set("QoS_Entry","ra2","WlanPort_2")
				end if
				if request_Form("WlanPort_3")="Yes" then
					TCWebAPI_set("QoS_Entry","ra3","WlanPort_3")
				end if
			else
				TCWebAPI_set("QoS_Entry","ra1","QosPhyPortWLANMssid1")
				TCWebAPI_set("QoS_Entry","ra2","QosPhyPortWLANMssid2")
				TCWebAPI_set("QoS_Entry","ra3","QosPhyPortWLANMssid3")	
			end if
		end if	
	end if	
	
	if request_Form("wlan11acISExist") = "On" then
		if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then
			TCWebAPI_set("QoS_Entry","rai0","QosPhyPortRai0")
		elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "2" then
			TCWebAPI_set("QoS_Entry","rai0","QosPhyPortWLAN11acMssid0")
			TCWebAPI_set("QoS_Entry","rai1","QosPhyPortWLAN11acMssid1")
		elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "3" then
			TCWebAPI_set("QoS_Entry","rai0","QosPhyPortWLAN11acMssid0")
			TCWebAPI_set("QoS_Entry","rai1","QosPhyPortWLAN11acMssid1")
			TCWebAPI_set("QoS_Entry","rai2","QosPhyPortWLAN11acMssid2")
		elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "4" then
			TCWebAPI_set("QoS_Entry","rai0","QosPhyPortWLAN11acMssid0")
			TCWebAPI_set("QoS_Entry","rai1","QosPhyPortWLAN11acMssid1")
			TCWebAPI_set("QoS_Entry","rai2","QosPhyPortWLAN11acMssid2")
			TCWebAPI_set("QoS_Entry","rai3","QosPhyPortWLAN11acMssid3")	
		end if	
	end if	
	
	TCWebAPI_set("QoS_Entry","DesMac","QosDestMacValue")
	TCWebAPI_set("QoS_Entry","DesIP","QosDestIpValue")
	if request_Form("QosDestIpValue") <> "" then             
	TCWebAPI_set("QoS_Entry","DesMask","QosDestMaskValue")
	else
		TCWebAPI_set("QoS_Entry","DesMask","")
	end if 
	TCWebAPI_set("QoS_Entry","DesPortRangeBegin","QosDestPortValue1")
	TCWebAPI_set("QoS_Entry","DesPortRangeEnd","QosDestPortValue2")
	TCWebAPI_set("QoS_Entry","SrcMac","QosSrcMacValue")
	TCWebAPI_set("QoS_Entry","SrcIP","QosSrcIpValue")
	if request_Form("QosSrcIpValue") <> "" then     
	TCWebAPI_set("QoS_Entry","SrcMask","QosSrcMaskValue")
	else
		TCWebAPI_set("QoS_Entry","SrcMask","")
	end if
	TCWebAPI_set("QoS_Entry","SrcPortRangeBegin","QosSrcPortValue1")
	TCWebAPI_set("QoS_Entry","SrcPortRangeEnd","QosSrcPortValue2")
	TCWebAPI_set("QoS_Entry","ProtocolID","QosProtocol")
	TCWebAPI_set("QoS_Entry","VlanIDRangeBegin","QosVIDValue1")
	TCWebAPI_set("QoS_Entry","VlanIDRangeEnd","QosVIDValue2")
	TCWebAPI_set("QoS_Entry","IPPDSField","Qos_IPP_DSCP1")
	TCWebAPI_set("QoS_Entry","IPPRangeBegin","QosIPPValue1")
	TCWebAPI_set("QoS_Entry","IPPRangeEnd","QosIPPValue2")
	TCWebAPI_set("QoS_Entry","TypeOfService","QosTOS")
	TCWebAPI_set("QoS_Entry","DSCPRangeBegin","QosDSCPValue1")
	TCWebAPI_set("QoS_Entry","DSCPRangeEnd","QosDSCPValue2")
	TCWebAPI_set("QoS_Entry","dotpBegin","Qos8021pValue1")
	TCWebAPI_set("QoS_Entry","dotpEnd","Qos8021pValue2")
	TCWebAPI_set("QoS_Entry","ActIPPDSField","Qos_IPP_DSCP2")
	TCWebAPI_set("QoS_Entry","ActIPPRemarking","QosReIPPValue")
	TCWebAPI_set("QoS_Entry","ActToSRemarking","QosReTOS")
	TCWebAPI_set("QoS_Entry","ActDSCPRemarking","QosReDSCPValue")
	TCWebAPI_set("QoS_Entry","Act8021pRemarkingNum","Qos8021pReValue")
	TCWebAPI_set("QoS_Entry","Act8021pRemarking","Qos8021pReApp")
	TCWebAPI_set("QoS_Entry","ActQueue","QosConfigPriority")
	
	/*commit changes*/
	TCWebAPI_commit("QoS_Entry")

/*select a rule*/	
elseif Request_Form("QOS_Flag")="1" then
	TCWebAPI_set("WebCurSet_Entry","qos_id","QosRuleIndex")

/*remove a rule*/
elseif Request_Form("QOS_Flag")="2" then
	TCWebAPI_set("QoS_Common","QoSOptType","qoSOptType")
	TCWebAPI_unset("QoS_Entry")
	TCWebAPI_commit("QoS_Entry")
	
elseif Request_Form("QOS_Flag")="4" then
	TCWebAPI_set("QoS_Common","Active","Qos_active")
	TCWebAPI_set("QoS_Common","Drop","Qosdrop")
	TCWebAPI_set("QoS_Common","Discipline","Qosdiscipline")
	TCWebAPI_set("QoS_Common","QoSOptType","qoSOptType")
	TCWebAPI_set("QoS_Common","WeightHighest","QosWRRweight1")
	TCWebAPI_set("QoS_Common","WeightHigh","QosWRRweight2")
	TCWebAPI_set("QoS_Common","WeightMedium","QosWRRweight3")
	TCWebAPI_set("QoS_Common","WeightLow","QosWRRweight4")			

	TCWebAPI_commit("QoS_Entry")
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" href="/style.css" type="text/css">
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/jsl.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->

<style  type="text/css">

*{color:  #404040;}

</style>

<script language="JavaScript">
	
//<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
function showSpin0(){
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
	
var target = document.getElementById('firstDiv0');
var spinner = new Spinner(opts).spin(target);
}

function showSpin1(){
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
	
var target = document.getElementById('firstDiv1');
var spinner = new Spinner(opts).spin(target);
}

function showSpin2(){
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
	
var target = document.getElementById('firstDiv2');
var spinner = new Spinner(opts).spin(target);
}
//<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->

function ornIppTosDscp(type){
var form = document.QoS_Form;

switch(type){
	case 0://disable all
		form.Qos_IPP_DSCP1[0].disabled = true;
		form.Qos_IPP_DSCP1[1].disabled = true;
		form.QosIPPValue1.disabled = true;
		form.QosIPPValue2.disabled = true;
		form.QosTOS.disabled = true;
		form.QosDSCPValue1.disabled = true;
		form.QosDSCPValue2.disabled = true;
		break;
	case 1://enable all
		form.Qos_IPP_DSCP1[0].disabled = false;
		form.Qos_IPP_DSCP1[1].disabled = false;
		form.QosIPPValue1.disabled = false;
		form.QosIPPValue2.disabled = false;
		form.QosTOS.disabled = false;
		form.QosDSCPValue1.disabled = false;
		form.QosDSCPValue2.disabled = false;
		break;
	case 2://IPP
		form.Qos_IPP_DSCP1[0].disabled = false;
		form.Qos_IPP_DSCP1[1].disabled = false;
		form.QosIPPValue1.disabled = false;
		form.QosIPPValue2.disabled = false;
		form.QosTOS.disabled = false;
		form.QosDSCPValue1.disabled = true;
		form.QosDSCPValue2.disabled = true;
		break;
	case 3://DSCP
		form.Qos_IPP_DSCP1[0].disabled = false;
		form.Qos_IPP_DSCP1[1].disabled = false;
		form.QosIPPValue1.disabled = true;
		form.QosIPPValue2.disabled = true;
		form.QosTOS.disabled = true;
		form.QosDSCPValue1.disabled = false;
		form.QosDSCPValue2.disabled = false;
		break;
	default:
		break;
	}
}

function reIppTosDscp(type){
	var form = document.QoS_Form;
	
	switch(type){
		case 0://disable all
		form.Qos_IPP_DSCP2[0].disabled = true;
		form.Qos_IPP_DSCP2[1].disabled = true;
		form.QosReIPPValue.disabled = true;
		form.QosReTOS.disabled = true;
		form.QosReDSCPValue.disabled = true;
		break;
	case 1://enable all
		form.Qos_IPP_DSCP2[0].disabled = false;
		form.Qos_IPP_DSCP2[1].disabled = false;
		form.QosReIPPValue.disabled = false;
		form.QosReTOS.disabled = false;
		form.QosReDSCPValue.disabled = false;
		break;
	case 2://IPP
		form.Qos_IPP_DSCP2[0].disabled = false;
		form.Qos_IPP_DSCP2[1].disabled = false;
		form.QosReIPPValue.disabled = false;
		form.QosReTOS.disabled = false;
		form.QosReDSCPValue.disabled = true;
		break;
	case 3://DSCP
		form.Qos_IPP_DSCP2[0].disabled = false;
		form.Qos_IPP_DSCP2[1].disabled = false;
		form.QosReIPPValue.disabled = true;
		form.QosReTOS.disabled = true;
		form.QosReDSCPValue.disabled = false;
		break;
	default:
		break;
	}
}

function fromDMacToPriority(TorF){
	var value;
	var form = document.QoS_Form;
	
	if(TorF == 0){
		value = true;
		ornIppTosDscp(0);
		reIppTosDscp(0);
	}else{
		value = false;
		ornIppTosDscp(1);
		reIppTosDscp(1);
	}
	
	form.QosDestMacValue.disabled = value;
	form.QosDestIpValue.disabled = value;
	form.QosDestMaskValue.disabled = value;
	form.QosDestPortValue1.disabled = value;
	form.QosDestPortValue2.disabled = value;
	form.QosSrcMacValue.disabled = value;
	form.QosSrcIpValue.disabled = value;
	form.QosSrcMaskValue.disabled = value;
	form.QosSrcPortValue1.disabled = value;
	form.QosSrcPortValue2.disabled = value;
	form.QosProtocol.disabled = value;
	form.QosVIDValue1.disabled = value;
	form.QosVIDValue2.disabled = value;
	form.Qos8021pValue1.disabled = value;
	form.Qos8021pValue2.disabled = value;
	form.Qos8021pReValue.disabled = value;
	form.Qos8021pReApp.disabled = value;

	form.QosConfigPriority.disabled = value;
}

function fromSumToDeact(TorF){
	var form = document.QoS_Form;
	var value;
	
	if(TorF == 0)
		value = true;
	else
		value = false;

	/*
	form.Qosdrop[0].disabled = value;
	form.Qosdrop[1].disabled = value;
	form.Qosdrop[2].disabled = value;
	*/
	form.Qosdiscipline[0].disabled = value;
	form.Qosdiscipline[1].disabled = value;
	form.Qosdisciplinesave.disabled = value;
	form.QosWRRweight1.disabled = value;
	form.QosWRRweight2.disabled = value;
	form.QosWRRweight3.disabled = value;
	form.QosWRRweight4.disabled = value;
	form.Qos_Summary.disabled = value;
	form.QosRuleIndex.disabled = value;
	form.QosRuleActive[0].disabled = value;
	form.QosRuleActive[1].disabled = value;
}


function formAppToPhyport(TorF){
	var form = document.QoS_Form;
	var value;
	
	if(TorF == 0)
		value = true;
	else
		value = false;
		
	form.QosApp.disabled = value;
	
	if (form.wlanISExist.value == "On") {
		if(form.QosMBSSIDNumberFlag.value == 1){
			//form.QosPhyPortWLANMssid0.disabled=value;
			form.QosPhyPortRa0.disabled = value;
		}
		if(form.QosMBSSIDNumberFlag.value == 2){
			form.QosPhyPortWLANMssid0.disabled = value;
			if(form.UserMode.value == 0){
				form.QosPhyPortWLANMssid1.disabled = value;
			}
		}
		if(form.QosMBSSIDNumberFlag.value == 3){
			form.QosPhyPortWLANMssid0.disabled = value;
			if(form.UserMode.value == 0){
				form.QosPhyPortWLANMssid1.disabled = value;
				form.QosPhyPortWLANMssid2.disabled = value;
			}
		}
		if(form.QosMBSSIDNumberFlag.value == 4){
			form.QosPhyPortWLANMssid0.disabled = value;
			if(form.UserMode.value == 0){
				form.QosPhyPortWLANMssid1.disabled = value;
				form.QosPhyPortWLANMssid2.disabled = value;
				form.QosPhyPortWLANMssid3.disabled = value;
			}
		}
	}
	
	if (form.wlan11acISExist.value == "On") {
		if(form.Qos11acMBSSIDNumberFlag.value == 1){
			form.QosPhyPortRai0.disabled = value;
		}
		if(form.Qos11acMBSSIDNumberFlag.value == 2){
			form.QosPhyPortWLAN11acMssid0.disabled = value;
			form.QosPhyPortWLAN11acMssid1.disabled = value;
		}
		if(form.Qos11acMBSSIDNumberFlag.value == 3){
			form.QosPhyPortWLAN11acMssid0.disabled = value;
			form.QosPhyPortWLAN11acMssid1.disabled = value;
			form.QosPhyPortWLAN11acMssid2.disabled = value;
		}
		if(form.Qos11acMBSSIDNumberFlag.value == 4){
			form.QosPhyPortWLAN11acMssid0.disabled = value;
			form.QosPhyPortWLAN11acMssid1.disabled = value;
			form.QosPhyPortWLAN11acMssid2.disabled = value;
			form.QosPhyPortWLAN11acMssid3.disabled = value;
		}
	}
	
	form.QosPhyPortEth0.disabled = value;

	if (form.QoS1PortFlag.value != "Yes") {
		form.QosPhyPortEth1.disabled = value;
		if (form.QoS2PortsFlag.value != "Yes") {
			form.QosPhyPortEth2.disabled = value;
			form.QosPhyPortEth3.disabled = value;
		}
	}
/*
	form.QosPhyPortUsb0.disabled = value;
*/
	//form.QosPhyPortRa0.disabled = value;

}

function disableAll()
{
	fromSumToDeact(0);
	formAppToPhyport(0);
	fromDMacToPriority(0);
}

function enableAll()
{
	fromSumToDeact(1);
	formAppToPhyport(1);
	fromDMacToPriority(1);
}

function onDisChanged()
{
	var form = document.QoS_Form;
	var value;
	if (form.Qosdiscipline[0].selected)
		value = false;
	else
		value = true;

	form.QosWRRweight1.disabled = value;
	form.QosWRRweight2.disabled = value;
	form.QosWRRweight3.disabled = value;
	form.QosWRRweight4.disabled = value;
}

function init()
{
//amy add start 02/26
//disableqosRule();
//amy add end 02/26

//cindy add 01/06
//disableqos();
//cindy add 01/06

	if(document.QoS_Form.Qos_active[1].checked){
		disableAll();
		return;
	}
	onDisChanged();
	if(document.QoS_Form.QosRuleActive[1].checked){
		formAppToPhyport(0);
		fromDMacToPriority(0);
		return;
	}
	if(document.QoS_Form.Qos_IPP_DSCP1[0].checked){
		ornIppTosDscp(2);
	}else{
		ornIppTosDscp(3);
	}
	if(document.QoS_Form.Qos_IPP_DSCP2[0].checked){
		reIppTosDscp(2);
	}else{
		reIppTosDscp(3);
	}
	doMACaddressChange();//wang 
}           

function isValidHex(ucHex)
{
	return (ucHex>='0' && ucHex<='9') || (ucHex>='a' && ucHex<='f') || (ucHex>='A' && ucHex<='F') ? true : false;
}

function doMACcheck(object)
{
	var szAddr = object.value;
	var len = szAddr.length;
	
	if ( len == 0 )
	{
		return;
	}
	
	if ( len == 12 )
	{
		var newAddr = "";
		var i = 0;
		for ( i = 0; i < len; i++ )
		{
			var c = szAddr.charAt(i);
			if ( !isValidHex(c) )
			{
				if( object.name == "QosDestMacValue"){
					alert("<%tcWebApi_get("String_Entry","QosJS0Text","s")%>");}else{
					alert("<%tcWebApi_get("String_Entry","QosJS1Text","s")%>");}
					object.focus();
					return;
			}
			
			if ( (i == 2) || (i == 4) || (i == 6) || (i == 8) || (i == 10) ){
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
		
		if ( (!isValidHex(c0)) || (!isValidHex(c1)) )
		{
			if( object.name == "QosDestMacValue")
			{
				alert("<%tcWebApi_get("String_Entry","QosJS0Text","s")%>");
			}else{
				alert("<%tcWebApi_get("String_Entry","QosJS1Text","s")%>");
			}
			
			object.focus();
			return;
		}         
		
		i = 2;
		while ( i < len )
		{
			var c0 = szAddr.charAt(i);
			var c1 = szAddr.charAt(i+1);
			var c2 = szAddr.charAt(i+2);
			
			if ( (c0 != ":") || (!isValidHex(c1)) || (!isValidHex(c2)) )
			{
				if( object.name == "QosDestMacValue")
				{
					alert("<%tcWebApi_get("String_Entry","QosJS0Text","s")%>");
				}else{
					alert("<%tcWebApi_get("String_Entry","QosJS1Text","s")%>");
				}
				
				object.focus();
				return;
			}
		i = i + 3;
		}
		return;
	}
	else
	{
		if( object.name == "QosDestMacValue")
		{
			alert("<%tcWebApi_get("String_Entry","QosJS0Text","s")%>");
			}else{
			alert("<%tcWebApi_get("String_Entry","QosJS1Text","s")%>");
		}
		
	object.focus();
	return;
	}
}                                   

function errorValueAlert(option){
	switch(option){
		case 0:
			alert("<%tcWebApi_get("String_Entry","QosJS5Text","s")%>");break;
		case 1:
			alert("<%tcWebApi_get("String_Entry","QosJS6Text","s")%>");break;
		case 2:
			alert("<%tcWebApi_get("String_Entry","QosJS7Text","s")%>");break;
		case 3:
			alert("<%tcWebApi_get("String_Entry","QosJS8Text","s")%>");break;
		case 4:
			alert("<%tcWebApi_get("String_Entry","QosJS9Text","s")%>");break;
		case 6:
			alert("<%tcWebApi_get("String_Entry","QosJS10Text","s")%>");break;
		case 7:
			alert("<%tcWebApi_get("String_Entry","QosJS11Text","s")%>");break;
		default:
			break;
	}
}

function checkRangeValue(sElem, eElem, min, max, option)
{
	start = parseInt(sElem.value);
	end = parseInt(eElem.value);
	
	if((sElem.value == "")&&(eElem.value == ""))
		return true;
		
	if(isNaN(start) || start > max || start < min)
	{
		errorValueAlert(option);
		return false;
	}
	
	if(isNaN(end) || end > max || end < min)
	{
		errorValueAlert(option);
		return false;
	}
	
	if(start > end)
	{
		errorValueAlert(option);
		return false;
	}
	
	return true;
}

function inValidSubnetMask(IPAddr,Mask)
{
  var ip = IPAddr.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  var mask = Mask.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  var digits;
  var ipdigits;
  var bMask = 0;
  var watch = false;
  var i;

  if(mask == null)
  { 
	  alert(_("InvalidNetMask") + " " + Mask);
	  return true;
  }
  ipdigits = ip[0].split(".");
  digits = mask[0].split(".");
  
  for(i=0; i < 4; i++)
  {
    if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || digits[i] == null)
     {
	     alert(_("InvalidNetMask") + " " + Mask);
	     return true;	
     }
	bMask = (bMask << 8) | Number(digits[i]);
  }
  //edited by Janey
  if((Number(digits[0]) == 0))
	{
	     alert(_("InvalidNetMask") + " " + Mask);
	     return true;	
	}

  bMask = bMask & 0x0FFFFFFFF;
  for(i=0; i<32; i++)
  {
    if((watch==true) && ((bMask & 0x1)==0)) { 
    alert(_("InvalidNetMask") + " " + Mask);
    return true;
  }
	bMask = bMask >> 1;
	if((bMask & 0x01) == 1) watch=true;
  }

    if(ipdigits[3] == 0 && digits[3] == 255){
	alert(_("InvalidIpAndNetMask") + " " + IPAddr + ' & ' + Mask);
	return true;
  }
  /* wang delete for if the last numer of ip is not 0 , 255.255.255.255 can't be saved 
  if(!((Number(ipdigits[0]&digits[0])==Number(ipdigits[0]))
		&&(Number(ipdigits[1]&digits[1])==Number(ipdigits[1]))
		&&(Number(ipdigits[2]&digits[2])==Number(ipdigits[2]))
		&&(Number(ipdigits[3]&digits[3])==Number(ipdigits[3])))){
		alert(_("InvalidIpAndNetMask") + " " + IPAddr + ' & ' + Mask);
		return true;
	}
   */
  return false;
}

function inValidQOSIP(Address){
	var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits;
	var i;
  
  	if (address == null) {
		//alert('<%tcWebApi_get("String_Entry","QosJS12Text","s")%>' + Address);
		return true;
	}
	digits = address[0].split(".");
	for(i=0; i < 4; i++){
 		if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (digits[i] == null)){ 
			alert('<%tcWebApi_get("String_Entry","QosJS12Text","s")%> ' + Address);
			return true;
		}
	}
	/*wang add start*/
	if(((Number(digits[0]) == 0) && (Number(digits[1]) == 0) && (Number(digits[2]) == 0) && (Number(digits[3]) == 0))||
	  ((Number(digits[0]) == 255) && (Number(digits[1]) == 255) && (Number(digits[2]) == 255) && (Number(digits[3]) == 255)))
	{
		alert('<%tcWebApi_get("String_Entry","QosJS12Text","s")%> ' + Address);
		return true;
	}/*end*/
  return false;
}

/*wang add star*/
function blockMask(index)
{
	switch(index)
	{
		case 0:
			IP = document.QoS_Form.QosDestIpValue;
			mask = document.QoS_Form.QosDestMaskValue;
			break;
		case 1:
			IP = document.QoS_Form.QosSrcIpValue;
			mask = document.QoS_Form.QosSrcMaskValue;
			break;
	}
	
	var addr1 = IP.value.split(".")[0];
	var addr4 = IP.value.split(".")[3];
	
	if(IP.value == ""){
             mask.value = "";
	}
	else if(addr4 != 0) {	
			mask.value = "255.255.255.255";
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
              
}
/*end*/

function verifyForm(){
	var form = document.QoS_Form;
	var	v6flag = false;
	if(form.QOS_Flag.value != 0)
		return;
		
	if(document.QoS_Form.Qos_active[1].checked)
		return;
		
	if(document.QoS_Form.QosRuleActive[1].checked)
		return;	
		
	if(form.QosDestIpValue.value != "")
	{
		if(inValidQOSIP(form.QosDestIpValue.value)) {
			if (inValidIPv6Addr(form.QosDestIpValue.value)) {
				return false;
			}
			else
				v6flag = true;
		}
		
		if(form.QosDestMaskValue.value == ""){
				alert("<%tcWebApi_get("String_Entry","QosJS13Text","s")%>");
				return false;
	        }
	}			
	
	if(form.QosDestMaskValue.value != "")
	{
		if (v6flag) {
			if(inValidIPv6Prefix(form.QosDestMaskValue.value))
				return false;
		}
		else {
			if(inValidSubnetMask(form.QosDestIpValue.value,form.QosDestMaskValue.value))
				return false;
		}
	}
	
	if(!checkRangeValue(form.QosDestPortValue1, form.QosDestPortValue2, 0, 65535, 0))
		return false;
	
	v6flag = false;
	if(form.QosSrcIpValue.value != "")
	{	
		if(inValidQOSIP(form.QosSrcIpValue.value)) {
			if (inValidIPv6Addr(form.QosSrcIpValue.value)) {
				return false;
			}
			else
				v6flag = true;
		}
		
		if(form.QosSrcMaskValue.value == ""){
			alert("<%tcWebApi_get("String_Entry","QosJS13Text","s")%>");
		    return false;
		}
	}   
	
	if(form.QosSrcMaskValue.value != "")
	{
		if (v6flag) {
			if(inValidIPv6Prefix(form.QosSrcMaskValue.value))
				return false;
		}
		else {
			if(inValidSubnetMask(form.QosSrcIpValue.value,form.QosSrcMaskValue.value))
				return false;
		}
	}
	
	if(!checkRangeValue(form.QosSrcPortValue1, form.QosSrcPortValue2, 0, 65535, 1))
		return false;
		
	if((form.QosVIDValue1.value !=0 ) || (form.QosVIDValue2.value != 0))
	{
		if(!checkRangeValue(form.QosVIDValue1, form.QosVIDValue2, 1, 4094, 2))
			return false;
	}
	
	if(document.QoS_Form.Qos_IPP_DSCP1[0].checked)
	{
		if(form.QosIPPValue1.selectedIndex > form.QosIPPValue2.selectedIndex)
		{
			alert("<%tcWebApi_get("String_Entry","QosJS2Text","s")%>");
			return false;
		}
	}else{
		if(!checkRangeValue(form.QosDSCPValue1, form.QosDSCPValue2, 0, 255, 3))
			return false;
	}
	
	if(form.Qos8021pValue1.selectedIndex > form.Qos8021pValue2.selectedIndex)
	{
		alert("<%tcWebApi_get("String_Entry","QosJS3Text","s")%>");return false;
	}
	
	if(form.Qos_IPP_DSCP2[1].checked)
	{
		if(!checkRangeValue(form.QosReDSCPValue, form.QosReDSCPValue, 0, 255, 4))
		return false;
	}
	/* check protocol is set for port setting */
	if (form.QosDestPortValue1.value != "" || form.QosSrcPortValue1.value != "") {
		if (form.QosProtocol.options[0].selected == true) {
			//alert("We should set protocol if src or dst port is setted!");
			//return false;
			form.QosProtocol.options[1].selected = true;
		}
	}

	if(form.QosConfigPriority.selectedIndex == 0)
	{
		alert("<%tcWebApi_get("String_Entry","QosJS4Text","s")%>");return false;
	}

	showSpin1();//cindy add
	return;
}

function checkPhysicalPort(){

	if(document.forms[0].QosPhyPortEth0.checked)
		document.forms[0].QosPhyPortEth0.value = "Yes";
	else
		document.forms[0].QosPhyPortEth0.value = "No";
		
	if (document.forms[0].QoS1PortFlag.value != "Yes") {
		if(document.forms[0].QosPhyPortEth1.checked)
			document.forms[0].QosPhyPortEth1.value = "Yes";
		else
			document.forms[0].QosPhyPortEth1.value = "No";
			
		if (document.forms[0].QoS2PortsFlag.value != "Yes") {
			if(document.forms[0].QosPhyPortEth2.checked)
				document.forms[0].QosPhyPortEth2.value = "Yes";
			else
				document.forms[0].QosPhyPortEth2.value = "No";		
				
			if(document.forms[0].QosPhyPortEth3.checked)
				document.forms[0].QosPhyPortEth3.value = "Yes";
			else
				document.forms[0].QosPhyPortEth3.value = "No";
		}
	}
/*		
	if(document.forms[0].QosPhyPortUsb0.checked)
		document.forms[0].QosPhyPortUsb0.value = "Yes";
	else
		document.forms[0].QosPhyPortUsb0.value = "No";

*/
	if (document.forms[0].wlanISExist.value == "On") {
		if(document.forms[0].QosMBSSIDNumberFlag.value == "1"){	
			if(document.forms[0].QosPhyPortRa0.checked)
				document.forms[0].QosPhyPortRa0.value = "Yes";
			else
				document.forms[0].QosPhyPortRa0.value = "No";
		}
		if(document.forms[0].QosMBSSIDNumberFlag.value == "2"){
			if(document.forms[0].QosPhyPortWLANMssid0.checked)
				document.forms[0].QosPhyPortWLANMssid0.value = "Yes"
			else
				document.forms[0].QosPhyPortWLANMssid0.value = "No"
			if(document.forms[0].UserMode.value == "0"){
				if(document.forms[0].QosPhyPortWLANMssid1.checked)
					document.forms[0].QosPhyPortWLANMssid1.value = "Yes"
				else
					document.forms[0].QosPhyPortWLANMssid1.value = "No"
			}
		}
		if(document.forms[0].QosMBSSIDNumberFlag.value == "3"){
			if(document.forms[0].QosPhyPortWLANMssid0.checked){
				document.forms[0].QosPhyPortWLANMssid0.value = "Yes"
			}
			else
				document.forms[0].QosPhyPortWLANMssid0.value = "No"
			if(document.forms[0].UserMode.value == "0"){
				if(document.forms[0].QosPhyPortWLANMssid1.checked)
					document.forms[0].QosPhyPortWLANMssid1.value = "Yes"
				else
					document.forms[0].QosPhyPortWLANMssid1.value = "No"
				if(document.forms[0].QosPhyPortWLANMssid2.checked)
					document.forms[0].QosPhyPortWLANMssid2.value = "Yes"
				else
					document.forms[0].QosPhyPortWLANMssid2.value = "No"
			}
		}
		if(document.forms[0].QosMBSSIDNumberFlag.value == "4"){	
			if(document.forms[0].QosPhyPortWLANMssid0.checked){	
				document.forms[0].QosPhyPortWLANMssid0.value = "Yes"
			}
			else
				document.forms[0].QosPhyPortWLANMssid0.value = "No"
			if(document.forms[0].UserMode.value == "0"){
				if(document.forms[0].QosPhyPortWLANMssid1.checked)
					document.forms[0].QosPhyPortWLANMssid1.value = "Yes"
				else
					document.forms[0].QosPhyPortWLANMssid1.value = "No"
				if(document.forms[0].QosPhyPortWLANMssid2.checked)
					document.forms[0].QosPhyPortWLANMssid2.value = "Yes"
				else
					document.forms[0].QosPhyPortWLANMssid2.value = "No"
				if(document.forms[0].QosPhyPortWLANMssid3.checked)
					document.forms[0].QosPhyPortWLANMssid3.value = "Yes"
				else
					document.forms[0].QosPhyPortWLANMssid3.value = "No"
			}
		}
	}
	
	if (document.forms[0].wlan11acISExist.value == "On") {
		if(document.forms[0].Qos11acMBSSIDNumberFlag.value == "1"){	
			if(document.forms[0].QosPhyPortRai0.checked)
				document.forms[0].QosPhyPortRai0.value = "Yes";
			else
				document.forms[0].QosPhyPortRai0.value = "No";
		}
		if(document.forms[0].Qos11acMBSSIDNumberFlag.value == "2"){
			if(document.forms[0].QosPhyPortWLAN11acMssid0.checked)
				document.forms[0].QosPhyPortWLAN11acMssid0.value = "Yes"
			else
				document.forms[0].QosPhyPortWLAN11acMssid0.value = "No"
				
			if(document.forms[0].QosPhyPortWLAN11acMssid1.checked)
				document.forms[0].QosPhyPortWLAN11acMssid1.value = "Yes"
			else
				document.forms[0].QosPhyPortWLAN11acMssid1.value = "No"
		}
		if(document.forms[0].Qos11acMBSSIDNumberFlag.value == "3"){
			if(document.forms[0].QosPhyPortWLAN11acMssid0.checked)
				document.forms[0].QosPhyPortWLAN11acMssid0.value = "Yes"
			else
				document.forms[0].QosPhyPortWLAN11acMssid0.value = "No"
		
			if(document.forms[0].QosPhyPortWLAN11acMssid1.checked)
				document.forms[0].QosPhyPortWLAN11acMssid1.value = "Yes"
			else
				document.forms[0].QosPhyPortWLAN11acMssid1.value = "No"
					
			if(document.forms[0].QosPhyPortWLAN11acMssid2.checked)
				document.forms[0].QosPhyPortWLAN11acMssid2.value = "Yes"
			else
				document.forms[0].QosPhyPortWLAN11acMssid2.value = "No"
		}
		if(document.forms[0].Qos11acMBSSIDNumberFlag.value == "4"){	
			if(document.forms[0].QosPhyPortWLAN11acMssid0.checked)
				document.forms[0].QosPhyPortWLAN11acMssid0.value = "Yes"
			else
				document.forms[0].QosPhyPortWLAN11acMssid0.value = "No"
			
			if(document.forms[0].QosPhyPortWLAN11acMssid1.checked)
					document.forms[0].QosPhyPortWLAN11acMssid1.value = "Yes"
			else
					document.forms[0].QosPhyPortWLAN11acMssid1.value = "No"
					
			if(document.forms[0].QosPhyPortWLAN11acMssid2.checked)
					document.forms[0].QosPhyPortWLAN11acMssid2.value = "Yes"
			else
					document.forms[0].QosPhyPortWLAN11acMssid2.value = "No"
					
			if(document.forms[0].QosPhyPortWLAN11acMssid3.checked)
					document.forms[0].QosPhyPortWLAN11acMssid3.value = "Yes"
			else
					document.forms[0].QosPhyPortWLAN11acMssid3.value = "No"
		}
	}
}

function doAdd() {
	document.forms[0].QOS_Flag.value = 0;

	document.QoS_Form.qoSOptType.value = "typeRule";
	checkPhysicalPort();

}

function doIndexChange() {
	document.forms[0].QOS_Flag.value = 1;
	document.forms[0].submit();
	return;
}

function doDel(){
	document.QoS_Form.qoSOptType.value = "typeRule";
	document.forms[0].QOS_Flag.value = 2;
}              

function setProtoPort(protoIdx, dPort1, dPort2){
	var form = document.QoS_Form;
	
	form.QosProtocol.selectedIndex = protoIdx;
	form.QosDestPortValue1.value = dPort1;
	form.QosDestPortValue2.value = dPort2;
}         

function doQosAppIdxChange(){
	var form = document.QoS_Form;
	//wang add
	form.QosDestIpValue.value = "";
	form.QosDestMaskValue.value = "";
	setProtoPort(3, "", "");
	form.QosSrcPortValue1.value = "";
	form.QosSrcPortValue2.value = "";
	//add end
	switch(form.QosApp.selectedIndex){
		case 0:
		default:
			break;
		case 1://IGMP
			form.QosDestIpValue.value = "224.0.0.0";
			form.QosDestMaskValue.value = "240.0.0.0";
			break;
	   /*	
		case 2://SIP
			setProtoPort(3, 5060, 5060);
			break;
		case 3://H.323
			setProtoPort(3, 1719, 1720);
			break;
	   */
		case 2://MGCP
			setProtoPort(3, 2427, 2427);
			break;
		/*
		case 5://SNMP
			setProtoPort(1, 161, 161);
			break;
		*/
		case 3://DNS
			setProtoPort(3, 53, 53);
			break;
		case 4://DHCP
			setProtoPort(3, 67, 67);
			form.QosSrcPortValue1.value = 68;
			form.QosSrcPortValue2.value = 68;
		break;
			case 5://RIP
			setProtoPort(3, 520, 520);
		break;
			case 6://RSTP
			setProtoPort(3, 554, 554);
			break;
		case 7://RTCP
			setProtoPort(3, 5005, 5005);
			break;
		case 8://RTP
			setProtoPort(3, 5004, 5004);
			break;
	}
}

function doQos1pAppIdxChange(){
	switch(document.QoS_Form.Qos8021pReApp.selectedIndex){
		case 0:
		default:
			break;
		case 1://ketNET
			document.QoS_Form.Qos8021pReValue.selectedIndex = 8;
			break;
		case 2://voice
			document.QoS_Form.Qos8021pReValue.selectedIndex = 7;
			break;
		case 3://vide0
			document.QoS_Form.Qos8021pReValue.selectedIndex = 6;
			break;
		case 4://IGMP
			document.QoS_Form.Qos8021pReValue.selectedIndex = 5;
			break;
		case 5://keyData
			document.QoS_Form.Qos8021pReValue.selectedIndex = 4;
			break;
	}
}
function onClickQosDiscipline(){
	var form = document.QoS_Form;

	if((!checkRangeValue(form.QosWRRweight1, form.QosWRRweight1, 1, 15, 7)) ||
       (!checkRangeValue(form.QosWRRweight2, form.QosWRRweight2, 1, 15, 7)) ||
       (!checkRangeValue(form.QosWRRweight3, form.QosWRRweight3, 1, 15, 7)) ||
       (!checkRangeValue(form.QosWRRweight4, form.QosWRRweight4, 1, 15, 7)))
		return false;
	else{		
		showSpin0();//cindy add 
		document.forms[0].QOS_Flag.value = 4;
		document.QoS_Form.qoSOptType.value = "discRule";	
		document.forms[0].submit();
	}
}
function onClickQosSummary() {
	window.open("/cgi-bin/adv_qoslist.asp","QoS_List","toolbar=no,menubar=no,scrollbars=yes,height=600, width=850,location=0,left=100,top=100");
	return false;
}


function showTable(id,header,data,keyIndex){
	var html = ["<table id=client_list width=640 border=0  cellpadding=1 cellspacing=0  bordercolor=#CCCCCC>"];
	// 1.generate table header
	html.push("<tr bgcolor=#FFFFFF height=30>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + " align=center class=tablelisttitle>" + header[i][1] + "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
	for(var i =0; i<data.length; i++){
		if(data[i][keyIndex] != "N/A"){
			html.push("<tr bgcolor=#FFFFFF height=30 id=tablebutton>");
			for(var j=0; j<(data[i].length - 1); j++){
				html.push("<td align=center  class=topborderstyle>" + data[i][j] + "</td>");
			}
			html.push('<td align=center  class=topborderstyle> <INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","QosBandwidthControlText6","s")%>" onClick=doDeleteRule(' + data[i][j] + ');> </td>');
			html.push("</tr>");
		}
	}
	html.push("</table>");
	document.getElementById(id).innerHTML = html.join('');
}

function doDeleteRule(i)
 {
 	document.QoS_Form.delnum.value=i;
	document.QoS_Form.submit();
}

function doAddRule() {
	//foxconn cindy add
	if (document.QoS_Form.QoS_Bandwidth_Control_Description.value == "")
	{
	  alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText17","s")%>");
		return false;
	}
	//foxconn cindy add
	if (doCheckmacAddr())
		return false;
	//foxconn cindy add
	if(!doCheckRepeatmacAddr())
		return false;
	//foxconn cindy add
	if (doCheckSpeed())
		return false;
    if(document.QoS_Form.QoS_Bandwidth_Control_mac_select[0].selected == true)
    {
	  document.forms[0].MacAddFlag.value = 1;
	}
	var j=0;
    for(var i =0; i<tableData.length; i++){
		var tableValueTmp = tableData[i][2];
		
		if(tableValueTmp != "N/A")
           j=j + 1;
	}
	 if(j == 8)
     {
    	 alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText16","s")%>");
    	 return false;
     }
	showSpin2();//cindy add 
	document.forms[0].QOS_Flag.value = 5;
	document.QoS_Form.submit();
}

function doCheckSpeed(){
	var upValue = document.QoS_Form.QoS_Bandwidth_Control_Up.value;
	var downValue = document.QoS_Form.QoS_Bandwidth_Control_Down.value;
	
	if (document.QoS_Form.QoS_Bandwidth_Control_Up.value.length == 0) {
    		alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText9","s")%>");
    		return 1;
    	}

	if (upValue <= 0 || upValue > 800) {
		alert(upValue + "<%tcWebApi_get("String_Entry","QosBandwidthControlText10","s")%>");
    		return 1;
    	}
	
	if (document.QoS_Form.QoS_Bandwidth_Control_Down.value.length == 0) {
    		alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText9","s")%>");
    		return 1;
    	}

	if (downValue <=0 || downValue > 800) {
		alert(downValue + "<%tcWebApi_get("String_Entry","QosBandwidthControlText10","s")%>");
    		return 1;
    	}
}

function doCheckmacAddr(){
	var macstr = document.QoS_Form.QoS_Bandwidth_Control_Mac.value;
	var maclen = macstr.length;
	var tmp = macstr.toUpperCase();
	document.QoS_Form.QoS_Bandwidth_Control_Mac.value = tmp;

	//foxconn cindy add
      if(document.QoS_Form.QoS_Bandwidth_Control_mac_select[0].selected == true){
		if(maclen==0){
			alert("<%tcWebApi_get("String_Entry","FilterJS4Text","s")%>");
			return 1;
		}
	}
	//foxconn cindy add
	
	if(maclen != 0){
		var findpos = macstr.search("^([0-9A-Fa-f]{2})(:[0-9A-Fa-f]{2}){5}$");
		if( findpos != 0 )
		{
			alert("<%tcWebApi_get("String_Entry","LANJS0Text","s")%>" + macstr);
		}	
		return findpos;
	}
	return 0;
}

function doCheckRepeatmacAddr(){	
	var inputValueTmp = document.QoS_Form.QoS_Bandwidth_Control_Mac.value;
	var inputValue = inputValueTmp.toUpperCase();	

	for(var i =0; i<tableData.length; i++){
		var tableValueTmp = tableData[i][2];
		var tableValue = tableValueTmp.toUpperCase();	

      if(document.QoS_Form.QoS_Bandwidth_Control_mac_select[0].selected == true)
	  {
		if (inputValue == tableValue)
		{
			alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText11","s")%>");
			return 0;
		}
	}
	  else
	  {
		  var j = document.QoS_Form.QoS_Bandwidth_Control_mac_select.selectedIndex;
	      var inputValueTmp1 = document.QoS_Form.QoS_Bandwidth_Control_mac_select[j].value;
	      var inputValue1 = inputValueTmp1.toUpperCase();	
	      if (inputValue1 == tableValue)
		  {
			  alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText11","s")%>");
			  return 0;
		  }
	  }
   }
	return 1;
}

function speedInputEnable(){
	if ((document.QoS_Form.QoS_Bandwidth_Control_Mac.disabled == false) && document.QoS_Form.QoS_Bandwidth_Control_Mac.value != "")
	{
		if (doCheckRepeatmacAddr() == 1)
		{
			document.QoS_Form.QoS_Bandwidth_Control_Up.disabled = false;
			document.QoS_Form.QoS_Bandwidth_Control_Down.disabled = false;
			document.QoS_Form.QoS_Bandwidth_Control_Up.value = 0;
			document.QoS_Form.QoS_Bandwidth_Control_Down.value = 0;
		}
	}
	else
	{
		document.QoS_Form.QoS_Bandwidth_Control_Up.disabled = true;
		document.QoS_Form.QoS_Bandwidth_Control_Down.disabled = true;
	}
}

function macInputEnable(){
	if (document.QoS_Form.QoS_Bandwidth_Control_Description.value != "")
	{
		//document.QoS_Form.QoS_Bandwidth_Control_mac_select.disabled = false;
	    doMACaddressChange();
	    }
	else{	
		//document.QoS_Form.QoS_Bandwidth_Control_mac_select.disabled = true;
		}
}

function qosbandwidthinput_init(){
	document.QoS_Form.QoS_Bandwidth_Control_mac_select.disabled = true;   
	document.QoS_Form.QoS_Bandwidth_Control_Mac.disabled = true;
	document.QoS_Form.QoS_Bandwidth_Control_Up.disabled = true;
	document.QoS_Form.QoS_Bandwidth_Control_Down.disabled = true;	
}

//cindy add start 12/14
function disableqos()
{
if(document.QoS_Form.Qos_active[1].checked==true)
	{
		document.getElementById("hiddenqosfunction").style.display="none";
	}
else{
		document.getElementById("hiddenqosfunction").style.display="";
	}
}

//cindy add end 12/14

//amy add start 2/26
function disableqosRule()
{
if(document.QoS_Form.QosRuleActive[1].checked==true)
	{
		document.getElementById("qosRule").style.display="none";
	}
else{
		document.getElementById("qosRule").style.display="";
	}
}
//amy add end 2/26 

//wang add  20180124
function doMACaddressChange()
{
  if(document.QoS_Form.QoS_Bandwidth_Control_mac_select[0].selected == true)
  {
     document.getElementById("ManuallyMacAddr").style.display=""; 
    // document.QoS_Form.QoS_Bandwidth_Control_Mac.disabled = false;
	// document.QoS_Form.QoS_Bandwidth_Control_Up.disabled = true;
	// document.QoS_Form.QoS_Bandwidth_Control_Down.disabled = true; 
	// document.QoS_Form.QoS_Bandwidth_Control_Up.value = 0;
	 //document.QoS_Form.QoS_Bandwidth_Control_Down.value = 0;
  }
  else{
     document.getElementById("ManuallyMacAddr").style.display="none";

  //  if(doCheckRepeatmacAddr() == 1)
   //  {
 	  // document.QoS_Form.QoS_Bandwidth_Control_Up.disabled = false;
 	 //  document.QoS_Form.QoS_Bandwidth_Control_Down.disabled = false;  
 	 //  document.QoS_Form.QoS_Bandwidth_Control_Up.value = 0;
 	 //  document.QoS_Form.QoS_Bandwidth_Control_Down.value = 0;
 	//}
  } 
}

//wang add end 

</script>

</head>
<body onload="init();">
<form METHOD="POST" ACTION="/cgi-bin/adv_qos.asp" name="QoS_Form" onsubmit="return verifyForm()">

<div id="pagestyle">
<div id="contenttype">
<div id="block1">
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">
<td align=left class="title-main" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosQualityServiceText","s")%></td>
</tr>
</table>

<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosText","s")%> </td>
<td align=left class="tabdata">
	<INPUT TYPE="RADIO" NAME="Qos_active" VALUE="Yes" <%if TCWebAPI_get("QoS_Common", "Active", "h") = "Yes" then asp_write("checked") end if %> onclick="enableAll();init();disableqos();"> <%tcWebApi_get("String_Entry","QosActivatedText","s")%>&nbsp;&nbsp;&nbsp;&nbsp; 
	<INPUT TYPE="RADIO" NAME="Qos_active" VALUE="No"<%if TCWebAPI_get("QoS_Common", "Active", "h") = "No" then asp_write("checked") end if
				  if TCWebAPI_get("QoS_Common", "Active", "h") = "N/A" then asp_write("checked") end if%> onclick="disableAll();disableqos();"> <%tcWebApi_get("String_Entry","QosDeactivatedText","s")%> 
			</td>
		</tr>			
<!--
		<tr>
			<td class="light-orange">&nbsp;</td>
			<td class="light-orange"></td>
			<td class="tabdata" align=right> Drop </td>
			<td class="tabdata" align=center>:</td>
			<td class="tabdata">
				<INPUT TYPE="RADIO" NAME="Qosdrop" VALUE="WRED"
				<%if TCWebAPI_get("QoS_Common", "Drop", "h") = "WRED" then asp_write("checked") end if %>> WRED 			
				<INPUT TYPE="RADIO" NAME="Qosdrop" VALUE="RED"
				<%if TCWebAPI_get("QoS_Common", "Drop", "h") = "RED" then asp_write("checked") end if %>> RED 
				<INPUT TYPE="RADIO" NAME="Qosdrop" VALUE="TAIL"
				<%if TCWebAPI_get("QoS_Common", "Drop", "h") = "TAIL" then asp_write("checked") end if
				  if TCWebAPI_get("QoS_Common", "Drop", "h") = "N/A" then asp_write("checked") end if%>> Tail drop 

			</td>
		</tr>	
-->
</table>
</div><!--id="block1" 12/19-->

<% if TCWebAPI_get("QoS_Common", "Active", "h") = "Yes" then %>
<div id="hiddenqosfunction">
<% else %>
<div id="hiddenqosfunction" style="display:none;">
<% end if %>
<div id="block1">
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">		
<td align=left class="title-main" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosDisciplineSettingText","s")%> </td>
</tr>
</table>

<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosDisciplineText","s")%> </td>
<td align=left class="tabdata">
<!--cindy delete start 02/24
				<INPUT TYPE="RADIO" NAME="Qosdiscipline" VALUE="WRR" onClick="onDisChanged()"
				<%if TCWebAPI_get("QoS_Common", "Discipline", "h") = "WRR" then asp_write("checked") end if %>> <%tcWebApi_get("String_Entry","QosWRRText","s")%> 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="Qosdiscipline" VALUE="SP" onClick="onDisChanged()"
				<%if TCWebAPI_get("QoS_Common", "Discipline", "h") = "SP" then asp_write("checked") end if
				  if TCWebAPI_get("QoS_Common", "Discipline", "h") = "N/A" then asp_write("checked") end if%>> <%tcWebApi_get("String_Entry","QosPriorityText","s")%> 
-->
<select name="Qosdiscipline" size="1" onchange="onDisChanged()">
<option value="WRR" <%if TCWebAPI_get("QoS_Common", "Discipline", "h") = "WRR" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosWRRText","s")%>
<option value="SP" <%if TCWebAPI_get("QoS_Common", "Discipline", "h") = "SP" then asp_write("selected") end if if TCWebAPI_get("QoS_Common", "Discipline", "h") = "N/A" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosPriorityText","s")%>
</select>

				<INPUT TYPE="HIDDEN" NAME="qoSOptType" VALUE="N/A">
			</td>
		</tr>				

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosWRRweightText","s")%> </td>
<td align=left class="tabdata">
				 <%tcWebApi_get("String_Entry","QosWRRweight0Text","s")%> <INPUT TYPE="TEXT" NAME="QosWRRweight1" SIZE="1" MAXLENGTH="2" VALUE="<%if TCWebAPI_get("QoS_Common", "WeightHighest", "h") <> "N/A" then TCWebAPI_get("QoS_Common", "WeightHighest", "s") else asp_Write("") end if %>">
				 <%tcWebApi_get("String_Entry","QosWRRweight1Text","s")%> <INPUT TYPE="TEXT" NAME="QosWRRweight2" SIZE="1" MAXLENGTH="2" VALUE="<%if TCWebAPI_get("QoS_Common", "WeightHigh", "h") <> "N/A" then TCWebAPI_get("QoS_Common", "WeightHigh", "s") else asp_Write("") end if %>">
				 <%tcWebApi_get("String_Entry","QosWRRweight2Text","s")%> <INPUT TYPE="TEXT" NAME="QosWRRweight3" SIZE="1" MAXLENGTH="2" VALUE="<%if TCWebAPI_get("QoS_Common", "WeightMedium", "h") <> "N/A" then TCWebAPI_get("QoS_Common", "WeightMedium", "s") else asp_Write("") end if %>">
				 <%tcWebApi_get("String_Entry","QosWRRweight3Text","s")%> <INPUT TYPE="TEXT" NAME="QosWRRweight4" SIZE="1" MAXLENGTH="2" VALUE="<%if TCWebAPI_get("QoS_Common", "WeightLow", "h") <> "N/A" then TCWebAPI_get("QoS_Common", "WeightLow", "s") else asp_Write("") end if %>"> 
</td>
</tr>

<tr height="30px">
<td align=left class="tabdata" style="padding-left:270px;white-space:nowrap;">
 <%tcWebApi_get("String_Entry","QosValidText","s")%> 
			</td>
		</tr>		
</table>
</div><!--id="block1" 12/19-->

<div id="block1">
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px">		
<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;">
<%tcWebApi_get("String_Entry","QosBandwidthControlText15","s")%> </td>
</tr>
</table>

<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr height="40px" id="buttoncolor">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
	<INPUT TYPE="BUTTON" class="button1" NAME="Qosdisciplinesave" VALUE="<%tcWebApi_get("String_Entry","ButtonDiscSaveText","s")%>" onClick="onClickQosDiscipline();">
	<INPUT TYPE="BUTTON" class="button1" NAME="Qos_Summary" VALUE="<%tcWebApi_get("String_Entry","ButtonRuleSumText","s")%>" onClick="onClickQosSummary();">				  
			</td>
<td id="firstDiv0" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
		</tr>
</table>
</div><!--id="block1" 12/19-->

<div id="block1">
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">		
<td align=left class="title-main" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosRuleText","s")%> </td>
		</tr>
</table>

<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosRuleIndexText","s")%> </td>
<td align=left class="tabdata">
				<SELECT NAME="QosRuleIndex" SIZE="1" onChange="doIndexChange()">
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "0" then asp_Write("selected") end if %>>0
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "1" then asp_Write("selected") end if %>>1
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "2" then asp_Write("selected") end if %>>2
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "3" then asp_Write("selected") end if %>>3
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "4" then asp_Write("selected") end if %>>4
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "5" then asp_Write("selected") end if %>>5
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "6" then asp_Write("selected") end if %>>6
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "7" then asp_Write("selected") end if %>>7
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "8" then asp_Write("selected") end if %>>8
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "9" then asp_Write("selected") end if %>>9
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "10" then asp_Write("selected") end if %>>10
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "11" then asp_Write("selected") end if %>>11
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "12" then asp_Write("selected") end if %>>12
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "13" then asp_Write("selected") end if %>>13
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "14" then asp_Write("selected") end if %>>14
		<%if tcWebApi_get("WebCustom_Entry","haveHwnat","h") <> "Yes" then%>
					<OPTION <%if TCWebAPI_get("WebCurSet_Entry", "qos_id", "h") = "15" then asp_Write("selected") end if %>>15
		<%end if%>			
				</SELECT>
				<INPUT TYPE="HIDDEN" NAME="QOS_Flag" VALUE="0">
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosActiveText","s")%> </td>
<td align=left class="tabdata" style="white-space:nowrap;">
				<INPUT TYPE="RADIO" NAME="QosRuleActive" VALUE="Yes" 
				<%if TCWebAPI_get("QoS_Entry", "Active", "h") = "Yes" then asp_write("checked") end if %> onclick="formAppToPhyport(1);fromDMacToPriority(1);init();disableqosRule();"> <%tcWebApi_get("String_Entry","QosActivatedText","s")%> 
				&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="QosRuleActive" VALUE="No" 
				<%if TCWebAPI_get("QoS_Entry", "Active", "h") = "No" then asp_write("checked") end if
				  if TCWebAPI_get("QoS_Entry", "Active", "h") = "N/A" then asp_write("checked") end if  %> onclick="formAppToPhyport(0);fromDMacToPriority(0);disableqosRule();"> <%tcWebApi_get("String_Entry","QosDeactivatedText","s")%> 
			</td>
		</tr>
<!--amy add 2/26-->
</table>	

<% if TCWebAPI_get("QoS_Entry", "Active", "h") = "Yes" then %>
<div id="qosRule">
<% else %>
<div id="qosRule" style="display:none;">
<% end if %>
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosApplicationText","s")%> </td>
<td align=left class="tabdata">
	<select name="QosApp" size="1" onChange="doQosAppIdxChange();">
            <option> 
            <option value="IGMP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "IGMP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication0Text","s")%>
           	<!--wang delete for issue 39
            <option value="SIP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "SIP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication1Text","s")%>
            <option value="H.323" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "H.323" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication2Text","s")%>
            -->
            <option value="MGCP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "MGCP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication3Text","s")%>
            <!--wang delete for issue 39
            <option value="SNMP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "SNMP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication4Text","s")%>
            -->
            <option value="DNS" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "DNS" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication5Text","s")%>
            <option value="DHCP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "DHCP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication6Text","s")%>
            <option value="RIP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "RIP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication7Text","s")%>
            <option value="RSTP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "RSTP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication8Text","s")%>
            <option value="RTCP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "RTCP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication9Text","s")%>
            <option value="RTP" <%if TCWebAPI_get("QoS_Entry", "Application", "h") = "RTP" then asp_write("selected") end if %>>
            <%tcWebApi_get("String_Entry","QosApplication10Text","s")%>
          </select>
</td>
		</tr>


		<div style="display:none"><!--wang add this style-->
		<tr style="display:none">
<td width="250" class="tabdata" align=left>
<%tcWebApi_get("String_Entry","QosPhysicalPortsText","s")%> </td>
			<td width="470" height="39" class="tabdata">
				<table border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
					<tr>
	<td width="40" align=center>
	<INPUT TYPE="CHECKBOX" NAME="QosPhyPortEth0" <%if TCWebAPI_get("QoS_Entry", "eth0.1", "h") = "Yes" then asp_write("checked") end if %>></td>
						<% if tcWebApi_get("WebCustom_Entry","isZY1PSupported","h") <> "Yes" then %>			
							<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortEth1" <%if TCWebAPI_get("QoS_Entry", "eth0.2", "h") = "Yes" then asp_write("checked") end if %>></td>
							<% if tcWebApi_get("WebCustom_Entry","is2PSupported","h") <> "Yes" then %>
							<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortEth2" <%if TCWebAPI_get("QoS_Entry", "eth0.3", "h") = "Yes" then asp_write("checked") end if %>></td>
							<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortEth3" <%if TCWebAPI_get("QoS_Entry", "eth0.4", "h") = "Yes" then asp_write("checked") end if %>></td>
							<%end if%>
						<%end if%>
<!--
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortUsb0" <%if TCWebAPI_get("QoS_Entry", "usb0", "h") = "Yes" then asp_write("checked") end if %>></td>
-->
<% if tcWebApi_get("Info_WLan","isExist","h") = "On" then %>

<%if TCWebAPI_get("WLan_Common","BssidNum","h") = "1" then%>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortRa0" <%if TCWebAPI_get("QoS_Entry", "ra0", "h") = "Yes" then asp_write("checked") end if %>></td>			
<%end if%>

<% if tcWebApi_get("Info_WLan11ac","isExist","h") = "On" then %>
<%if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then%>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortRai0" <%if TCWebAPI_get("QoS_Entry", "rai0", "h") = "Yes" then asp_write("checked") end if %>></td>			
<% end if %>
<% end if %>

 <%else%>
 
<% if tcWebApi_get("Info_WLan11ac","isExist","h") = "On" then %>
<%if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then%>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortRai0" <%if TCWebAPI_get("QoS_Entry", "rai0", "h") = "Yes" then asp_write("checked") end if %>></td>			
<% end if %>

<% end if %>
<% end if %>
					</tr>
						<tr class="tabdata">
						<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qoseth0Text","s")%> </td>
						<% if tcWebApi_get("WebCustom_Entry","isZY1PSupported","h") <> "Yes" then %>
							<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qoseth1Text","s")%> </td>
							<% if tcWebApi_get("WebCustom_Entry","is2PSupported","h") <> "Yes" then %>
							<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qoseth2Text","s")%> </td>
							<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qoseth3Text","s")%> </td>
							<% end if %>
						<% end if %>
<!--
						<td class="tabdata" align=center> usb0 </td>
-->
<% if tcWebApi_get("Info_WLan","isExist","h") = "On" then %>
<%if TCWebAPI_get("WLan_Common","BssidNum","h") = "1" then%>
						<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra0Text","s")%> </td>
<%end if%>	

<% if tcWebApi_get("Info_WLan11ac","isExist","h") = "On" then %>	
<%
	if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then
%>
						<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
<%
	end if
%>
<%end if%>				
					</tr>
<%
	if TCWebAPI_get("WLan_Common","BssidNum","h") = "2" then
%>
					<tr>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLANMssid0" <%if TCWebAPI_get("QoS_Entry","ra0","h") = "Yes" then asp_write("checked") end if %>></td>
<%if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then%>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLANMssid1" <%if TCWebAPI_get("QoS_Entry","ra1","h") = "Yes" then asp_write("checked") end if %>></td>
<%end if%>
					</tr>
					<tr class="tabdata">
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra0Text","s")%> </td>
<%if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then%>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra1Text","s")%> </td>
<%end if%>
					</tr>
<%
	elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "3" then
%>
					<tr>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLANMssid0" <%if TCWebAPI_get("QoS_Entry","ra0","h") = "Yes" then asp_write("checked") end if %>></td>
<%if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then%>		
              <td width="40" align=center><input type="CHECKBOX" name="QosPhyPortWLANMssid1" <%if TCWebAPI_get("QoS_Entry","ra1","h") = "Yes" then asp_write("checked") end if %>></td>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLANMssid2" <%if TCWebAPI_get("QoS_Entry","ra2","h") = "Yes" then asp_write("checked") end if %>></td>	
<%end if%>
					</tr>
					<tr class="tabdata">
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra0Text","s")%> </td>
<%if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then%>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra1Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra2Text","s")%> </td>
<%end if%>
					</tr>
<%
	elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "4" then
%>
					<tr>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLANMssid0" <%if TCWebAPI_get("QoS_Entry","ra0","h") = "Yes" then asp_write("checked") end if %>></td>
<%if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then%>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLANMssid1" <%if TCWebAPI_get("QoS_Entry","ra1","h") = "Yes" then asp_write("checked") end if %>></td>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLANMssid2" <%if TCWebAPI_get("QoS_Entry","ra2","h") = "Yes" then asp_write("checked") end if %>></td>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLANMssid3" <%if TCWebAPI_get("QoS_Entry","ra3","h") = "Yes" then asp_write("checked") end if %>></td>
<% end if %>			
					</tr>
					<tr class="tabdata">
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra0Text","s")%> </td>
<%if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then%>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra1Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra2Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra3Text","s")%> </td>
<%end if%>
					</tr>

<%
	end if
%>
<%else%>
<% if tcWebApi_get("Info_WLan11ac","isExist","h") = "On" then %>	
<%
	if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then
%>
						<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
<%
	end if
%>
<%end if%>
<%
	end if
%>

<% if tcWebApi_get("Info_WLan11ac","isExist","h") = "On" then %>
<%
	if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "2" then
%>
					<tr>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLAN11acMssid0" <%if TCWebAPI_get("QoS_Entry","rai0","h") = "Yes" then asp_write("checked") end if %>></td>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLAN11acMssid1" <%if TCWebAPI_get("QoS_Entry","rai1","h") = "Yes" then asp_write("checked") end if %>></td>
					</tr>
					<tr class="tabdata">
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai1Text","s")%> </td>
					</tr>
<%
	elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "3" then
%>
					<tr>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLAN11acMssid0" <%if TCWebAPI_get("QoS_Entry","rai0","h") = "Yes" then asp_write("checked") end if %>></td>	
            <td width="40" align=center><input type="CHECKBOX" name="QosPhyPortWLAN11acMssid1" <%if TCWebAPI_get("QoS_Entry","rai1","h") = "Yes" then asp_write("checked") end if %>></td>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLAN11acMssid2" <%if TCWebAPI_get("QoS_Entry","rai2","h") = "Yes" then asp_write("checked") end if %>></td>	
					</tr>
					<tr class="tabdata">
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai1Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai2Text","s")%> </td>
					</tr>
<%
	elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "4" then
%>
					<tr>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLAN11acMssid0" <%if TCWebAPI_get("QoS_Entry","rai0","h") = "Yes" then asp_write("checked") end if %>></td>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLAN11acMssid1" <%if TCWebAPI_get("QoS_Entry","rai1","h") = "Yes" then asp_write("checked") end if %>></td>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLAN11acMssid2" <%if TCWebAPI_get("QoS_Entry","rai2","h") = "Yes" then asp_write("checked") end if %>></td>
						<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="QosPhyPortWLAN11acMssid3" <%if TCWebAPI_get("QoS_Entry","rai3","h") = "Yes" then asp_write("checked") end if %>></td>	
					</tr>
					<tr class="tabdata">
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai1Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai2Text","s")%> </td>
					<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai3Text","s")%> </td>
					</tr>

<%
	end if
%>

<%
	end if
%>
				</table>
			</td>
		</tr>
		</div><!--delete end-->
 
 
		<tr style="display:none"><!--wang add this style-->
<td class="light-orange">&nbsp;</td>
<td class="light-orange"></td>
<td class="tabdata" align=right> 
<%tcWebApi_get("String_Entry","QosDestinationMACText","s")%> </td>
			<td class="tabdata" align=center>:</td>
			<td class="tabdata">
<INPUT TYPE="TEXT" NAME="QosDestMacValue" SIZE="17" MAXLENGTH="17" VALUE="<%if TCWebAPI_get("QoS_Entry", "DesMac", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "DesMac", "s") else asp_Write("") end if %>" onBlur="doMACcheck(this)">
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosDestinationIPText","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" onblur=blockMask(0); NAME="QosDestIpValue" SIZE="39" MAXLENGTH="39" VALUE="<%if TCWebAPI_get("QoS_Entry", "DesIP", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "DesIP", "s") else asp_Write("") end if %>">
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosMaskText","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" NAME="QosDestMaskValue" SIZE="15" MAXLENGTH="15" VALUE="<%if TCWebAPI_get("QoS_Entry", "DesMask", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "DesMask", "s") else asp_Write("") end if %>">
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosPortRangeText","s")%> </td>
<td align=left class="tabdata" style="white-space:nowrap;">
<INPUT TYPE="TEXT" NAME="QosDestPortValue1" SIZE="3" MAXLENGTH="5" VALUE="<%if TCWebAPI_get("QoS_Entry", "DesPortRangeBegin", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "DesPortRangeBegin", "s") else asp_Write("") end if %>">~
<INPUT TYPE="TEXT" NAME="QosDestPortValue2" SIZE="3" MAXLENGTH="5" VALUE="<%if TCWebAPI_get("QoS_Entry", "DesPortRangeEnd", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "DesPortRangeEnd", "s") else asp_Write("") end if %>">
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosSourceIPText","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" onblur=blockMask(1); NAME="QosSrcIpValue" SIZE="39" MAXLENGTH="39" VALUE="<%if TCWebAPI_get("QoS_Entry", "SrcIP", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "SrcIP", "s") else asp_Write("") end if %>">
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosMaskText","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" NAME="QosSrcMaskValue" SIZE="15" MAXLENGTH="15" VALUE="<%if TCWebAPI_get("QoS_Entry", "SrcMask", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "SrcMask", "s") else asp_Write("") end if %>">
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosPortRangeText","s")%> </td>
<td align=left class="tabdata" style="white-space:nowrap;">
<INPUT TYPE="TEXT" NAME="QosSrcPortValue1" SIZE="3" MAXLENGTH="5" VALUE="<%if TCWebAPI_get("QoS_Entry", "SrcPortRangeBegin", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "SrcPortRangeBegin", "s") else asp_Write("") end if %>">~
<INPUT TYPE="TEXT" NAME="QosSrcPortValue2" SIZE="3" MAXLENGTH="5" VALUE="<%if TCWebAPI_get("QoS_Entry", "SrcPortRangeEnd", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "SrcPortRangeEnd", "s") else asp_Write("") end if %>">
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosProtocolIDText","s")%> </td>
<td align=left class="tabdata">
				<SELECT NAME="QosProtocol" SIZE="1">
					<OPTION SELECTED>
					<OPTION value="TCP/UDP" <%if TCWebAPI_get("QoS_Entry", "ProtocolID", "h") = "TCP/UDP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosProtocol0Text","s")%>
					<OPTION value="TCP" <%if TCWebAPI_get("QoS_Entry", "ProtocolID", "h") = "TCP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosProtocol1Text","s")%>
					<OPTION value="UDP" <%if TCWebAPI_get("QoS_Entry", "ProtocolID", "h") = "UDP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosProtocol2Text","s")%>
					<OPTION value="ICMP" <%if TCWebAPI_get("QoS_Entry", "ProtocolID", "h") = "ICMP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosProtocol3Text","s")%>
					<!-- wang delete 
					<OPTION value="IGMP" <%if TCWebAPI_get("QoS_Entry", "ProtocolID", "h") = "IGMP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosProtocol4Text","s")%>
					-->
				</SELECT>
			</td>
		</tr>

<tr height="30px" style="display:none"><!--wang add the style-->
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosSourceMACText","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" NAME="QosSrcMacValue" SIZE="17" MAXLENGTH="17" VALUE="<%if TCWebAPI_get("QoS_Entry", "SrcMac", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "SrcMac", "s") else asp_Write("") end if %>" onBlur="doMACcheck(this)">
</td>
</tr>


<tr height="30px" style="display:none;">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosVlanIDRangeText","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" NAME="QosVIDValue1" SIZE="3" MAXLENGTH="5" VALUE="<%if TCWebAPI_get("QoS_Entry", "VlanIDRangeBegin", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "VlanIDRangeBegin", "s") else asp_Write("") end if %>">~
<INPUT TYPE="TEXT" NAME="QosVIDValue2" SIZE="3" MAXLENGTH="5" VALUE="<%if TCWebAPI_get("QoS_Entry", "VlanIDRangeEnd", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "VlanIDRangeEnd", "s") else asp_Write("") end if %>">
			</td>
		</tr>

		<tr style="display:none"><!--wang add the style-->
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosFieldText","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="RADIO" NAME="Qos_IPP_DSCP1" VALUE="IPPTOS" <%if TCWebAPI_get("QoS_Entry", "IPPDSField", "h") = "IPPTOS" then asp_write("checked") end if %> onclick="ornIppTosDscp(2);"> <%tcWebApi_get("String_Entry","QosField0Text","s")%> &nbsp;&nbsp;
<INPUT TYPE="RADIO" NAME="Qos_IPP_DSCP1" VALUE="DSCP" <%if TCWebAPI_get("QoS_Entry", "IPPDSField", "h") = "DSCP" then asp_write("checked") end if
				  if TCWebAPI_get("QoS_Entry", "IPPDSField", "h") = "N/A" then asp_write("checked") end if %> onclick="ornIppTosDscp(3)"> <%tcWebApi_get("String_Entry","QosField1Text","s")%> 
			</td>
		</tr>

		<tr style="display:none"><!--wang add the style-->
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosPrecedenceText","s")%> </td>
<td align=left class="tabdata">
				<SELECT NAME="QosIPPValue1" SIZE="1">
					<OPTION>
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeBegin", "h") = "0" then asp_write("selected") end if %>>0
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeBegin", "h") = "1" then asp_write("selected") end if %>>1
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeBegin", "h") = "2" then asp_write("selected") end if %>>2
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeBegin", "h") = "3" then asp_write("selected") end if %>>3
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeBegin", "h") = "4" then asp_write("selected") end if %>>4
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeBegin", "h") = "5" then asp_write("selected") end if %>>5
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeBegin", "h") = "6" then asp_write("selected") end if %>>6
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeBegin", "h") = "7" then asp_write("selected") end if %>>7
				</SELECT>~
				<SELECT NAME="QosIPPValue2" SIZE="1">
					<OPTION>
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeEnd", "h") = "0" then asp_write("selected") end if %>>0
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeEnd", "h") = "1" then asp_write("selected") end if %>>1
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeEnd", "h") = "2" then asp_write("selected") end if %>>2
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeEnd", "h") = "3" then asp_write("selected") end if %>>3
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeEnd", "h") = "4" then asp_write("selected") end if %>>4
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeEnd", "h") = "5" then asp_write("selected") end if %>>5
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeEnd", "h") = "6" then asp_write("selected") end if %>>6
					<OPTION <%if TCWebAPI_get("QoS_Entry", "IPPRangeEnd", "h") = "7" then asp_write("selected") end if %>>7
				</SELECT>
			</td>
		</tr>

		<tr style="display:none"><!--wang add the style -->
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosServiceText","s")%> </td>
<td align=left class="tabdata">
				<SELECT NAME="QosTOS" SIZE="1">
					<OPTION>
					<OPTION value="Normal service" <%if TCWebAPI_get("QoS_Entry", "TypeOfService", "h") = "Normal service" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosService0Text","s")%>
					<OPTION value="Minimize delay" <%if TCWebAPI_get("QoS_Entry", "TypeOfService", "h") = "Minimize delay" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosService1Text","s")%>
					<OPTION value="Maximize throughput" <%if TCWebAPI_get("QoS_Entry", "TypeOfService", "h") = "Maximize throughput" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosService2Text","s")%>
					<OPTION value="Maximize reliability" <%if TCWebAPI_get("QoS_Entry", "TypeOfService", "h") = "Maximize reliability" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosService3Text","s")%>
					<OPTION value="Minimize monetary cost" <%if TCWebAPI_get("QoS_Entry", "TypeOfService", "h") = "Minimize monetary cost" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosService4Text","s")%>
				</SELECT>
			</td>
		</tr>

		<tr style="display:none"><!--wang add the style -->
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosDSCPRangeText","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" NAME="QosDSCPValue1" SIZE="3" MAXLENGTH="3" VALUE="<%if TCWebAPI_get("QoS_Entry", "DSCPRangeBegin", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "DSCPRangeBegin", "s") else asp_Write("") end if %>">~
<INPUT TYPE="TEXT" NAME="QosDSCPValue2" SIZE="3" MAXLENGTH="3" VALUE="<%if TCWebAPI_get("QoS_Entry", "DSCPRangeEnd", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "DSCPRangeEnd", "s") else asp_Write("") end if %>"> <%tcWebApi_get("String_Entry","QosDSCPRangeCommText","s")%> 
			</td>
		</tr>

<tr height="30px" style="display:none">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","Qos8021pText","s")%> </td>
<td align=left class="tabdata">
				<SELECT NAME="Qos8021pValue1" SIZE="1">
					<OPTION>
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpBegin", "h") = "0" then asp_write("selected") end if %>>0
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpBegin", "h") = "1" then asp_write("selected") end if %>>1
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpBegin", "h") = "2" then asp_write("selected") end if %>>2
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpBegin", "h") = "3" then asp_write("selected") end if %>>3
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpBegin", "h") = "4" then asp_write("selected") end if %>>4
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpBegin", "h") = "5" then asp_write("selected") end if %>>5
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpBegin", "h") = "6" then asp_write("selected") end if %>>6
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpBegin", "h") = "7" then asp_write("selected") end if %>>7
				</SELECT>~
					<SELECT NAME="Qos8021pValue2" SIZE="1">
					<OPTION>
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpEnd", "h") = "0" then asp_write("selected") end if %>>0
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpEnd", "h") = "1" then asp_write("selected") end if %>>1
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpEnd", "h") = "2" then asp_write("selected") end if %>>2
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpEnd", "h") = "3" then asp_write("selected") end if %>>3
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpEnd", "h") = "4" then asp_write("selected") end if %>>4
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpEnd", "h") = "5" then asp_write("selected") end if %>>5
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpEnd", "h") = "6" then asp_write("selected") end if %>>6
					<OPTION <%if TCWebAPI_get("QoS_Entry", "dotpEnd", "h") = "7" then asp_write("selected") end if %>>7
				</SELECT>
			</td>
		</tr>

<tr height="30px" style="display:none">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<% if tcWebApi_get("WebCustom_Entry", "isC1ZYSupported", "h") = "Yes" then tcWebApi_get("String_Entry","QosActionText","s") else tcWebApi_get("String_Entry","QosActiveText","s") end if%> </td>
			<td class="tabdata"><hr  class="light-gray-line"></td>
			<td class="tabdata"><hr  class="light-gray-line"></td>
		</tr>

<tr height="30px" style="display:none">
			<td class="light-orange">&nbsp;</td>
			<td class="light-orange"></td>
			<td class="tabdata" align=right> <%tcWebApi_get("String_Entry","QosFieldText","s")%> </td>
			<td class="tabdata" align=center>:</td>
			<td class="tabdata">
				<INPUT TYPE="RADIO" NAME="Qos_IPP_DSCP2" VALUE="IPPTOS"
				<%if TCWebAPI_get("QoS_Entry", "ActIPPDSField", "h") = "IPPTOS" then asp_write("checked") end if %> onclick="reIppTosDscp(2);"> <%tcWebApi_get("String_Entry","QosField0Text","s")%> &nbsp;&nbsp;
				<INPUT TYPE="RADIO" NAME="Qos_IPP_DSCP2" VALUE="DSCP"
				<%if TCWebAPI_get("QoS_Entry", "ActIPPDSField", "h") = "DSCP" then asp_write("checked") end if
				  if TCWebAPI_get("QoS_Entry", "ActIPPDSField", "h") = "N/A" then asp_write("checked") end if %> onclick="reIppTosDscp(3);"> <%tcWebApi_get("String_Entry","QosField1Text","s")%> 
			</td>
		</tr>

<tr height="30px" style="display:none">
			<td class="light-orange">&nbsp;</td>
			<td class="light-orange"></td>
			<td class="tabdata" align=right> <%tcWebApi_get("String_Entry","QosPrecedenceRemarkText","s")%> </td>
			<td class="tabdata" align=center>:</td>
			<td class="tabdata">
				<SELECT NAME="QosReIPPValue" SIZE="1">
					<OPTION>
					<OPTION <%if TCWebAPI_get("QoS_Entry", "ActIPPRemarking", "h") = "0" then asp_write("selected") end if %>>0
					<OPTION <%if TCWebAPI_get("QoS_Entry", "ActIPPRemarking", "h") = "1" then asp_write("selected") end if %>>1
					<OPTION <%if TCWebAPI_get("QoS_Entry", "ActIPPRemarking", "h") = "2" then asp_write("selected") end if %>>2
					<OPTION <%if TCWebAPI_get("QoS_Entry", "ActIPPRemarking", "h") = "3" then asp_write("selected") end if %>>3
					<OPTION <%if TCWebAPI_get("QoS_Entry", "ActIPPRemarking", "h") = "4" then asp_write("selected") end if %>>4
					<OPTION <%if TCWebAPI_get("QoS_Entry", "ActIPPRemarking", "h") = "5" then asp_write("selected") end if %>>5
					<OPTION <%if TCWebAPI_get("QoS_Entry", "ActIPPRemarking", "h") = "6" then asp_write("selected") end if %>>6
					<OPTION <%if TCWebAPI_get("QoS_Entry", "ActIPPRemarking", "h") = "7" then asp_write("selected") end if %>>7
				</SELECT>
			</td>
		</tr>

<tr height="30px" style="display:none">
			<td class="light-orange">&nbsp;</td>
			<td class="light-orange"></td>
			<td class="tabdata" align=right> <%tcWebApi_get("String_Entry","QosServiceRemarkText","s")%> </td>
			<td class="tabdata" align=center>:</td>
			<td class="tabdata">
				<SELECT NAME="QosReTOS" SIZE="1">
					<OPTION SELECTED>
					<OPTION value="Normal service" <%if TCWebAPI_get("QoS_Entry", "ActToSRemarking", "h") = "Normal service" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosServiceRemark0Text","s")%>
					<OPTION value="Minimize delay" <%if TCWebAPI_get("QoS_Entry", "ActToSRemarking", "h") = "Minimize delay" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosServiceRemark1Text","s")%>
					<OPTION value="Maximize throughput" <%if TCWebAPI_get("QoS_Entry", "ActToSRemarking", "h") = "Maximize throughput" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosServiceRemark2Text","s")%>
					<OPTION value="Maximize reliability" <%if TCWebAPI_get("QoS_Entry", "ActToSRemarking", "h") = "Maximize reliability" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosServiceRemark3Text","s")%>
					<OPTION value="Minimize monetary cost" <%if TCWebAPI_get("QoS_Entry", "ActToSRemarking", "h") = "Minimize monetary cost" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosServiceRemark4Text","s")%>
				</SELECT>
			</td>
		</tr>
		
<tr height="30px" style="display:none">
			<td class="light-orange">&nbsp;</td>
			<td class="light-orange"></td>
			<td class="tabdata" align=right> <%tcWebApi_get("String_Entry","QosDSCPRemarkingText","s")%> </td>
			<td class="tabdata" align=center>:</td>
			<td class="tabdata">
				<INPUT TYPE="TEXT" NAME="QosReDSCPValue" SIZE="3" MAXLENGTH="3" VALUE=
				"<%if TCWebAPI_get("QoS_Entry", "ActDSCPRemarking", "h") <> "N/A" then TCWebAPI_get("QoS_Entry", "ActDSCPRemarking", "s") else asp_Write("") end if %>"> <%tcWebApi_get("String_Entry","QosDSCPRemarkingCommText","s")%> 
			</td>
		</tr>
		
<tr height="30px" style="display:none">
			<td class="light-orange">&nbsp;</td>
			<td class="light-orange"></td>
			<td class="tabdata" align=right> <%tcWebApi_get("String_Entry","Qos8021pRemarkingText","s")%> </td>
			<td class="tabdata" align=center>:</td>
			<td class="tabdata">
				<SELECT NAME="Qos8021pReValue" SIZE="1">
					<OPTION>
					<OPTION <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarkingNum", "h") = "0" then asp_write("selected") end if %>>0
					<OPTION <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarkingNum", "h") = "1" then asp_write("selected") end if %>>1
					<OPTION <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarkingNum", "h") = "2" then asp_write("selected") end if %>>2
					<OPTION <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarkingNum", "h") = "3" then asp_write("selected") end if %>>3
					<OPTION <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarkingNum", "h") = "4" then asp_write("selected") end if %>>4
					<OPTION <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarkingNum", "h") = "5" then asp_write("selected") end if %>>5
					<OPTION <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarkingNum", "h") = "6" then asp_write("selected") end if %>>6
					<OPTION <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarkingNum", "h") = "7" then asp_write("selected") end if %>>7
				</SELECT>
				<SELECT NAME="Qos8021pReApp" SIZE="1" onchange="doQos1pAppIdxChange();">
					<OPTION>
					<OPTION value="Key Net Traffic(RIP, OSPF)" <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarking", "h") = "Key Net Traffic(RIP, OSPF)" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","Qos8021pReApp0Text","s")%>
					<OPTION value="Voice" <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarking", "h") = "Voice" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","Qos8021pReApp1Text","s")%>
					<OPTION value="Video" <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarking", "h") = "Video" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","Qos8021pReApp2Text","s")%>
					<OPTION value="IGMP" <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarking", "h") = "IGMP" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","Qos8021pReApp3Text","s")%>
					<OPTION value="Key Data" <%if TCWebAPI_get("QoS_Entry", "Act8021pRemarking", "h") = "Key Data" then asp_write("selected") end if %>>><%tcWebApi_get("String_Entry","Qos8021pReApp4Text","s")%>
				</SELECT>
			</td>
		</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosQueueText","s")%> </td>
<td align=left class="tabdata">
				<SELECT NAME="QosConfigPriority" SIZE="1">
					<OPTION>
					<OPTION value="Low" <%if TCWebAPI_get("QoS_Entry", "ActQueue", "h") = "Low" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosQueue0Text","s")%>
					<OPTION value="Medium" <%if TCWebAPI_get("QoS_Entry", "ActQueue", "h") = "Medium" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosQueue1Text","s")%>
					<OPTION value="High" <%if TCWebAPI_get("QoS_Entry", "ActQueue", "h") = "High" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosQueue2Text","s")%>
					<OPTION value="Highest" <%if TCWebAPI_get("QoS_Entry", "ActQueue", "h") = "Highest" then asp_write("selected") end if %>><%tcWebApi_get("String_Entry","QosQueue3Text","s")%>
				</SELECT>
			</td>
		</tr>
 </table>
 </div><!--id=qosRule 2/26-->
</div><!--id="block1" 12/19-->
</div><!--id=hiddenqosfunction-->

<div id="block1">
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px">		
<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;">
<%tcWebApi_get("String_Entry","QosBandwidthControlText14","s")%> </td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr height="40px" id="buttoncolor">
<td width="250px" align=left class="tabdata" style="padding-left:20px;">
				<INPUT TYPE="SUBMIT" class="button1" NAME="QoS_Add" VALUE="<%tcWebApi_get("String_Entry","ButtonAddText","s")%>" onClick="doAdd();">
				<INPUT TYPE="SUBMIT" class="button1" NAME="QoS_Del" VALUE="<%tcWebApi_get("String_Entry","ButtonDeleteText","s")%>" onClick="doDel();">
				
				<INPUT TYPE="HIDDEN" NAME="QosMBSSIDNumberFlag" VALUE="<%tcWebApi_get("WLan_Common","BssidNum","s")%>">
				<INPUT TYPE="HIDDEN" NAME="Qos11acMBSSIDNumberFlag" VALUE="<%tcWebApi_get("WLan11ac_Common","BssidNum","s")%>">
				<INPUT TYPE="HIDDEN" NAME="QoS1PortFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","isZY1PSupported","s")%>">
				<INPUT TYPE="HIDDEN" NAME="QoS2PortsFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","is2PSupported","s")%>">
				<INPUT TYPE="HIDDEN" NAME="wlanISExist" ID="IDwlanISExist" VALUE="<%tcWebApi_get("Info_WLan","isExist","s")%>">
				<INPUT TYPE="HIDDEN" NAME="wlan11acISExist" ID="IDwlan11acISExist" VALUE="<%tcWebApi_get("Info_WLan11ac","isExist","s")%>">
				<input type="HIDDEN" name="UserMode" value="<% if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h")<>"Yes" then asp_write("0") else asp_write("1") end if%>"> 
				<input type="HIDDEN" name="WlanPort_1" value="<% if tcWebApi_get("QoS_Entry","ra1","h")="Yes" then asp_write("Yes") else asp_write("No") end if%>"> 
				<input type="HIDDEN" name="WlanPort_2" value="<% if tcWebApi_get("QoS_Entry","ra2","h")="Yes" then asp_write("Yes") else asp_write("No") end if%>"> 
				<input type="HIDDEN" name="WlanPort_3" value="<% if tcWebApi_get("QoS_Entry","ra3","h")="Yes" then asp_write("Yes") else asp_write("No") end if%>"> 
	</td>
	<td id="firstDiv1" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
		</tr>
	</table>
</div><!--id="block1" 12/19-->

<div id="block1">
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">		
<td align=left class="title-main" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosBandwidthControlTitleText","s")%> </td>
		</tr>	
</table>
	
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosBandwidthControlText1","s")%> </td>
<td align=left class="tabdata">
			 <INPUT NAME="QoS_Bandwidth_Control_Description" SIZE="32" MAXLENGTH="30" VALUE="" PLACEHOLDER="PC" Onclick="doMACaddressChange()">
		</td>
	</tr>
<!--wang add 20180124-->
 <tr height="30px">
 <input type="HIDDEN" name="MacAddFlag" value="0">
  <td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","QosBandwidthControl0Text","s")%> </td>
  <td align=left class="tabdata">
    <SELECT NAME="QoS_Bandwidth_Control_mac_select" SIZE="1" onchange="doMACaddressChange()">
        <OPTION value="0" selected ><%tcWebApi_get("String_Entry","QosBandwidthControl1Text","s")%>
        <% if tcwebApi_get("LanHost_Entry0", "MAC","h") <> "N/A" then %>
		<OPTION value="<%tcWebApi_staticGet("LanHost_Entry0", "MAC","s")%>"><%tcWebApi_staticGet("LanHost_Entry0", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("LanHost_Entry0", "MAC","s")%>
        <% end if %>
        <% if tcwebApi_get("LanHost_Entry1", "MAC","h") <> "N/A" then %>
		<OPTION value="<%tcWebApi_staticGet("LanHost_Entry1", "MAC","s")%>"><%tcWebApi_staticGet("LanHost_Entry1", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("LanHost_Entry1", "MAC","s")%>
        <% end if %>
        <% if tcwebApi_get("LanHost_Entry2", "MAC","h") <> "N/A" then %>
		<OPTION value="<%tcWebApi_staticGet("LanHost_Entry2", "MAC","s")%>"><%tcWebApi_staticGet("LanHost_Entry2", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("LanHost_Entry2", "MAC","s")%>
        <% end if %>
        <% if tcwebApi_get("LanHost_Entry3", "MAC","h") <> "N/A" then %>
		<OPTION value="<%tcWebApi_staticGet("LanHost_Entry3", "MAC","s")%>"><%tcWebApi_staticGet("LanHost_Entry3", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("LanHost_Entry3", "MAC","s")%>
        <% end if %>
        <% if tcwebApi_get("LanHost_Entry4", "MAC","h") <> "N/A" then %>
		<OPTION value="<%tcWebApi_staticGet("LanHost_Entry4", "MAC","s")%>"><%tcWebApi_staticGet("LanHost_Entry4", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("LanHost_Entry4", "MAC","s")%>
        <% end if %>
        <% if tcwebApi_get("LanHost_Entry5", "MAC","h") <> "N/A" then %>
		<OPTION value="<%tcWebApi_staticGet("LanHost_Entry5", "MAC","s")%>"><%tcWebApi_staticGet("LanHost_Entry5", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("LanHost_Entry5", "MAC","s")%>
        <% end if %>
        <% if tcwebApi_get("LanHost_Entry6", "MAC","h") <> "N/A" then %>
		<OPTION value="<%tcWebApi_staticGet("LanHost_Entry6", "MAC","s")%>"><%tcWebApi_staticGet("LanHost_Entry6", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("LanHost_Entry6", "MAC","s")%>
        <% end if %>
        <% if tcwebApi_get("LanHost_Entry7", "MAC","h") <> "N/A" then %>
		<OPTION value="<%tcWebApi_staticGet("LanHost_Entry7", "MAC","s")%>"><%tcWebApi_staticGet("LanHost_Entry7", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("LanHost_Entry7", "MAC","s")%>
        <% end if %>        
	</SELECT>
  </td>
 </tr>

<tr id="ManuallyMacAddr" height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosBandwidthControlText2","s")%> </td>
<td align=left class="tabdata">
			<INPUT NAME="QoS_Bandwidth_Control_Mac" SIZE="18"  MAXLENGTH="24" VALUE="" PLACEHOLDER="11:22:33:44:55:66"> 
		</td>		
	</tr>
	
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosBandwidthControlText3","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="number" NAME="QoS_Bandwidth_Control_Up" SIZE="6" MAXLENGTH="6" VALUE="" min="1" PLACEHOLDER="0" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">  <%tcWebApi_get("String_Entry","QosBandwidthControlText7","s")%> 
</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;"></td>
<td align=left class="tabdata"> 
<%tcWebApi_get("String_Entry","QosBandwidthControlText8","s")%>
		</td>				
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","QosBandwidthControlText4","s")%> </td>
<td align=left class="tabdata">
<INPUT TYPE="number" NAME="QoS_Bandwidth_Control_Down" SIZE="6" MAXLENGTH="6"  VALUE="" min="1" PLACEHOLDER="0" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"> <%tcWebApi_get("String_Entry","QosBandwidthControlText7","s")%>
		</td>		
	</tr>
	
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;"></td>
<td align=left class="tabdata"> 
<%tcWebApi_get("String_Entry","QosBandwidthControlText8","s")%>
</td>
</tr>
	</table>
</div><!--id="block1" 12/19-->
	
<div id="block1">
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px">		
<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;">
<%tcWebApi_get("String_Entry","QosBandwidthControlText12","s")%></td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr height="30px" id="buttoncolor">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<INPUT TYPE="BUTTON" class="button1" NAME="QoS_Bandwidth_Control_Add" VALUE="<%tcWebApi_get("String_Entry","ButtonAddText","s")%>" onClick="doAddRule();">
			</td>
<td id="firstDiv2" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
	</tr>
</table>
</div><!--id="block1" 12/19-->

<div id="block2">
<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">		
<td class="title-main" align=left style="padding-left:20px;"><%tcWebApi_get("String_Entry","QosBandwidthControlText13","s")%></td> 
</tr>
</table>
		
<table width="640" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed;">
<tr >
<td align=center class="tabdata">
		<INPUT TYPE="HIDDEN" NAME="delnum">
		<INPUT TYPE="HIDDEN" NAME="add_num" value="<%TcWebApi_get("QosBandwidth_Common","addNum","s")%>">
	<div class="configstyle">
		<div id=qosBandwidthControl></div>
	</div>
		</td>
</tr>
</table>
</div><!--id="block2" 12/19-->
</div><!--id="contenttype"-->
</div><!--id="pagestyle" 12/19-->

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
	
<script language=JavaScript>
var tableHeader = [
	["8%","<%tcWebApi_get("String_Entry","QosBandwidthIndexText1","s")%>"],
	["14%","<%tcWebApi_get("String_Entry","QosBandwidthControlText1","s")%>"],
	["17%","<%tcWebApi_get("String_Entry","QosBandwidthControlText2","s")%>"],
	["22%","<%tcWebApi_get("String_Entry","QosBandwidthControlText3","s")%><%tcWebApi_get("String_Entry","QosBandwidthControlText7","s")%>"],
	["23%","<%tcWebApi_get("String_Entry","QosBandwidthControlText4","s")%><%tcWebApi_get("String_Entry","QosBandwidthControlText7","s")%>"],
	["16%","<%tcWebApi_get("String_Entry","QosBandwidthControlText5","s")%>"]
];

var tableData = [
	["1", "<%tcWebApi_get("QosBandwidth_Entry0", "Qos_Description","s")%>","<%tcWebApi_get("QosBandwidth_Entry0", "Qos_Mac","s")%>","<%tcWebApi_get("QosBandwidth_Entry0", "Qos_Up","s")%>","<%tcWebApi_get("QosBandwidth_Entry0", "Qos_Down","s")%>","<%tcWebApi_get("QosBandwidth_Entry0", "Qos_Num","s")%>"],
	["2", "<%tcWebApi_get("QosBandwidth_Entry1", "Qos_Description","s")%>","<%tcWebApi_get("QosBandwidth_Entry1", "Qos_Mac","s")%>","<%tcWebApi_get("QosBandwidth_Entry1", "Qos_Up","s")%>","<%tcWebApi_get("QosBandwidth_Entry1", "Qos_Down","s")%>","<%tcWebApi_get("QosBandwidth_Entry1", "Qos_Num","s")%>"],
	["3", "<%tcWebApi_get("QosBandwidth_Entry2", "Qos_Description","s")%>","<%tcWebApi_get("QosBandwidth_Entry2", "Qos_Mac","s")%>","<%tcWebApi_get("QosBandwidth_Entry2", "Qos_Up","s")%>","<%tcWebApi_get("QosBandwidth_Entry2", "Qos_Down","s")%>","<%tcWebApi_get("QosBandwidth_Entry2", "Qos_Num","s")%>"],
	["4", "<%tcWebApi_get("QosBandwidth_Entry3", "Qos_Description","s")%>","<%tcWebApi_get("QosBandwidth_Entry3", "Qos_Mac","s")%>","<%tcWebApi_get("QosBandwidth_Entry3", "Qos_Up","s")%>","<%tcWebApi_get("QosBandwidth_Entry3", "Qos_Down","s")%>","<%tcWebApi_get("QosBandwidth_Entry3", "Qos_Num","s")%>"],
	["5", "<%tcWebApi_get("QosBandwidth_Entry4", "Qos_Description","s")%>","<%tcWebApi_get("QosBandwidth_Entry4", "Qos_Mac","s")%>","<%tcWebApi_get("QosBandwidth_Entry4", "Qos_Up","s")%>","<%tcWebApi_get("QosBandwidth_Entry4", "Qos_Down","s")%>","<%tcWebApi_get("QosBandwidth_Entry4", "Qos_Num","s")%>"],
	["6", "<%tcWebApi_get("QosBandwidth_Entry5", "Qos_Description","s")%>","<%tcWebApi_get("QosBandwidth_Entry5", "Qos_Mac","s")%>","<%tcWebApi_get("QosBandwidth_Entry5", "Qos_Up","s")%>","<%tcWebApi_get("QosBandwidth_Entry5", "Qos_Down","s")%>","<%tcWebApi_get("QosBandwidth_Entry5", "Qos_Num","s")%>"],
	["7", "<%tcWebApi_get("QosBandwidth_Entry6", "Qos_Description","s")%>","<%tcWebApi_get("QosBandwidth_Entry6", "Qos_Mac","s")%>","<%tcWebApi_get("QosBandwidth_Entry6", "Qos_Up","s")%>","<%tcWebApi_get("QosBandwidth_Entry6", "Qos_Down","s")%>","<%tcWebApi_get("QosBandwidth_Entry6", "Qos_Num","s")%>"],
	["8", "<%tcWebApi_get("QosBandwidth_Entry7", "Qos_Description","s")%>","<%tcWebApi_get("QosBandwidth_Entry7", "Qos_Mac","s")%>","<%tcWebApi_get("QosBandwidth_Entry7", "Qos_Up","s")%>","<%tcWebApi_get("QosBandwidth_Entry7", "Qos_Down","s")%>","<%tcWebApi_get("QosBandwidth_Entry7", "Qos_Num","s")%>"]
];

showTable('qosBandwidthControl',tableHeader,tableData,2);

</script>

</form>
</body>
</html>
