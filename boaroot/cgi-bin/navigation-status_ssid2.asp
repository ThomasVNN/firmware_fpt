<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<link rel="stylesheet" type="text/css" href="/style.css">
</head>

<body>
<div class="navigation">
<table class="nav-sub nav_table">
       <tr><td height="50">&nbsp;</td></tr>
  <tr>
   <td width="160" class="header"><font color="#FFFFFF">
   <%tcWebApi_get("String_Entry","NavigationStatusSText","s")%></font>
   </td>
   <td width="600">
	 <table width="600" height="40" border="0" cellpadding="0" cellspacing="0" class="nav-main">
       <tr align="center" valign="middle">	                
         <td width="80" class="nav-main-sel">
         <%tcWebApi_get("String_Entry","NavigationStatusSText","s")%>
         </a></td> 
		 <td width="520" bgcolor="#FFFFFF"></td>                         
       </tr>
     </table>
	 
	 <table width="600" height="5" border="0" align="center" cellpadding="0" cellspacing="0" class="nav_css">
       <tr>
   	     <td width="600" class="nav_css"></td>
	   </tr>
	 </table>

     <table width="600" height="22" border="0" cellpadding="0" cellspacing="0" class="nav-sub">
       <tr align="center" valign="middle">
         <td width="105" class="nav_css"><a href="/cgi-bin/status_deviceinfo.asp" target="main_ssid2"><div align="center">
         <%tcWebApi_get("String_Entry","NavigationStatusSDeviceText","s")%>
         </div></a></td>
         <td width="1"   bgcolor="#FFFFFF">&nbsp;</td>
         <td width="100" class="nav_css"><a href="/cgi-bin/status_log.cgi" target="main_ssid2"><div align="center">
         <%tcWebApi_get("String_Entry","NavigationStatusSSystemText","s")%>
         </div></a></td>
         <td width="1"   bgcolor="#FFFFFF">&nbsp;</td>                            		                                                
         <td width="90"  class="nav_css"><a href="/cgi-bin/status_statistics.asp" target="main_ssid2"><div align="center">
         <%tcWebApi_get("String_Entry","NavigationStatusSStatisticsText","s")%>
         </div></a></td>                              		                                                                                 
         <!-- <td width="1"   class="orange">&nbsp;</td> <td class="orange">&nbsp;</td>saffi removed for bottom bar style -->
         
       </tr>
     </table> 
   </td>
  </tr>
</table>
</div>
</body>
</html>
