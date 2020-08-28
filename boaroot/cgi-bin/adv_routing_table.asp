<%

	if Request_form("add_num") <> "" then
		tcWebApi_set("WebCurSet_Entry","route_id","add_num")
	end if
	
if Request_form("delnum") <> "" then
		tcWebApi_set("WebCurSet_Entry","route_id","delnum")
		tcWebApi_unset("Route_Entry")
		tcWebApi_commit("Route_Entry")
end if

	if Request_form("EditFlag") = "1" then
		tcWebApi_unset("Route_Entry")
		tcWebApi_commit("Route_Entry")
		tcWebApi_set("Route_Entry","Active","RouteActive")
		tcWebApi_set("Route_Entry","DST_IP","staticDestIP")
		tcWebApi_set("Route_Entry","Sub_mask","staticSubnetMask")
		tcWebApi_set("Route_Entry","User_def","EditFlag")
		if Request_form("Route_PVCGateway") = "Yes" then 
			tcWebApi_set("Route_Entry","Gateway","staticGatewayIP")
		else
			tcWebApi_set("Route_Entry","Device","Route_PVC_Index")
			tcWebApi_set("Route_Entry","PVC_Index","pvc_index")
		end if
		tcWebApi_set("Route_Entry","metric","staticMetric")
		tcWebApi_commit("WebCurSet_Entry")
		tcWebApi_commit("Route_Entry")
	end if
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

</style>

<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->

<SCRIPT language=javascript>

//<%if Request_form("EditFlag") = "1" then%>
//window.location.href = "/cgi-bin/adv_routing_table.asp";
//<%end if%>
<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") = "Yes" then%>
var aryISP = new Array("<% TcWebApi_get("Wan_PVC0","ISP","s")%>", "<% TcWebApi_get("Wan_PVC1","ISP","s")%>", "<% TcWebApi_get("Wan_PVC2","ISP","s")%>", "<% TcWebApi_get("Wan_PVC3","ISP","s")%>", "<% TcWebApi_get("Wan_PVC4","ISP","s")%>", "<% TcWebApi_get("Wan_PVC5","ISP","s")%>", "<% TcWebApi_get("Wan_PVC6","ISP","s")%>", "<% TcWebApi_get("Wan_PVC7","ISP","s")%>");
<%else%>
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
var aryISP = new Array("<% TcWebApi_get("Wan_PVC0","ISP","s")%>","<% TcWebApi_get("Wan_PVC1","ISP","s")%>", "<% TcWebApi_get("Wan_PVC2","ISP","s")%>", "<% TcWebApi_get("Wan_PVC3","ISP","s")%>", "<% TcWebApi_get("Wan_PVC4","ISP","s")%>", "<% TcWebApi_get("Wan_PVC5","ISP","s")%>", "<% TcWebApi_get("Wan_PVC6","ISP","s")%>", "<% TcWebApi_get("Wan_PVC7","ISP","s")%>","<% TcWebApi_get("WanExt_PVC8e0","ISP","s")%>","<% TcWebApi_get("WanExt_PVC8e1","ISP","s")%>","<% TcWebApi_get("WanExt_PVC8e2","ISP","s")%>","<% TcWebApi_get("WanExt_PVC8e3","ISP","s")%>","<% TcWebApi_get("WanExt_PVC8e4","ISP","s")%>","<% TcWebApi_get("WanExt_PVC8e5","ISP","s")%>","<% TcWebApi_get("WanExt_PVC8e6","ISP","s")%>","<% TcWebApi_get("WanExt_PVC8e7","ISP","s")%>","<% TcWebApi_get("WanExt_PVC9e0","ISP","s")%>","<% TcWebApi_get("WanExt_PVC9e1","ISP","s")%>","<% TcWebApi_get("WanExt_PVC9e2","ISP","s")%>","<% TcWebApi_get("WanExt_PVC9e3","ISP","s")%>","<% TcWebApi_get("WanExt_PVC9e4","ISP","s")%>","<% TcWebApi_get("WanExt_PVC9e5","ISP","s")%>","<% TcWebApi_get("WanExt_PVC9e6","ISP","s")%>","<% TcWebApi_get("WanExt_PVC9e7","ISP","s")%>","<% TcWebApi_get("WanExt_PVC10e0","ISP","s")%>","<% TcWebApi_get("WanExt_PVC10e1","ISP","s")%>","<% TcWebApi_get("WanExt_PVC10e2","ISP","s")%>","<% TcWebApi_get("WanExt_PVC10e3","ISP","s")%>","<% TcWebApi_get("WanExt_PVC10e4","ISP","s")%>","<% TcWebApi_get("WanExt_PVC10e5","ISP","s")%>","<% TcWebApi_get("WanExt_PVC10e6","ISP","s")%>","<% TcWebApi_get("WanExt_PVC10e7","ISP","s")%>");
<%else%>
var aryISP = new Array("<% TcWebApi_get("Wan_PVC0","ISP","s")%>","<% TcWebApi_get("Wan_PVC1","ISP","s")%>", "<% TcWebApi_get("Wan_PVC2","ISP","s")%>", "<% TcWebApi_get("Wan_PVC3","ISP","s")%>", "<% TcWebApi_get("Wan_PVC4","ISP","s")%>", "<% TcWebApi_get("Wan_PVC5","ISP","s")%>", "<% TcWebApi_get("Wan_PVC6","ISP","s")%>", "<% TcWebApi_get("Wan_PVC7","ISP","s")%>","<% TcWebApi_get("Wan_PVC8","ISP","s")%>","<% TcWebApi_get("Wan_PVC9","ISP","s")%>","<% TcWebApi_get("Wan_PVC10","ISP","s")%>");
<%end if%>
<%end if%>

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

function doGatewayCheck()
{
   	if (document.forms[0].Route_PVCGateway[0].checked == true){
        document.forms[0].staticGatewayIP.disabled = false;
		    document.forms[0].Route_PVC_Index.disabled = true;
	}
	else{
	    document.forms[0].staticGatewayIP.disabled = true;
		  document.forms[0].Route_PVC_Index.disabled = false;
		  document.forms[0].Route_PVC_Index.options.selectedIndex = "<% tcWebApi_get("Route_Entry","PVC_Index","s") %>";
		  
   }
}	

function isValidIpAddrRoute(ip1,ip2,ip3,ip4) {
    if(ip1==0 || ip4==255 || ip1==127 )
        return false;

    return true;
}

function valDoValidateIPRoute(Address) {
    var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
    var digits;
    var i;
    var error=null;

    if(address == null) {
        alert('<%tcWebApi_get("String_Entry","StaticRouteJS0Text","s")%>');
        error="Invalid destination IP address";
        return false;
    }
    else {
        digits = address[0].split(".");
        for(i=0; i < 4; i++) {
            if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223) || (digits[i] == null)) {
                alert('<%tcWebApi_get("String_Entry","StaticRouteJS0Text","s")%>');
              	error="Invalid IP address";
              	return false;
              	break;
            }
        }

        if((Number(digits[0])==0) && (Number(digits[1])==0) && (Number(digits[2])==0) && (Number(digits[3])==0))
        {
              	alert("<%tcWebApi_get("String_Entry","StaticRouteJS1Text","s")%>"+Address);
              	return false;
        }

        if(!isValidIpAddrRoute(digits[0],digits[1],digits[2],digits[3],false)) {
         	alert('<%tcWebApi_get("String_Entry","StaticRouteJS0Text","s")%>');
        	return false;
        }
    }
    return error;
}

function IPCheckRoute(address) {
    var message;
    if (address.value != "N/A") {
        message = valDoValidateIPRoute(address.value);
        if(message!=null) {
            address.focus();
            return false;
        }
   }
   return true;
}

function isValidIpAddr(ip1,ip2,ip3,ip4) {
    if(ip1==0 || ip4==0 || ip4==255 || ip1==127 )
        return false;

    return true;
}

function valDoValidateIP(Address) {
    var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
    var digits;
    var i;
    var error=null;

    if(address == null) {
        alert('<%tcWebApi_get("String_Entry","StaticRouteJS2Text","s")%>');
        error="Invalid IP address";
        return false;
    }
    else {
        digits = address[0].split(".");
        for(i=0; i < 4; i++) {
            if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223)) {
                alert('<%tcWebApi_get("String_Entry","StaticRouteJS2Text","s")%>');
              	error="Invalid IP address";
              	return false;
              	break;
            }
        }

        if((Number(digits[0])==1) && (Number(digits[1])==0) && (Number(digits[2])==0) && (Number(digits[3])==0))
            return error;

        if(!isValidIpAddr(digits[0],digits[1],digits[2],digits[3],false)) {
            alert('<%tcWebApi_get("String_Entry","StaticRouteJS2Text","s")%>');
        	return false;
        }
    }
    return error;
}

function IPCheck(address) {
    var message;
    if (address.value != "N/A") {
        message = valDoValidateIP(address.value);
        if(message!=null) {
     	    address.focus();
     	    return false;
        }
    }
    return true;
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


function metricCheck() {

	var value = document.forms[0].staticMetric.value;

	if (!isNumeric(value)) {
		alert("<%tcWebApi_get("String_Entry","StaticRouteJS3Text","s")%>");
		return true;
	}

	if (value < 0 || value > 15) {
		alert("<%tcWebApi_get("String_Entry","StaticRouteJS4Text","s")%>");
		return true;
	}

	return false;
}

function trans_to_realindex(now_index) {
	var pvc = now_index;
	var hasAtm=0, hasPtm=0, hasWan0=0, hasPon=0;

<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
	hasAtm = 1;
<%end if%>
<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
	hasPtm = 1;
<%end if%>
<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
	hasWan0 = 1;
<%end if%>
<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then%>
	hasPon = 1;
<%end if%>

	if(hasAtm==1 && hasPtm==0 && hasWan0==1){
		//AtmEther, no Ptm
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
		if(pvc>=8)
			pvc+=16;
<%else%>
		if(pvc==8) //ether
			pvc = 10;
<%end if%>			
	}

	if(hasAtm==0 && hasPtm==1 && hasWan0==1){
		//PtmEther, no Atm
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
		pvc += 8;
<%else%>
		if(pvc==0) //ptm0
			pvc = 8;
		else if(pvc==1) //ptm1
			pvc = 9;
		else if(pvc==2) //ether
			pvc = 10;
<%end if%>		
		}

	if(hasAtm==0 && hasPtm==1 && hasWan0==0){
		//Ptm, no AtmEther
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
		pvc += 8;
<%else%>
		if(pvc==0) //ptm0
			pvc = 8;
		else if(pvc==1) //ptm1
			pvc = 9;
<%end if%>			
	}

	if(hasAtm==0 && hasPtm==0 && hasWan0==1){
		//Ether, no AtmPtm
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
		pvc += 24;
<%else%>
		if(pvc==0) //ether
			pvc = 10;
<%end if%>
		}
	if(hasAtm==1 && hasPtm==1 && hasWan0==1){
	//Ether,Atm,Ptm
	<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
	  if(pvc>=16)
			pvc += 24;
	<%else%>
			if(pvc==9) //ether
				pvc = 10;
	<%end if%>
	}
	if (hasPon==1){
		// Fiber
		pvc = now_index;
	}
	return pvc;
}

function SubnetCheckRouter(mask,IPAddr) {
//cindy modify start
	mask=document.RoutingTable_form.staticSubnetMask;
	IPAddr=document.RoutingTable_form.staticDestIP;
	var v=mask.value;
	var addr = IPAddr.value.split(".");
	var digits = v.split(".");
	if ( !((v == "128.0.0.0")||
		(v == "192.0.0.0")||
		(v == "224.0.0.0")||
		(v == "240.0.0.0")||
		(v == "248.0.0.0")||
		(v == "252.0.0.0")||
		(v == "254.0.0.0")||
		(v == "255.0.0.0")||
		(v == "255.128.0.0")||
		(v == "255.192.0.0")||
		(v == "255.224.0.0")||
		(v == "255.240.0.0")||
		(v == "255.248.0.0")||
		(v == "255.252.0.0")||
		(v == "255.254.0.0")||
		(v == "255.255.0.0")||
		(v == "255.255.128.0")||
		(v == "255.255.192.0")||
		(v == "255.255.224.0")||
		(v == "255.255.240.0")||
		(v == "255.255.248.0")||
		(v == "255.255.252.0")||
		(v == "255.255.254.0")||
		(v == "255.255.255.0")||
		(v == "255.255.255.128")||
		(v == "255.255.255.192")||
		(v == "255.255.255.224")||
		(v == "255.255.255.240")||
		(v == "255.255.255.248")||
		(v == "255.255.255.252")||
		(v == "255.255.255.254")||
		(v == "255.255.255.255")) )
	{
		alert("<%tcWebApi_get("String_Entry","JSSubMaskInvalid","s")%>");
		mask.focus();
		v = "0.0.0.0";
		return false;
	}
	
	//cindy add start 
	if((Number(addr[3])==0)&&(Number(digits[3])==255))
	{
		alert("<%tcWebApi_get("String_Entry","JSSubMaskInvalid","s")%>");
		return false;
	}
//cindy modify end
	return true;
}

var routecount = 16;
function stStaticRoute(domain,DestIPAddress)
{
	this.domain = domain;
	this.DestIPAddress = DestIPAddress;
}
function getStaticRouteInfo()
{
	var	nCurTemp = 0;
	var	vDestIPAddress = new Array(routecount);
	var	vcurLinks = new Array(routecount);
	
	vDestIPAddress[0] = "<% tcWebApi_get("Route_Entry0","DST_IP","s") %>";
	vDestIPAddress[1] = "<% tcWebApi_get("Route_Entry1","DST_IP","s") %>";
	vDestIPAddress[2] = "<% tcWebApi_get("Route_Entry2","DST_IP","s") %>";
	vDestIPAddress[3] = "<% tcWebApi_get("Route_Entry3","DST_IP","s") %>";
	vDestIPAddress[4] = "<% tcWebApi_get("Route_Entry4","DST_IP","s") %>";
	vDestIPAddress[5] = "<% tcWebApi_get("Route_Entry5","DST_IP","s") %>";
	vDestIPAddress[6] = "<% tcWebApi_get("Route_Entry6","DST_IP","s") %>";
	vDestIPAddress[7] = "<% tcWebApi_get("Route_Entry7","DST_IP","s") %>";
	vDestIPAddress[8] = "<% tcWebApi_get("Route_Entry8","DST_IP","s") %>";
	vDestIPAddress[9] = "<% tcWebApi_get("Route_Entry9","DST_IP","s") %>";
	vDestIPAddress[10] = "<% tcWebApi_get("Route_Entry10","DST_IP","s") %>";
	vDestIPAddress[11] = "<% tcWebApi_get("Route_Entry11","DST_IP","s") %>";
	vDestIPAddress[12] = "<% tcWebApi_get("Route_Entry12","DST_IP","s") %>";
	vDestIPAddress[13] = "<% tcWebApi_get("Route_Entry13","DST_IP","s") %>";
	vDestIPAddress[14] = "<% tcWebApi_get("Route_Entry14","DST_IP","s") %>";
	vDestIPAddress[15] = "<% tcWebApi_get("Route_Entry15","DST_IP","s") %>";
	
	for(var i=0; i<routecount; i++)
	{
		if(vDestIPAddress[i] != "N/A")
			vcurLinks[nCurTemp++] = new stStaticRoute(i, vDestIPAddress[i]);
	}
	var	vObjRet = new Array(nCurTemp+1);
	for(var m=0; m<nCurTemp; m++)
	{
		vObjRet[m] = vcurLinks[m];
	}
	vObjRet[nCurTemp] = null;
	return vObjRet;
}
var StaticRouteInfo = getStaticRouteInfo();

function doSubmit(index) {
	if(document.RoutingTable_form.user_def_num.value>=16){
		alert("<%tcWebApi_get("String_Entry","RoutingTableJS0Text","s")%>");
		return false;
	}
	var pvc= document.forms[0].Route_PVC_Index.options.selectedIndex;
	var mask = document.forms[0].staticSubnetMask;
	var destIP = document.forms[0].staticDestIP;

//	document.forms[0].EditFlag.value=index;
	document.forms[0].RouteActive.value="Yes";

	if(index)
	{
	
	//	var strdstIPtmp = "<% tcWebApi_get("Route_Entry","DST_IP","s") %>";
		var stripvalue = document.forms[0].staticDestIP.value;
	//	if ((strdstIPtmp == "N/A") || ((strdstIPtmp != "N/A") && (stripvalue != strdstIPtmp))) {
			for (i = 0; i < StaticRouteInfo.length - 1; i++)
			{
				if (StaticRouteInfo[i].DestIPAddress == stripvalue)
				{
					alert(stripvalue + '<%tcWebApi_get("String_Entry","StaticRouteJS7Text","s")%>');
					return false;
				}
			}
		//}
		
		if (metricCheck()) return false;
		if(!IPCheckRoute(document.forms[0].staticDestIP)) return false;
		if (document.forms[0].Route_PVCGateway[0].checked)
			if(!IPCheck(document.forms[0].staticGatewayIP)) return false;

		if (document.forms[0].Route_PVCGateway[1].checked) {	
<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") = "Yes" then%>			
			var strpvc = document.forms[0].Route_PVC_Index.value;
			var strisptmp = aryISP[parseInt(strpvc.charAt(3))];
<%else%>
			var strpvc = trans_to_realindex(document.forms[0].Route_PVC_Index.options.selectedIndex);
			document.forms[0].pvc_index.value = strpvc;
			var strisptmp = aryISP[strpvc];
<%end if%>
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
			if (strpvc >= 8){
				if ((strisptmp == "0") || (strisptmp == "1")){
					alert("<%tcWebApi_get("String_Entry","StaticRouteMerServiceText","s")%>");
					return false;
				}
				else if((strisptmp == "3") || (strisptmp == "N/A")){
					alert("<%tcWebApi_get("String_Entry","StaticRouteBridgeServiceText","s")%>");
					return false;
				}
			} else {
<%end if%>
			if ((strisptmp == "0") || (strisptmp == "1")){
				alert("<%tcWebApi_get("String_Entry","StaticRouteMerText","s")%>");
				return false;
			}
			else if(strisptmp == "3") {
				alert("<%tcWebApi_get("String_Entry","StaticRouteBridgeText","s")%>");
				return false;
			}
			
<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
			}	
<%end if%>			

		}
		if(!SubnetCheckRouter(mask,destIP))
		{ 
			return false;
		}
		if((destIP.value != "0.0.0.0") && (mask.value == "0.0.0.0") ){
			alert("<%tcWebApi_get("String_Entry","JSSubMaskInvalid","s")%>");
			document.forms[0].staticSubnetMask.focus();
			return false;
		}
		
	}
	showSpin();//cindy add 
	document.forms[0].EditFlag.value=index;
	document.forms[0].submit();	
}
function changePVC(theselect)
{
	var pvc = trans_to_realindex(document.forms[0].Route_PVC_Index.options.selectedIndex);

	document.forms[0].pvc_index_num.value = pvc;
}

function doUserDefNumCheck(){
	if(document.RoutingTable_form.user_def_num.value>=16){
		alert("<%tcWebApi_get("String_Entry","RoutingTableJS0Text","s")%>");
		return false;
	}
//	window.location='/cgi-bin/adv_static_route.asp?add_num='+document.RoutingTable_form.add_num.value
	
	return true;
}
function doDelete(i)
 {
 	
 	document.RoutingTable_form.delnum.value=i;
	document.RoutingTable_form.submit();
}
//amy removed 2017-12-23.
/*
function doedit(i)
 {
 	document.RoutingTable_form.action="/cgi-bin/adv_static_route.asp";
	document.RoutingTable_form.editnum.value=i;
	document.RoutingTable_form.submit();
}
*/
</SCRIPT>

</head><body onLoad="doGatewayCheck();">
<FORM METHOD="POST" ACTION="/cgi-bin/adv_routing_table.asp" name="RoutingTable_form">
<div id="pagestyle"><!--cindy add for border 11/28-->
<div id="contenttype">
<INPUT type="hidden" name="Route_num" value="<%TcWebApi_get("Route","Route_num","s")%>">
<INPUT TYPE="HIDDEN" NAME="delnum">
<!--amy removed edit
<INPUT TYPE="HIDDEN" NAME="editnum">
-->
<INPUT TYPE="HIDDEN" NAME="user_def_num" value="<%TcWebApi_get("Route","User_def_num","s")%>">
<INPUT TYPE="HIDDEN" NAME="add_num" value="<%TcWebApi_get("Route","add_num","s")%>">
<!--add hidden typefrom static_route.asp start-->
<INPUT TYPE="HIDDEN" NAME="User_def" value="1">
<!--amy removed
<INPUT TYPE="HIDDEN" NAME="editnum">
<INPUT TYPE="HIDDEN" NAME="Route_num">
<INPUT TYPE="HIDDEN" NAME="add_num">
-->
<INPUT TYPE="HIDDEN" NAME="RouteActive" value="Yes">
<INPUT TYPE="HIDDEN" NAME="pvc_index_num" value="0">
<INPUT TYPE="HIDDEN" NAME="pvc_index" value="0">
<!--add hidden type from staic_route.asp end-->

	<div id="block1">
		<table width="640px" border="0"  cellpadding="0" cellspacing="0" class="tabdata"  style="margin:5px 0px;">
		<tr height="25px" class="bgcolor">
			<td align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","StaticRouteText","s")%></td>
		</tr>
		</table>
		<table width="640px" border="0"  cellpadding="0" cellspacing="0" class="tabdata" >
		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","StaticRouteDestIPText","s")%></td>
			<td align=left class="tabdata">
				<INPUT maxLength=16 size=16 value="0.0.0.0"  name="staticDestIP"> 
			</td>
		</tr>

		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","StaticRouteDestMaskText","s")%></td>
			<td align=left class="tabdata">
				<INPUT maxLength=16 size=16 value="0.0.0.0" name="staticSubnetMask"> 
			</td>
		</tr>

		<tr height="30px">
			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","StaticRouteGatewayIPText","s")%></td>
			<td align=left class="tabdata">
    				<INPUT onclick=doGatewayCheck() type=radio value="Yes" <%If TcWebApi_get("Route_Entry","Gateway","h") <> "N/A" then asp_Write("checked")  end if%> name="Route_PVCGateway">
    				<INPUT maxLength=16 size=16 value="0.0.0.0" name="staticGatewayIP">
    				<INPUT onclick=doGatewayCheck() type=radio value="No" <%If TcWebApi_get("Route_Entry","Gateway","h") = "N/A" then asp_Write("checked")  end if%> name="Route_PVCGateway">
    					<SELECT NAME="Route_PVC_Index" SIZE="1" onChange="changePVC()">

					<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") = "Yes" then%>
					    <option value="PVC0"><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
							<!--wang only use one wan port 20190927
							<option value="PVC1"><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
							<option value="PVC2"><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
							<option value="PVC3"><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
							<!--wang
							<option value="PVC4"><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
							<option value="PVC5"><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
							<option value="PVC6"><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
							<option value="PVC7"><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
							-->
					<%else%>
							<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then%>
							    	<option value="PVC0"><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
									<!--wang only use one wan port 20190927
									<option value="PVC1"><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
									<option value="PVC2"><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
									<option value="PVC3"><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
									<!--
									<option value="PVC4"><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
									<option value="PVC5"><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
									<option value="PVC6"><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
									<option value="PVC7"><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
    		-->
							<%else%>
								<%if tcWebApi_get("WebCustom_Entry","haveAtm","h") = "Yes" then%>
								    	<option value="PVC0"><%tcWebApi_get("String_Entry","StaticRoutePVC0Text","s")%>
										<!--wang only use one wan port 20190927
										<option value="PVC1"><%tcWebApi_get("String_Entry","StaticRoutePVC1Text","s")%>
										<option value="PVC2"><%tcWebApi_get("String_Entry","StaticRoutePVC2Text","s")%>
										<option value="PVC3"><%tcWebApi_get("String_Entry","StaticRoutePVC3Text","s")%>
										<!--wang
										<option value="PVC4"><%tcWebApi_get("String_Entry","StaticRoutePVC4Text","s")%>
										<option value="PVC5"><%tcWebApi_get("String_Entry","StaticRoutePVC5Text","s")%>
										<option value="PVC6"><%tcWebApi_get("String_Entry","StaticRoutePVC6Text","s")%>
										<option value="PVC7"><%tcWebApi_get("String_Entry","StaticRoutePVC7Text","s")%>
										-->
								<%end if%>
								<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
									<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
										<option value="PVC8e0" <%if Request_form("pvc_index_num") = "8" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Serv0Text","s")%>
										<option value="PVC8e1" <%if Request_form("pvc_index_num") = "9" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Serv1Text","s")%>
										<option value="PVC8e2" <%if Request_form("pvc_index_num") = "10" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Serv2Text","s")%>
										<option value="PVC8e3" <%if Request_form("pvc_index_num") = "11" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Serv3Text","s")%>
										<option value="PVC8e4" <%if Request_form("pvc_index_num") = "12" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Serv4Text","s")%>
										<option value="PVC8e5" <%if Request_form("pvc_index_num") = "13" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Serv5Text","s")%>
										<option value="PVC8e6" <%if Request_form("pvc_index_num") = "14" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Serv6Text","s")%>
										<option value="PVC8e7" <%if Request_form("pvc_index_num") = "15" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Serv7Text","s")%>
									<%end if%>
									<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
										<option value="PVC10e0" <%if Request_form("pvc_index_num") = "24" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Serv0Text","s")%>
										<option value="PVC10e1" <%if Request_form("pvc_index_num") = "25" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Serv1Text","s")%>
										<option value="PVC10e2" <%if Request_form("pvc_index_num") = "26" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Serv2Text","s")%>
										<option value="PVC10e3" <%if Request_form("pvc_index_num") = "27" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Serv3Text","s")%>
										<option value="PVC10e4" <%if Request_form("pvc_index_num") = "28" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Serv4Text","s")%>
										<option value="PVC10e5" <%if Request_form("pvc_index_num") = "29" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Serv5Text","s")%>
										<option value="PVC10e6" <%if Request_form("pvc_index_num") = "30" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Serv6Text","s")%>
										<option value="PVC10e7" <%if Request_form("pvc_index_num") = "31" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Serv7Text","s")%>
									<%end if%>

								<%else%>
									<%if tcWebApi_get("WebCustom_Entry","havePtm","h") = "Yes" then%>
										<option value="PVC8" <%if Request_form("pvc_index_num") = "8" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC8Text","s")%>
									<%end if%>
									<%if tcWebApi_get("WebCustom_Entry","haveWan0","h") = "Yes" then%>
										<option value="PVC10" <%if Request_form("pvc_index_num") = "10" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","StaticRoutePVC10Text","s")%>
									<%end if%>
								<%end if%>
							<%end if%>
					<%end if%>
    				</SELECT> 
				</td>
			</tr>

			<tr height="30px">
				<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","StaticRouteMetricText","s")%></td>
				<td align=left class="tabdata">
					<INPUT maxLength=5 size=3 value="0" name="staticMetric">  
				</td>
			</tr>
		</table>
	</div>

	<div id="block1">
			<table width="640px" border="0"  cellpadding="0" cellspacing="0" class="tabdata" style="margin:5px 0px;">
			<tr height="25px">
				<td align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","RoutingAddText","s")%></td>
			</tr>
			</table>
			<table width="640px" border="0"  cellpadding="0" cellspacing="0" class="tabdata">
			<tr height="40px" id="buttoncolor">
				<td colspan="2" align=left class="tabdata" style="padding-left:20px;">
				<INPUT type="hidden" value="0" name="EditFlag"> 
				<input name="AddRoute" type="button" class="button1" value="<%tcWebApi_get("String_Entry","ButtonAddRouteText","s")%>" onClick="doSubmit(1)">
				</td>
				<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
  			</tr>
			</table>
	</div>
	
	<div id="block1">
		<table width="640px" border="0"  cellpadding="0" cellspacing="0" class="tabdata" style="margin:5px 0px;">
			<tr height="25px" class="bgcolor">
				<td align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","RoutingTableText","s")%></td> 
			</tr>
		</table>
		<table width="600px" border="0"  cellpadding="0" cellspacing="0"  >
		
  			<tr>
  				<td>
  					<div class="configstyle">
       				<table width="600"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC"  >
				<tr  bgcolor=#FFFFFF height=35><td width="40" align=center class="tabdata" ><strong><%tcWebApi_get("String_Entry","RTCgiIndexText","s")%></strong></td>
					<td width="100" align=center class="tabdata"><strong> <%tcWebApi_get("String_Entry","RTCgiDestIPText","s")%> </strong></td>
					<td width="100" align=center class="tabdata"><strong> <%tcWebApi_get("String_Entry","RTCgiMaskText","s")%></strong> </td>
					<td width="100" align=center class="tabdata"><strong> <%tcWebApi_get("String_Entry","RTCgiGatewayIPText","s")%></strong> </td>
					<td width="60"  align=center class="tabdata" ><strong> <%tcWebApi_get("String_Entry","RTCgiMetricText","s")%></strong> </td>
					<td width="60" align=center class="tabdata"> <strong><%tcWebApi_get("String_Entry","RTCgiDeviceText","s")%></strong> </td>
					<td width="80" align=center class="tabdata"><strong> <%tcWebApi_get("String_Entry","RTCgiEditext","s")%></strong> </td>
					<!--amy removed
					<td align=center class="tablelisttitle"><%tcWebApi_get("String_Entry","RTCgiDropext","s")%> </td>
					-->
		</tr>
		<%if tcWebApi_get("GUITemp_Entry0","routeTRLine","h") <> "" then%>

				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry0","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry0","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry0","Metric_Use","s") %>
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry0","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(0);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry0","Drop","s") %></td>
						-->
			</tr>

		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry1","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry1","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry1","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry1","Metric_Use","s") %>
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry1","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(1);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry1","Drop","s") %></td>
						-->
			</tr>

		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry2","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry2","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry2","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry2","Metric_Use","s") %>
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry2","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(2);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry2","Drop","s") %></td>
						-->
			</tr>

		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry3","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry3","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry3","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry3","Metric_Use","s") %>
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry3","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(3);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry3","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry4","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry4","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry4","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry4","Metric_Use","s") %>
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry4","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(4);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry4","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry5","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry5","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry5","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry5","Metric_Use","s") %>
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry5","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(5);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry5","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry6","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry6","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry6","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry6","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry6","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(6);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry6","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry7","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry7","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry7","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry7","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry7","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(7);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry7","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry8","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry8","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry8","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry8","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry8","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(8);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry8","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry9","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry9","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry9","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry9","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry9","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(9);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry9","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry10","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry10","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry10","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry10","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry10","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(10);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry10","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry11","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry11","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry11","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry11","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry11","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(11);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry11","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry12","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry12","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry12","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry12","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry12","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(12);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry12","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry13","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry13","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry13","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry13","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry13","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(13);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry13","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry14","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry14","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry14","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry14","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry14","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(14);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry14","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry15","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry15","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry15","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry15","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry15","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(15);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry15","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry16","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry16","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry16","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry16","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry16","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(16);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry16","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry17","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry17","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry17","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry17","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry17","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(7);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry17","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry18","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry18","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry18","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry18","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry18","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(18);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry18","Drop","s") %></td>
						-->
			</tr>
		<%end if%>		
		<%if tcWebApi_staticGet("GUITemp_Entry19","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry19","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry19","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry19","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry19","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(19);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry19","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry20","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry20","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry20","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry20","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry20","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(20);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry20","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
		<%if tcWebApi_staticGet("GUITemp_Entry21","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry21","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry21","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry21","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry21","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(21);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry21","Drop","s") %></td>
						-->
			</tr>
		<%end if%>

		<%if tcWebApi_staticGet("GUITemp_Entry22","routeTRLine","h") <> "" then%>
				
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry22","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry22","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry22","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry22","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(22);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry22","Drop","s") %></td>
						-->
			</tr>
		<%end if%>

		<%if tcWebApi_staticGet("GUITemp_Entry23","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry23","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry23","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry23","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry23","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(23);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry23","Drop","s") %></td>
						-->
			</tr>
		<%end if%>

		<%if tcWebApi_staticGet("GUITemp_Entry24","routeTRLine","h") <> "" then%>
					
			        <tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry24","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry24","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry24","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry24","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(24);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry24","Drop","s") %></td>
						-->
			</tr>
		<%end if%>

		<%if tcWebApi_staticGet("GUITemp_Entry25","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry25","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry25","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry25","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry25","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(25);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry25","Drop","s") %></td>
						-->
			</tr>
		<%end if%>

		<%if tcWebApi_staticGet("GUITemp_Entry26","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry26","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry26","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry26","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry26","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(26);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="topborderstyle"><%tcWebApi_staticGet("GUITemp_Entry26","Drop","s") %></td>
						-->
			</tr>
		<%end if%>

		<%if tcWebApi_staticGet("GUITemp_Entry27","routeTRLine","h") <> "" then%>
					
				<tr bgcolor=#FFFFFF height=35 id=tablebutton>
			<%tcWebApi_staticGet("GUITemp_Entry27","Index_Des","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry27","Mask_Gate","s")%>
			<%tcWebApi_staticGet("GUITemp_Entry27","Metric_Use","s") %>
						
				<td align=center class="topborderstyle">
					<%if tcWebApi_get("Route_Entry27","User_def","h")="1"  then%>
						<INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","RoutingTableRemoveText","s")%>" onClick="doDelete(27);">
					<%else%>
						&nbsp;
					<%end if%>
				</td>
						<!--amy removed
						<td align=center class="tabdata"id="tablebottomstyle"><%tcWebApi_staticGet("GUITemp_Entry27","Drop","s") %></td>
						-->
			</tr>
		<%end if%>
				</table>
				</div><!--class=configstyle-->
			</td>
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
</form></body></html>
