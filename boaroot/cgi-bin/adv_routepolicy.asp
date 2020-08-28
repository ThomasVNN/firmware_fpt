<%
if request_Form("RPSaveFlag") = "0" then
	TCWebAPI_set("WebCurSet_Entry","policy_id","PolicyIndex")
elseif request_Form("RPSaveFlag") = "1" Then
	if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then
		TCWebApi_unset("RoutePolicy_Entry")
		tcWebApi_constSet("WebCurSet_Entry", "url_policy_flush", "1")
	end if
	TCWebApi_set("RoutePolicy_Entry","Active","PolicyActive")
	if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then
		TCWebApi_set("RoutePolicy_Entry","Type","ipUrlType")
		if request_Form("PolicyActive") = "1" then
			if request_Form("ipUrlType") = "1" then
				TCWebApi_set("RoutePolicy_Entry","srcMac","PolicySourceMac")
				TCWebApi_set("RoutePolicy_Entry","startIP","StartSourceIPAddr")
				TCWebApi_set("RoutePolicy_Entry","endIP","EndSourceIPAddr")
				TCWebApi_set("RoutePolicy_Entry","startDstIP","StartDstIPAddr")
				TCWebApi_set("RoutePolicy_Entry","endDstIP","EndDstIPAddr")
				TCWebApi_set("RoutePolicy_Entry","Ethertype","PolicyEthertype")
				TCWebApi_set("RoutePolicy_Entry","Protocol","PolicyProtocol")
				if request_Form("PolicyProtocol") <> "" then
					TCWebApi_set("RoutePolicy_Entry","startSrcPort","PolicyStartSrcPort")
					TCWebApi_set("RoutePolicy_Entry","endSrcPort","PolicyEndSrcPort")
					TCWebApi_set("RoutePolicy_Entry","startDstPort","PolicyStartDstPort")
					TCWebApi_set("RoutePolicy_Entry","endDstPort","PolicyEndDstPort")
				End if
				TCWebApi_set("RoutePolicy_Entry","TOS","TOS")
			else
				TCWebApi_set("RoutePolicy_Entry","URL","urlvalue")
			end if
			TCWebApi_set("RoutePolicy_Entry","PolicyPVC","PolicyWanPVCIndex")
		End if
	elseif request_Form("PolicyActive") = "1" then
		TCWebApi_set("RoutePolicy_Entry","srcMac","PolicySourceMac")
		TCWebApi_set("RoutePolicy_Entry","startIP","StartSourceIPAddr")
		TCWebApi_set("RoutePolicy_Entry","endIP","EndSourceIPAddr")
		TCWebApi_set("RoutePolicy_Entry","startDstIP","StartDstIPAddr")
		TCWebApi_set("RoutePolicy_Entry","endDstIP","EndDstIPAddr")
		TCWebApi_set("RoutePolicy_Entry","Ethertype","PolicyEthertype")
		TCWebApi_set("RoutePolicy_Entry","Protocol","PolicyProtocol")
		if request_Form("PolicyProtocol") <> "" then
			TCWebApi_set("RoutePolicy_Entry","startSrcPort","PolicyStartSrcPort")
			TCWebApi_set("RoutePolicy_Entry","endSrcPort","PolicyEndSrcPort")
			TCWebApi_set("RoutePolicy_Entry","startDstPort","PolicyStartDstPort")
			TCWebApi_set("RoutePolicy_Entry","endDstPort","PolicyEndDstPort")
		End if
		TCWebApi_set("RoutePolicy_Entry","TOS","TOS")
		TCWebApi_set("RoutePolicy_Entry","PolicyPVC","PolicyWanPVCIndex")
	End if
	tcWebApi_commit("RoutePolicy_Entry")
End If
%>

<html><head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" href="/style.css" tppabs="/style.css" type="text/css">
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>

<style  type="text/css">

*{color:  #404040;}

table td
{
margin:5 0;padding:5 0;
}
</style>


<script>
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

function uiSave() {
	var form = document.uiRoutePolicyForm;
	var active=form.PolicyActive[0].checked;
	var srcmac=form.PolicySourceMac;
	var startip=form.StartSourceIPAddr.value;
	var endip=form.EndSourceIPAddr.value;
	var startDstip=form.StartDstIPAddr.value;
	var endDstip=form.EndDstIPAddr.value;	
	var Ethertype=form.PolicyEthertype.value;
	var protocol=form.PolicyProtocol.value;
	var startsrcport=form.PolicyStartSrcPort.value;
	var endsrcport=form.PolicyEndSrcPort.value;
	var startdstport=form.PolicyStartDstPort.value;
	var enddstport=form.PolicyEndDstPort.value;
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
	var urlname=form.urlvalue.value;
	var mode=form.ipUrlType[1].checked;
<% end if %>
	var ISPMode = new Array('<% tcWebApi_get("Wan_PVC0","ISP","s") %>','<% tcWebApi_get("Wan_PVC1","ISP","s") %>','<% tcWebApi_get("Wan_PVC2","ISP","s") %>','<% tcWebApi_get("Wan_PVC3","ISP","s") %>','<% tcWebApi_get("Wan_PVC4","ISP","s") %>','<% tcWebApi_get("Wan_PVC5","ISP","s") %>','<% tcWebApi_get("Wan_PVC6","ISP","s") %>','<% tcWebApi_get("Wan_PVC7","ISP","s") %>');
	if(active){
		if(!doMACcheck(srcmac))
		{
			return false;
		}
		if(startip.length != 0 || endip.length != 0){
			if(inValidIPAddr(startip))
			{
				return false;
			}
			
			if(inValidSubnetMask(endip))
			{
				return false;
			}

			if (0)
			{
				if(equalIP(startip,endip)<0)
				{
					alert('<%tcWebApi_get("String_Entry","RtPolicyJS0Text","s")%>');
					return false;
				}
			}
		}		
		if(startDstip.length != 0 || endDstip.length != 0){
			if(inValidIPAddr(startDstip))
			{
				return false;
			}

			if(inValidSubnetMask(endDstip))
			{
				return false;
			}

			if (0)
			{
				if(equalIP(startDstip,endDstip)<0)
				{
					alert('<%tcWebApi_get("String_Entry","RtPolicyJS6Text","s")%>');
					return false;
				}
			}
		}	
		if(protocol !=""){
			if(startsrcport.length != 0 || endsrcport.length != 0){
				if(!isValidatePortNo(startsrcport))
				{
					return false;
				}
				
				if(!isValidatePortNo(endsrcport))
				{
					return false;
				}
				
				if(equalPort(startsrcport,endsrcport)<0)
				{
					alert('<%tcWebApi_get("String_Entry","RtPolicyJS1Text","s")%>');
					return false;
				}
			}
			if(startdstport.length != 0 || enddstport.length != 0){
				if(!isValidatePortNo(startdstport))
				{
					return false;
				}
				
				if(!isValidatePortNo(enddstport))
				{
					return false;
				}
				
				if(equalPort(startdstport,enddstport)<0)
				{
					alert('<%tcWebApi_get("String_Entry","RtPolicyJS2Text","s")%>');
					return false;
				}
			}
		}
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
		if(mode)
		{
			if (isValidUrlName(urlname.toLowerCase()) == false){
					alert("<%tcWebApi_get("String_Entry","URLfilterWrongUrl","s")%>");
					return false;
			}
			for(i=1; i<urlname.length-1; i++)
			{
				var c = urlname.charAt(i);
				if(c == '*')
				{
					alert("invalid url!");
					return false;
				}
			}
		}
		if(document.getElementsByName("ipUrlType")&&form.ipUrlType[0].checked)
<% end if %>
		{
			for(i=0;i<8;i++)
			{
				if(i == form.PolicyWanPVCIndex.value)
				{
					if(ISPMode[i] == 3)
					{
						if(Ethertype == "")
						{
							alert('<%tcWebApi_get("String_Entry","RtPolicybridgeText","s")%>');
							return false;
						}
					}
				}
			}
		}
	}
	form.RPSaveFlag.value = 1;
	form.submit();
}
function equalIP(startip,endip){
	var ret = -1;
	var sip=startip.split(".");
	var eip=endip.split(".");
	if(Number(sip[0])==Number(eip[0]) && Number(sip[1])==Number(eip[1]) && Number(sip[2])==Number(eip[2]))
	{
		if(Number(sip[3])==Number(eip[3])){
			ret = 0;
		}
		else if(Number(sip[3])<Number(eip[3])){
			ret = 1;
		}
	}
	return ret;
}
function equalPort(startport,endport){
	if(Number(startport)>Number(endport)){
		return -1;
	}else if(Number(startport)==Number(endport)){
		return 0;
	}else{
		return 1;
	}
}
function isValidatePortNo (Portno)
{

	var pingno;
	if(!isNumeric(Portno))
	{
		alert('<%tcWebApi_get("String_Entry","RtPolicyJS5Text","s")%>');
		return false;
	}
	pingno=Number(Portno);
	if(pingno <= 65535 && pingno>=0)
	{
		return true;
	}
	else
	{
		alert('<%tcWebApi_get("String_Entry","RtPolicyJS5Text","s")%>');
		return false;
	}
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
		return true;
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
				alert("<%tcWebApi_get("String_Entry","RtPolicyJS4Text","s")%>");
				object.focus();
				return false;
			}
			if((i == 2)||(i == 4)||(i == 6)||(i == 8)||(i == 10))
			{
				newAddr = newAddr + ":";
			}
			newAddr = newAddr + c;
		}
		object.value = newAddr;
		return true;
	}
	else if ( len == 17 )
	{
		var i = 2;
		var c0 = szAddr.charAt(0);
		var c1 = szAddr.charAt(1);

		if ((doHexCheck(c0) < 0)||(doHexCheck(c1) < 0))
		{
			alert("<%tcWebApi_get("String_Entry","RtPolicyJS4Text","s")%>");
			object.focus();
			return false;
		}

		i = 2;
		while (i<len)
		{
			var c0 = szAddr.charAt(i);
			var c1 = szAddr.charAt(i+1);
			var c2 = szAddr.charAt(i+2);

			if ((c0 != ":")||(doHexCheck(c1)<0)||(doHexCheck(c2)<0))
			{
				alert("<%tcWebApi_get("String_Entry","RtPolicyJS4Text","s")%>");
				object.focus();
				return false;
			}
			i = i + 3;
		}
		if((szAddr == "00:00:00:00:00:00") || (szAddr.toUpperCase() == "FF:FF:FF:FF:FF:FF"))
		{
			alert("<%tcWebApi_get("String_Entry","RtPolicyJS4Text","s")%>");
			object.focus();
			return false;
		}
		return true; 
	}
	else
	{
		alert("<%tcWebApi_get("String_Entry","RtPolicyJS4Text","s")%>");
		object.focus();
		return false;
	}
}
function doChangeIndex(){
	var form = document.uiRoutePolicyForm;
	form.RPSaveFlag.value = 0;
	form.submit();
}
function Init()
{
	changeActive();
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
	changeType();
<% end if %>
}
function changeActive()
{
	var form = document.uiRoutePolicyForm;
	if(form.PolicyActive[0].checked){
		form.PolicySourceMac.disabled=false;
		form.StartSourceIPAddr.disabled=false;
		form.EndSourceIPAddr.disabled=false;
		form.StartDstIPAddr.disabled=false;
		form.EndDstIPAddr.disabled=false;
		form.PolicyEthertype.disabled=false;
		form.PolicyProtocol.disabled=false;
		changeProtocol();
		form.TOS.disabled=false;
		form.PolicyWanPVCIndex.disabled=false;
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
		form.urlvalue.disabled=false;
<% end if %>
	}
	else{
		form.PolicySourceMac.disabled=true;
		form.StartSourceIPAddr.disabled=true;
		form.EndSourceIPAddr.disabled=true;
		form.StartDstIPAddr.disabled=true;
		form.EndDstIPAddr.disabled=true;
		form.PolicyEthertype.disabled=true;
		form.PolicyProtocol.disabled=true;
		form.PolicyStartSrcPort.disabled=true;
		form.PolicyEndSrcPort.disabled=true;
		form.PolicyStartDstPort.disabled=true;
		form.PolicyEndDstPort.disabled=true;
		form.TOS.disabled=true;
		form.PolicyWanPVCIndex.disabled=true;
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
		form.urlvalue.disabled=true;
<% end if %>
	}
}
function changeProtocol(){
	var form = document.uiRoutePolicyForm;
	if(form.PolicyProtocol.value!=""){
		form.PolicyStartSrcPort.disabled=false;
		form.PolicyEndSrcPort.disabled=false;
		form.PolicyStartDstPort.disabled=false;
		form.PolicyEndDstPort.disabled=false;
	}else{
		form.PolicyStartSrcPort.disabled=true;
		form.PolicyEndSrcPort.disabled=true;
		form.PolicyStartDstPort.disabled=true;
		form.PolicyEndDstPort.disabled=true;
	}
}

<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
function changeType()
{
	var form = document.uiRoutePolicyForm;
	var IpShow = document.getElementsByName("ipshow");
	if(form.ipUrlType[0].checked)
	{
		for (i = 0; i < IpShow.length; i++)
		{
			IpShow[i].style.display = "";
		}
		document.getElementById("urlshow").style.display="none";
	}
	else
	{	
		for (i = 0; i < IpShow.length; i++)
		{
			IpShow[i].style.display = "none";
		}
		document.getElementById("urlshow").style.display="";
	}
}
<% end if %>
</script>
</head><body onload="Init()">



<FORM METHOD="POST" ACTION="/cgi-bin/adv_routepolicy.asp" name="uiRoutePolicyForm">
  <div align=center>
    <table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr> 
        <td height="5" class="light-orange" colspan="5">&nbsp;</td>
      </tr>
      <tr> 
        <td width="150" height="30" class="title-main"><%tcWebApi_get("String_Entry","RtPolicyText","s")%>  </td>
        <td width="10">&nbsp;</td>
        <td width="150"><hr noshade></td>
				<td width="10" ><hr noshade></td>
				<td width="440"><hr noshade></td>
			</tr>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","RtPolicyRuleIndexText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata">
        	<select name="PolicyIndex" size="1" onchange="doChangeIndex()" >
        		<option value="0" <% if tcWebApi_get("WebCurSet_Entry","policy_id","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyRuleIndex0Text","s")%></option>
        		<option value="1" <% if tcWebApi_get("WebCurSet_Entry","policy_id","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyRuleIndex1Text","s")%></option>
        		<option value="2" <% if tcWebApi_get("WebCurSet_Entry","policy_id","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyRuleIndex2Text","s")%></option>
        		<option value="3" <% if tcWebApi_get("WebCurSet_Entry","policy_id","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyRuleIndex3Text","s")%></option>
        		<option value="4" <% if tcWebApi_get("WebCurSet_Entry","policy_id","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyRuleIndex4Text","s")%></option>
        		<option value="5" <% if tcWebApi_get("WebCurSet_Entry","policy_id","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyRuleIndex5Text","s")%></option>
        		<option value="6" <% if tcWebApi_get("WebCurSet_Entry","policy_id","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyRuleIndex6Text","s")%></option>
        		<option value="7" <% if tcWebApi_get("WebCurSet_Entry","policy_id","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyRuleIndex7Text","s")%></option>
        	</select> &nbsp;&nbsp;
        	<INPUT TYPE="button" NAME="PolicySummaryBtn" VALUE="<%tcWebApi_get("String_Entry","RtPolicySummaryBtnText","s")%>" onclick="window.open('/cgi-bin/adv_routepolicy_summary.asp','Policy','toolbar=no,menubar=no,height=550,width=780,location=0,left=200,top=400');">
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","RtPolicyActiveText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> 
        	<input name="PolicyActive" type="radio" onclick="changeActive()" value="1" <% if tcWebApi_get("RoutePolicy_Entry","Active","h") = "1" then asp_Write("CHECKED") end if %>><%tcWebApi_get("String_Entry","RtPolicyActiveYesText","s")%>
					<input name="PolicyActive" type="radio" onclick="changeActive()" value="0" <% if tcWebApi_get("RoutePolicy_Entry","Active","h") = "0" then asp_Write("CHECKED") end if %>><%tcWebApi_get("String_Entry","RtPolicyActiveNoText","s")%>
        </td>
      </tr>
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","RtPolicyModeText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> 
        	<input name="ipUrlType" type="radio" onclick="changeType()" value="1" <% if tcWebApi_get("RoutePolicy_Entry","Type","h") = "1" then asp_Write("CHECKED") end if %>><%tcWebApi_get("String_Entry","RtPolicyModeIPText","s")%>
					<input name="ipUrlType" type="radio" onclick="changeType()" value="0" <% if tcWebApi_get("RoutePolicy_Entry","Type","h") = "0" then asp_Write("CHECKED") end if %>><%tcWebApi_get("String_Entry","RtPolicyModeURLText","s")%>
        </td>
      </tr>  
<% end if %> 
      <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","RtPolicySrcMacText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="PolicySourceMac" SIZE="17" MAXLENGTH="17" VALUE="<%If tcWebApi_get("RoutePolicy_Entry","srcMac","h") <> "N/A" then tcWebApi_get("RoutePolicy_Entry","srcMac","s") end if%>" >
        </td>
      </tr>
      <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","RtPolicyStaSrcIPText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="StartSourceIPAddr" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("RoutePolicy_Entry","startIP","h") <> "N/A" then tcWebApi_get("RoutePolicy_Entry","startIP","s") end if%>" >
        </td>
      </tr>
      <tr name="ipshow" id="ipshow" > 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"> <div align=right>  <%tcWebApi_get("String_Entry","RtPolicyEndSrcIPText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="EndSourceIPAddr" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("RoutePolicy_Entry","endIP","h") <> "N/A" then tcWebApi_get("RoutePolicy_Entry","endIP","s") end if%>" >	
        </td>
      </tr>
      <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","RtPolicyStaDstIPText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="StartDstIPAddr" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("RoutePolicy_Entry","startDstIP","h") <> "N/A" then tcWebApi_get("RoutePolicy_Entry","startDstIP","s") end if%>" >
        </td>
      </tr>
      <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"> <div align=right>  <%tcWebApi_get("String_Entry","RtPolicyEndDstIPText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="EndDstIPAddr" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("RoutePolicy_Entry","endDstIP","h") <> "N/A" then tcWebApi_get("RoutePolicy_Entry","endDstIP","s") end if%>" >	
        </td>
      </tr>
      <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"> <div align=right>  <%tcWebApi_get("String_Entry","RtPolicyEthertypeText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> 
        	<select name="PolicyEthertype" size="1">
        		<option value="" <% if tcWebApi_get("RoutePolicy_Entry","Ethertype","h") = "" then asp_Write("selected") end if %>>&nbsp;</option>
        		<option value="0" <% if tcWebApi_get("RoutePolicy_Entry","Ethertype","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyEthertypeIPText","s")%></option>
        		<option value="2" <% if tcWebApi_get("RoutePolicy_Entry","Ethertype","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyEthertypeIP6Text","s")%></option>
        		<option value="1" <% if tcWebApi_get("RoutePolicy_Entry","Ethertype","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyEthertypeARPText","s")%></option>
        		<option value="3" <% if tcWebApi_get("RoutePolicy_Entry","Ethertype","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyEthertypePPPoEText","s")%></option>
        	</select>
        </td>
      </tr>
       <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"> <div align=right>  <%tcWebApi_get("String_Entry","RtPolicyProtocolText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> 
        	<select name="PolicyProtocol" size="1" onchange="changeProtocol()">
        		<option value="" <% if tcWebApi_get("RoutePolicy_Entry","Protocol","h") = "" then asp_Write("selected") end if %>>&nbsp;</option>
        		<option value="0" <% if tcWebApi_get("RoutePolicy_Entry","Protocol","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyProtocolTCPText","s")%></option>
        		<option value="1" <% if tcWebApi_get("RoutePolicy_Entry","Protocol","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyProtocolUDPText","s")%></option>
        	</select>
        </td>
      </tr>
      <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"> <div align=right>  <%tcWebApi_get("String_Entry","RtPolicySrcPortRangeText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata">
        		<INPUT TYPE="TEXT" NAME="PolicyStartSrcPort" SIZE="3" MAXLENGTH="5" VALUE=
				"<%if TCWebAPI_get("RoutePolicy_Entry", "startSrcPort", "h") <> "N/A" then TCWebAPI_get("RoutePolicy_Entry", "startSrcPort", "s") else asp_Write("") end if %>">~
				<INPUT TYPE="TEXT" NAME="PolicyEndSrcPort" SIZE="3" MAXLENGTH="5" VALUE=
				"<%if TCWebAPI_get("RoutePolicy_Entry", "endSrcPort", "h") <> "N/A" then TCWebAPI_get("RoutePolicy_Entry", "endSrcPort", "s") else asp_Write("") end if %>">
        </td>
      </tr>
       <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"> <div align=right>  <%tcWebApi_get("String_Entry","RtPolicyDstPortRangeText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata">
        		<INPUT TYPE="TEXT" NAME="PolicyStartDstPort" SIZE="3" MAXLENGTH="5" VALUE=
				"<%if TCWebAPI_get("RoutePolicy_Entry", "startDstPort", "h") <> "N/A" then TCWebAPI_get("RoutePolicy_Entry", "startDstPort", "s") else asp_Write("") end if %>">~
				<INPUT TYPE="TEXT" NAME="PolicyEndDstPort" SIZE="3" MAXLENGTH="5" VALUE=
				"<%if TCWebAPI_get("RoutePolicy_Entry", "endDstPort", "h") <> "N/A" then TCWebAPI_get("RoutePolicy_Entry", "endDstPort", "s") else asp_Write("") end if %>">
        </td>
      </tr>
      <tr name="ipshow" id="ipshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"> <div align=right>  <%tcWebApi_get("String_Entry","RtPolicyTOSText","s")%>  
          </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> 
		<select name="TOS" size="1" MAXLENGTH="1">
    		<option value="0" <% if tcWebApi_get("RoutePolicy_Entry","TOS","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyTOS0Text","s")%></option>
    		<option value="1" <% if tcWebApi_get("RoutePolicy_Entry","TOS","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyTOS1Text","s")%></option>
    		<option value="2" <% if tcWebApi_get("RoutePolicy_Entry","TOS","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyTOS2Text","s")%></option>
    		<option value="3" <% if tcWebApi_get("RoutePolicy_Entry","TOS","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyTOS3Text","s")%></option>
    		<option value="4" <% if tcWebApi_get("RoutePolicy_Entry","TOS","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyTOS4Text","s")%></option>
    		<option value="5" <% if tcWebApi_get("RoutePolicy_Entry","TOS","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyTOS5Text","s")%></option>
    	</select>
		</td>
      </tr>
<% if TCWebApi_get("WebCustom_Entry","isUrlPolicySupported","h" ) = "Yes" then %>
    	<tr id="urlshow"> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","RtPolicyURLText","s")%>  </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="urlvalue" SIZE="64" MAXLENGTH="64" VALUE="<%If tcWebApi_get("RoutePolicy_Entry","URL","h") <> "N/A" then tcWebApi_get("RoutePolicy_Entry","URL","s") end if%>" >
        </td>
      </tr>
<% end if %>
    <tr> 
        <td height="30" class="title-main"><%tcWebApi_get("String_Entry","RtPolicyGatewayText","s")%>  </td>
        <td>&nbsp;</td>
        <td ><hr noshade></td>
				<td ><hr noshade></td>
				<td ><hr noshade></td>
			</tr>

      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange">&nbsp;</td>
        <td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","RtPolicyInterfaceText","s")%>  
          </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> 
        	<select name="PolicyWanPVCIndex" size="1" >
        		<option value="0" <% if tcWebApi_get("RoutePolicy_Entry","PolicyPVC","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyInterface0Text","s")%></option>
        		<option value="1" <% if tcWebApi_get("RoutePolicy_Entry","PolicyPVC","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyInterface1Text","s")%></option>
        		<option value="2" <% if tcWebApi_get("RoutePolicy_Entry","PolicyPVC","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyInterface2Text","s")%></option>
        		<option value="3" <% if tcWebApi_get("RoutePolicy_Entry","PolicyPVC","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyInterface3Text","s")%></option>
        		<option value="4" <% if tcWebApi_get("RoutePolicy_Entry","PolicyPVC","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyInterface4Text","s")%></option>
        		<option value="5" <% if tcWebApi_get("RoutePolicy_Entry","PolicyPVC","h") = "5" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyInterface5Text","s")%></option>
        		<option value="6" <% if tcWebApi_get("RoutePolicy_Entry","PolicyPVC","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyInterface6Text","s")%></option>
        		<option value="7" <% if tcWebApi_get("RoutePolicy_Entry","PolicyPVC","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","RtPolicyInterface7Text","s")%></option>
        	</select>	
        </td>
      </tr>
    </table>
  

 	<table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="150" class="light-orange">&nbsp;</td><td width="10"  class="light-orange"></td><td width="150">&nbsp;</td><td width="10" >&nbsp;</td><td width="440">&nbsp;</td></tr></table><table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr height="42" >
    <td width="160">&nbsp;</td><td width="160" class="orange">&nbsp;</td><td width="440" class="orange">
        <INPUT TYPE="button" NAME="SaveBtn" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="uiSave()">
        <input type="HIDDEN" name="RPSaveFlag" value="0"> 
        <INPUT TYPE="button" NAME="lan_cancel" VALUE="<%tcWebApi_get("String_Entry","ButtonCancelText","s")%>" onclick="javascript:window.location='adv_routepolicy.asp'"></td></tr></table></div></form></body>
</html>
