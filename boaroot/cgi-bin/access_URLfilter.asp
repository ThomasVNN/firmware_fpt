<%
if request_Form("Duplicate")="1" then
	TCWebAPI_unset("UrlFilter_Entry")
	TCWebAPI_commit("UrlFilter_Entry")
	tcWebApi_set("UrlFilter_Common","Duplicate","NoDup")
end if
if request_form("UrlFilter_index") <> "" Then
	tcWebApi_set("WebCurSet_Entry","url_filter_id","UrlFilter_index")
	tcWebApi_set("GUITemp_Entry0","IndexTmp","UrlFilter_index")
end if

if request_form("Save_or_Delete") = "1" Then 
	tcWebApi_set("UrlFilter_Common","Activate","RuleIndex_active")
	tcWebApi_set("UrlFilter_Entry","URL","UrlFilter_URL")
	tcWebApi_set("UrlFilter_Entry","Activate","SingleRule_active")
	tcWebApi_commit("UrlFilter")
elseif request_form("Save_or_Delete") = "2" Then 
	tcWebApi_unset("UrlFilter_Entry")
	tcWebApi_commit("UrlFilter")
End If

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<META http-equiv=Content-Script-Type content=text/javascript>
<META http-equiv=Content-Style-Type content=text/css>
<META http-equiv=Content-Type content="text/html; charset=&#10;<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<script language="JavaScript" type="text/javascript" src="/general.js"></script>

<style  type="text/css">

*{color:  #404040;}

</style>

<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<SCRIPT language="javascript" type="text/javascript">

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


var ary_url = [
				["<% tcWebApi_get("UrlFilter_Entry0", "Activate", "s") %>", "<% tcWebApi_get("UrlFilter_Entry0", "URL", "s") %>"],
				["<% tcWebApi_get("UrlFilter_Entry1", "Activate", "s") %>", "<% tcWebApi_get("UrlFilter_Entry1", "URL", "s") %>"],
				["<% tcWebApi_get("UrlFilter_Entry2", "Activate", "s") %>", "<% tcWebApi_get("UrlFilter_Entry2", "URL", "s") %>"],
				["<% tcWebApi_get("UrlFilter_Entry3", "Activate", "s") %>", "<% tcWebApi_get("UrlFilter_Entry3", "URL", "s") %>"],
				["<% tcWebApi_get("UrlFilter_Entry4", "Activate", "s") %>", "<% tcWebApi_get("UrlFilter_Entry4", "URL", "s") %>"],
				["<% tcWebApi_get("UrlFilter_Entry5", "Activate", "s") %>", "<% tcWebApi_get("UrlFilter_Entry5", "URL", "s") %>"],
				["<% tcWebApi_get("UrlFilter_Entry6", "Activate", "s") %>", "<% tcWebApi_get("UrlFilter_Entry6", "URL", "s") %>"],
				["<% tcWebApi_get("UrlFilter_Entry7", "Activate", "s") %>", "<% tcWebApi_get("UrlFilter_Entry7", "URL", "s") %>"]
			];
var	strActive = new Array("<%tcWebApi_get("String_Entry","URLfilterYesText","s")%>", "<%tcWebApi_get("String_Entry","URLfilterNoText","s")%>");
var n = 0;
var url_obj = new Array(new Array);
for (var i=0; i<ary_url.length; i++)
{
	if ("1" == ary_url[i][0])	
		url_obj[i] = [strActive[0], ary_url[i][1]];
	else
		url_obj[i] = [strActive[1], ary_url[i][1]];
}
function writeUrlTable()
{
	if ('undefined' == typeof(url_obj[0][0])) return;
	var strtemp = "";
	for (var i=0; i<url_obj.length; i++) {
		if (url_obj[i][1] != "" && url_obj[i][1] != "N/A") {
			strtemp += '<tr height=30><td align="center" class="topborderstyle">' + (i+1) + '</td>\n';
			strtemp += '<td align="center" class="topborderstyle">' + url_obj[i][0] + '</td>\n';
			strtemp += '<td align="center" class="topborderstyle">' + url_obj[i][1] + '</td></tr>\n';
		}
	}
	document.write(strtemp);
}
function switchFilterType(object)
{
  var index = object.selectedIndex;
	switch(index)
	{
		case 0:
			window.location='access_ipfilter.asp';
			break;
	/*	case 1:
			window.location='access_appfilter.asp';
			break;
			*/
	}
}
//amy add start 
/*
function UrlfilterOnOff(off)
{
	if(off)
		{
		
		document.UrlFilterform.UrlFilter_index.disabled=true;
		document.UrlFilterform.SingleRule_active[0].disabled=true;
		document.UrlFilterform.SingleRule_active[1].disabled=true;
		document.UrlFilterform.UrlFilter_URL.disabled=true;
		
	//	document.getElementById("div_ruleIndex").style.display="none";
	//	document.getElementById("div_urltxt").style.display="none";
	//	document.getElementById("div_urltable").style.display="none";
	//	document.UrlFilterform.UrlFilterDelete.disabled=true;
	//	document.getElementById("del").style.display="none";
	//	document.getElementById("div_del").style.display="none";
	//	document.getElementById("div_save").style.display="";
		//setDisplay('div_ruleIndex',0);
		//setDisplay('div_ruleIndex',0);
		//setDisplay('div_urltable',0);
		}
	else
		{
		
		document.UrlFilterform.UrlFilter_index.disabled=false;
		document.UrlFilterform.SingleRule_active[0].disabled=false;
		document.UrlFilterform.SingleRule_active[1].disabled=false;
		if(document.UrlFilterform.SingleRule_active[0].checked)
			document.UrlFilterform.UrlFilter_URL.disabled=false;
		else
			document.UrlFilterform.UrlFilter_URL.disabled=true;
	
		/*
		setDisplay('div_ruleIndex',1);
		if(document.UrlFilterform.SingleRule_active[0].checked)
			setDisplay('div_urltxt',1);
		else
			setDisplay('div_urltxt',0);
		setDisplay('div_urltable',1);
		
		document.getElementById("div_ruleIndex").style.display="block";
		if(document.UrlFilterform.SingleRule_active[0].checked)
			document.getElementById("div_urltxt").style.display="block";
		else
			document.getElementById("div_urltxt").style.display="none";
		document.getElementById("div_urltable").style.display="block";
		document.getElementById("del").style.display="";
		document.getElementById("div_del").style.display="";
		document.getElementById("div_save").style.display="none";
		*/
		
		/*}
		
		
}*/
function UrlfilterOnOff(off)
{
	if(off)
		{
	
		document.getElementById("div_ruleIndex").style.display="none";
		document.getElementById("div_urltxt").style.display="none";
		document.getElementById("div_urltable").style.display="none";
	//	document.getElementById("del").style.display="none";
		document.getElementById("div_del").style.display="none";
		document.getElementById("div_save").style.display="";

		}
	else
		{
	
		
		document.getElementById("div_ruleIndex").style.display="";
		if(document.UrlFilterform.SingleRule_active[0].checked)
			document.getElementById("div_urltxt").style.display="";
		else
			document.getElementById("div_urltxt").style.display="none";
		document.getElementById("div_urltable").style.display="";
	//	document.getElementById("del").style.display="";
		document.getElementById("div_del").style.display="";
		document.getElementById("div_save").style.display="none";
		
		}
		
		
}
function SingleRuleOnOff(off)
{
	if(off)
		document.getElementById("div_urltxt").style.display="none";
	//	document.UrlFilterform.UrlFilter_URL.disabled=true;
	else
		document.getElementById("div_urltxt").style.display="";
	//	document.UrlFilterform.UrlFilter_URL.disabled=false;
		
}
//amy add end.

function doDel()
{
document.UrlFilterform.Save_or_Delete.value = 2;

}
function doSubmit(){
	var str=UrlFilterform.UrlFilter_URL.value;
	var lower_str;

	lower_str = str.toLowerCase();
	str = lower_str;
	UrlFilterform.UrlFilter_URL.value = lower_str;

	if ((UrlFilterform.SingleRule_active[1].checked) && (str.length == 0)) {
		//alert("set switch for each");
	}
	else {
		if (str.length > 48 || isValidUrlName(str) == false){
			alert("<%tcWebApi_get("String_Entry","URLfilterWrongUrl","s")%>");
			return false;
		}	
	}
	showSpin();//cindy add
	document.UrlFilterform.Save_or_Delete.value = 1;
	document.UrlFilterform.submit();
}

function init()
{
//	if(document.UrlFilterform.RuleIndex_active[0].checked) //amy add start.
//		UrlfilterOnOff(0);
//	else
//		UrlfilterOnOff(1); //amy add end. amy removed 0313.
	if(document.forms[0].Duplicate.value == 1)
	{
		alert("<%tcWebApi_get("String_Entry","URLfilterDuplicateUrl","s")%>");
		document.forms[0].submit();
	}
}
</SCRIPT>

<META content="MSHTML 6.00.2900.3059" name=GENERATOR></HEAD>

<BODY onLoad="init();">
<FORM name=UrlFilterform action="/cgi-bin/access_URLfilter.asp" method=post>
			<div id="pagestyle"><!--cindy add for border 11/28-->
				<div id="contenttype">
				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;" >
						

						<tr height="25px" class="bgcolor">

							<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterTypeText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata"  >
						<tr height="30px">

						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterTypeSelectionText","s")%></td>
						     	<td align=left class="tabdata">
							<SELECT onchange=switchFilterType(this) size=1 name=FILTERTYPE_index>
								<OPTION ><%tcWebApi_get("String_Entry","URLfilterType0Text","s")%>
								<OPTION SELECTED><%tcWebApi_get("String_Entry","URLfilterType2Text","s")%>
				    			</SELECT>
							</td>
						</tr>
					</table>
				</div>
				
				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;" >
						<tr height="25px" class="bgcolor">

							<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterEditingText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata"  >
						<tr height="30px">
    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterActiveText","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT type=radio <% if tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then asp_Write("checked") end if %> value=1 name=RuleIndex_active onClick="UrlfilterOnOff(0)">  <%tcWebApi_get("String_Entry","URLfilterYesText","s")%>  
    							&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=radio <% if tcWebApi_get("UrlFilter_Common","Activate","h") = "0" then asp_Write("checked") end if 
					    							 	 if tcWebApi_get("UrlFilter_Common","Activate","h") = "N/A" then asp_Write("checked") end if %> value=0 name=RuleIndex_active onClick="UrlfilterOnOff(1)">  <%tcWebApi_get("String_Entry","URLfilterNoText","s")%>
							</td>
						</tr>
					</table>
					<!--amy modified start 0313-->
					<% if tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then %>
						<div id="div_ruleIndex">
					<% else %>
						<div id="div_ruleIndex" style="display:none;">
					<% end if %>
					<!--amy modified end 0313-->
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >	
						<tr height="30px">
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterURLIndexText","s")%></td>
						     	<td align=left class="tabdata">
				    			 <SELECT NAME="UrlFilter_index" SIZE="1" onchange="document.UrlFilterform.submit();">
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "0" then asp_Write("selected") end if %> value="0">1
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "1" then asp_Write("selected") end if %> value="1">2
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "2" then asp_Write("selected") end if %> value="2">3
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "3" then asp_Write("selected") end if %> value="3">4
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "4" then asp_Write("selected") end if %> value="4">5
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "5" then asp_Write("selected") end if %> value="5">6
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "6" then asp_Write("selected") end if %> value="6">7
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "7" then asp_Write("selected") end if %> value="7">8
									<!-- Only Support 8 rules
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "8" then asp_Write("selected") end if %> value="8">9
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "9" then asp_Write("selected") end if %> value="9">10
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "10" then asp_Write("selected") end if %> value="10">11
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "11" then asp_Write("selected") end if %> value="11">12
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "12" then asp_Write("selected") end if %> value="12">13
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "13" then asp_Write("selected") end if %> value="13">14
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "14" then asp_Write("selected") end if %> value="14">15
				      				<OPTION <% if tcWebApi_get("WebCurSet_Entry","url_filter_id","h") = "15" then asp_Write("selected") end if %> value="15">16
									-->
				    			</SELECT>
							</td>
						</tr>

						<tr height="30px">
						    	
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterIndividualText","s")%></td>
						     	<td align=left class="tabdata">
						     		<INPUT type=radio <% if tcWebApi_get("UrlFilter_Entry","Activate","h") = "1" then asp_Write("checked") end if %> value=1 name=SingleRule_active onClick="SingleRuleOnOff(0)">  <%tcWebApi_get("String_Entry","URLfilterYesText","s")%>  
    								&nbsp;&nbsp;&nbsp;&nbsp;<INPUT type=radio <% if tcWebApi_get("UrlFilter_Entry","Activate","h") = "0" then asp_Write("checked") end if 
					    							 	 if tcWebApi_get("UrlFilter_Entry","Activate","h") = "N/A" then asp_Write("checked") end if %> value=0 name=SingleRule_active onClick="SingleRuleOnOff(1)">  <%tcWebApi_get("String_Entry","URLfilterNoText","s")%>
							</td>
						</tr>
						</table>
					</div>
					<!--amy modified start 0313-->
					<% if tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then %>
						<% if tcWebApi_get("UrlFilter_Entry","Activate","h") = "1" then %>
							<div id="div_urltxt">
						<% else %>
							<div id="div_urltxt" style="display:none;">
						<% end if %>
					<% else %>
						<div id="div_urltxt" style="display:none;">
					<% end if %>
					<!--amy modified end 0313-->
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
							<tr height="30px">
							    	
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterhostText","s")%></td>
							     	<td align=left class="tabdata">
    									<INPUT TYPE="TEXT" maxLength=49 size=48 name="UrlFilter_URL" VALUE="<% if tcWebApi_get("UrlFilter_Entry","URL","h") <> "N/A" then  tcWebApi_get("UrlFilter_Entry","URL","s") end if %>" > (maxlength:48)  
								</td>
							</tr>

							
						</table>
					</div>
				</div>
				<!--amy modified start 0313-->
				<% if tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then %>
					<div id="div_urltable">
				<% else %>
					<div id="div_urltable" style="display:none;">
				<% end if %>
				<!--amy modified end 0313-->
				<div id="block1">
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"  style="margin:5px 0px;">
						

						<tr height="25px" class="bgcolor">

							<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterListingText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF"  >
						<!--amy
						<tr height="30px">
    	
						    	<td colspan="2" align=left class="tabdata">
						    	-->
			<!--
    			<iframe src="/cgi-bin/access_urlfilterlist.cgi" frameborder="0" width="580" height="200"></iframe>
			-->			<tr>
						<td align=left class="tabdata">	
						<%if tcwebApi_get("UrlFilter_Common","Duplicate","h")<>"Yes" then %>
							<div class="configstyle">
								<table width="600" border="0"  cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#FFFFFF" >
								<tr height="30px">
				                			<td class=tabdata align=center width=30><STRONG><%tcWebApi_get("String_Entry","URLfilterCgiIndexText","s")%></STRONG></td>
									<td width=100 align=center class="tabdata"><strong><%tcWebApi_get("String_Entry","URLfilterCgiActiveText","s")%> </strong></td> 
									<td class=tabdata align=center width=460><STRONG>  
					                  					<%tcWebApi_get("String_Entry","URLfilterCgiURLText","s")%>  </STRONG>
									</td>
								</tr>
										
								<script language="JavaScript" type="text/JavaScript">
									writeUrlTable();
								</script>
								</table>
							</div>
						<%end if%>
							
						    	</td>						     	
						</tr>
    	
					
					</table>
				</div>
				</div>

				<div id="button0">
				<!--amy modified start 0313-->
				<% if tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then %>
					<div id="div_del">
				<% else %>
					<div id="div_del" style="display:none;">
				<% end if %>
				<!--amy modified end 0313-->
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">

    						<tr height="25px">
							<td align=left class="title-main" style="white-space:nowrap; padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterSaveDelText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
						<tr height="40px">
   
							<td width="250px" align=left class="tabdata" style="padding-left:20px;">
							    
								<INPUT type=button class="button1" value=<%tcWebApi_get("String_Entry","ButtonSaveText","s")%> name=UrlFilterApply onclick="doSubmit()">
								<INPUT type=submit class="button1"  value=<%tcWebApi_get("String_Entry","ButtonDeleteText","s")%> name=UrlFilterDelete onclick="doDel();">																					
								<INPUT type=reset class="button1" style="display:none" value=<%tcWebApi_get("String_Entry","ButtonCancelText","s")%> name=UrlFilterCancel> 
							</td>
							<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
						</tr>
					</table>
					</div>
					<!--amy modified start 0313-->
					<% if tcWebApi_get("UrlFilter_Common","Activate","h") = "1" then %>
						<div id="div_save" style="display:none;">
					<% else %>
						<div id="div_save">
					<% end if %>
					<!--amy modified end 0313-->
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">

    						<tr height="25px" class="bgcolor">
							<td align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","URLfilterSaveText","s")%></td>
						</tr>
					</table>
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >

						<tr height="40px"> 
							<td width="250px" align=left class="tabdata" style="padding-left:20px;">
								<INPUT type=button class="button1" value=<%tcWebApi_get("String_Entry","ButtonSaveText","s")%> name=UrlFilterApply onclick="doSubmit()">
							</td>
					</table>
					</div>
					
    					<INPUT TYPE="HIDDEN" NAME="Save_or_Delete" VALUE="0">
					<INPUT type="hidden" name="Duplicate" VALUE="<%if tcwebApi_get("UrlFilter_Common","Duplicate","h")="Yes" then asp_write("1") else asp_write("0") end if%>">
					<Input type="hidden" name="NoDup" value="No">
					
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
