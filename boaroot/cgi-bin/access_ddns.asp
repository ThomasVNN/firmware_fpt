<%
If Request_Form("SaveFlag") = "1" Then 
	TCWebApi_set("Ddns_Entry","Active","Enable_DyDNS")
	TCWebApi_set("Ddns_Entry","SERVERNAME","ddns_ServerName")
	TCWebApi_set("Ddns_Entry","MYHOST","sysDNSHost")
	TCWebApi_set("Ddns_Entry","USERNAME","sysDNSUser")
	TCWebApi_set("Ddns_Entry","PASSWORD","sysDNSPassword")
	TCWebApi_set("Ddns_Entry","WILDCARD","Enable_Wildcard")
  	tcWebApi_commit("Ddns_Entry")

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
<script language="JavaScript" src="OutVariant.asp"></script>

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

function ddnsSwitch(on_off)
{	//amy modified start 2017-12-15.
/*	if(on_off == 0)
		for(i = 2; i < 8; i++)
			document.DDNS_form.elements[i].disabled = true;
	else
		for(i = 2; i < 9; i++)
			document.DDNS_form.elements[i].disabled = false;*/
		
	if(on_off)
		
		document.getElementById("ddns_active").style.display="block";
	else
		document.getElementById("ddns_active").style.display="none";
		
	//amy modified end 2017-12-15.	
}

function checkSubmit()
{
	if(document.DDNS_form.elements[0].checked)
	{
		for(i = 3; i < 6; i++)
		{
			if(document.DDNS_form.elements[i].value.length == 0)
			{
				alert('<%tcWebApi_get("String_Entry","dyDNSJS0Text","s")%>');
				document.DDNS_form.elements[i].focus();
				return false;
			}
		}
		if(invalidCharCheck(document.DDNS_form.sysDNSHost) ) 
			return false;
		if(invalidCharCheck(document.DDNS_form.sysDNSUser) ) 
			return false;
		if(invalidCharCheck(document.DDNS_form.sysDNSPassword) ) 
			return false;
	}
	showSpin();//cindy add 
	document.DDNS_form.SaveFlag.value = 1;
	document.DDNS_form.submit();
}
function invalidCharCheck(object)
{
	var len = object.value.length;
	var c;
	var i;
    for (i = 0; i < len; i++)
    {
	 	 var c = object.value.charAt(i);
      
	 	 if (c == '"' || c == ':' || c == '&' || c == '\'' || c == '(' || c== ')' || c==';' || c=='`' || c =='|' || c=='\\')
		 {
				alert('<%tcWebApi_get("String_Entry","dyDNSJS1Text","s")%>');      	  								    	    	   		
		 		return true;
		 }
    }
    
	return false;
}

function doLoad()
{
//	if(!document.DDNS_form.elements[0].checked)
//		ddnsSwitch(0); //amy removed 0313
	
	if(document.DDNS_form.sysDNSPassword != null)
		document.DDNS_form.sysDNSPassword.value = ddnsPwd;
}
</script>

<body onLoad="doLoad()">
		<FORM METHOD="POST" ACTION="/cgi-bin/access_ddns.asp" name="DDNS_form">
			<div id="pagestyle"><!--cindy add for border 11/28-->
			<div id="contenttype">
				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">

						<tr height="25px" class="bgcolor">

							<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></td>
						</tr>
					</table>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						<tr height="30px">

						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","dyDNS1Text","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT NAME="Enable_DyDNS" TYPE="RADIO" onClick="ddnsSwitch(1)" VALUE="Yes" <% If TCWebApi_get("Ddns_Entry","Active","h") = "Yes" then asp_Write("checked") end if%> >		 
								<%tcWebApi_get("String_Entry","dyDNSActivatedText","s")%> 

								&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="Enable_DyDNS" VALUE="No" <% If TCWebApi_get("Ddns_Entry","Active","h") = "No" then asp_Write("checked") end if%> onClick="ddnsSwitch(0)">		 
								<%tcWebApi_get("String_Entry","dyDNSDeactivatedText","s")%>  
							</td>
 						</tr>
					</table>
					<!--amy modified start 0313-->
					<% if TCWebApi_get("Ddns_Entry","Active","h") = "Yes" then %>
						<div id="ddns_active" >
					<% else %>
						<div id="ddns_active" style="display:none;">
					<% end if%>
					<!--amy modified end 0313-->
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						<tr height="30px">

						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","dyDNSServiceProviderText","s")%> </td>
						     	<td align=left class="tabdata">
								<SELECT NAME="ddns_ServerName" SIZE="1">
								 <option value="www.dyndns.org" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.dyndns.org" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","dyDNSWebSiteText","s")%>
								 <option value="www.tzo.net" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.tzo.net" then asp_Write("selected") end if %>>www.tzo.net
								 <option value="www.zoneedit.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.zoneedit.com" then asp_Write("selected") end if %>>www.zoneedit.com
								 <option value="www.dhs.org" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.dhs.org" then asp_Write("selected") end if %>>www.dhs.org
																	 
								 <!--cindy add start-->
								 <option value="www.changeip.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.changeip.com" then asp_Write("selected") end if %>>www.changeip.com
								 <%if tcWebApi_get("WebCustom_Entry","isNOIPSupported","h") = "Yes" then%>
								 <option value="www.noip.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.noip.com" then asp_Write("selected") end if %>>www.noip.com
								 <% end if %>
								 <!--cindy add end-->
																	 
								  	<%if tcWebApi_get("WebCustom_Entry","isC2TrueSupported","h") <> "Yes" then%>
								 <option value="www.hn.org" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.hn.org" then asp_Write("selected") end if %>>www.hn.org
								 <option value="www.ez-ip.net" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.ez-ip.net" then asp_Write("selected") end if %>>www.ez-ip.net
								  	<% end if %>
								 <option value="www.easydns.com" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.easydns.com" then asp_Write("selected") end if %>>www.easydns.com
													 				
								 <!-- 	<%if tcWebApi_get("WebCustom_Entry","isNOIPSupported","h") = "Yes" then%>
								 <option value="www.no-ip.net" <% if tcWebApi_get("Ddns_Entry","SERVERNAME","h") = "www.no-ip.com" then asp_Write("selected") end if %>>www.no-ip.com
								 	  <% end if %>-->
								</SELECT>
							</td>
						</tr>

						<tr height="30px">
						    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","dyDNSHostNameText","s")%> </td>
						     	<td align=left class="tabdata">
						     		<INPUT TYPE="TEXT" NAME="sysDNSHost" SIZE="32" MAXLENGTH="63" VALUE="<% If TCWebApi_get("Ddns_Entry","MYHOST","h") <> "N/A" then TCWebApi_get("Ddns_Entry","MYHOST","s") end if%>" >
							</td>
						</tr>

						<tr height="30px">
						    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","dyDNSUsernameText","s")%> </td>
						     	<td align=left class="tabdata">
						     		<INPUT TYPE="TEXT" NAME="sysDNSUser" SIZE="32" MAXLENGTH="31" VALUE="<% If TCWebApi_get("Ddns_Entry","USERNAME","h") <> "N/A" then TCWebApi_get("Ddns_Entry","USERNAME","s") end if%>" >
							</td>
						</tr>

						<tr height="30px">
						    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","dyDNSPasswordText","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT TYPE="PASSWORD" NAME="sysDNSPassword" SIZE="32" MAXLENGTH="31" VALUE="" >
							</td>
						</tr>

						<tr height="30px">
						    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","dyDNSWildcardText","s")%></td>
						     	<td align=left class="tabdata">
						     		<input type="RADIO" name="Enable_Wildcard" value="Yes" <% If TCWebApi_get("Ddns_Entry","WILDCARD","h") = "Yes" then asp_Write("checked") end if%> >
       								<%tcWebApi_get("String_Entry","dyDNSYesText","s")%> 
						       	
						        	&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="Enable_Wildcard" VALUE="No" <% If TCWebApi_get("Ddns_Entry","WILDCARD","h") = "No" then asp_Write("checked") end if%> >  
						        	<%tcWebApi_get("String_Entry","dyDNSNoText","s")%> 
							</td>
						</tr>

						
					</table>

					<!--Foxconn alan add for DDNS result table (20190216)-->
					<% if TCWebApi_get("Ddns_Entry","Active","h") = "Yes" then %>
						<div id="ddns_result" >
					<% else %>
						<div id="ddns_result" style="display:none;">
					<% end if%>
					
						<table width="640px" border="0"  cellpadding="0" cellspacing="0" class="tabdata" style="margin:5px 0px;">
							<tr height="25px" class="bgcolor">
								<td align=left class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","dyDNSReportingText","s")%></td>
							</tr>
						</table>
						
  					<div class="configstyle">
       				<table width="600"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC"  >
					<tr  bgcolor=#FFFFFF height=35><td width="190" align=center class="tabdata" ><strong><%tcWebApi_get("String_Entry","dyDNSReportedAddressText","s")%></strong></td>
						<td width="190" align=center class="tabdata"><strong><%tcWebApi_get("String_Entry","dyDNSReportedTimeText","s")%></strong></td>
						<td width="160" align=center class="tabdata"><strong><%tcWebApi_get("String_Entry","dyDNSReportstatusText","s")%></strong> </td>
					</tr>
					<tr  bgcolor=#FFFFFF height=35><td width="190" align=center class="tabdata" ><%If tcWebApi_get("DdnsReport","Address","h") <> "N/A" Then tcWebApi_get("DdnsReport","Address","s") end if%></td>
						<td width="190" align=center class="tabdata"><%tcWebApi_get("DdnsReport","Time","s")%></td>
						<td width="160" align=center class="tabdata"><%tcWebApi_get("DdnsReport","Status","s")%></td>
					</tr>
					</table>
					</div>
					<!--Foxconn alan add for DDNS result table (20190216)-->	
					</div>
				</div>
			</div><!--block1-->

				<div id="button0">
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
						
						<tr height="25px">
							<td  align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						<tr height="40px">
							
							<td colspan="2" align=left class="tabdata" style="padding-left:20px;">
								<INPUT TYPE="SUBMIT" NAME="SaveBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick=" return checkSubmit()">
								<INPUT TYPE="HIDDEN" NAME="SaveFlag" VALUE="0">	
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
		</form>
	</body>
</html>
