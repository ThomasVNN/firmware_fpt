<%
If Request_Form("PortTriggering_SubmitFlag") = "1" Then
	tcWebApi_set("GUITemp_Entry0","NameTmp","PortTriggering_Applications")
	tcWebApi_set("GUITemp_Entry0","TSPortTmp","PortTriggering_StartPort_0")
	tcWebApi_set("GUITemp_Entry0","TEPortTmp","PortTriggering_EndPort_0")
	tcWebApi_set("GUITemp_Entry0","TProtocolTmp","PortTriggering_Protocol_0")
	tcWebApi_set("GUITemp_Entry0","OSPortTmp","PortOpening_StartPort_0")
	tcWebApi_set("GUITemp_Entry0","OEPortTmp","PortOpening_EndPort_0")
	tcWebApi_set("GUITemp_Entry0","OProtocolTmp","PortOpening_Protocol_0")
	
	tcWebApi_set("GUITemp_Entry1","NameTmp","PortTriggering_Applications")
	tcWebApi_set("GUITemp_Entry1","TSPortTmp","PortTriggering_StartPort_1")
	tcWebApi_set("GUITemp_Entry1","TEPortTmp","PortTriggering_EndPort_1")
	tcWebApi_set("GUITemp_Entry1","TProtocolTmp","PortTriggering_Protocol_1")
	tcWebApi_set("GUITemp_Entry1","OSPortTmp","PortOpening_StartPort_1")
	tcWebApi_set("GUITemp_Entry1","OEPortTmp","PortOpening_EndPort_1")
	tcWebApi_set("GUITemp_Entry1","OProtocolTmp","PortOpening_Protocol_1")
	
	tcWebApi_set("GUITemp_Entry2","NameTmp","PortTriggering_Applications")
	tcWebApi_set("GUITemp_Entry2","TSPortTmp","PortTriggering_StartPort_2")
	tcWebApi_set("GUITemp_Entry2","TEPortTmp","PortTriggering_EndPort_2")
	tcWebApi_set("GUITemp_Entry2","TProtocolTmp","PortTriggering_Protocol_2")
	tcWebApi_set("GUITemp_Entry2","OSPortTmp","PortOpening_StartPort_2")
	tcWebApi_set("GUITemp_Entry2","OEPortTmp","PortOpening_EndPort_2")
	tcWebApi_set("GUITemp_Entry2","OProtocolTmp","PortOpening_Protocol_2")
	
	tcWebApi_set("GUITemp_Entry3","NameTmp","PortTriggering_Applications")
	tcWebApi_set("GUITemp_Entry3","TSPortTmp","PortTriggering_StartPort_3")
	tcWebApi_set("GUITemp_Entry3","TEPortTmp","PortTriggering_EndPort_3")
	tcWebApi_set("GUITemp_Entry3","TProtocolTmp","PortTriggering_Protocol_3")
	tcWebApi_set("GUITemp_Entry3","OSPortTmp","PortOpening_StartPort_3")
	tcWebApi_set("GUITemp_Entry3","OEPortTmp","PortOpening_EndPort_3")
	tcWebApi_set("GUITemp_Entry3","OProtocolTmp","PortOpening_Protocol_3")
	
	tcWebApi_set("GUITemp_Entry4","NameTmp","PortTriggering_Applications")
	tcWebApi_set("GUITemp_Entry4","TSPortTmp","PortTriggering_StartPort_4")
	tcWebApi_set("GUITemp_Entry4","TEPortTmp","PortTriggering_EndPort_4")
	tcWebApi_set("GUITemp_Entry4","TProtocolTmp","PortTriggering_Protocol_4")
	tcWebApi_set("GUITemp_Entry4","OSPortTmp","PortOpening_StartPort_4")
	tcWebApi_set("GUITemp_Entry4","OEPortTmp","PortOpening_EndPort_4")
	tcWebApi_set("GUITemp_Entry4","OProtocolTmp","PortOpening_Protocol_4")
	
	tcWebApi_set("GUITemp_Entry5","NameTmp","PortTriggering_Applications")
	tcWebApi_set("GUITemp_Entry5","TSPortTmp","PortTriggering_StartPort_5")
	tcWebApi_set("GUITemp_Entry5","TEPortTmp","PortTriggering_EndPort_5")
	tcWebApi_set("GUITemp_Entry5","TProtocolTmp","PortTriggering_Protocol_5")
	tcWebApi_set("GUITemp_Entry5","OSPortTmp","PortOpening_StartPort_5")
	tcWebApi_set("GUITemp_Entry5","OEPortTmp","PortOpening_EndPort_5")
	tcWebApi_set("GUITemp_Entry5","OProtocolTmp","PortOpening_Protocol_5")
	
	tcWebApi_set("GUITemp_Entry6","NameTmp","PortTriggering_Applications")
	tcWebApi_set("GUITemp_Entry6","TSPortTmp","PortTriggering_StartPort_6")
	tcWebApi_set("GUITemp_Entry6","TEPortTmp","PortTriggering_EndPort_6")
	tcWebApi_set("GUITemp_Entry6","TProtocolTmp","PortTriggering_Protocol_6")
	tcWebApi_set("GUITemp_Entry6","OSPortTmp","PortOpening_StartPort_6")
	tcWebApi_set("GUITemp_Entry6","OEPortTmp","PortOpening_EndPort_6")
	tcWebApi_set("GUITemp_Entry6","OProtocolTmp","PortOpening_Protocol_6")
	
	tcWebApi_set("GUITemp_Entry7","NameTmp","PortTriggering_Applications")
	tcWebApi_set("GUITemp_Entry7","TSPortTmp","PortTriggering_StartPort_7")
	tcWebApi_set("GUITemp_Entry7","TEPortTmp","PortTriggering_EndPort_7")
	tcWebApi_set("GUITemp_Entry7","TProtocolTmp","PortTriggering_Protocol_7")
	tcWebApi_set("GUITemp_Entry7","OSPortTmp","PortOpening_StartPort_7")
	tcWebApi_set("GUITemp_Entry7","OEPortTmp","PortOpening_EndPort_7")
	tcWebApi_set("GUITemp_Entry7","OProtocolTmp","PortOpening_Protocol_7")
	tcWebApi_commit("portTriggering_Entry")

	tcWebApi_unset("GUITemp_Entry0")
	tcWebApi_unset("GUITemp_Entry1")
	tcWebApi_unset("GUITemp_Entry2")
	tcWebApi_unset("GUITemp_Entry3")
	tcWebApi_unset("GUITemp_Entry4")
	tcWebApi_unset("GUITemp_Entry5")
	tcWebApi_unset("GUITemp_Entry6")
	tcWebApi_unset("GUITemp_Entry7")

End If
%>
<html><head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css" tppabs="/style.css">


<style>
*{color:  #404040;}
table td{margin:5 0;padding:5 0;}
</style>


<SCRIPT language=javascript>
var ApplicationName = ["-" , "AimTalk" , "Asheron's Call" , "CalistaIPPhone" , "DeltaForce" , "ICQ" , "Napster" , "Net2Phone" , "QuickTimeClient" , "RainBow 6 Game" ];
var defaultArray = [
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var AimTalkArray = [
					[1 , 4099 ,4099 , 1 , 5191 , 5191 , 1],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var ACallArray = [
					[1 , 9000 ,9013 , 2 , 9000 , 9013 , 2],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var CalistaIPPhoneArray = [
					[1 , 5190 ,5190 , 1 , 3000 , 3000 , 1],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var DeltaForceArray = [
					[1 , 3568 ,3568 , 2 , 3100 , 3999 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var ICQArray = [
					[1 , 4000 ,4000 , 2 , 20000 , 20059 , 1],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var NapsterArray = [
					[1 , 6699 ,6699 , 1 , 6699 , 6699 , 1],
					[1 , 6699 ,6699 , 1 , 6697 , 6697 , 1],
					[1 , 6699 ,6699 , 1 , 4444 , 4444 , 1],
					[1 , 6699 ,6699 , 1 , 5555 , 5555 , 1],
					[1 , 6699 ,6699 , 1 , 6666 , 6666 , 1],
					[1 , 6699 ,6699 , 1 , 7777 , 7777 , 1],
					[1 , 6699 ,6699 , 1 , 8888 , 8888 , 1],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var Net2PhoneArray = [
					[1 , 6801 ,6801 , 2 , 6801 , 6801 , 2],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var QuickTimeArray = [
					[1 , 554 ,554 , 1 , 6990 , 32000 , 1],
					[1 , 554 ,554 , 1 , 6970 , 7000 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
var RainBow6GameArray = [
					[1 , 2346 ,2346 , 1 , 2346 , 2438 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0],
					[0 , 0 ,0 , 0 , 0 , 0 , 0]					
];
function RuleTableSetting(ApplicationArray)
{
	var i = 0;
	for(i = 0; i < 8; i++)
	{
		if(1 == ApplicationArray[i][0])
		{
			document.forms[0].elements[i*7+3].checked = true;	
		}
		else
		{
			document.forms[0].elements[i*7+3].checked = false;
		}

		document.forms[0].elements[i*7+4].value = ApplicationArray[i][1];
		document.forms[0].elements[i*7+5].value = ApplicationArray[i][2];
		document.forms[0].elements[i*7+6].selectedIndex = ApplicationArray[i][3];
		document.forms[0].elements[i*7+7].value = ApplicationArray[i][4];	
		document.forms[0].elements[i*7+8].value = ApplicationArray[i][5];
		document.forms[0].elements[i*7+9].selectedIndex = ApplicationArray[i][6];
	}
}

function ruleSetting(selectIndex)
{
	document.forms[0].PortTriggering_Applications.value = ApplicationName[selectIndex];
	switch(selectIndex)
	{
		case 0:
			RuleTableSetting(defaultArray);
			break;
		case 1:
			RuleTableSetting(AimTalkArray);
			break;
		case 2:
			RuleTableSetting(ACallArray);
			break;
		case 3:
			RuleTableSetting(CalistaIPPhoneArray);
			break;
		case 4:
			RuleTableSetting(DeltaForceArray);
			break;
		case 5:
			RuleTableSetting(ICQArray);
			break;
		case 6:
			RuleTableSetting(NapsterArray);
			break;
		case 7:
			RuleTableSetting(Net2PhoneArray);
			break;
		case 8:
			RuleTableSetting(QuickTimeArray);
			break;
		case 9:
			RuleTableSetting(RainBow6GameArray);
			break;
	}
}

function doAppChange(selectIndex) 
{
	ruleSetting(selectIndex);
}

function chkRuleLimit()
{

	var free_rule = 0;
	var input_rule = 0;
	var i=0;
	var value0,value1,value2,value3,value4,value5,value6;
	var port1 = document.forms[0].elements[i*7+4].value,port2 = document.forms[0].elements[i*7+5].value,port3 = document.forms[0].elements[i*7+6].value;port4 = document.forms[0].elements[i*7+7].value;
	var port4 = document.forms[0].elements[i*7+7].value,port5 = document.forms[0].elements[i*7+8].value,port6 = document.forms[0].elements[i*7+9].value;
	
<%if tcWebApi_get("portTriggering_Entry0","TSPort","h") = "N/A" then%>
	free_rule += 1;
<%else%>
	var value0 = "<%TCWebApi_get("portTriggering_Entry0","Name","s")%>";
	value1 = "<%TCWebApi_get("portTriggering_Entry0","TSPort","s")%>";
	value2 = "<%TCWebApi_get("portTriggering_Entry0","TEPort","s")%>";
	value3 = "<%TCWebApi_get("portTriggering_Entry0","TProtocol","s")%>";
	value4 = "<%TCWebApi_get("portTriggering_Entry0","OSPort","s")%>";
	value5 = "<%TCWebApi_get("portTriggering_Entry0","OEPort","s")%>";
	value6 = "<%TCWebApi_get("portTriggering_Entry0","OProtocol","s")%>";
	for(i = 0; i < 8; i++){
		if(document.forms[0].elements[i*7+3].checked){
			if((port1 == value1)&&(port2 == value2)&&(port3 == value3)&&(port4 == value4)&&(port5 == value5)&&(port6 == value6)&&
			   (document.forms[0].PortTriggering_Applications.value == value0)){
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS10Text","s")%>");
				return true;
			}
		}
	}
<%end if%>

<%if tcWebApi_get("portTriggering_Entry1","TSPort","h") = "N/A" then%>
	free_rule += 1;
<%else%>
	value0 = "<%TCWebApi_get("portTriggering_Entry1","Name","s")%>";
	value1 = "<%TCWebApi_get("portTriggering_Entry1","TSPort","s")%>";
	value2 = "<%TCWebApi_get("portTriggering_Entry1","TEPort","s")%>";
	value3 = "<%TCWebApi_get("portTriggering_Entry1","TProtocol","s")%>";
	value4 = "<%TCWebApi_get("portTriggering_Entry1","OSPort","s")%>";
	value5 = "<%TCWebApi_get("portTriggering_Entry1","OEPort","s")%>";
	value6 = "<%TCWebApi_get("portTriggering_Entry1","OProtocol","s")%>";
	for(i = 0; i < 8; i++){
		if(document.forms[0].elements[i*7+3].checked){
			if((port1 == value1)&&(port2 == value2)&&(port3 == value3)&&(port4 == value4)&&(port5 == value5)&&(port6 == value6)&&
			   (document.forms[0].PortTriggering_Applications.value == value0)){
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS10Text","s")%>");
				return true;
			}
		}
	}
<%end if%>

<%if tcWebApi_get("portTriggering_Entry2","TSPort","h") = "N/A" then%>
	free_rule += 1;
<%else%>
	value0 = "<%TCWebApi_get("portTriggering_Entry2","Name","s")%>";
	value1 = "<%TCWebApi_get("portTriggering_Entry2","TSPort","s")%>";
	value2 = "<%TCWebApi_get("portTriggering_Entry2","TEPort","s")%>";
	value3 = "<%TCWebApi_get("portTriggering_Entry2","TProtocol","s")%>";
	value4 = "<%TCWebApi_get("portTriggering_Entry2","OSPort","s")%>";
	value5 = "<%TCWebApi_get("portTriggering_Entry2","OEPort","s")%>";
	value6 = "<%TCWebApi_get("portTriggering_Entry2","OProtocol","s")%>";
	for(i = 0; i < 8; i++){
		if(document.forms[0].elements[i*7+3].checked){
			if((port1 == value1)&&(port2 == value2)&&(port3 == value3)&&(port4 == value4)&&(port5 == value5)&&(port6 == value6)&&
			   (document.forms[0].PortTriggering_Applications.value == value0)){
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS10Text","s")%>");
				return true;
			}
		}
	}
<%end if%>

<%if tcWebApi_get("portTriggering_Entry3","TSPort","h") = "N/A" then%>
	free_rule += 1;
<%else%>
	value0 = "<%TCWebApi_get("portTriggering_Entry3","Name","s")%>";
	value1 = "<%TCWebApi_get("portTriggering_Entry3","TSPort","s")%>";
	value2 = "<%TCWebApi_get("portTriggering_Entry3","TEPort","s")%>";
	value3 = "<%TCWebApi_get("portTriggering_Entry3","TProtocol","s")%>";
	value4 = "<%TCWebApi_get("portTriggering_Entry3","OSPort","s")%>";
	value5 = "<%TCWebApi_get("portTriggering_Entry3","OEPort","s")%>";
	value6 = "<%TCWebApi_get("portTriggering_Entry3","OProtocol","s")%>";
	for(i = 0; i < 8; i++){
		if(document.forms[0].elements[i*7+3].checked){
			if((port1 == value1)&&(port2 == value2)&&(port3 == value3)&&(port4 == value4)&&(port5 == value5)&&(port6 == value6)&&
			   (document.forms[0].PortTriggering_Applications.value == value0)){
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS10Text","s")%>");
				return true;
			}
		}
	}
<%end if%>

<%if tcWebApi_get("portTriggering_Entry4","TSPort","h") = "N/A" then%>
	free_rule += 1;
<%else%>
	value0 = "<%TCWebApi_get("portTriggering_Entry4","Name","s")%>";
	value1 = "<%TCWebApi_get("portTriggering_Entry4","TSPort","s")%>";
	value2 = "<%TCWebApi_get("portTriggering_Entry4","TEPort","s")%>";
	value3 = "<%TCWebApi_get("portTriggering_Entry4","TProtocol","s")%>";
	value4 = "<%TCWebApi_get("portTriggering_Entry4","OSPort","s")%>";
	value5 = "<%TCWebApi_get("portTriggering_Entry4","OEPort","s")%>";
	value6 = "<%TCWebApi_get("portTriggering_Entry4","OProtocol","s")%>";
	for(i = 0; i < 8; i++){
		if(document.forms[0].elements[i*7+3].checked){
			if((port1 == value1)&&(port2 == value2)&&(port3 == value3)&&(port4 == value4)&&(port5 == value5)&&(port6 == value6)&&
			   (document.forms[0].PortTriggering_Applications.value == value0)){
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS10Text","s")%>");
				return true;
			}
		}
	}
<%end if%>

<%if tcWebApi_get("portTriggering_Entry5","TSPort","h") = "N/A" then%>
	free_rule += 1;
<%else%>
	value0 = "<%TCWebApi_get("portTriggering_Entry5","Name","s")%>";
	value1 = "<%TCWebApi_get("portTriggering_Entry5","TSPort","s")%>";
	value2 = "<%TCWebApi_get("portTriggering_Entry5","TEPort","s")%>";
	value3 = "<%TCWebApi_get("portTriggering_Entry5","TProtocol","s")%>";
	value4 = "<%TCWebApi_get("portTriggering_Entry5","OSPort","s")%>";
	value5 = "<%TCWebApi_get("portTriggering_Entry5","OEPort","s")%>";
	value6 = "<%TCWebApi_get("portTriggering_Entry5","OProtocol","s")%>";
	for(i = 0; i < 8; i++){
		if(document.forms[0].elements[i*7+3].checked){
			if((port1 == value1)&&(port2 == value2)&&(port3 == value3)&&(port4 == value4)&&(port5 == value5)&&(port6 == value6)&&
			   (document.forms[0].PortTriggering_Applications.value == value0)){
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS10Text","s")%>");
				return true;
			}
		}
	}
<%end if%>

<%if tcWebApi_get("portTriggering_Entry6","TSPort","h") = "N/A" then%>
	free_rule += 1;
<%else%>
	value0 = "<%TCWebApi_get("portTriggering_Entry6","Name","s")%>";
	value1 = "<%TCWebApi_get("portTriggering_Entry6","TSPort","s")%>";
	value2 = "<%TCWebApi_get("portTriggering_Entry6","TEPort","s")%>";
	value3 = "<%TCWebApi_get("portTriggering_Entry6","TProtocol","s")%>";
	value4 = "<%TCWebApi_get("portTriggering_Entry6","OSPort","s")%>";
	value5 = "<%TCWebApi_get("portTriggering_Entry6","OEPort","s")%>";
	value6 = "<%TCWebApi_get("portTriggering_Entry6","OProtocol","s")%>";
	for(i = 0; i < 8; i++){
		if(document.forms[0].elements[i*7+3].checked){
			if((port1 == value1)&&(port2 == value2)&&(port3 == value3)&&(port4 == value4)&&(port5 == value5)&&(port6 == value6)&&
			   (document.forms[0].PortTriggering_Applications.value == value0)){
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS10Text","s")%>");
				return true;
			}
		}
	}
<%end if%>

<%if tcWebApi_get("portTriggering_Entry7","TSPort","h") = "N/A" then%>
	free_rule += 1;
<%else%>
	value0 = "<%TCWebApi_get("portTriggering_Entry7","Name","s")%>";
	value1 = "<%TCWebApi_get("portTriggering_Entry7","TSPort","s")%>";
	value2 = "<%TCWebApi_get("portTriggering_Entry7","TEPort","s")%>";
	value3 = "<%TCWebApi_get("portTriggering_Entry7","TProtocol","s")%>";
	value4 = "<%TCWebApi_get("portTriggering_Entry7","OSPort","s")%>";
	value5 = "<%TCWebApi_get("portTriggering_Entry7","OEPort","s")%>";
	value6 = "<%TCWebApi_get("portTriggering_Entry7","OProtocol","s")%>";
	for(i = 0; i < 8; i++){
		if(document.forms[0].elements[i*7+3].checked){
			if((port1 == value1)&&(port2 == value2)&&(port3 == value3)&&(port4 == value4)&&(port5 == value5)&&(port6 == value6)&&
			   (document.forms[0].PortTriggering_Applications.value == value0)){
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS10Text","s")%>");
				return true;
			}
		}
	}
<%end if%>


	for(i = 0; i < 8; i++)
	{
		if(document.forms[0].elements[i*7+3].checked)
			input_rule++;
	}

	if (free_rule >= input_rule)
		return false;
	else{
		alert('<%tcWebApi_get("String_Entry","PortTriggerJS6Text","s")%>');
	return true;
}
}

//saffi add start 
 function isNum(num){
      var reNum =/^\+?[1-9][0-9]*$/;
      return (reNum.test(num));
   }
//saffi add end 

function chkPortRange()
{
	var active = 0;
	var i = 0;
	for(i = 0; i < 8; i++)
	{
		if(document.forms[0].elements[i*7+3].checked)
		{
			active++;
			//saffi modify start (isNum)
			if(!(isNum(document.forms[0].elements[i*7+4].value))|| 
			!(isNum(document.forms[0].elements[i*7+5].value))||
			!(isNum(document.forms[0].elements[i*7+7].value))|| 
			!(isNum(document.forms[0].elements[i*7+8].value)))
			{
				alert("<%tcWebApi_get("String_Entry","PortTriggerJS7Text","s")%>");
				return true;
			}		
			//saffi modify end 

		}
		else
		{
			//saffi add start 
			document.forms[0].elements[i*7+4].value=0;
			document.forms[0].elements[i*7+5].value=0;
			document.forms[0].elements[i*7+7].value=0;
			document.forms[0].elements[i*7+8].value=0;
			//saffi add end 
			continue;
		}
		
		port1 = parseInt(document.forms[0].elements[i*7+4].value);
		port2 = parseInt(document.forms[0].elements[i*7+5].value);
		port3 = parseInt(document.forms[0].elements[i*7+7].value);
		port4 = parseInt(document.forms[0].elements[i*7+8].value);
		
		if (port1 > 65535 || port1 < 1 || port2 > 65535 || port2 < 1 ||
		port3 > 65535 || port3 < 1 || port4 > 65535 || port4 < 1)
		{
			alert("<%tcWebApi_get("String_Entry","PortTriggerJS0Text","s")%>");return true;
		}
		if (port2 < port1 || port4 < port3)
		{
			alert("<%tcWebApi_get("String_Entry","PortTriggerJS1Text","s")%>");return true;
		}
	}
	
	if(!active)
	{
		alert("<%tcWebApi_get("String_Entry","PortTriggerJS2Text","s")%>");
		return true;
	}
	
	if(active > document.forms[0].PortTriggering_CanUseNumFlag.value)
	{
		alert("<%tcWebApi_get("String_Entry","PortTriggerJS3Text","s")%>");
		return true;
	}

	//wang check whether the rules has been repeated in the table
	if(active > 1){
		var j = 0;
		var n = 0;
		for(n = 0; n < 8; n++){
			if(document.forms[0].elements[n*7+3].checked){
				for(j = 0; j < 8; j++){
					if(n==j)
					{ continue;}
					else{
						if((document.forms[0].elements[n*7+4].value == document.forms[0].elements[j*7+4].value)&&
						   (document.forms[0].elements[n*7+5].value == document.forms[0].elements[j*7+5].value)&&
						   (document.forms[0].elements[n*7+6].value == document.forms[0].elements[j*7+6].value)&&
						   (document.forms[0].elements[n*7+7].value == document.forms[0].elements[j*7+7].value)&&
						   (document.forms[0].elements[n*7+8].value == document.forms[0].elements[j*7+8].value)&&
						   (document.forms[0].elements[n*7+9].value == document.forms[0].elements[j*7+9].value)){
						  	 alert("<%tcWebApi_get("String_Entry","PortTriggerJS9Text","s")%>");
								return true;		}
					}
				}
			}
		}
	}
	//wang add end
	return false;
}

function quotationCheck(object, limit_len) 
{
	var len = object.value.length;
	var c;
	var i, j = 0;
	if(!len)
	{
		alert("<%tcWebApi_get("String_Entry","PortTriggerJS4Text","s")%>");
		return true;
	}
	for (i = 0; i < len; i++)
	{
		var c = object.value.charAt(i);
		if (c == '"')
		{
			j += 6;
		}
		else
		{
			j++;	
		}

	}
	
	if (j > limit_len)
	{
		alert('<%tcWebApi_get("String_Entry","PortTriggerJS5Text","s")%>');return true;
	}
	return false;
}

function doSave() 
{
	if (chkPortRange())
		return;
	 if (chkRuleLimit())
	 {
	 	return;
	 }	
	if (quotationCheck(document.forms[0].PortTriggering_Applications, 15) )
		return;
	document.forms[0].PortTriggering_SubmitFlag.value = 1;
	document.forms[0].submit();
}

function doLoad() 
{
	ruleSetting(document.forms[0].PortTriggering_App_idx.selectedIndex);
	return;
}

<% if tcWebApi_get("GUI_Entry0","portTriggering","h") = "support" Then %>  
	function onClickPortTriggeringSummary() {
	window.open("/cgi-bin/adv_nat_porttriggering_list.asp","Port_Triggering_List","toolbar=no,menubar=no,scrollbars=no,height=400, width=650,location=0,left=150,top=150");
	return false;
}
<%End If%>
</SCRIPT>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<BODY onLoad="doLoad();">
<FORM name=PORTTRIGGERING_form method=post>

<table width="760px" border="0"  cellpadding="0" cellspacing="0">
<tr><td height="40px"  colspan="5"></td></tr>
<tr><td width="10">&nbsp; </td>
<td width="150" height="15"></td>
<td  colspan="3" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","PortTriggerText","s")%></td>
</tr>
</table>



<TABLE cellSpacing=0 cellPadding=0 width=760 bgColor=#ffffff border=0>
	<TBODY>
		<TR>
			<TD  width=150 height=1>
			</TD>
			<TD width=10>&nbsp;</TD>
			<TD width=150></TD>
			<TD width=10></TD>
			<TD width=440></TD>
		</TR>
	</TBODY>
</TABLE>

<TABLE cellSpacing=0 cellPadding=0 width=760 bgColor=#ffffff border=0>
	<TBODY>
		<TR>
			<TD class=light-orange width=150>&nbsp;</TD>
			<TD class=light-orange width=10></TD>
			<TD width=10>&nbsp;</TD>
			<TD class=tabdata  width=580>
			<FONT ><%tcWebApi_get("String_Entry","PortTriggerCommnetText","s")%> : 8</TD>
			<TD width=10>&nbsp;</TD>
		</TR>
		<TR>
			<TD class=light-orange>&nbsp;</TD>
			<TD class=light-orange></TD>
			<TD>&nbsp;</TD>
			<TD >
				<TABLE cellSpacing=0 cellPadding=0 width=570 bgColor=#ffffff>
					<TBODY>
						<TR>
							<TD class=tabdata align=left>
								 <%tcWebApi_get("String_Entry","PortTriggerApplicationText","s")%> &nbsp;:&nbsp; 
								<INPUT maxLength=15 size=15 name=PortTriggering_Applications>
								<SELECT onchange=doAppChange(this.selectedIndex) size=1 name=PortTriggering_App_idx>
								<OPTION selected>-
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication0Text","s")%>
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication1Text","s")%>
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication2Text","s")%>
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication3Text","s")%>
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication4Text","s")%>
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication5Text","s")%>
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication6Text","s")%>
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication7Text","s")%>
								<OPTION><%tcWebApi_get("String_Entry","PortTriggerApplication8Text","s")%>
								</OPTION>
								</SELECT>
							</TD>
						</TR>
					</TBODY>
				</TABLE>
			</TD>
			<TD width=10>&nbsp;</TD>
		</TR>
		<TR>
			<TD class=light-orange>&nbsp;</TD>
			<TD class=light-orange></TD>
			<TD>&nbsp;</TD>
			<TD align=middle><INPUT type=hidden value=8 name=PortTriggering_SubmitFlag>
				<TABLE borderColor=#cccccc cellSpacing=0 cellPadding=0 width=570 bgColor=#ffffff border=1>
				<TBODY>
					<TR height=30>
						<TD class=tabdata align=middle><STRONG><%tcWebApi_get("String_Entry","PortTriggerActiveText","s")%></STRONG></TD>
						<TD class=tabdata align=middle colSpan=3><STRONG> <%tcWebApi_get("String_Entry","PortTriggerRangeText","s")%> </STRONG></TD>
						<TD class=tabdata align=middle colSpan=3><STRONG> <%tcWebApi_get("String_Entry","PortTriggerOpeningRangeText","s")%> </STRONG></TD>
					</TR>
					<TR height=30>
						<TD class=tabdata align=middle>&nbsp;</TD>
						<TD class=tabdata align=middle><STRONG> <%tcWebApi_get("String_Entry","PortTriggerStartPort0Text","s")%> </STRONG></TD>
						<TD class=tabdata align=middle><STRONG> <%tcWebApi_get("String_Entry","PortTriggerStartPort1Text","s")%> </STRONG></TD>
						<TD class=tabdata align=middle><STRONG> <%tcWebApi_get("String_Entry","PortTriggerStartPort2Text","s")%> </STRONG></TD>
						<TD class=tabdata align=middle><STRONG> <%tcWebApi_get("String_Entry","PortTriggerStartPort3Text","s")%> </STRONG></TD>
						<TD class=tabdata align=middle><STRONG> <%tcWebApi_get("String_Entry","PortTriggerStartPort4Text","s")%> </STRONG> </TD>
						<TD class=tabdata align=middle><STRONG> <%tcWebApi_get("String_Entry","PortTriggerStartPort5Text","s")%> </STRONG> </TD>
					</TR>
					<TR>
						<TD class=tabdata align=middle>
							<INPUT type=checkbox name=PortTriggeringActive_0>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_StartPort_0>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_EndPort_0>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortTriggering_Protocol_0>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_StartPort_0>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_EndPort_0>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortOpening_Protocol_0>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
					</TR>
					<TR>
						<TD class=tabdata align=middle>
							<INPUT type=checkbox name=PortTriggeringActive_1>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_StartPort_1>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_EndPort_1>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortTriggering_Protocol_1>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_StartPort_1>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_EndPort_1>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortOpening_Protocol_1>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
					</TR>
					<TR>
						<TD class=tabdata align=middle>
							<INPUT type=checkbox name=PortTriggeringActive_2>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_StartPort_2>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_EndPort_2>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortTriggering_Protocol_2>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_StartPort_2>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_EndPort_2>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortOpening_Protocol_2>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
					</TR>
					<TR>
						<TD class=tabdata align=middle>
							<INPUT type=checkbox name=PortTriggeringActive_3>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_StartPort_3>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_EndPort_3>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortTriggering_Protocol_3>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_StartPort_3>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_EndPort_3>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortOpening_Protocol_3>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
					</TR>
					<TR>
						<TD class=tabdata align=middle>
							<INPUT type=checkbox name=PortTriggeringActive_4>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_StartPort_4>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_EndPort_4>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortTriggering_Protocol_4>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_StartPort_4>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_EndPort_4>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortOpening_Protocol_4>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
					</TR>
					<TR>
						<TD class=tabdata align=middle>
							<INPUT type=checkbox name=PortTriggeringActive_5>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_StartPort_5>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_EndPort_5>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortTriggering_Protocol_5>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_StartPort_5>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_EndPort_5>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortOpening_Protocol_5>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
					</TR>
					<TR>
						<TD class=tabdata align=middle>
							<INPUT type=checkbox name=PortTriggeringActive_6>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_StartPort_6>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_EndPort_6>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortTriggering_Protocol_6>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_StartPort_6>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_EndPort_6>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortOpening_Protocol_6>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
					</TR>
					<TR>
						<TD class=tabdata align=middle>
							<INPUT type=checkbox name=PortTriggeringActive_7>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_StartPort_7>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortTriggering_EndPort_7>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortTriggering_Protocol_7>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_StartPort_7>
						</TD>
						<TD class=tabdata align=middle>
							<INPUT maxLength=5 size=5 value=0 name=PortOpening_EndPort_7>
						</TD>
						<TD class=tabdata align=middle>
							<SELECT size=1 name=PortOpening_Protocol_7>
								<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
								<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
								<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
								</OPTION>
							</SELECT>
						</TD>
					</TR>
				</TBODY>
				</TABLE>
			</TD>
			<TD width=10>&nbsp;</TD>
		</TR>
		<TR>
			<TD class=light-orange>&nbsp;</TD>
			<TD class=light-orange></TD>
			<TD>&nbsp;</TD>
			<TD>&nbsp;</TD>
			<TD width=10>&nbsp;</TD>
		</TR>
	</TBODY>
</TABLE>
<TABLE width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
			<TR>
      <TD width="150" height="30" >   
          </TD>
      <TD width="10" class="light-orange">&nbsp;</TD>
			<TD width="150" class="title-sub-center"><%tcWebApi_get("String_Entry","PortTriggerSummaryText","s")%> </TD>
			<TD class="tabdata">				
				<INPUT onclick=onClickPortTriggeringSummary(); type=button value="<%tcWebApi_get("String_Entry","ButtonTriggerSumText","s")%>" name=PortTriggeringSummary>
			</TD></TR>
</TABLE>	
<TABLE cellSpacing=0 cellPadding=0 width=760 bgColor=#ffffff border=0>
	<TBODY>
	<TR>
		<TD width=160 height=42>&nbsp;</TD>
		<TD class=orange width=160>&nbsp;</TD>
		<TD class=orange width=440 style="padding-right:20px;" align="right">
			<INPUT onclick=doSave(); type=button value=<%tcWebApi_get("String_Entry","ButtonSaveText","s")%> name=SaveBtn>
			<INPUT onclick="javascript:window.location='/cgi-bin/adv_nat_top.asp'" type=button value=<%tcWebApi_get("String_Entry","ButtonBackText","s")%> name=BackBtn>
			<input type="reset" name="Reset" value="<%tcWebApi_get("String_Entry","ButtonCancelText","s")%>">
			<input type=hidden value="<%if TCWebAPI_get("portTriggering_setting", "canUseNum", "h") <> "N/A" then TCWebAPI_staticGet("portTriggering_setting", "canUseNum", "s") else asp_Write("8") end if %>" name=PortTriggering_CanUseNumFlag>
		</TD>
	</TR>
<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
	<tr>
	<td align=center colSpan=3><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%></font> </td>
	</tr>
<%end if%>	
	</TBODY>
</TABLE>
<P>&nbsp;</P>
</FORM>
</BODY>
</HTML>
