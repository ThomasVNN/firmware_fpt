<% 
	IF Request_Form("saveFlag") = "1" Then
  		If Request_Form("dmzFlag") = "1" Then
			tcWebApi_set("Dmz_PVC","Active","dmz_active")
			if Request_Form("IPAddFlag")="1" then
				TCWebAPI_set("Dmz_PVC","DMZ_IP","dmzHostIP")
			else
				TCWebAPI_set("Dmz_PVC","DMZ_IP","DMZ_IP_select")
			end if  
			TCWebAPI_commit("Dmz_PVC")		
  		end if
  		
  		If Request_Form("dmzFlag") = "2" Then
			tcWebApi_unset("Dmz_PVC")
			tcWebApi_set("Dmz_PVC","Active","dmzdeactive")
			TCWebAPI_commit("Dmz_PVC")		
  		end if 
	
	  	'tcWebApi_set("NatType_Entry","dmz_edit","dmz_remove")
	  	tcWebApi_set("NatType_Entry","type","NATtyleChange")
	  	TCWebAPI_commit("NatType_Entry")
	End if 
	
	If Request_Form("virsevFlag") = "2" Then
		tcWebApi_set("WebCurSet_Entry","virServ_id","editnum")
		tcWebApi_set("VirServer_PVC_Entry","STARTPORT","start_port1")
		tcWebApi_set("VirServer_PVC_Entry","ENDPORT","end_port1")
		
		tcWebApi_set("VirServer_PVC_Entry","LOCAL_SPORT","local_sport")
		tcWebApi_set("VirServer_PVC_Entry","LOCAL_EPORT","local_eport")
		
		if Request_Form("VirsvrIPAddFlag")="1" then
			TCWebAPI_set("VirServer_PVC_Entry","LOCALIP","Addr1")
		else
			TCWebAPI_set("VirServer_PVC_Entry","LOCALIP","Virsvr_IP_select")
		end if 
		'tcWebApi_set("VirServer_PVC_Entry","Virser_edit","editnum")
		tcWebApi_commit("WebCurSet_Entry")
		tcWebApi_commit("VirServer_PVC_Entry")
	 	tcWebApi_set("NatType_Entry","type","NATtyleChange")
 	 	TCWebAPI_commit("NatType_Entry")
	elseif Request_Form("virsevFlag") = "1" then
	  	tcWebApi_set("WebCurSet_Entry","virServ_id","editnum")
	  	tcWebApi_unset("VirServer_PVC_Entry")
	  	tcWebApi_commit("VirServer_PVC_Entry")
  		tcWebApi_set("NatType_Entry","type","NATtyleChange")
 		TCWebAPI_commit("NatType_Entry")
	End if   
	
	If Request_Form("TrigFlag") = "1" Then
		tcWebApi_set("WebCurSet_Entry","Trig_id","editTrigNum")
		tcWebApi_set("portTriggering_Entry","Name","PortTriggering_Applications")
		tcWebApi_set("portTriggering_Entry","TSPort","Trig_start_port")
		tcWebApi_set("portTriggering_Entry","TEPort","Trig_end_port")
		tcWebApi_set("portTriggering_Entry","TProtocol","Trig_PtclChoose")
		tcWebApi_set("portTriggering_Entry","OSPort","Open_start_port")
		tcWebApi_set("portTriggering_Entry","OEPort","Open_end_port")
		tcWebApi_set("portTriggering_Entry","OProtocol","Open_PtclChange")	
	    'tcWebApi_set("portTriggering_Entry","Trig_edit","editTrigNum")
		tcWebApi_commit("WebCurSet_Entry")
		tcWebApi_commit("portTriggering_Entry")
		tcWebApi_set("NatType_Entry","type","NATtyleChange")
	 	TCWebAPI_commit("NatType_Entry")
	End if   	
	
	if Request_Form("TrigFlag") = "2" Then
		tcWebApi_set("WebCurSet_Entry","Trig_id","editTrigNum")
		tcWebApi_unset("portTriggering_Entry")
	    	tcWebApi_commit("portTriggering_Entry")
	    	tcWebApi_set("NatType_Entry","type","NATtyleChange")
	 	TCWebAPI_commit("NatType_Entry")
	end if
%>			


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/jsl.js"></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<link rel="stylesheet" type="text/css" href="/style.css">

<style  type="text/css">

*{color:  #404040;}

.tabletitlew
{
font:bold 13px Arial,Helvetica,sans-serif;
color:#FFFFFF;
}

</style>

<script language='javascript'>

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

//add for virtual server
function chkRule(){
	

var startP_Value = parseInt(document.NAT_form.start_port1.value);
var endP_value = parseInt(document.NAT_form.end_port1.value);
var localIP_value = document.NAT_form.Addr1.value.split(".");
var edit_id = document.NAT_form.editnum.value;


for(var i=0; i<tableData1.length; i++)
{
	var edit_startP_value = parseInt(tableData1[i][1]);
	var edit_endP_value = parseInt(tableData1[i][2]);
	var edit_localIP_valueTmp = tableData1[i][3];
	var edit_localIP_value = edit_localIP_valueTmp.split(".");

	if((edit_id != i) && (isNaN(edit_startP_value) == 0)){
		if((Number(edit_localIP_value[0]) == Number(localIP_value[0])) && (Number(edit_localIP_value[1]) == Number(localIP_value[1]))&&
	   		(Number(edit_localIP_value[2]) == Number(localIP_value[2])) && (Number(edit_localIP_value[3]) == Number(localIP_value[3]))) 
		{
			if((edit_startP_value == startP_Value) && (edit_endP_value == endP_value))
			{
				alert("<%tcWebApi_get("String_Entry","VirsvrJS2Text","s")%>");
				return true;
			}
		}
		else
		{
			if(!((startP_Value > edit_endP_value) || (endP_value < edit_startP_value)))
			{
				alert("<%tcWebApi_get("String_Entry","VirsvrJS3Text","s")%>");
					return true;
			}
		}
	}
}

	return false;
	
}


function chkPortRange()
{	
	var port = parseInt(document.NAT_form.start_port1.value);
	var port1 = parseInt(document.NAT_form.end_port1.value);
	var port2 = parseInt(document.NAT_form.local_sport.value);
	var port3 = parseInt(document.NAT_form.local_eport.value);
	
	if (port > 65535 || port < 1 || port1 > 65535 || port1< 1 || isNaN(port) || isNaN(port1))
	{	
		alert("<%tcWebApi_get("String_Entry","VirsvrJS0Text","s")%>");
		return true;	
	}
	if (port1 < port)
	{	
		alert("<%tcWebApi_get("String_Entry","VirsvrJS1Text","s")%>");
		return true;
	}

	if(!(isNum(document.NAT_form.start_port1.value) && isNum(document.NAT_form.end_port1.value)))
	{
		alert("<%tcWebApi_get("String_Entry","NatVirsvrtable5Text","s")%>");
		return true;
	}
//cindy add internal port
	if (port2 > 65535 || port2 < 1 || port3 > 65535 || port3< 1 || isNaN(port2) || isNaN(port3))
	{	
		alert("<%tcWebApi_get("String_Entry","VirsvrJS0Text","s")%>");
		return true;	
	}
	if (port3 < port2)
	{	
		alert("<%tcWebApi_get("String_Entry","VirsvrJS1Text","s")%>");
		return true;
	}
	
	if(!(isNum(document.NAT_form.local_sport.value) && isNum(document.NAT_form.local_eport.value)))
	{
		alert("<%tcWebApi_get("String_Entry","NatVirsvrtable5Text","s")%>");
		return true;
	}
//cindy add internal port
	Sports = new Array(10);
	Eports = new Array(10);
	return false;
}

function DeleteVirSer(j){
 	document.NAT_form.editnum.value = j;
	document.NAT_form.virsevFlag.value = 1;
	document.NAT_form.submit();

}


function showTableVir(id,header,data,keyIndex){
	var html = ["<table id=Virser_client_list border=0  cellpadding=1 cellspacing=0>"];
	// 1.generate table header
	html.push("<tr height=30px>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + " align=center class=tabdata>" +"<STRONG><FONT color=#000000>"+ header[i][1] +" </strong>"+ "</td>");
	}
	html.push("</tr>");
 	// 2.generate table data

 	for(var i =0; i<data.length; i++){
	//	alert("i = " + i + "  data[i][keyIndex] = " + data[i][keyIndex]);
		if(data[i][keyIndex] != "N/A" && data[i][keyIndex] != ""){
			html.push("<tr height=30px id=tablebutton>");
			for(var j=0; j<(data[i].length - 1); j++){
				html.push("<td align=center class=topborderstyle>" + data[i][j] + "</td>");
			}
			html.push('<td align=center class=topborderstyle> <INPUT class= "button3" TYPE="button" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" onClick=DeleteVirSer(' + data[i][j] + ');> </td>');

			html.push("</tr>");
		}
	}
	html.push("</table>");
	document.getElementById(id).innerHTML = html.join('');
}

function Add_virtualsvr() 
{
	if (chkPortRange())
		return;
	//gleaf modified begin
	if(document.NAT_form.Virsvr_IP_select[0].selected == true)
	{
		if(inValidIPAddr(document.NAT_form.Addr1.value))
		{
			return;
		}
		else
		{
			document.NAT_form.VirsvrIPAddFlag.value = 1;
		}
	}
	
	/*if (inValidIPAddr(document.forms[0].Addr1.value))
		return;*/
	//gleaf modified end

    for(var i=0; i<tableData1.length; i++){

		var Endport_value = tableData1[i][2];
		if(Endport_value == "N/A")
		{	
			document.NAT_form.editnum.value = i;
			break;
		}
	}

	if(i == 32)
	{
		alert("<%tcWebApi_get("String_Entry","PortTriggerJS8Text","s")%>");
			return true;
	}
	
	if (chkRule())
		return;
	showSpin1();//cindy add 
	document.NAT_form.virsevFlag.value = 2;
	document.NAT_form.submit();
}
//virtual server add end

function showTableDMZ(id,header,data,keyIndex){
	var html = ["<table id=DMZ_client_list width=600 border=0  cellpadding=1 cellspacing=0 >"];
	// 1.generate table header
	html.push("<tr height=30px>");
	for(var i =0; i<header.length; i++){
	   if(i < (header.length - 1))
		 html.push("<td width=" + header[i][0]  + " align=left class=tabdata>" +"<STRONG><FONT color=#000000>" + header[i][1] +" </strong>"+ "</td>");    
       else
         html.push("<td width=" + header[i][0]  + " align=center class=tabdata>" +"<STRONG><FONT color=#000000>" + header[i][1] +" </strong>"+ "</td>");    
	}

	html.push("</tr>");
	// 2.generate table data
 	for(var i =0; i<data.length; i++){
 //	alert("data[i][keyIndex] = " + data[i][keyIndex]);
		if(data[i][keyIndex] != "N/A" && data[i][keyIndex] != "" && data[i][keyIndex] != "0.0.0.0" && data[i][keyIndex] != "0" ){
			html.push("<tr height=30px id=tablebutton>");
			for(var j=0; j<(data[i].length - 1); j++){
				html.push("<td align=left class=topborderstyle>" + data[i][j] + "</td>");
			}
			html.push('<td align=center class=topborderstyle> <INPUT class= "button3" TYPE="button" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" onClick=doDelete();> </td>');
			html.push("</tr>");
		}
	}
	html.push("</table>");
	document.getElementById(id).innerHTML = html.join('');
}

function doDelete()
 {

	document.NAT_form.dmz_remove.value = 0;
 	document.NAT_form.dmzFlag.value = 2;
 	document.NAT_form.saveFlag.value = 1;
	document.NAT_form.submit();
	
}

function doInactive() {
	if(document.NAT_form.dmz_active[0].checked)
	{
		document.getElementById("DMZ_active").style.display="";			
	}
	else
	{
		document.getElementById("DMZ_active").style.display="none";
		document.NAT_form.dmzHostIP.value="0.0.0.0";
	}
}

function ApplyDMZ()
{	
	//gleaf modified begin
        /*if (document.NAT_form.dmz_active[0].checked && 
	inValidIPAddr(document.NAT_form.dmzHostIP.value))
	{		
				return;
	}*/

 	if (document.NAT_form.dmz_active[0].checked)  
	{	
		if(document.NAT_form.DMZ_IP_select[0].selected == true)
		{
			if(inValidIPAddr(document.NAT_form.dmzHostIP.value))
			{
				return;
			}
			else
			{
				document.NAT_form.IPAddFlag.value = 1;
			}
		}		
	}
	//gleaf modified end

	if(document.NAT_form.dmz_active[1].checked)
	{
		document.NAT_form.dmz_remove.value = 0;
	}
	else
	{
		document.NAT_form.dmz_remove.value = 1;
	}
	
	showSpin0();//cindy add 
	document.NAT_form.dmzFlag.value = 1;
	document.NAT_form.saveFlag.value = 1;
	document.NAT_form.submit();
}

function doNATtypeChange()
{	
	if(document.NAT_form.NATtyleChange.selectedIndex == 0)
	{
		 
		document.getElementById("DMZ_selected").style.display="block";
		document.getElementById("virtual_selected").style.display="none";	
		document.getElementById("Triggering_selected").style.display="none";
		doInactive(); 
	}
	else if(document.NAT_form.NATtyleChange.selectedIndex == 1)
	{
		document.getElementById("virtual_selected").style.display="block";	
		document.getElementById("DMZ_selected").style.display="none";
		document.getElementById("Triggering_selected").style.display="none";
		document.NAT_form.start_port1.value = "0";
		document.NAT_form.end_port1.value = "0";
		//cindy add internal port
		document.NAT_form.local_sport.value = "0";
		document.NAT_form.local_eport.value = "0";
		//cindy add for internal port
        document.NAT_form.Addr1.value = "0.0.0.0";
	}
	else
	{
		document.getElementById("Triggering_selected").style.display="block";
		document.getElementById("DMZ_selected").style.display="none";
		document.getElementById("virtual_selected").style.display="none";	
	}
	return;
	
}
/*wang add end DMZ*/

function doload()
{
	//doNATtypeChange();
/*
	if(document.NAT_form.NATtyleChange.selectedIndex == 0)
	{
	    doInactive(); 
	}
*/
	//else if(document.NAT_form.NATtyleChange.selectedIndex == 1)
	 if(document.NAT_form.NATtyleChange.selectedIndex == 1)
	{
		document.NAT_form.start_port1.value = "0";
		document.NAT_form.end_port1.value = "0";
		//cindy add internal port
		document.NAT_form.local_sport.value = "0";
		document.NAT_form.local_eport.value = "0";
		//cindy add for internal port
        document.NAT_form.Addr1.value = "0.0.0.0";
	}
	//else(document.NAT_form.NATtyleChange.selectedIndex == 2)
	else if(document.NAT_form.NATtyleChange.selectedIndex == 2)
	{
		//document.NAT_form.PortTriggering_Applications.value = document.NAT_form.PortTriggering_App_idx.value ;
		
	   //if(document.NAT_form.PortTriggering_App_idx.selectedIndex == 0)
		//{
			document.NAT_form.Trig_start_port.value="0";
			document.NAT_form.Trig_end_port.value="0";
        	document.NAT_form.Open_start_port.value="0";
			document.NAT_form.Open_end_port.value="0";
		//}
	}		
}


//port triggering start
function isNum(num){
      var reNum =/^\+?[1-9][0-9]*$/;
      return (reNum.test(num));
 }
 
function chkTrigPortRange(){

	var  port1 = parseInt(document.NAT_form.Trig_start_port.value);
	var  port2 = parseInt(document.NAT_form.Trig_end_port.value);
	var  port3 = parseInt(document.NAT_form.Open_start_port.value);
	var  port4 = parseInt(document.NAT_form.Open_end_port.value);

	if (port1 > 65535 || port1 < 1 || port2 > 65535 || port2 < 1 || isNaN(port1) || isNaN(port2)||
		port3 > 65535 || port3 < 1 || port4 > 65535 || port4 < 1 || isNaN(port3) || isNaN(port4))
	{	
		alert("<%tcWebApi_get("String_Entry","PortTriggerJS0Text","s")%>");
		return true;	
	}
	if (port2 < port1 || port4 < port3)
	{	
		alert("<%tcWebApi_get("String_Entry","PortTriggerJS1Text","s")%>");
		return true;
	}

	if(!(isNum(document.NAT_form.Trig_start_port.value) && isNum(document.NAT_form.Trig_end_port.value)
	   && isNum(document.NAT_form.Open_start_port.value) && isNum(document.NAT_form.Open_end_port.value)))
	{
		alert("<%tcWebApi_get("String_Entry","PortTriggerJS8Text","s")%>");
		return true;
	}
	
	return false;
}

//wang check whether the rules has been set
function chkTrigRuleLimit(){
	var  edit_Trig_id = document.NAT_form.editTrigNum.value;
	var  Trig_startP_value = parseInt(document.NAT_form.Trig_start_port.value);
	var  Trig_endP_vaule = parseInt(document.NAT_form.Trig_end_port.value);
	var  Trig_Ptcl_value = document.NAT_form.Trig_PtclChoose.value;
	var  Open_startP_value = parseInt(document.NAT_form.Open_start_port.value);
	var  Open_endP_value = parseInt(document.NAT_form.Open_end_port.value);
	var  Open_Ptcl_value = document.NAT_form.Open_PtclChange.value;


	for(var i=0; i<tableData2.length; i++){
		var table_Trig_startP = parseInt(tableData2[i][2]);
		var table_Trig_endP = parseInt(tableData2[i][3]);
		var table_Trig_Ptcl = tableData2[i][4];
		var table_Open_startP = parseInt(tableData2[i][5]);
		var table_Open_endP = parseInt(tableData2[i][6]);
		var table_Open_Ptcl = tableData2[i][7];
		var tcpudp = "TCP/UDP";
		
		if((edit_Trig_id != i) && (isNaN(table_Trig_startP) == 0))
		{
			if((Trig_startP_value == table_Trig_startP) && (Trig_endP_vaule == table_Trig_endP) &&
			   (Open_startP_value == table_Open_startP) && (Open_endP_value == table_Open_endP))
			{
				if((Trig_Ptcl_value == table_Trig_Ptcl) && (Open_Ptcl_value == table_Open_Ptcl))
				{
					alert("<%tcWebApi_get("String_Entry","PortTriggerJS11Text","s")%>");
					return true;
				}
				else if(((table_Trig_Ptcl == tcpudp) && (table_Open_Ptcl == tcpudp))) 
						//((Trig_Ptcl_value == "TCP/UDP") && (table_Open_Ptcl == "TCP/UDP")) ||
						//((Open_Ptcl_value == "TCP/UDP") && (table_Trig_Ptcl == "TCP/UDP")) )
						//((Trig_Ptcl_value == "TCP/UDP") && (Open_Ptcl_value == "TCP/UDP"))) 
				{
					alert("<%tcWebApi_get("String_Entry","PortTriggerJS11Text","s")%>");
					return true;
				}
				else if((table_Trig_Ptcl == tcpudp) && (Open_Ptcl_value != tcpudp))
				{
					if(Open_Ptcl_value == table_Open_Ptcl)
					{
						alert("<%tcWebApi_get("String_Entry","PortTriggerJS11Text","s")%>");
						return true;
					}
				}
				else if((table_Open_Ptcl == tcpudp) && (Trig_Ptcl_value != tcpudp))
				{
					if(Trig_Ptcl_value == table_Trig_Ptcl)
					{
						alert("<%tcWebApi_get("String_Entry","PortTriggerJS11Text","s")%>");
						return true;
					}
				}
				else{
						return false;
				}
			}
		}
	}
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
		alert('<%tcWebApi_get("String_Entry","PortTriggerJS5Text","s")%>');
		return true;
	}
	return false;
}


function showTableTrig(id2,header2,data2,keyIndex2){
	var html = ["<table id=Trig_client_list width=600 border=0  cellpadding=1 cellspacing=0 >"];
	// 1.generate table header2
	html.push("<tr height=30px>");
	for(var i =0; i<header2.length; i++){
		html.push("<td width=" + header2[i][0] + " align=center class=tabdata>" +"<STRONG><FONT color=#000000>" + header2[i][1] +" </strong>"+ "</td>");
	}
	html.push("</tr>");
 	// 2.generate table data
//	alert("data2.length = " + data2.length);
 	for(var i =0; i<data2.length; i++){
	//	alert("i = " + i + "  data2[i][keyIndex2] = " + data2[i][keyIndex2]);
		if(data2[i][keyIndex2] != "N/A" && data2[i][keyIndex2] != ""){
			html.push("<tr height=30px id=tablebutton>");
			for(var j=0; j<(data2[i].length - 1); j++){
				html.push("<td align=center class=topborderstyle>" + data2[i][j] + "</td>");
			}
			html.push('<td align=center class=topborderstyle> <INPUT class= "button3" TYPE="button" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","PortTrigger13Text","s")%>" onClick=DeleteTrig(' + data2[i][j] + ');> </td>');

			html.push("</tr>");
		}
	}
	html.push("</table>");
	document.getElementById(id2).innerHTML = html.join('');
}

function DeleteTrig(j){
 	document.NAT_form.editTrigNum.value = j;
	document.NAT_form.TrigFlag.value = 2;
	document.NAT_form.submit();

}


function addTrigRule(){
	if (chkTrigPortRange())
		return;  

	if (quotationCheck(document.forms[0].PortTriggering_Applications, 15) )
		return;         

	
    for(var i=0; i<tableData2.length; i++){
		var Endport_value = tableData2[i][2];
		if(Endport_value == "N/A")
		{	
			document.NAT_form.editTrigNum.value = i;
			break;
		}
	}

	if(i == 8)
	{
			alert("<%tcWebApi_get("String_Entry","PortTriggerJS12Text","s")%>");
				return true;
	}

	if(chkTrigRuleLimit())
	 	return;
	
	showSpin2();//cindy add 
	document.NAT_form.TrigFlag.value = 1;
	document.NAT_form.submit();
}


/*
function doAppChange(selectIndex) 
{
//	ruleSetting(selectIndex);
   alert("PortTriggering_App_idx =  " + document.NAT_form.PortTriggering_App_idx.selectedIndex);
	document.NAT_form.PortTriggering_Applications.value = document.NAT_form.PortTriggering_App_idx.value ;

	var i = document.NAT_form.PortTriggering_App_idx.selectedIndex ;
	if(i == 0)
	{
		document.getElementById("Customer_setting").style.display="";	
	}
	else
	{
		document.getElementById("Customer_setting").style.display="none";
		//document.NAT_form.dmzHostIP.value="0.0.0.0"
		
	}		
}*/

//port triggering end


//gleaf add begin
function doIPaddressChange()
{
  	if(document.NAT_form.DMZ_IP_select[0].selected == true)
  	{
     		document.getElementById("ManuallyIPAddr").style.display=""; 
     		document.NAT_form.dmzHostIP.disabled = false;
  	}
  	else
	{
     		document.getElementById("ManuallyIPAddr").style.display="none";
  	} 
}

function doIPaddressChange1()
{
  	if(document.NAT_form.Virsvr_IP_select[0].selected == true)
  	{
     		document.getElementById("ManuallyVirsvrIPAddr").style.display=""; 
     		document.NAT_form.virsvrHostIP.disabled = false;
  	}
  	else
	{
     		document.getElementById("ManuallyVirsvrIPAddr").style.display="none";
  	} 
}
//gleaf add end 
</script>
</head>
<body onload=doload()>
<form name="NAT_form" method="post">
<INPUT TYPE="HIDDEN" NAME="natFlag" VALUE="1">
<INPUT TYPE="HIDDEN" NAME="service_num_flag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="dmzFlag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="saveFlag" VALUE="0">
<INPUT TYPE="HIDDEN" NAME="dmzdeactive" VALUE="No">
<INPUT TYPE="HIDDEN" NAME="dmz_remove" VALUE="0">

<div id="pagestyle">
<div id="contenttype">
<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">		
<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","NatTopText","s")%>  </td>
	</tr>
</table>
	
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed">
   <tr height="30px">
   <td align=left class="tabdata" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","NatTop1Text","s")%></td>
   <td align=left class="tabdata">
    <select name="NATtyleChange" size="1" onchange="doNATtypeChange()">
    <option value="0" <% if tcWebApi_get("NatType_Entry","type","h") = "0" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","NatTopDMZText","s")%> 
    <option value="1" <% if tcWebApi_get("NatType_Entry","type","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","NatTopVirtualServerText","s")%> 
	<option value="2" <% if tcWebApi_get("NatType_Entry","type","h") = "2" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","NatTopPortTriggeringText","s")%> 
	</option>
	</select>
   </td>
  </tr>
</table>
</div> <!--end id=block1-->

<% if TCWebAPI_get("NatType_Entry", "type", "h") = "0" then %>
<DIV id="DMZ_selected">
<% else %>
<DIV id="DMZ_selected" style="display:none;">
<% end if %>
<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","NatDMZStateSetText","s")%> </td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >		
	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","NatDMZStateText","s")%></td>
		<td align=left class="tabdata">
           <input name="dmz_active" type="radio" value="Yes" <% if tcWebApi_get("Dmz_PVC","Active","h") = "Yes" then asp_Write("checked") end if %> onClick="doInactive()">
			 <%tcWebApi_get("String_Entry","NatDMZActiveSta0Text","s")%>&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="dmz_active" type="radio" value="No"  <% if tcWebApi_get("Dmz_PVC","Active","h") = "No" then asp_Write("checked") end if %> onClick="doInactive()">    
       		 <%tcWebApi_get("String_Entry","NatDMZActiveSta1Text","s")%>
		</td>
	</tr>
</table>	
</div><!--end id=block2-->

<% if TCWebAPI_get("Dmz_PVC", "Active", "h") = "Yes" then %>
<DIV id="DMZ_active">
<% else %>
<DIV id="DMZ_active" style="display:none;">
<% end if %>
<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","NatDMZSetAHostIPText","s")%> </td>
	</tr>
</table>	

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >		
	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","NatDMZAHostIPText","s")%></td>
		<!--gleaf begin-->
		<!--<td align=left class="tabdata">
			<input type="text" class="uiTextInput"  size="15" maxlength="15" name="dmzHostIP" id="uiViewdmzHostIP" VALUE="<% If tcWebApi_get("Dmz_PVC","DMZ_IP","h") <> "N/A" then  tcWebApi_get("Dmz_PVC","DMZ_IP","s") end if %>">
		</td>-->    
		
		<input type="HIDDEN" name="IPAddFlag" value="0">
		<td align=left class="tabdata">
			<SELECT NAME="DMZ_IP_select" SIZE="1" onchange="doIPaddressChange()">
				<OPTION value="0" selected ><%tcWebApi_get("String_Entry","NatDMZManuallyIPText","s")%>
			        
			       <% if tcwebApi_get("LanHost_Entry0", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry0", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry0", "IP","s")%>
			       <% end if %>
			        
			       <% if tcwebApi_get("LanHost_Entry1", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry1", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry1", "IP","s")%>
				<% end if %>
				
			       <% if tcwebApi_get("LanHost_Entry2", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry2", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry2", "IP","s")%>
			       <% end if %>
			       
			       <% if tcwebApi_get("LanHost_Entry3", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry3", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry3", "IP","s")%>
			       <% end if %>
			       
			       <% if tcwebApi_get("LanHost_Entry4", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry4", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry4", "IP","s")%>
			       <% end if %>
			       
			       <% if tcwebApi_get("LanHost_Entry5", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry5", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry5", "IP","s")%>
			       <% end if %>
			       
			       <% if tcwebApi_get("LanHost_Entry6", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry6", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry6", "IP","s")%>
				<% end if %> 
				
			       <% if tcwebApi_get("LanHost_Entry7", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry7", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry7", "IP","s")%>
			       <% end if %>        
			</SELECT>
		</td>
	</tr>

	<tr id="ManuallyIPAddr" height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;">
			<%tcWebApi_get("String_Entry","NatDMZIPText","s")%> 
		</td>
		<td align=left class="tabdata">
			<input type="text" class="uiTextInput"  size="15" maxlength="15" name="dmzHostIP" id="uiViewdmzHostIP" VALUE="" PLACEHOLDER="0.0.0.0">
		</td>
	</tr>
	<!--gleaf end-->	
</table>
</div><!--end id=block2-->
</DIV>

<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px">		
	<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;">
		 <%tcWebApi_get("String_Entry","NatDMZApply0Text","s")%> </td>
	</tr>
</table>	

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr height="40" id="buttoncolor">
    <td width="250px" align=left class="tabdata" style="padding-left:20px;">
		<INPUT TYPE="button" NAME="ApplyBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","NatDMZApply1Text","s")%>" onClick="ApplyDMZ()">
	</td>
	<td id="firstDiv0" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
	</tr> 
</table>
</div><!--end id=ApplyBtn0-->

<div id="block2">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
    <tr height="25px" style="width:100%;background:#e6e6e6;">
	   <td class="title-main" align=left style="padding-left:20px;"> <%tcWebApi_get("String_Entry","NaTDMZ0Text","s")%> </td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed">
	<tr>
         <td align=left class="tabdata">
         	<div class="configstyle">
			 <div id=DMZconfigration></div>
		</div>
	  </td>
	</tr>
</table>

<script language=JavaScript>
var tableHeader = [
	["200px","<%tcWebApi_get("String_Entry","NatDMZStateText","s")%>"],
	["100px","<%tcWebApi_get("String_Entry","NaTDMZ2Text","s")%>"],
	["300px","<%tcWebApi_get("String_Entry","NaTDMZ3Text","s")%>"]
];


var tableData = [
	["<%tcWebApi_get("String_Entry", "NatDMZActiveSta0Text","s")%>","<%tcWebApi_get("Dmz_PVC", "DMZ_IP","s")%>","0"]
];


showTableDMZ('DMZconfigration',tableHeader,tableData,1);

</script>
</table> 

</div><!--end block2-->
</DIV> <!--end id=DMZ_selected -->


<!-- virtual server start-->
<% if TCWebAPI_get("NatType_Entry", "type", "h") = "1" then %>
<DIV id="virtual_selected">
<% else %>
<DIV id="virtual_selected" style="display:none;">
<% end if %>
<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
	
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","NatVirsvrText","s")%> </td>
	</tr>
</table>	

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >	
	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","NatVirsvrStartPortNumText","s")%></td>
		<td align=left class="tabdata">
			<input type="text" size="5" maxlength="5" name="start_port1" value="<%if tcWebApi_get("VirServer_PVC_Entry","STARTPORT","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","STARTPORT","s") end if%>"  id="uiViewPvcVpi1">       
	</tr>
		<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","NatVirsvrEndPortNumText","s")%></td>
		<td align=left class="tabdata">
			<input type="text" size="5" maxlength="5" value="<%if tcWebApi_get("VirServer_PVC_Entry","ENDPORT","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","ENDPORT","s") end if%>" name="end_port1" id="uiViewPvcVpi2">       
	</tr>
		<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","NatVirsvrLocalIPAddrText","s")%></td>
		<!--gleaf begin-->
		<!--<td align=left class="tabdata">
			<input type="text" class="uiTextInput" size="16" maxlength="15" name="Addr1" id="uiViewIpAddressMark" value="<%if tcWebApi_get("VirServer_PVC_Entry","LOCALIP","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","LOCALIP","s") end if%>">-->
		
		<input type="HIDDEN" name="VirsvrIPAddFlag" value="0">
		<td align=left class="tabdata">
			<SELECT NAME="Virsvr_IP_select" SIZE="1" onchange="doIPaddressChange1()">
				<OPTION value="0" selected ><%tcWebApi_get("String_Entry","NatDMZManuallyIPText","s")%>
			        
			       <% if tcwebApi_get("LanHost_Entry0", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry0", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry0", "IP","s")%>
			       <% end if %>
			        
			       <% if tcwebApi_get("LanHost_Entry1", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry1", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry1", "IP","s")%>
				<% end if %>
				
			       <% if tcwebApi_get("LanHost_Entry2", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry2", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry2", "IP","s")%>
			       <% end if %>
			       
			       <% if tcwebApi_get("LanHost_Entry3", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry3", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry3", "IP","s")%>
			       <% end if %>
			       
			       <% if tcwebApi_get("LanHost_Entry4", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry4", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry4", "IP","s")%>
			       <% end if %>
			       
			       <% if tcwebApi_get("LanHost_Entry5", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry5", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry5", "IP","s")%>
			       <% end if %>
			       
			       <% if tcwebApi_get("LanHost_Entry6", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry6", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry6", "IP","s")%>
				<% end if %> 
				
			       <% if tcwebApi_get("LanHost_Entry7", "IP","h") <> "N/A" then %>
					<OPTION value="<%tcWebApi_staticGet("LanHost_Entry7", "IP","s")%>"><%tcWebApi_staticGet("LanHost_Entry7", "IP","s")%>
			       <% end if %>        
			</SELECT>
		</td>	
	</tr>

	<tr id="ManuallyVirsvrIPAddr" height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;">
			<%tcWebApi_get("String_Entry","NatDMZIPText","s")%> 
		</td>
		<td align=left class="tabdata">
			<input type="text" class="uiTextInput" size="16" maxlength="15" name="Addr1" id="uiViewIpAddressMark" value="" PLACEHOLDER="0.0.0.0">
		</td>
	</tr>

	<!--cindy add start for local port-->	
	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","NatVirsvrStartPortNumLoText","s")%></td>
		<td align=left class="tabdata">
			<input type="text" size="5" maxlength="5" name="local_sport" value="<%if tcWebApi_get("VirServer_PVC_Entry","LOCAL_SPORT","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","LOCAL_SPORT","s") end if%>">       
	</tr>
		<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","NatVirsvrEndPortNumLoText","s")%></td>
		<td align=left class="tabdata">
			<input type="text" size="5" maxlength="5" name="local_eport" value="<%if tcWebApi_get("VirServer_PVC_Entry","LOCAL_EPORT","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","LOCAL_EPORT","s") end if%>">       
	</tr>

	<!--cindy add end for local port-->	
	
	<!--gleaf end-->	
</table>	
</div><!--end id=block2-->

<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">

	<tr height="25px">		
		<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;"> <%tcWebApi_get("String_Entry","NatVirsvrAddruleText","s")%> </td>
	</tr>
</table>	

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
	<tr height="30px" id="buttoncolor">
	<td width="250px" align=left class="tabdata" style="padding-left:20px;">
		<INPUT TYPE="button" NAME="AddBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","NatVirsvrAddBtnText","s")%>" onClick="Add_virtualsvr()">
	</td>
	<td id="firstDiv1" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
	</tr> 
</table>
</div>

<!--virtual server table start-->
<div id="block2" >
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
    <tr height="25px" style="width:100%;background:#e6e6e6;">    <td class="title-main" align=left style="padding-left:20px;">
    <%tcWebApi_get("String_Entry","NatVirsvrServerListingText","s")%></td>
	</tr>
</table>
	
<table width="640" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed">
	<tr>
         <td align=left class="tabdata">
         	<div class="configstyle">
			 <div id=Virserconfigration></div>
		</div>
	  </td>
	</tr>
</table>
	<script language=JavaScript>
var tableHeader1 = [
	["30px","<%tcWebApi_get("String_Entry","NatVirsvrtable0Text","s")%>"],
	["100px","<%tcWebApi_get("String_Entry","NatVirsvrStartPortNumText","s")%>"],
	["100px","<%tcWebApi_get("String_Entry","NatVirsvrEndPortNumText","s")%>"],
	["140px","<%tcWebApi_get("String_Entry","NatVirsvrtable3Text","s")%>"],
	["100px","<%tcWebApi_get("String_Entry","NatVirsvrStartPortNumLoText","s")%>"],
	["100px","<%tcWebApi_get("String_Entry","NatVirsvrEndPortNumLoText","s")%>"],
	["120px","<%tcWebApi_get("String_Entry","NatVirsvrtable4Text","s")%>"]
];

var tableData1 = [
	["1", "<%tcWebApi_get("VirServer_PVC_Entry0", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry0", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry0", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry0", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry0", "LOCAL_EPORT","s")%>","0"],
	["2", "<%tcWebApi_get("VirServer_PVC_Entry1", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry1", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry1", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry1", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry1", "LOCAL_EPORT","s")%>","1"],
	["3", "<%tcWebApi_get("VirServer_PVC_Entry2", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry2", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry2", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry2", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry2", "LOCAL_EPORT","s")%>","2"],
	["4", "<%tcWebApi_get("VirServer_PVC_Entry3", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry3", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry3", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry3", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry3", "LOCAL_EPORT","s")%>","3"],
	["5", "<%tcWebApi_get("VirServer_PVC_Entry4", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry4", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry4", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry4", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry4", "LOCAL_EPORT","s")%>","4"],
	["6", "<%tcWebApi_get("VirServer_PVC_Entry5", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry5", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry5", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry5", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry5", "LOCAL_EPORT","s")%>","5"],
	["7", "<%tcWebApi_get("VirServer_PVC_Entry6", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry6", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry6", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry6", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry6", "LOCAL_EPORT","s")%>","6"],
	["8", "<%tcWebApi_get("VirServer_PVC_Entry7", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry7", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry7", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry7", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry7", "LOCAL_EPORT","s")%>","7"],
	["9", "<%tcWebApi_get("VirServer_PVC_Entry8", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry8", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry8", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry8", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry8", "LOCAL_EPORT","s")%>","8"],
	["10", "<%tcWebApi_get("VirServer_PVC_Entry9", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry9", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry9", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry9", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry9", "LOCAL_EPORT","s")%>","9"],
	["11", "<%tcWebApi_get("VirServer_PVC_Entry10", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry10", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry10", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry10", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry10", "LOCAL_EPORT","s")%>","10"],
	["12", "<%tcWebApi_get("VirServer_PVC_Entry11", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry11", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry11", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry11", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry11", "LOCAL_EPORT","s")%>","11"],
	["13", "<%tcWebApi_get("VirServer_PVC_Entry12", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry12", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry12", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry12", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry12", "LOCAL_EPORT","s")%>","12"],
	["14", "<%tcWebApi_get("VirServer_PVC_Entry13", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry13", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry13", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry13", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry13", "LOCAL_EPORT","s")%>","13"],
	["15", "<%tcWebApi_get("VirServer_PVC_Entry14", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry14", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry14", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry14", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry14", "LOCAL_EPORT","s")%>","14"],
	["16", "<%tcWebApi_get("VirServer_PVC_Entry15", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry15", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry15", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry15", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry15", "LOCAL_EPORT","s")%>","15"],
	["17", "<%tcWebApi_get("VirServer_PVC_Entry16", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry16", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry16", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry16", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry16", "LOCAL_EPORT","s")%>","16"],
	["18", "<%tcWebApi_get("VirServer_PVC_Entry17", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry17", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry17", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry17", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry17", "LOCAL_EPORT","s")%>","17"],
	["19", "<%tcWebApi_get("VirServer_PVC_Entry18", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry18", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry18", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry18", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry18", "LOCAL_EPORT","s")%>","18"],
	["20", "<%tcWebApi_get("VirServer_PVC_Entry19", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry19", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry19", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry19", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry19", "LOCAL_EPORT","s")%>","19"],
	["21", "<%tcWebApi_get("VirServer_PVC_Entry20", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry20", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry20", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry20", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry20", "LOCAL_EPORT","s")%>","20"],
	["22", "<%tcWebApi_get("VirServer_PVC_Entry21", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry21", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry21", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry21", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry21", "LOCAL_EPORT","s")%>","21"],
	["23", "<%tcWebApi_get("VirServer_PVC_Entry22", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry22", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry22", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry22", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry22", "LOCAL_EPORT","s")%>","22"],
	["24", "<%tcWebApi_get("VirServer_PVC_Entry23", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry23", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry23", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry23", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry23", "LOCAL_EPORT","s")%>","23"],
	["25", "<%tcWebApi_get("VirServer_PVC_Entry24", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry24", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry24", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry24", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry24", "LOCAL_EPORT","s")%>","24"],
	["26", "<%tcWebApi_get("VirServer_PVC_Entry25", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry25", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry25", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry25", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry25", "LOCAL_EPORT","s")%>","25"],
	["27", "<%tcWebApi_get("VirServer_PVC_Entry26", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry26", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry26", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry26", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry26", "LOCAL_EPORT","s")%>","26"],
	["28", "<%tcWebApi_get("VirServer_PVC_Entry27", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry27", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry27", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry27", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry27", "LOCAL_EPORT","s")%>","27"],
	["29", "<%tcWebApi_get("VirServer_PVC_Entry28", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry28", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry28", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry28", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry28", "LOCAL_EPORT","s")%>","28"],
	["30", "<%tcWebApi_get("VirServer_PVC_Entry29", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry29", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry29", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry29", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry29", "LOCAL_EPORT","s")%>","29"],
	["31", "<%tcWebApi_get("VirServer_PVC_Entry30", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry30", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry30", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry30", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry30", "LOCAL_EPORT","s")%>","30"],
	["32", "<%tcWebApi_get("VirServer_PVC_Entry31", "STARTPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry31", "ENDPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry31", 
		"LOCALIP","s")%>","<%tcWebApi_get("VirServer_PVC_Entry31", "LOCAL_SPORT","s")%>","<%tcWebApi_get("VirServer_PVC_Entry31", "LOCAL_EPORT","s")%>","31"]
];

showTableVir('Virserconfigration',tableHeader1,tableData1,2);

</script>

</div><!--end class=cfglist-->
<!--virtual server table end-->

</DIV><!--end id=virtual_selected-->

<!--virtual server end-->


<!--Port Triggering  start -->
<% if TCWebAPI_get("NatType_Entry", "type", "h") = "2" then %>
<DIV id= "Triggering_selected">
<% else %>
<DIV id= "Triggering_selected" style="display:none;">
<% end if %>
<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
	
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger0Text","s")%> </td>
	</tr>
</table>	

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >	
  <tr height="30px">
   <td align=left class="tabdata" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger1Text","s")%></td>
   <td align=left class="tabdata">								
								<INPUT maxLength=15 size=15 name=PortTriggering_Applications value="">&nbsp;&nbsp; <%tcWebApi_get("String_Entry","PortTrigger15Text","s")%> 
							<!--	<SELECT onchange=doAppChange(this.selectedIndex) size=1 name=PortTriggering_App_idx>
								<OPTION selected><%tcWebApi_get("String_Entry","PortTrigger14Text","s")%>
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
								</SELECT> -->
	</td>
  </tr>
</table>	
</div><!--end id=block2-->

<div id="Customer_setting">
<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
	
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger2Text","s")%> </td>
	</tr>
</table>	

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >	
	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger4Text","s")%></td>
		<td align=left class="tabdata">
			<input type="text" size="5" maxlength="5" name="Trig_start_port" value="<%if tcWebApi_get("portTriggering_Entry","TSPort","h") <> "N/A" then tcWebApi_get("portTriggering_Entry","TSPort","s") end if%>">       
	</tr>
		<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger5Text","s")%></td>
		<td align=left class="tabdata">
			<input type="text" size="5" maxlength="5" name="Trig_end_port" value="<%if tcWebApi_get("portTriggering_Entry","TEPort","h") <> "N/A" then tcWebApi_get("portTriggering_Entry","TEPort","s") end if%>">       
	</tr>
		<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger6Text","s")%></td>
		<td align=left class="tabdata">
			    <select name="Trig_PtclChoose" size="1" >
   				<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
				<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
				<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
				</OPTION>
		</td>
	</tr>
</table>	
</div><!--end id=block2--> 

<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
	
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger3Text","s")%> </td>
	</tr>
</table>	

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >	
	<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger4Text","s")%></td>
		<td align=left class="tabdata">
			<input type="text" size="5" maxlength="5" name="Open_start_port" value="<%if tcWebApi_get("portTriggering_Entry","OSPort","h") <> "N/A" then tcWebApi_get("portTriggering_Entry","OSPort","s") end if%>">       
	</tr>
		<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger5Text","s")%></td>
		<td align=left class="tabdata">
			<input type="text" size="5" maxlength="5" name="Open_end_port" value="<%if tcWebApi_get("portTriggering_Entry","OEPort","h") <> "N/A" then tcWebApi_get("portTriggering_Entry","OEPort","s") end if%>">       
	</tr>
		<tr height="30px">
		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","PortTrigger6Text","s")%></td>
		<td align=left class="tabdata">
			    <select name="Open_PtclChange" size="1">
   				<OPTION selected value="TCP/UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol0Text","s")%>
				<OPTION value="TCP"><%tcWebApi_get("String_Entry","PortTriggerProtocol1Text","s")%>
				<OPTION value="UDP"><%tcWebApi_get("String_Entry","PortTriggerProtocol2Text","s")%>
				</OPTION>
		</td>
	</tr>
</table>	
</div><!--end id=block2-->
</div><!--end id="Customer_setting" -->

<div id="block1">
<table width="640px" border="0"  cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">

	<tr height="25px">		
		<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;"> <%tcWebApi_get("String_Entry","PortTrigger7Text","s")%> </td>
	</tr>
</table>	

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr height="30px" id="buttoncolor">
	<td width="250px" align=left class="tabdata" style="padding-left:20px;">
		<INPUT TYPE="button" NAME="AddBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","PortTrigger8Text","s")%>" onClick="addTrigRule()">
	</td>
	<td id="firstDiv2" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
	</tr> 
</table>
</div><!--end id="ApplyBtn0"-->

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
	<tr height="25px" style="width:100%;background:#e6e6e6;">	
    <td class="title-main" align=left style="padding-left:20px;">
    <%tcWebApi_get("String_Entry","PortTrigger10Text","s")%></td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
	<tr height="30px">
     <td align=left class="tabdata" width="165px"></td>
     <td align=left class="tabdata" width="200px"><STRONG><FONT color=#000000><%tcWebApi_get("String_Entry","PortTrigger11Text","s")%></STRONG> </td>
     <td align=left class="tabdata" width="180px"><STRONG><FONT color=#000000><%tcWebApi_get("String_Entry","PortTrigger12Text","s")%></STRONG> </td>
     <td align=left class="tabdata" width="115px"></td>
   </tr>
</table>

<table width="600" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed;margin:5px 0;">
	<tr>
         <td align=left class="tabdata">
			 <div id=Virserconfigration></div>
	  </td>
	</tr> 
</table>

<!--Port Triggering list start-->
<div id="block2">
<INPUT TYPE="HIDDEN" NAME="editTrigNum" value="0">
<INPUT TYPE="HIDDEN" NAME="TrigFlag" value="0">
<input type=hidden value="<%if TCWebAPI_get("portTriggering_setting", "canUseNum", "h") <> "N/A" then TCWebAPI_staticGet("portTriggering_setting", "canUseNum", "s") else asp_Write("8") end if %>" name=PortTriggering_CanUseNumFlag>
		
<table width="600" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed">
<INPUT TYPE="HIDDEN" NAME="editnum" value="0">
<INPUT TYPE="HIDDEN" NAME="virsevFlag" VALUE="0">
	<tr>
         <td align=left class="tabdata">
              <div id=porttriggeringCfg></div></td>
  </tr>
 </table>
<script>
var tableHeader2 = [
	["10%","<%tcWebApi_get("String_Entry","NatVirsvrtable0Text","s")%>"],
	["15%","<%tcWebApi_get("String_Entry","PortTrigger1Text","s")%>"],
	["10%","<%tcWebApi_get("String_Entry","PortTrigger4Text","s")%>"],
	["10%","<%tcWebApi_get("String_Entry","PortTrigger5Text","s")%>"],
	["10%","<%tcWebApi_get("String_Entry","PortTrigger6Text","s")%>"],
	["10%","<%tcWebApi_get("String_Entry","PortTrigger4Text","s")%>"],
	["10%","<%tcWebApi_get("String_Entry","PortTrigger5Text","s")%>"],
	["10%","<%tcWebApi_get("String_Entry","PortTrigger6Text","s")%>"],
	["15%","<%tcWebApi_get("String_Entry","PortTrigger9Text","s")%>"]
];

var tableData2 = [
	
	["1", "<%tcWebApi_get("portTriggering_Entry0", "Name","s")%>","<%tcWebApi_get("portTriggering_Entry0", "TSPort","s")%>","<%tcWebApi_get("portTriggering_Entry0", "TEPort","s")%>","<%tcWebApi_get("portTriggering_Entry0", "TProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry0", "OSPort","s")%>","<%tcWebApi_get("portTriggering_Entry0", "OEPort","s")%>","<%tcWebApi_get("portTriggering_Entry0", "OProtocol","s")%>","0"],
	["2", "<%tcWebApi_get("portTriggering_Entry1", "Name","s")%>","<%tcWebApi_get("portTriggering_Entry1", "TSPort","s")%>","<%tcWebApi_get("portTriggering_Entry1", "TEPort","s")%>","<%tcWebApi_get("portTriggering_Entry1", "TProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry1", "OSPort","s")%>","<%tcWebApi_get("portTriggering_Entry1", "OEPort","s")%>","<%tcWebApi_get("portTriggering_Entry1", "OProtocol","s")%>","1"],
	["3", "<%tcWebApi_get("portTriggering_Entry2", "Name","s")%>","<%tcWebApi_get("portTriggering_Entry2", "TSPort","s")%>","<%tcWebApi_get("portTriggering_Entry2", "TEPort","s")%>","<%tcWebApi_get("portTriggering_Entry2", "TProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry2", "OSPort","s")%>","<%tcWebApi_get("portTriggering_Entry2", "OEPort","s")%>","<%tcWebApi_get("portTriggering_Entry2", "OProtocol","s")%>","2"],
	["4", "<%tcWebApi_get("portTriggering_Entry3", "Name","s")%>","<%tcWebApi_get("portTriggering_Entry3", "TSPort","s")%>","<%tcWebApi_get("portTriggering_Entry3", "TEPort","s")%>","<%tcWebApi_get("portTriggering_Entry3", "TProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry3", "OSPort","s")%>","<%tcWebApi_get("portTriggering_Entry3", "OEPort","s")%>","<%tcWebApi_get("portTriggering_Entry3", "OProtocol","s")%>","3"],
	["5", "<%tcWebApi_get("portTriggering_Entry4", "Name","s")%>","<%tcWebApi_get("portTriggering_Entry4", "TSPort","s")%>","<%tcWebApi_get("portTriggering_Entry4", "TEPort","s")%>","<%tcWebApi_get("portTriggering_Entry4", "TProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry4", "OSPort","s")%>","<%tcWebApi_get("portTriggering_Entry4", "OEPort","s")%>","<%tcWebApi_get("portTriggering_Entry4", "OProtocol","s")%>","4"],
	["6", "<%tcWebApi_get("portTriggering_Entry5", "Name","s")%>","<%tcWebApi_get("portTriggering_Entry5", "TSPort","s")%>","<%tcWebApi_get("portTriggering_Entry5", "TEPort","s")%>","<%tcWebApi_get("portTriggering_Entry5", "TProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry5", "OSPort","s")%>","<%tcWebApi_get("portTriggering_Entry5", "OEPort","s")%>","<%tcWebApi_get("portTriggering_Entry5", "OProtocol","s")%>","5"],
	["7", "<%tcWebApi_get("portTriggering_Entry6", "Name","s")%>","<%tcWebApi_get("portTriggering_Entry6", "TSPort","s")%>","<%tcWebApi_get("portTriggering_Entry6", "TEPort","s")%>","<%tcWebApi_get("portTriggering_Entry6", "TProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry6", "OSPort","s")%>","<%tcWebApi_get("portTriggering_Entry6", "OEPort","s")%>","<%tcWebApi_get("portTriggering_Entry6", "OProtocol","s")%>","6"],
	["8", "<%tcWebApi_get("portTriggering_Entry7", "Name","s")%>","<%tcWebApi_get("portTriggering_Entry7", "TSPort","s")%>","<%tcWebApi_get("portTriggering_Entry7", "TEPort","s")%>","<%tcWebApi_get("portTriggering_Entry7", "TProtocol","s")%>","<%tcWebApi_get("portTriggering_Entry7", "OSPort","s")%>","<%tcWebApi_get("portTriggering_Entry7", "OEPort","s")%>","<%tcWebApi_get("portTriggering_Entry7", "OProtocol","s")%>","7"]
];

showTableTrig('porttriggeringCfg',tableHeader2,tableData2,2);

</script>
</div><!--end class="cfglist"-->
</DIV><!--end id=Triggering_selected-->
<!--Port Triggering  end-->

</div><!--end id=contenttype-->
</div><!--end id=pagestyle-->

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
</html>        
