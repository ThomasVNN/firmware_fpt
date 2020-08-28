<%
	If Request_Form("SaveTime") = "1" Then	
		TCWebApi_set("Timezone_Entry","TZ","uiViewdateToolsTZ") 
		TCWebApi_set("Timezone_Entry","DAYLIGHT","uiViewdateDS") 
		TCWebApi_set("Timezone_Entry","SERVER","uiViewSNTPServer")
		If Request_Form("ntp2ServerFlag") = "Yes" Then
			TCWebApi_set("Timezone_Entry","SERVER2","uiViewSNTPServer2")
		elseif Request_Form("ntp3ServerFlag") = "Yes" Then
			TCWebApi_set("Timezone_Entry","SERVER2","uiViewSNTPServer2")
			TCWebApi_set("Timezone_Entry","SERVER3","uiViewSNTPServer3")
		end if
		
		TCWebApi_set("Timezone_Entry","TYPE","uiViewSyncWith")
		
		If Request_Form("uiViewSyncWith") = "1" Then
			TCWebApi_set("Timezone_Entry","PC_CLOCK","uiCurrentTime2")
			TCWebApi_set("Timezone_Entry","TYPE","uiViewSyncWith")
		End if	

		If Request_Form("uiViewSyncWith") = "2" Then
			TCWebApi_set("Timezone_Entry","TYPE","uiViewSyncWith")
			TcWebApi_set("Timezone_Entry","Year","uiPCdateYear")
			TcWebApi_set("Timezone_Entry","Month","uiPCdateMonth")
			TcWebApi_set("Timezone_Entry","Date","uiPCdateDay")
			TcWebApi_set("Timezone_Entry","Hour","uiPCdateHour")
			TcWebApi_set("Timezone_Entry","Min","uiPCdateMinute")
			TcWebApi_set("Timezone_Entry","Sec","uiPCdateSec")
		End if		
		
		tcWebApi_commit("Timezone_Entry")
	End if

	If Request_Form("uiViewSyncWith") <> "" Then
		If Request_Form("uiViewSyncWith") = "0" Then
			TCWebApi_set("Timezone_Entry","TYPE","uiViewSyncWith")
			TCWebApi_set("Timezone_Entry","PCSyncFlag","uiClearPCSyncFlag")
		End if
		
		If Request_Form("uiViewSyncWith") = "1" Then
			TCWebApi_set("Timezone_Entry","TYPE","uiViewSyncWith")
			If Request_Form("uiRadioValue") = "1" Then
				TCWebApi_set("Timezone_Entry","PC_CLOCK","uiCurrentTime2")
				TCWebApi_set("Timezone_Entry","PCSyncFlag","uiClearPCSyncFlag")
				tcWebApi_commit("Timezone_Entry")
			End if
		End if	

		If Request_Form("uiViewSyncWith") = "2" Then
			TCWebApi_set("Timezone_Entry","TYPE","uiViewSyncWith")
			TCWebApi_set("Timezone_Entry","PCSyncFlag","uiClearPCSyncFlag")
		End if		
	End if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
		<link rel="stylesheet" type="text/css" href="/style.css" >
		<script language="JavaScript" src="/general.js"></script>
		<script language="JavaScript" src="/val.js"></script>
		<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>

		<style  type="text/css">
			*{color:  #404040;}

		</style>
	</head>
	
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
	<SCRIPT language="javascript">		

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
		
		//gleaf added begin
		function doSynchronize()
		{
			if(document.Alpha_Time.uiViewSyncWith.value == "0" || document.Alpha_Time.uiViewSyncWith.value == "2")
			{
				doTimeChange();
				doDisplay();
			}
			else if(document.Alpha_Time.uiViewSyncWith.value == "1")
			{
				syncwithpc();
				doDisplay();
			}
			return;
		}
		//gleaf added end

		function doTimeChange() 
		{
		   	document.Alpha_Time.ToolsTimeSetFlag.value = 1;

		  	//if(document.Alpha_Time.uiViewSyncWith[0].checked)   //gleaf
		    	if(document.Alpha_Time.uiViewSyncWith.value == "0")   //gleaf
		        	document.Alpha_Time.uiCurrentTime1.value =  document.Alpha_Time.uiCurTime.value;

			if(document.Alpha_Time.uiCurrentTime1.value == "N/A (NTP server is connecting)")
				document.Alpha_Time.uiCurrentTime1.value = "<%tcWebApi_get("String_Entry","ToolsTimeConnNTPText","s")%>";
			else if(document.Alpha_Time.uiCurrentTime1.value == "N/A (Can't find NTP server)")
				document.Alpha_Time.uiCurrentTime1.value = "<%tcWebApi_get("String_Entry","ToolsTimeCantFindNTPText","s")%>";
		 
		    	return;
		}

		function isAsciiString(s) 
		{
		    	var len= s.length;
		    	var ch;

		    	if(len == 0)
		        	return false;
				
		    	for( i=0; i< len; i++) 
			{
		       	ch= s.charCodeAt(i);
		       	if(ch > 0x39 || ch < 0x30)
		          		return false;
		    	}
		    	return true;
		}

		function uiComputerTimeOnLoad() 
		{
		    	var smtmp;
		    	if(document.Alpha_Time.uiRadioValue.value != null )
			{
		    		smtmp = document.Alpha_Time.uiRadioValue.value;
		    	}
		    	else
			{
		    		return;
		    	}
				
		    	if(smtmp=="1")
			{
		        	syncwithpc();
		      	}
		   	else
		        	return;
		}

		function syncwithpc() 
		{
		    	var form=document.Alpha_Time;
		    	theDate=(new Date()).getDate();
		    	form.uiwPCdateDay.value = theDate;

		    	theMonth=(new Date()).getMonth();
		    	form.uiwPCdateMonth.value = theMonth;

		    	theYear=(new Date()).getFullYear();
		    	form.uiwPCdateYear.value = theYear;

		    	theHour=(new Date()).getHours();
		    	form.uiwPCdateHour.value = theHour;

		    	theMinute=(new Date()).getMinutes();
		    	form.uiwPCdateMinute.value = theMinute;

		   	theSec=(new Date()).getSeconds();
		    	form.uiwPCdateSec.value = theSec;

		    	form.ToolsTimeSetFlag.value = 1;
		    	uiShowNow();
		}

		function uiDoCancel() 
		{
		    	document.location.href="/cgi-bin/tools_time.asp";
		}

		function isValidIpAddr(ip1,ip2,ip3,ip4) 
		{
			alert("<%tcWebApi_get("String_Entry","ToolsTimeJS9Text","s")%>");
		    	if(ip1==0 || ip4==0 || ip4==255 || ip1==127)
		        	return false;
		       return true;
		}

		function uiTimeSave() 
		{
			var value;
			var timestring;
			var form=document.Alpha_Time;

			if (form.uiViewSyncWith.value == "2")   //gleaf
			{
				day = form.uiPCdateDay.value;
				value = parseInt(day);
				if(isNaN(value))
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS0Text","s")%>");
					return false;
				}
				
				month = form.uiPCdateMonth.value;
				value = parseInt(month);
				if(isNaN(value))
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS1Text","s")%>");
					return false;
				}
				
				year = form.uiPCdateYear.value;
				value = parseInt(year);
				if(isNaN(value) || value > 2038 || value < 1970)
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS2Text","s")%>");
					return false;
				}
				
				//if (!((1<=month) && (12>=month) && (31>=day) && (1<=day)) )    //gleaf
				if ((day > 31) || (day < 1) )   //gleaf
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS0Text","s")%>");
					return false;
				}

				//gleaf begin
				if(month == 2)
				{
					if((day == 29) && ((year % 4) != 0))
					{
						alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS3Text","s")%>");
						return false;
					}
					if((day == 30) || (day == 31))
					{
						alert("<%tcWebApi_get("String_Entry","ToolsTimeJS5Text","s")%>");
						return false;
					}
				}
				else if((month <= 7) && ((month % 2) ==0 ) && (day >= 31))
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS4Text","s")%>");
					return false;
				}
				//gleaf end
				
				/*if (!((year % 4)==0) && (month==2) && (day==29))
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS3Text","s")%>");
					return false;
				}
				
				if ((month<=7) && ((month % 2)==0) && (day>=31))
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS4Text","s")%>");
					return false;
				
				}*/
				
				if ((month>=8) && ((month % 2)==1) && (day>=31))
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS4Text","s")%>");
					return false;
				}
				
				/*if ((month==2) && (day==30))
				{
					alert("<%tcWebApi_get("String_Entry","ToolsTimeJS5Text","s")%>");
					return false;
				}*/
				
				hour = form.uiPCdateHour.value;
				if(isNaN(hour) || hour >23 || hour <0)
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS6Text","s")%>");
					return false;
				}
				
				min = form.uiPCdateMinute.value;
				if(isNaN(min) || min >59 || min <0)
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS7Text","s")%>");
					return false;
				}
				
				sec = form.uiPCdateSec.value;
				if(isNaN(sec) || sec >59 || sec <0)
				{
					alert ("<%tcWebApi_get("String_Entry","ToolsTimeJS8Text","s")%>");
					return false;
				}
				
				timestring=year+"/"+month+"/"+day+" "+hour+":"+min+":"+sec
				form.uiCurrentTime.value=timestring
			}			
			else if (form.uiViewSyncWith.value == "0")
			{
				value = form.uiViewSNTPServer.value;
				
				//if(value !="0.0.0.0")
				//{
				//	if (inValidIPAddr(value)){
				//	    alert("<%tcWebApi_get("String_Entry","ToolsTimeJS9Text","s")%>");
				//		return false;
				//	}
				//}
				
			}
			else if (form.uiViewSyncWith.value == "1")
			{
				syncwithpc();
			}
			showSpin();//cindy add
			form.SaveTime.value = 1;
		    	form.submit();
		}

		/*
		function uiShowNow() {
			var  now  =  new  Date();  
		        var  hh  =  now.getHours();  
		        var  mm  =  now.getMinutes();  
		        var  ss  =  now.getTime()  %  60000;  
		        ss  =  (ss  -  (ss  %  1000))  /  1000;  
		        var  clock  =  hh+':';  
		        if  (mm  <  10)  clock  +=  '0';  
		        clock  +=  mm+':';  
		        if  (ss  <  10)  clock  +=  '0';  
		        clock  +=  ss;  
			document.Alpha_Time.uiCurrentTime.value = now.getYear() + "/" + (now.getMonth()+1) + "/" + now.getDate() + " " + clock;
			setTimeout("uiShowNow()",1000);
		}*/
		
		function uiShowNow() 
		{
			//if(document.Alpha_Time.uiViewSyncWith[1].checked)    //gleaf
			if(document.Alpha_Time.uiViewSyncWith.value == "1")    //gleaf
			{ 
				var  now  =  new  Date();
				var  hh  =  now.getHours();  
				var  mm  =  now.getMinutes();  
				var  ss  =  now.getTime()  %  60000;  
				ss  =  (ss  -  (ss  %  1000))  /  1000;  
				var  clock  =  hh+':';  
				if  (mm  <  10)  clock  +=  '0';  
					clock  +=  mm+':';  
				if  (ss  <  10)  clock  +=  '0';  
					clock  +=  ss;  
				document.Alpha_Time.uiCurrentTime.value = now.getYear() + "/" + (now.getMonth()+1) + "/" + now.getDate() + " " + clock;
				document.Alpha_Time.uiCurrentTime1.value = now.toString();
			}
			else
			{
				document.Alpha_Time.uiCurrentTime1.value =  document.Alpha_Time.uiCurTime.value;
			}

			if(document.Alpha_Time.uiCurrentTime1.value == "N/A (NTP server is connecting)")
				document.Alpha_Time.uiCurrentTime1.value = "<%tcWebApi_get("String_Entry","ToolsTimeConnNTPText","s")%>";
			else if(document.Alpha_Time.uiCurrentTime1.value == "N/A (Can't find NTP server)")
				document.Alpha_Time.uiCurrentTime1.value = "<%tcWebApi_get("String_Entry","ToolsTimeCantFindNTPText","s")%>";
		}

		function doDisplay()
		{
			//if(document.Alpha_Time.uiViewSyncWith[0].checked)    //gleaf	
			if(document.Alpha_Time.uiViewSyncWith.value == "0")    //gleaf
			{
				setDisplay('timezone_ntp_div0',1);
				setDisplay('timezone_manual_div2',0);
			}
			//else if(document.Alpha_Time.uiViewSyncWith[1].checked)   //gleaf
			else if(document.Alpha_Time.uiViewSyncWith.value == "1")   //gleaf
			{
				setDisplay('timezone_ntp_div0',0);
				setDisplay('timezone_manual_div2',0);
			}
			//else if(document.Alpha_Time.uiViewSyncWith[2].checked)   //gleaf
			else if(document.Alpha_Time.uiViewSyncWith.value == "2")   //gleaf
			{
				setDisplay('timezone_ntp_div0',0);
				setDisplay('timezone_manual_div2',1);	
			}			
		}
		
		function startRefeshForNtp()
		{
			var str1="<%tcWebApi_get("String_Entry","ToolsTimeConnNTPText","s")%>";
			var str2="<%tcWebApi_get("String_Entry","ToolsTimeCantFindNTPText","s")%>";

			var str3=document.Alpha_Time.uiCurrentTime1.value;
			
			setTimeout("startRefeshForNtp()",10000);
			
			if( (!document.Alpha_Time.uiViewSyncWith[0].checked) || (document.Alpha_Time.uiTimezoneType.value != "0") )
				return ;

			if(str1 == str3 || str2 == str3)
				document.location.href="/cgi-bin/tools_time.asp";
		}
	</SCRIPT>

	<body onLoad="uiComputerTimeOnLoad();doDisplay();uiShowNow();setTimeout('startRefeshForNtp()',10000);">
		<FORM METHOD="POST" ACTION="/cgi-bin/tools_time.asp" name="Alpha_Time">
			<div id="pagestyle"><!--cindy add for border 11/28-->
				<div id="contenttype">  <!--gleaf-->
					<div id="block1">
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
							<INPUT TYPE="HIDDEN" name="SaveTime" VALUE="0">
							<INPUT TYPE="HIDDEN" id="uiCurrentTime" name="uiCurrentTime2">
							<tr height="25px" style="background-color:#e6e6e6;">
								<td width="20px">&nbsp;</td>
								<td colspan="2" align="left" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","ToolsTimeZoneText","s")%></td>
							</tr>
						</table>

						<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
							<tr height="30px">
							    	<td width="20px">&nbsp;</td>
							    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeDateText","s")%></td>
							     	<td align=left class="tabdata">
							     		<input type="text" id="uiCurrentTime1" name="uiCurrentTime1" size="40" maxlength="40" onFocus="document.Alpha_Time.SaveBtn.focus()" style="border:0">
								</td>
							</tr>
						</table>

						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">
							<!--sub title -->
							<tr height="25px" style="background-color:#e6e6e6;">
								<td width="20px">&nbsp; </td>
								<td colspan="2" align=left  class="title-main"><%tcWebApi_get("String_Entry","ToolsTimeSyncText","s")%></td>
								<INPUT TYPE="HIDDEN" NAME="ToolsTimeSetFlag" VALUE="0">
							    	<% If tcWebApi_get("Timezone_Entry","TYPE","h") = "1" Then %>
							    		<INPUT TYPE="HIDDEN" NAME="uiRadioValue" VALUE="<%TCWebApi_get("Timezone_Entry","PCSyncFlag","s")%>">
							    	<% Else %>
							    		<INPUT TYPE="HIDDEN" NAME="uiRadioValue" VALUE="0">
							    	<%End If %>
							    	<INPUT TYPE="HIDDEN" NAME="uiClearPCSyncFlag" VALUE="0">
							       <INPUT TYPE="HIDDEN" NAME="uiwPCdateMonth" VALUE="0">
							       <INPUT TYPE="HIDDEN" NAME="uiwPCdateDay" VALUE="">
							       <INPUT TYPE="HIDDEN" NAME="uiwPCdateYear" VALUE="">
							       <INPUT TYPE="HIDDEN" NAME="uiwPCdateHour" VALUE="">
							       <INPUT TYPE="HIDDEN" NAME="uiwPCdateMinute" VALUE="">
							       <INPUT TYPE="HIDDEN" NAME="uiwPCdateSec" VALUE="">
							       <INPUT TYPE="HIDDEN" NAME="uiCurTime" VALUE="<%TCWebApi_get("DeviceInfo","cur_time","s")%>">
							       <INPUT TYPE="HIDDEN" NAME="uiTimezoneType" VALUE="<%TCWebApi_get("Timezone_Entry","TYPE","s")%>">
							</tr>
						</table>

						<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
							<tr height="30px">
							    	<td width="20px">&nbsp;</td>
							    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeSyncwithText","s")%></td>
							     	<td align=left class="tabdata">
							     		<!--gleaf modified begin-->
							     		<select NAME="uiViewSyncWith" SIZE="1" onChange="doSynchronize()">
							     			<OPTION value="0" <% If TCWebApi_get("Timezone_Entry","TYPE","h") = "0"  then asp_Write("selected") end if %>>
							     			<%tcWebApi_get("String_Entry","ToolsTimeNTPautoText","s")%> 
							     			
										<OPTION value="1" <% If TCWebApi_get("Timezone_Entry","TYPE","h") = "1" then asp_Write("selected") end if %>>
										<%tcWebApi_get("String_Entry","ToolsTimeClockText","s")%>
										
										<OPTION value="2" <% If TCWebApi_get("Timezone_Entry","TYPE","h") = "2" then asp_Write("selected") end if %>>
										<%tcWebApi_get("String_Entry","ToolsTimeManuallyText","s")%>
							     		</select>
							     		
							     		<!--<INPUT NAME="uiViewSyncWith" TYPE="RADIO"  onclick="doTimeChange();doDisplay();" VALUE="0"  <% If TCWebApi_get("Timezone_Entry","TYPE","h") = "0" then asp_Write("checked") end if%>>
						    			<%tcWebApi_get("String_Entry","ToolsTimeNTPautoText","s")%> 
						    			<INPUT TYPE="RADIO" NAME="uiViewSyncWith" VALUE="1" onClick="syncwithpc();doDisplay();"  <% If TCWebApi_get("Timezone_Entry","TYPE","h") = "1" then asp_Write("checked") end if%>>
						         		<%tcWebApi_get("String_Entry","ToolsTimeClockText","s")%>
						         		<INPUT TYPE="RADIO" NAME="uiViewSyncWith" VALUE="2"  onClick="doTimeChange();doDisplay();" <% If TCWebApi_get("Timezone_Entry","TYPE","h") = "2" then asp_Write("checked") end if%>> 
						   	  		<%tcWebApi_get("String_Entry","ToolsTimeManuallyText","s")%> -->
						   	  		<!--gleaf modified end-->
								</td>
							</tr>
						</table>
	 					
						<div id="timezone_manual_div2">
	 						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeNewDateText","s")%></td>
								     	<td align=left class="tabdata">
								     		<select id="uiPCdateMonth"  NAME="uiPCdateMonth" SIZE="1">
									        	<option VALUE=1>1
									        	<option VALUE=2>2
									        	<option VALUE=3>3
									        	<option VALUE=4>4
									        	<option VALUE=5>5
									        	<option VALUE=6>6
									        	<option VALUE=7>7
									        	<option VALUE=8>8
									        	<option VALUE=9>9
									        	<option VALUE=10>10
									        	<option VALUE=11>11
									        	<option VALUE=12>12
									      	</SELECT>
									      	/
									      	<input type="text" id="uiPCdateDay" name="uiPCdateDay" size="2" maxlength="2" value="">
									      	/
								      		<input type="text" id="uiPCdateYear" name="uiPCdateYear" size="4" maxlength="4" value="">
								        	<%tcWebApi_get("String_Entry","ToolsTimeNewDateCommText","s")%>	  
									</td>
								</tr>

								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeTimeText","s")%></td>
								     	<td align=left class="tabdata">
								     		<input type="text" id="uiPCdateHour" name="uiPCdateHour" size="2" maxlength="2" value="" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
								        	<input type="text" id="uiPCdateMinute" name="uiPCdateMinute" size="2" maxlength="2" value="" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">      
								        	<input type="text" id="uiPCdateSec" name="uiPCdateSec" size="2" maxlength="2" value="" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">      
								        	<%tcWebApi_get("String_Entry","ToolsTimeTimeCommText","s")%>
									</td>
								</tr>
							
								<script language="JavaScript" type="text/JavaScript">
									var strmonth = "<% TCWebApi_get("Timezone_Entry","Month","s") %>";
									var strdate = "<% TCWebApi_get("Timezone_Entry","Date","s") %>";
									var stryear = "<% TCWebApi_get("Timezone_Entry","Year","s") %>";
									var strhour = "<% TCWebApi_get("Timezone_Entry","Hour","s") %>";
									var strmin = "<% TCWebApi_get("Timezone_Entry","Min","s") %>";
									var strsec = "<% TCWebApi_get("Timezone_Entry","Sec","s") %>";
									
									if(strmonth != "N/A")
										document.Alpha_Time.uiPCdateMonth.selectedIndex = parseInt(strmonth) - 1;
									if(strdate != "N/A")
										document.Alpha_Time.uiPCdateDay.value = strdate;
									if(stryear != "N/A")
										document.Alpha_Time.uiPCdateYear.value = stryear;
									if(strhour != "N/A")
										document.Alpha_Time.uiPCdateHour.value = strhour;
									if(strmin != "N/A")
										document.Alpha_Time.uiPCdateMinute.value = strmin;
									if(strsec != "N/A")
										document.Alpha_Time.uiPCdateSec.value = strsec;
								</script>
							</table>
						</div>

						<div id="timezone_ntp_div0">
							<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeZoneText","s")%></td>
								     	<td align=left class="tabdata">
								     		<SELECT NAME="uiViewdateToolsTZ" SIZE="1" style="width:330px;">
											<option value="GMT-12:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-12:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry0Text","s")%>
											<option value="GMT-11:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-11:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry1Text","s")%>
											<option value="GMT-10:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-10:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry2Text","s")%>
											<option value="GMT-09:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-09:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry3Text","s")%>
											<option value="GMT-08:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-08:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry4Text","s")%>
											<option value="GMT-07:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-07:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry5Text","s")%>
											<option value="GMT-06:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-06:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry6Text","s")%>
											<option value="GMT-05:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-05:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry7Text","s")%>
											<option value="GMT-04:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-04:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry8Text","s")%>
											<option value="GMT-03:30" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-03:30" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry9Text","s")%>
											<option value="GMT-03:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-03:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry10Text","s")%>
											<option value="GMT-02:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-02:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry11Text","s")%>
											<option value="GMT-01:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT-01:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry12Text","s")%>
											<option value="GMT" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry13Text","s")%>
											<option value="GMT+01:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+01:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry14Text","s")%>
											<option value="GMT+02:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+02:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry15Text","s")%>
											<option value="GMT+03:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+03:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry16Text","s")%>
											<option value="GMT+03:30" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+03:30" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry17Text","s")%>
											<option value="GMT+04:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+04:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry18Text","s")%>
											<option value="GMT+04:30" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+04:30" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry19Text","s")%>
											<option value="GMT+05:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+05:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry20Text","s")%>
											<option value="GMT+05:30" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+05:30" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry21Text","s")%>
											<option value="GMT+06:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+06:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry22Text","s")%>
											<option value="GMT+06:30" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+06:30" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry23Text","s")%>
											<option value="GMT+07:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+07:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry24Text","s")%>
											<option value="GMT+08:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+08:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry25Text","s")%>
											<option value="GMT+09:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+09:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry26Text","s")%>
											<option value="GMT+09:30" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+09:30" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry27Text","s")%>
											<option value="GMT+10:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+10:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry28Text","s")%>
											<option value="GMT+11:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+11:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry29Text","s")%>
											<option value="GMT+12:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+12:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry30Text","s")%>
											<option value="GMT+13:00" <% if TCWebApi_get("Timezone_Entry","TZ","h") = "GMT+13:00" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","ToolsTimeCountry31Text","s")%>
										</SELECT> 
									</td>
								</tr>

								<!--cindy delete
								<tr>
								    <td class="light-orange">&nbsp;</td><td class="light-orange"></td><td class="tabdata"><div align=right>
								     <%tcWebApi_get("String_Entry","ToolsTimeDaylightText","s")%>  </div>    <td class="tabdata"><div align=center>:</div></td><td class="tabdata">
								    	<INPUT TYPE="RADIO" NAME="uiViewdateDS" VALUE="Enable"  <% If TCWebApi_get("Timezone_Entry","DAYLIGHT","h") = "Enable" then asp_Write("checked") end if%>   >      <%tcWebApi_get("String_Entry","ToolsTimeDaylight0Text","s")%>         
								    	<INPUT TYPE="RADIO" NAME="uiViewdateDS" VALUE="Disable" <% If TCWebApi_get("Timezone_Entry","DAYLIGHT","h") = "Disable" then asp_Write("checked") end if%> >     <%tcWebApi_get("String_Entry","ToolsTimeDaylight1Text","s")%> </td>
								  </tr>
								  -->  

								<tr height="30px">
								    	<td width="20px">&nbsp;</td>
								    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeNTPSerAddText","s")%></td>
								     	<td align=left class="tabdata">
								     		<INPUT TYPE="TEXT" NAME="uiViewSNTPServer" SIZE="24" MAXLENGTH="48" VALUE="<%TCWebApi_get("Timezone_Entry","SERVER","s")%>" >         <!--<%tcWebApi_get("String_Entry","ToolsTimeNTPSerAddCommText","s")%>--> 
									</td>
								</tr>

								<% if TCWebApi_get("WebCustom_Entry","is2NTPServerSupported","h") = "Yes" then%>
									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeNTPSer2AddText","s")%></td>
									     	<td align=left class="tabdata">
									     		<INPUT TYPE="TEXT" NAME="uiViewSNTPServer2" SIZE="24" MAXLENGTH="48" VALUE="<%TCWebApi_get("Timezone_Entry","SERVER2","s")%>" >         <!--<%tcWebApi_get("String_Entry","ToolsTimeNTPSerAddCommText","s")%>-->
										</td>
									</tr>
								<%elseif TCWebApi_get("WebCustom_Entry","is3NTPServerSupported","h") = "Yes" then%>
									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeNTPSer2AddText","s")%></td>
									     	<td align=left class="tabdata">
									     		<INPUT TYPE="TEXT" NAME="uiViewSNTPServer2" SIZE="24" MAXLENGTH="48" VALUE="<%TCWebApi_get("Timezone_Entry","SERVER2","s")%>" >         <!--<%tcWebApi_get("String_Entry","ToolsTimeNTPSerAddCommText","s")%>--> 
										</td>
									</tr>

									<tr height="30px">
									    	<td width="20px">&nbsp;</td>
									    	<td width="250px" align=left class="tabdata"><%tcWebApi_get("String_Entry","ToolsTimeNTPSer3AddText","s")%></td>
									     	<td align=left class="tabdata">
									     		<INPUT TYPE="TEXT" NAME="uiViewSNTPServer3" SIZE="24" MAXLENGTH="48" VALUE="<%TCWebApi_get("Timezone_Entry","SERVER3","s")%>" >         <!--<%tcWebApi_get("String_Entry","ToolsTimeNTPSerAddCommText","s")%>-->
										</td>
									</tr>
								<%end if%>							
							</table>
						</div>	
					</div>

					<div id="button0">
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;">	
							<tr height="25px">
								<td width="20px">&nbsp;</td>
								<td colspan="2" align="left" class="title-main"><%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%></td>
							</tr>
						</table>

						<table width="640px" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata">
							<tr height="30px">
								<td width="20px">&nbsp;</td>
								<td colspan="2" align=left class="tabdata">
									<INPUT TYPE="BUTTON" NAME="SaveBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="uiTimeSave()">
								</td>
								<td align=left class="tabdata" style="display:none">
									<INPUT TYPE="BUTTON" NAME="CancelBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonCancelText","s")%>" onClick="uiDoCancel()">
								</td>
								<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
								<INPUT TYPE="HIDDEN" NAME="ntp2ServerFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","is2NTPServerSupported","s")%>">
								<INPUT TYPE="HIDDEN" NAME="ntp3ServerFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","is3NTPServerSupported","s")%>">
							</tr>
						</table>
					</div>
				</div>    <!--gleaf-->
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
