<%
If Request_Form("SaveFlag")="1" Then
	TCWebApi_set("Upnpd_Entry","Active","UPnP_active")
TCWebApi_set("Upnpd_Entry","autoconf","UPnP_auto")
if tcwebApi_get("WebCustom_Entry","isUpnpEnhanceSupport","h") = "Yes" then
TCWebApi_set("Upnpd_Entry","ExtSecFlag","ExtSec")
end if
tcWebApi_commit("Upnpd_Entry")
End If	
%>

<%
If Request_form("delnum") <> "" then
   	TCWebApi_set("UpnpdRule_Common","Num","delnum")
	TCWebApi_commit("UpnpdRule_Common")
End If
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<style  type="text/css">

*{color:  #404040;}

</style>
</head>

<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script language="JavaScript">

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

function showTable(id,header,data,keyIndex){
	var html = ["<table id=client_list  border=0  cellpadding=1 cellspacing=0  bordercolor=#CCCCCC "];
	// 1.generate table header
	html.push("<tr bgcolor=#FFFFFF height=35>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + "  align=center class=tabdata>" +"<STRONG><FONT color=#000000>" +header[i][1] + "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
	for(var i =0; i<data.length; i++){
		if(data[i][keyIndex] != "N/A"){
			html.push("<tr bgcolor=#FFFFFF height=35 id=tablebutton>");
			for(var j=0; j<(data[i].length - 1); j++){
				html.push("<td align=center id=topborderstyle>" + data[i][j] + "</td>");
			}
			html.push('<td align=center id=topborderstyle> <INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","UPNPList6Text","s")%>" onClick=doDelete(' + data[i][j] + ');> </td>');
			html.push("</tr>");
		}
	}
	html.push("</table>");
	document.getElementById(id).innerHTML = html.join('');
}

function doDelete(i)
 {
 	document.UPnP_form.delnum.value=i;
	document.UPnP_form.submit();
}

function upnpOff(off)
{
	if(off)
	{
		document.getElementById("gleaf1").style.display="none";
		<%if tcwebApi_get("WebCustom_Entry","isUpnpEnhanceSupport","h") = "Yes" then%>
		document.getElementById("gleaf2").style.display="none";
		<%end if%>
		document.getElementById("upnp_list").style.display="none";
	}
	else
	{
		document.getElementById("gleaf1").style.display="";
		<%if tcwebApi_get("WebCustom_Entry","isUpnpEnhanceSupport","h") = "Yes" then%>
		document.getElementById("gleaf2").style.display="";
		<%end if%>
		document.getElementById("upnp_list").style.display="";
	}
}
function doSubmit()
{
showSpin();//cindy add 
document.UPnP_form.SaveFlag.value = 1;
document.UPnP_form.submit();
}
</script>

	<body ><!--amy remove onLoad="if(document.UPnP_form.elements[1].checked) upnpOff(1); else upnpOff(0)"  0313-->
		<FORM METHOD="POST" ACTION="/cgi-bin/access_upnp.asp" name="UPnP_form">
			<div id="pagestyle"><!--cindy add for border 11/28-->
				<div id="contenttype">
				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
						<tr height="25px" class="bgcolor">
							
							<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","UPNPPlugText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
						<tr height="30px">
						    	<td width="20px">&nbsp;</td>
						    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UPNPText","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT TYPE="RADIO" NAME="UPnP_active" VALUE="Yes" onClick="upnpOff(0)" <% If TCWebApi_get("Upnpd_Entry","Active","h") = "Yes" then asp_Write("checked") end if%> >         
						     		<%tcWebApi_get("String_Entry","UPNPActivatedText","s")%> 
						     		
								&nbsp;&nbsp;&nbsp;
				        			<INPUT TYPE="RADIO" NAME="UPnP_active" VALUE="No" onClick="upnpOff(1)" <% If TCWebApi_get("Upnpd_Entry","Active","h") = "No" then asp_Write("checked") end if%> >         
				        			<%tcWebApi_get("String_Entry","UPNPDeactivatedText","s")%> 
							</td>
						</tr>
						<!--amy modified start 0313-->
						<% If TCWebApi_get("Upnpd_Entry","Active","h") = "Yes" then %>
							<tr height="30px" id="gleaf1">
						<% else %>
							<tr height="30px" id="gleaf1" style="display:none;">
						<% end if %>
						<!--amy modified end 0313-->
						    	<td width="20px">&nbsp;</td>
						    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UPNPconfiguredText","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT NAME="UPnP_auto" TYPE="RADIO" VALUE="1" <% If TCWebApi_get("Upnpd_Entry","autoconf","h") = "1" then asp_Write("checked") end if%> >        
					         		<%tcWebApi_get("String_Entry","UPNPActivatedText","s")%>
					         		
					         		&nbsp;&nbsp;&nbsp;
					        		<INPUT TYPE="RADIO" NAME="UPnP_auto" VALUE="0" <% If TCWebApi_get("Upnpd_Entry","autoconf","h") = "0" then asp_Write("checked") end if%> >         <%tcWebApi_get("String_Entry","UPNPDeactivatedText","s")%> &nbsp; 
					         		<%tcWebApi_get("String_Entry","UPNPCommentText","s")%> 
							</td>
						</tr>
				         
						<%if tcwebApi_get("WebCustom_Entry","isUpnpEnhanceSupport","h") = "Yes" then%>
							<!--amy modified start 0313-->
							<% If TCWebApi_get("Upnpd_Entry","Active","h") = "Yes" then %>
								<tr height="30px" id="gleaf2">
							<% else %>
								<tr height="30px" id="gleaf2" style="display:none;">
							<% end if %>
							<!--amy modified end 0313-->
							    	<td width="20px">&nbsp;</td>
							    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","UPNPExtSecText","s")%></td>
							     	<td align=left class="tabdata">
							     		<INPUT NAME="ExtSec" TYPE="RADIO" VALUE="Yes" <% If TCWebApi_get("Upnpd_Entry","ExtSecFlag","h") = "Yes" then asp_Write("checked") end if%> >        
					         			<%tcWebApi_get("String_Entry","UPNPActivatedText","s")%> 
					         			
					        			<INPUT NAME="ExtSec" TYPE="RADIO" VALUE="No" <% If TCWebApi_get("Upnpd_Entry","ExtSecFlag","h") = "No" then asp_Write("checked") elseif TCWebApi_get("Upnpd_Entry","ExtSecFlag","h") = "N/A" then asp_Write("checked") end if%> >         <%tcWebApi_get("String_Entry","UPNPDeactivatedText","s")%> &nbsp; 
					         			<%tcWebApi_get("String_Entry","UPNPCommentText","s")%> 
								</td>
							</tr>
						<%end if%>
					</table>
				</div>

				<div id="block1">
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
						<tr height="25px">
							
							<td align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%></td>
						</tr>
					</table>	
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
						<tr height="40px" id="buttoncolor">
							<td width="20px">&nbsp;</td>
							<td align=left class="tabdata">
								<INPUT TYPE="button" NAME="SaveBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="doSubmit();">
								<INPUT TYPE="HIDDEN" NAME="SaveFlag" VALUE="0">
							</td>
							<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
						</tr>
					</table>
				</div>
			<!--amy modified start 0313-->
			<% If TCWebApi_get("Upnpd_Entry","Active","h") = "Yes" then %>	
				<div id="upnp_list">
			<% else %>
				<div id="upnp_list" style="display:none;">
			<% end if %>
			<!--amy modified end 0313-->
					<div id="block1">
					<table width="640" border="0" cellpadding="0" cellspacing="0"  class="tabdata"  style="margin:5px 0px;">
						<tr height="25px" class="bgcolor">
								<td align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","UPNPListTitleText","s")%></td> 
						</tr>
					</table>
					<table width="640" border="0" cellpadding="0" cellspacing="0"  class="tabdata" style="table-layout: fixed;" >
						<tr height="30px">
							
							<td colspan="2" align=left class="tabdata">
								<INPUT TYPE="HIDDEN" NAME="delnum">
								<div class="configstyle">
								<div id=upnpdList></div>
								</div>
							</td>
						</tr>
					</table>
					</div>
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
				
			<script language=JavaScript>
				var tableHeader = [
					["40","<%tcWebApi_get("String_Entry","UPNPListIndexText","s")%>"],
					["120","<%tcWebApi_get("String_Entry","UPNPList1Text","s")%>"],
					["100","<%tcWebApi_get("String_Entry","UPNPList2Text","s")%>"],
					["100","<%tcWebApi_get("String_Entry","UPNPList3Text","s")%>"],
					["100","<%tcWebApi_get("String_Entry","UPNPList4Text","s")%>"],
					["80","<%tcWebApi_get("String_Entry","UPNPList5Text","s")%>"]
				];

				var tableData = [
					["1", "<%tcWebApi_get("UpnpdRule_Entry0", "IP_Addr","s")%>","<%tcWebApi_get("UpnpdRule_Entry0", "Protocol","s")%>","<%tcWebApi_get("UpnpdRule_Entry0", "Inter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry0", "Exter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry0", "rNum","s")%>"],
					["2", "<%tcWebApi_get("UpnpdRule_Entry1", "IP_Addr","s")%>","<%tcWebApi_get("UpnpdRule_Entry1", "Protocol","s")%>","<%tcWebApi_get("UpnpdRule_Entry1", "Inter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry1", "Exter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry1", "rNum","s")%>"],
					["3", "<%tcWebApi_get("UpnpdRule_Entry2", "IP_Addr","s")%>","<%tcWebApi_get("UpnpdRule_Entry2", "Protocol","s")%>","<%tcWebApi_get("UpnpdRule_Entry2", "Inter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry2", "Exter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry2", "rNum","s")%>"],
					["4", "<%tcWebApi_get("UpnpdRule_Entry3", "IP_Addr","s")%>","<%tcWebApi_get("UpnpdRule_Entry3", "Protocol","s")%>","<%tcWebApi_get("UpnpdRule_Entry3", "Inter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry3", "Exter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry3", "rNum","s")%>"],
					["5", "<%tcWebApi_get("UpnpdRule_Entry4", "IP_Addr","s")%>","<%tcWebApi_get("UpnpdRule_Entry4", "Protocol","s")%>","<%tcWebApi_get("UpnpdRule_Entry4", "Inter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry4", "Exter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry4", "rNum","s")%>"],
					["6", "<%tcWebApi_get("UpnpdRule_Entry5", "IP_Addr","s")%>","<%tcWebApi_get("UpnpdRule_Entry5", "Protocol","s")%>","<%tcWebApi_get("UpnpdRule_Entry5", "Inter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry5", "Exter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry5", "rNum","s")%>"],
					["7", "<%tcWebApi_get("UpnpdRule_Entry6", "IP_Addr","s")%>","<%tcWebApi_get("UpnpdRule_Entry6", "Protocol","s")%>","<%tcWebApi_get("UpnpdRule_Entry6", "Inter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry6", "Exter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry6", "rNum","s")%>"],
					["8", "<%tcWebApi_get("UpnpdRule_Entry7", "IP_Addr","s")%>","<%tcWebApi_get("UpnpdRule_Entry7", "Protocol","s")%>","<%tcWebApi_get("UpnpdRule_Entry7", "Inter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry7", "Exter_Port","s")%>","<%tcWebApi_get("UpnpdRule_Entry7", "rNum","s")%>"]
				];

				showTable('upnpdList',tableHeader,tableData,2);
			</script>
		</form>
	</body>
</html>
