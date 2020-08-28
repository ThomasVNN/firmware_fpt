<%
If Request_Form("editFlag") = "1" then
	tcWebApi_set("WebCurSet_Entry","virServ_id","editnum")
	tcWebApi_set("VirServer_PVC_Entry","STARTPORT","start_port")
	tcWebApi_set("VirServer_PVC_Entry","ENDPORT","end_port")
	tcWebApi_set("VirServer_PVC_Entry","LOCALIP","Addr")
If Request_Form("isLocalPortSupport") = "Yes" then
	tcWebApi_set("VirServer_PVC_Entry","LOCAL_SPORT","local_sport")
	tcWebApi_set("VirServer_PVC_Entry","LOCAL_EPORT","local_eport")
end if
	if tcwebApi_get("WebCustom_Entry","isVirSerApplAndProtSupport","h") = "Yes" then
	tcWebApi_set("VirServer_PVC_Entry","APPLICATION","Application")
	tcWebApi_set("VirServer_PVC_Entry","PROTOCOL","SelectProtocol")
	end if
	tcWebApi_commit("WebCurSet_Entry")
	tcWebApi_commit("VirServer_PVC_Entry")
elseif Request_Form("delFlag") = "1" then
  tcWebApi_set("WebCurSet_Entry","virServ_id","editnum")
  tcWebApi_unset("VirServer_PVC_Entry")
  tcWebApi_commit("VirServer_PVC_Entry")
end if  
%>

<html><head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<link rel="stylesheet" type="text/css" href="/style.css">
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
<script language='javascript'>
<%if tcwebApi_get("WebCustom_Entry","isVirSerApplAndProtSupport","h") = "Yes" then%>
function doApplicationChange(){
	var AppList=new Array();
	var cn=0;
	AppList[cn++]=new Citem("--", 0, 0); //--
	AppList[cn++]=new Citem("FTP", 2, 21); //FTP
	AppList[cn++]=new Citem("SSH", 2, 22); //SSH
	AppList[cn++]=new Citem("TELNET",2, 23);//TELNET
	AppList[cn++]=new Citem("SMTP",2, 25);//SMTP
	AppList[cn++]=new Citem("HTTP_Server",2, 80);//HTTP_Server
	AppList[cn++]=new Citem("POP3",2, 110);//POP3
	AppList[cn++]=new Citem("HTTPS",2, 443);//HTTPS
	AppList[cn++]=new Citem("T.120",2, 1503);//T.120
	AppList[cn++]=new Citem("H.323",2, 1720);//H.323
	AppList[cn++]=new Citem("PPTP",2, 1723);//PPTP
	AppList[cn++]=new Citem("pcAnywhere",2, 5631);//pcAnywhere
	AppList[cn++]=new Citem("VNC",2, 5900);//VNC
	AppList[cn++]=new Citem("CUSeeMe",2, 7648);//CUSeeMe

	cn = document.VIRTUALSVR_form.SelectApplication.selectedIndex;
	document.VIRTUALSVR_form.SelectProtocol.selectedIndex = AppList[cn].iProtocol;
	document.VIRTUALSVR_form.Application.value = AppList[cn].sApp;
	document.VIRTUALSVR_form.start_port.value = AppList[cn].iPort;
	document.VIRTUALSVR_form.end_port.value = AppList[cn].iPort;
	document.VIRTUALSVR_form.local_sport.value = AppList[cn].iPort;
	document.VIRTUALSVR_form.local_eport.value = AppList[cn].iPort;

}

function checkProtocol(){
	
	if((document.VIRTUALSVR_form.Application.value == "--") || (document.VIRTUALSVR_form.Application.value == "")){
		alert("<%tcWebApi_get("String_Entry","VirsvrJS5Text","s")%>");
		return true;
	}
	return false;
}

function Citem(sApp, iProtocol, iPort)
{
	this.sApp=sApp;
	this.iProtocol=iProtocol;
	this.iPort=iPort;
}

<%end if%>
function chkPortRange()
{	
	var port = parseInt(document.VIRTUALSVR_form.start_port.value);
	var port2 = parseInt(document.VIRTUALSVR_form.end_port.value);
	var port3;
	var port4;
	
	if (port > 65535 || port < 1 || port2 > 65535 || port2 < 1 || isNaN(port) || isNaN(port2))
	{	
		alert("<%tcWebApi_get("String_Entry","VirsvrJS0Text","s")%>");
		return true;	
	}
	if (port2 < port)
	{	
		alert("<%tcWebApi_get("String_Entry","VirsvrJS1Text","s")%>");
		return true;
	}
	
	if(document.VIRTUALSVR_form.isLocalPortSupport.value == "Yes"){
		port3 = parseInt(document.VIRTUALSVR_form.local_sport.value);
		port4 = parseInt(document.VIRTUALSVR_form.local_eport.value);
		
		if (port3 > 65535 || port3 < 1 || port4 > 65535 || port4 < 1 || isNaN(port3) || isNaN(port4))
		{	
			alert("<%tcWebApi_get("String_Entry","VirsvrJS0Text","s")%>");
			return true;	
		}
		if (port4 < port3)
		{	
			alert("<%tcWebApi_get("String_Entry","VirsvrJS1Text","s")%>");
			return true;
		}
	}
	if (document.VIRTUALSVR_form.AccoutAclSupported.value == "Yes") {
		var acl_ports = document.VIRTUALSVR_form.ACLPort.value;
		var ports_array = acl_ports.split(",");

		var i;
		for (i = 0; i < ports_array.length; i++) {
			if (port <= parseInt(ports_array[i]) && port2 >= parseInt(ports_array[i])) {
				alert("<%tcWebApi_get("String_Entry","VirsvrJS4Text","s")%>");
				return true;
			}
		}
	}
	
	Sports = new Array(10);
	Eports = new Array(10);
	return false;
}

function chkRule(){
	var j = 1;
	var start_port = new Array(10);
	var end_port = new Array(10);
	var ipaddr = new Array(10);
	var edit_id = document.VIRTUALSVR_form.editnum.value;
	var edit_start_port = parseInt(document.VIRTUALSVR_form.start_port.value);
	var edit_end_port = parseInt(document.VIRTUALSVR_form.end_port.value);
	var edit_ipaddr = document.VIRTUALSVR_form.Addr.value.split(".");	
	<%if tcwebApi_get("WebCustom_Entry","isVirSerApplAndProtSupport","h") = "Yes" then %>
	var protocol = new Array(10);
	var edit_protocol = document.VIRTUALSVR_form.SelectProtocol.value;	
	<%end if%>				
	for(i = 0 ; i < 10 ; i++){
		ipaddr[i] = new Array(4);
		<%if tcwebApi_get("WebCustom_Entry","isVirSerApplAndProtSupport","h") = "Yes" then %>
		protocol[i] = document.getElementById("cgi_frame").contentWindow.document.getElementById("CgiInnerTable").rows[i+1].cells[2].innerHTML;
		j = 3;
		<%end if%>
		start_port[i] = parseInt(document.getElementById("cgi_frame").contentWindow.document.getElementById("CgiInnerTable").rows[i+1].cells[j].innerHTML);
		end_port[i] = parseInt(document.getElementById("cgi_frame").contentWindow.document.getElementById("CgiInnerTable").rows[i+1].cells[j+1].innerHTML);
		ipaddr[i] = document.getElementById("cgi_frame").contentWindow.document.getElementById("CgiInnerTable").rows[i+1].cells[j+2].innerHTML.split(".");

	}

	for(i = 0; i < 10; i++){
		if((edit_id != i) && (isNaN(start_port[i]) == 0)){
			if((Number(ipaddr[i][0]) == Number(edit_ipaddr[0])) && (Number(ipaddr[i][1]) == Number(edit_ipaddr[1])) &&
			   (Number(ipaddr[i][2]) == Number(edit_ipaddr[2])) && (Number(ipaddr[i][3]) == Number(edit_ipaddr[3]))){
				if((edit_start_port == start_port[i]) && (edit_end_port == end_port[i])){ 
			   	<%if tcwebApi_get("WebCustom_Entry","isVirSerApplAndProtSupport","h") = "Yes" then %>
							if(protocol[i]=="ALL" || edit_protocol=="ALL" ||edit_protocol == protocol[i])
							{
						<%end if%>	
                                 	alert("<%tcWebApi_get("String_Entry","VirsvrJS2Text","s")%>");
					return true;
						<%if tcwebApi_get("WebCustom_Entry","isVirSerApplAndProtSupport","h") = "Yes" then %>
				}			
						<%end if%>
				}
							
			}
			else{
				if(!((edit_start_port > end_port[i]) || (edit_end_port < start_port[i]))){
					alert("<%tcWebApi_get("String_Entry","VirsvrJS3Text","s")%>");
					return true;
				}				
			}
		}
	}

	return false;
}

function doSave() {
	if (chkPortRange())
		return;
	if (inValidIPAddr(document.VIRTUALSVR_form.Addr.value))
		return;
	if (chkRule())
		return;
	<%if tcwebApi_get("WebCustom_Entry","isVirSerApplAndProtSupport","h") = "Yes" then%>
	if (checkProtocol())
		return;
	<%end if%>
	document.VIRTUALSVR_form.editFlag.value ="1"	
	document.VIRTUALSVR_form.submit();
}
</script>


<style  type="text/css">

*{color:  #404040;}

table td
{
margin:5 0;padding:5 0;
}
</style>


</head>
<body>
<form name="VIRTUALSVR_form" method="post" ACTION="/cgi-bin/adv_nat_virsvr.asp">
<INPUT TYPE="HIDDEN" NAME="isLocalPortSupport" value="<%if tcWebApi_get("WebCustom_Entry","isVirSvrLocalPortSupport","h") <> "N/A" then tcWebApi_get("WebCustom_Entry","isVirSvrLocalPortSupport","s") end if%>">
<table width="760" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
      <td height="5" class="light-orange" colspan="5">&nbsp;</td>
  </tr>
  <tr>
    <td width="150" height="30" ></td>
    <td width="10">&nbsp;</td>
    <td width="150" class="title-main"><%tcWebApi_get("String_Entry","NatVirsvrText","s")%> </td>
    <td width="10" ></td>
    <td width="440"></td>
  </tr>
  <tr>
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align="right">
    
    <%tcWebApi_get("String_Entry","NatVirsvrforText","s")%> 
    
    </div></td>
    <td class="tabdata"><div align="center">:</div></td>
    <td class="tabdata">
<%if tcWebApi_get("WebCustom_Entry","noWanModeDefined","h") = "Yes" then%>
		<%If tcWebApi_get("Nat_PVC","IPMODE","h") = "Single" Then%>
    	<%tcWebApi_get("String_Entry","NatVirsvrSingleText","s")%><%tcWebApi_get("WebCurSet_Entry","nat_pvc","s")%>
    <%Else%>
    <%tcWebApi_get("String_Entry","NatVirsvrMultipleText","s")%><%tcWebApi_get("WebCurSet_Entry","nat_pvc","s")%>
    <%End If%>

<%else%>
	<%If tcWebApi_get("Nat_PVC","IPMODE","h") = "Single" Then%>
		<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") = "Yes" then%>
			<%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%><%tcWebApi_get("WebCurSet_Entry","nat_pvc","s")%>
		<%else%>
		<%if tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "0" then%>
			 <%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%>0
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "1" then%>
			 <%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%>1
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "2" then%>
			 <%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%>2
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "3" then%>
			 <%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%>3
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "4" then%>
			 <%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%>4
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "5" then%>
			 <%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%>5
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "6" then%>
			 <%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%>6
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "7" then%>
			 <%tcWebApi_get("String_Entry","NatDMZSingleAccountText","s")%>7
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "8" then%>
			<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
				<%if tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "0" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 0
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "1" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 1
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "2" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 2
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "3" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 3
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "4" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 4
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "5" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 5
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "6" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 6	
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "7" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 7
				<%End if%>	
			<%else%>
		    	<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>0
			<%End if%>	
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "9" then%>
			<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
				<%if tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "0" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 0
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "1" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 1
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "2" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 2
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "3" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 3
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "4" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 4
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "5" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 5
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "6" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 6	
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "7" then%>
					<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 7
				<%End if%>
			<%else%>
		    	<%tcWebApi_get("String_Entry","NatDMZSinglePTMAccountText","s")%>1
			<%End if%>	
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "10" then%>
			<%if tcWebApi_get("WebCustom_Entry","isMultiSerSupported","h") = "Yes" then%>
				<%if tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "0" then%>
					<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 0
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "1" then%>
					<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 1
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "2" then%>
					<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 2
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "3" then%>
					<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 3
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "4" then%>
					<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 4
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "5" then%>
					<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 5
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "6" then%>
					<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 6
				<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc_ext","h") = "7" then%>
					<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0 <%tcWebApi_get("String_Entry","NatDMZServiceIDText","s")%> 7
				<%End if%>	
			<%else%>
				<%tcWebApi_get("String_Entry","NatDMZSingleWanAccountText","s")%>0
			<%End if%>	
		<%end if%>
		<%End If%>
	<%else%>
		<%if tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "0" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleAccountText","s")%>0
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "1" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleAccountText","s")%>1
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "2" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleAccountText","s")%>2
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "3" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleAccountText","s")%>3
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "4" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleAccountText","s")%>4
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "5" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleAccountText","s")%>5
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "6" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleAccountText","s")%>6
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "7" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleAccountText","s")%>7
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "8" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultiplePTMAccountText","s")%>0
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "9" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultiplePTMAccountText","s")%>1
		<%elseif tcWebApi_get("WebCurSet_Entry","nat_pvc","h") = "10" then%>
			 <%tcWebApi_get("String_Entry","NatDMZMultipleWanAccountText","s")%>0
		<%end if%>
	<%end if%>

<%end if%>
    </td>
  </tr>
  <%if tcwebApi_get("WebCustom_Entry","isVirSerApplAndProtSupport","h") = "Yes" then%>
  <tr>
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align="right">    
	<%tcWebApi_get("String_Entry","NatVirsvrApplicationText","s")%>
    </div></td>
    <td class="tabdata"><div align="center">:</div></td>
    <td class="tabdata">    	
        <input type="text" size="5" maxlength="12" name="Application" value="<%if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","APPLICATION","s") end if%>"  id="uiViewPvcVpi3">
		<select name="SelectApplication" size="1" onChange="doApplicationChange()">
			<option value="N/A" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "N/A" then asp_Write("selected") end if %>>--</option>
			<option value="FTP" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "FTP" then asp_Write("selected") end if %>>FTP</option>
			<option value="SSH" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "SSH" then asp_Write("selected") end if %>>SSH</option>
			<option value="TELNET" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "TELNET" then asp_Write("selected") end if %>>TELNET</option>
			<option value="SMTP" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "SMTP" then asp_Write("selected") end if %>>SMTP</option>
			<option value="HTTP_Server" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "HTTP_Server" then asp_Write("selected") end if %>>HTTP_Server</option>
			<option value="POP3" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "POP3" then asp_Write("selected") end if %>>POP3</option>
			<option value="HTTPS" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "HTTPS" then asp_Write("selected") end if %>>HTTPS</option>
			<option value="T.120" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "T.120" then asp_Write("selected") end if %>>T.120</option>
			<option value="H.323" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "H.323" then asp_Write("selected") end if %>>H.323</option>
			<option value="PPTP" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "PPTP" then asp_Write("selected") end if %>>PPTP</option>
			<option value="pcAnywhere" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "pcAnywhere" then asp_Write("selected") end if %>>pcAnywhere</option>
			<option value="VNC" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "VNC" then asp_Write("selected") end if %>>VNC</option>
			<option value="CUSeeMe" <% if tcWebApi_get("VirServer_PVC_Entry","APPLICATION","h") = "CUSeeMe" then asp_Write("selected") end if %>>CUSeeMe</option>
					
		</select>       
    </td>
  </tr>
  <tr>
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align="right">    
    <%tcWebApi_get("String_Entry","NatVirsvrProtocolText","s")%>   
    </div></td>
    <td class="tabdata"><div align="center">:</div></td>
    <td class="tabdata">    	
        <select name="SelectProtocol" size="1" >
			<option value="TCP" <% if tcWebApi_get("VirServer_PVC_Entry","PROTOCOL","h") = "TCP" then asp_Write("selected") end if %>>TCP</option>
			<option value="UDP" <% if tcWebApi_get("VirServer_PVC_Entry","PROTOCOL","h") = "UDP" then asp_Write("selected") end if %>>UDP</option>
			<option value="ALL" <% if tcWebApi_get("VirServer_PVC_Entry","PROTOCOL","h") = "ALL" then asp_Write("selected") end if %>>ALL</option>
		</select>      
    </td>
  </tr>
  <%end if%>
  <tr>
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align="right">    
    <%tcWebApi_get("String_Entry","NatVirsvrStartPortNumText","s")%>   
    </div></td>
    <td class="tabdata"><div align="center">:</div></td>
    <td class="tabdata">    	
        <input type="text" size="5" maxlength="5" name="start_port" value="<%if tcWebApi_get("VirServer_PVC_Entry","STARTPORT","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","STARTPORT","s") end if%>"  id="uiViewPvcVpi1">       
    </td>
  </tr>
  <tr>
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align="right">   
    <%tcWebApi_get("String_Entry","NatVirsvrEndPortNumText","s")%>   
    </div></td>
    <td class="tabdata"><div align="center">:</div></td>
    <td class="tabdata">  	
        <input type="text" size="5" maxlength="5" value="<%if tcWebApi_get("VirServer_PVC_Entry","ENDPORT","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","ENDPORT","s") end if%>" name="end_port" id="uiViewPvcVpi2">       
    </td>
  </tr>
  <tr>
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align="right">   
    <%tcWebApi_get("String_Entry","NatVirsvrLocalIPAddrText","s")%>   
    </div></td>
    <td class="tabdata"><div align="center">:</div></td>
    <td class="tabdata">        
        <input type="text" class="uiTextInput" size="16" maxlength="15" name="Addr" id="uiViewIpAddressMark" value="<%if tcWebApi_get("VirServer_PVC_Entry","LOCALIP","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","LOCALIP","s") end if%>">        
  </tr>
<%If tcWebApi_get("WebCustom_Entry","isVirSvrLocalPortSupport","h") = "Yes" Then%>   
  <tr>
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align="right">    
    <%tcWebApi_get("String_Entry","NatVirsvrStartPortNumLoText","s")%>   
    </div></td>
    <td class="tabdata"><div align="center">:</div></td>
    <td class="tabdata">    	
        <input type="text" size="5" maxlength="5" name="local_sport" value="<%if tcWebApi_get("VirServer_PVC_Entry","LOCAL_SPORT","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","LOCAL_SPORT","s") end if%>" >       
    </td>
  </tr>
  <tr>
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align="right">   
    <%tcWebApi_get("String_Entry","NatVirsvrEndPortNumLoText","s")%>
    </div></td>
    <td class="tabdata"><div align="center">:</div></td>
    <td class="tabdata">  	
        <input type="text" size="5" maxlength="5"  name="local_eport" value="<%if tcWebApi_get("VirServer_PVC_Entry","LOCAL_EPORT","h") <> "N/A" then tcWebApi_get("VirServer_PVC_Entry","LOCAL_EPORT","s") end if%>">       
    </td>
  </tr>
<%End If%>
</table>



<table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="150" height="30"></td>
    <td width="10">&nbsp;</td>
    <td width="150" class="title-sub"><%tcWebApi_get("String_Entry","NatVirsvrServerListingText","s")%> </td>
    <td width="10"></td>
    <td width="440"></td>
  </tr>
  </table>
  
  <table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="150" class="light-orange" height="5">&nbsp;</td>
    <td width="10" class="light-orange"></td>
    <td width="10">&nbsp;</td>
    <td width="580" align="center">	
    </td>
    <INPUT TYPE="HIDDEN" NAME="editFlag" VALUE="0">
    <INPUT TYPE="HIDDEN" NAME="delFlag" VALUE="0">
    <INPUT TYPE="HIDDEN" NAME="editnum" VALUE="0">
    <td width="10">&nbsp;</td>
  </tr>
</table>

<TABLE cellSpacing=0 cellPadding=0 width=760 bgColor=#ffffff border=0>
  <TBODY>
  <TR>
    <TR>
    <TD class=light-orange width=150>&nbsp;</TD>
    <TD class=light-orange width=10></TD>
    <TD class=tabdata>
		  <iframe src="/cgi-bin/virsvr_table.cgi" id="cgi_frame" frameborder="0" width="550" height="250"></iframe>
    </TD></TR></TBODY></TABLE>


<table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="160" height="42">&nbsp;</td>
    <td width="160" class="orange">&nbsp;</td>
    <td width="440" class="orange">
		<input type="button" name="SaveBtn"  value="<%tcWebApi_get("String_Entry","ButtonApplyText","s")%>"  onClick="doSave();">
		<input type="button" name="BackBtn"   value="<%tcWebApi_get("String_Entry","ButtonBackText","s")%>"   onClick="javascript:window.location='/cgi-bin/adv_nat_top.asp'">
		<input type="button" name="CancelBtn" value="<%tcWebApi_get("String_Entry","ButtonCancelText","s")%>" onClick="javascript:window.location='/cgi-bin/adv_nat_virsvr.asp'">
		<INPUT TYPE="HIDDEN" NAME="ACLPort" VALUE="<%tcWebApi_get("Info_Service","acl_ports","s")%>">
		<INPUT TYPE="HIDDEN" NAME="AccoutAclSupported" VALUE="<%tcWebApi_get("WebCustom_Entry","isAccoutAclSupported","s")%>">
	</td>
  </tr>
</table>
<p>&nbsp;</p>
</div>
</form>
</body>
</html>        
