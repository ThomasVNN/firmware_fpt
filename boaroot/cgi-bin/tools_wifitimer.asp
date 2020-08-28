<%
	If Request_Form("saveFlag") = "1" Then
		TCWebApi_set("WiFiTimer_Entry","Enable","wifitimer_enable")
		TCWebApi_set("WiFiTimer_Entry","StartTime","starttime")
		TCWebApi_set("WiFiTimer_Entry","EndTime","endtime")
		
		TCWebApi_set("WiFiTimer_Entry","Mon","mon_value")
		TCWebApi_set("WiFiTimer_Entry","Tue","tue_value")
		TCWebApi_set("WiFiTimer_Entry","Wed","wed_value")
		TCWebApi_set("WiFiTimer_Entry","Thu","thu_value")
		TCWebApi_set("WiFiTimer_Entry","Fri","fri_value")
		TCWebApi_set("WiFiTimer_Entry","Sat","sat_value")
		TCWebApi_set("WiFiTimer_Entry","Sun","sun_value")
		
		tcWebApi_commit("WiFiTimer_Entry")
	End If
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" href="/style.css" type="text/css">
		<script language="JavaScript" src="OutVariant.asp"></script>
		<script language="JavaScript" src="/general.js"></script>
		<script language="JavaScript" src="/jsl.js"></script>
		<script language="JavaScript" src="/ip.js"></script>
		<style  type="text/css">
			*{color:  #404040;}

		</style>

		<script type="text/javascript" src="/spin.js" ></script>
<script language="JavaScript">

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

function HiddenWiFiTimer(){
	if(document.tool_wifitimer.wifitimer_enable[0].checked)
		document.getElementById("hiddentimer").style.display="";
	else
		document.getElementById("hiddentimer").style.display="none";

}

function Timenumber(){
	var startnum=document.tool_wifitimer.starttime.value;
	var endnum=document.tool_wifitimer.endtime.value;
	var Stimedigits = startnum.split(":");
	var Stimenum1=Number(Stimedigits[0]);
	var Stimenum2=Number(Stimedigits[1]);

	var Etimedigits = endnum.split(":");
	var Etimenum1=Number(Etimedigits[0]);
	var Etimenum2=Number(Etimedigits[1]);
	if(document.tool_wifitimer.wifitimer_enable[0].checked)
	{
	if(startnum.indexOf(":")==-1)
	{
		alert("<%tcWebApi_get("String_Entry","WiFiTimerInvalid0Text","s")%>");
		return false;
	}
	if(endnum.indexOf(":")==-1)
	{
		alert("<%tcWebApi_get("String_Entry","WiFiTimerInvalid1Text","s")%>");
		return false;
	}
		if(!((Stimenum1>=0&&Stimenum1<=23)&&(Stimenum2>=0&&Stimenum2<=59)))
	{
		alert("<%tcWebApi_get("String_Entry","WiFiTimerInvalid0Text","s")%>");
		return false;
	}
		if(!((Etimenum1>=0&&Etimenum1<=23)&&(Etimenum2>=0&&Etimenum2<=59)))
	{
		alert("<%tcWebApi_get("String_Entry","WiFiTimerInvalid1Text","s")%>");
		return false;
	}
	}
	return true;	
}

function uiSave(){
	if(Timenumber()==false)
		return;
	
 	var mon = document.tool_wifitimer.mon;
 	var tue = document.tool_wifitimer.tue;
 	var wed = document.tool_wifitimer.wed;
 	var thu = document.tool_wifitimer.thu;
 	var fri = document.tool_wifitimer.fri;
 	var sat = document.tool_wifitimer.sat;
 	var sun = document.tool_wifitimer.sun;
	if(mon.checked)
		document.tool_wifitimer.mon_value.value=1;
	else
		document.tool_wifitimer.mon_value.value=0;
	
	if(tue.checked)
		document.tool_wifitimer.tue_value.value=1;
	else
		document.tool_wifitimer.tue_value.value=0;
	
	if(wed.checked)
		document.tool_wifitimer.wed_value.value=1;
	else
		document.tool_wifitimer.wed_value.value=0;
	
	if(thu.checked)
		document.tool_wifitimer.thu_value.value=1;
	else
		document.tool_wifitimer.thu_value.value=0;
	
	if(fri.checked)
		document.tool_wifitimer.fri_value.value=1;
	else
		document.tool_wifitimer.fri_value.value=0;
	
	if(sat.checked)
		document.tool_wifitimer.sat_value.value=1;
	else
		document.tool_wifitimer.sat_value.value=0;
	
	if(sun.checked)
		document.tool_wifitimer.sun_value.value=1;
	else
		document.tool_wifitimer.sun_value.value=0;

	if(document.tool_wifitimer.wifitimer_enable[0].checked)
	{
        	if(!(mon.checked||tue.checked||wed.checked||thu.checked||fri.checked||sat.checked||sun.checked))
        	{
		alert("<%tcWebApi_get("String_Entry","WiFiTimerInvalid3Text","s")%>");
		return;
        	}
	}
	showSpin();
	document.tool_wifitimer.saveFlag.value=1;
	document.tool_wifitimer.submit();
}		
			
</script>
	</head>

	<body onLoad="HiddenWiFiTimer()">
		<FORM METHOD="POST" ACTION="/cgi-bin/tools_wifitimer.asp" name="tool_wifitimer">
			<div id="pagestyle">
				<div id="contenttype">  
					<div id="block1">		
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed; margin:5px 0;">
							<tr height="25px" style="background-color:#e6e6e6;">
								<td align=left class="title-main" style="width:620px;padding-left:20px;">
									<%tcWebApi_get("String_Entry","WiFiTimerStatusText","s")%>
								</td>
							</tr>
						</table>
						
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
							<tr height="30px">
								<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WiFiTimerEnableStatusText","s")%></td>
								<td align=left class="tabdata">
									<INPUT TYPE="radio" NAME="wifitimer_enable" VALUE="1"  onClick="HiddenWiFiTimer();" <% if tcWebApi_get("WiFiTimer_Entry","Enable","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerEnableStatus0Text","s")%>&nbsp;&nbsp;&nbsp;&nbsp;         
									<INPUT TYPE="radio" NAME="wifitimer_enable" VALUE="0"  onClick="HiddenWiFiTimer();" <% if tcWebApi_get("WiFiTimer_Entry","Enable","h") = "0" then asp_Write("checked") end if %> <% if tcWebApi_get("WiFiTimer_Entry","Enable","h") = "N/A" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerEnableStatus1Text","s")%> 
								</td>
							</tr>
						</table>
					</div>
					
					<div id="block1">		
						<div id="hiddentimer">
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed; margin:5px 0;">
							<tr height="25px" style="background-color:#e6e6e6;">
								<td align=left class="title-main" style="width:620px;padding-left:20px;">
									<%tcWebApi_get("String_Entry","WiFiTimerControlText","s")%>
								</td>
							</tr>
						</table>
						
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
							<tr height="30px">
								<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WiFiTimerControl0Text","s")%></td>
								<td align=left class="tabdata">
									<INPUT TYPE="text" NAME="starttime" SIZE="7" MAXLENGTH="5"  VALUE="<%If tcWebApi_get("WiFiTimer_Entry","StartTime","h") <> "N/A" then tcWebApi_get("WiFiTimer_Entry","StartTime","s") else asp_Write("") end if%>" > <%tcWebApi_get("String_Entry","WiFiTimerInvalid2Text","s")%>    
								</td>
							</tr>
							
							<tr height="30px">
								<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WiFiTimerControl1Text","s")%></td>
								<td align=left class="tabdata">
									<INPUT TYPE="text" NAME="endtime" SIZE="7" MAXLENGTH="5"  VALUE="<%If tcWebApi_get("WiFiTimer_Entry","EndTime","h") <> "N/A" then tcWebApi_get("WiFiTimer_Entry","EndTime","s") else asp_Write("") end if%>" > <%tcWebApi_get("String_Entry","WiFiTimerInvalid2Text","s")%>    
								</td>
							</tr>
							
							<tr height="30px">
								<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WiFiTimerDateChooseText","s")%></td>
								<td align=left class="tabdata">
									<INPUT TYPE="checkbox" NAME="mon"   	<% if tcWebApi_get("WiFiTimer_Entry","Mon","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerDateChoose0Text","s")%>    
									<INPUT type="hidden" name="mon_value" value="<%if TCWebAPI_get("WiFiTimer_Entry", "Mon", "h")="1" then asp_write("1") else asp_write("0") end if%>">

									<INPUT TYPE="checkbox" NAME="tue"   	<% if tcWebApi_get("WiFiTimer_Entry","Tue","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerDateChoose1Text","s")%>    
									<INPUT type="hidden" name="tue_value" value="<%if TCWebAPI_get("WiFiTimer_Entry", "Tue", "h")="1" then asp_write("1") else asp_write("0") end if%>">

									<INPUT TYPE="checkbox" NAME="wed" <% if tcWebApi_get("WiFiTimer_Entry","Wed","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerDateChoose2Text","s")%>    
									<INPUT type="hidden" name="wed_value" value="<%if TCWebAPI_get("WiFiTimer_Entry", "Wed", "h")="1" then asp_write("1") else asp_write("0") end if%>">

									<INPUT TYPE="checkbox" NAME="thu"  <% if tcWebApi_get("WiFiTimer_Entry","Thu","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerDateChoose3Text","s")%>    
									<INPUT type="hidden" name="thu_value" value="<%if TCWebAPI_get("WiFiTimer_Entry", "Thu", "h")="1" then asp_write("1") else asp_write("0") end if%>">

									<INPUT TYPE="checkbox" NAME="fri"   <% if tcWebApi_get("WiFiTimer_Entry","Fri","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerDateChoose4Text","s")%>    
									<INPUT type="hidden" name="fri_value" value="<%if TCWebAPI_get("WiFiTimer_Entry", "Fri", "h")="1" then asp_write("1") else asp_write("0") end if%>">

									<INPUT TYPE="checkbox" NAME="sat" <% if tcWebApi_get("WiFiTimer_Entry","Sat","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerDateChoose5Text","s")%>    
									<INPUT type="hidden" name="sat_value" value="<%if TCWebAPI_get("WiFiTimer_Entry", "Sat", "h")="1" then asp_write("1") else asp_write("0") end if%>">

									<INPUT TYPE="checkbox" NAME="sun" <% if tcWebApi_get("WiFiTimer_Entry","Sun","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WiFiTimerDateChoose6Text","s")%>    
									<INPUT type="hidden" name="sun_value" value="<%if TCWebAPI_get("WiFiTimer_Entry", "Sun", "h")="1" then asp_write("1") else asp_write("0") end if%>">
								</td>
							</tr>
						</table>
					</div>
					</div>

					<div id="button0">
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
							<tr height="25px">
								<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;">
									<%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%>
								</td>
							</tr>
						</table>

						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
							<tr height="40px">
								<td align=left class="tabdata" style="width:250px;padding-left:20px;">
									<INPUT TYPE="HIDDEN" NAME="saveFlag" VALUE="0">
									<INPUT TYPE="button" class="button1" NAME="SaveBtn" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="uiSave()"> 
								</td>
								<td id="firstDiv" style="float:left;"></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
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
