
<% 
asp_write("<table id=client_list width=580 border=1  cellpadding=1 cellspacing=0  bordercolor=#CCCCCC bgcolor=#FFFFFF>");
asp_write("<tr>")
    asp_write("<td width=40 align=center class=tabdata><strong><FONT color=#000000>")
        asp_write("#")
    asp_write("</strong></td>")
    asp_write("<td width=120 align=center class=tabdata><strong><FONT color=#000000>")
        tcWebApi_get("String_Entry","WLANHOSTNAME","s")
    asp_write("</strong></td>")
    asp_write("<td width=100 align=center class=tabdata><strong><FONT color=#000000>")
        tcWebApi_get("String_Entry","WLANIP","s")
    asp_write("</strong></td>")
    asp_write("<td width=120 align=center class=tabdata><strong><FONT color=#000000>")
        tcWebApi_get("String_Entry","WLANMAC","s");
    asp_write("</strong></td>")
    asp_write("<td width=60 align=center class=tabdata><strong><FONT color=#000000>")
        tcWebApi_get("String_Entry","WLANRSSI1","s")
    asp_write("</strong></td>")
    asp_write("<td width=60 align=center class=tabdata><strong><FONT color=#000000>")
        tcWebApi_get("String_Entry","WLANRSSI2","s")
    asp_write("</strong></td>")
    asp_write("<td width=60 align=center class=tabdata><strong><FONT color=#000000>")
        tcWebApi_get("String_Entry","WLANRSSI3","s")
    asp_write("</strong></td>")
asp_write("</tr>")

if tcWebApi_staticGet("WiFi5GInfo_Entry0", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("1")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry0", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry0", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry0", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry0", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry0", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry0", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry1", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("2")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry1", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry1", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry1", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry1", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry1", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry1", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry2", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("3")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry2", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry2", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry2", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry2", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry2", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry2", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry3", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("4")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry3", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry3", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry3", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry3", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry3", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry3", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry4", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("5")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry4", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry4", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry4", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry4", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry4", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry4", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry5", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("6")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry5", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry5", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry5", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry5", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry5", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry5", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry6", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("7")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry6", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry6", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry6", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry6", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry6", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry6", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry7", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("8")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry7", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry7", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry7", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry7", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry7", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry7", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry8", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("9")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry8", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry8", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry8", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry8", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry8", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry8", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if

if tcWebApi_staticGet("WiFi5GInfo_Entry9", "IP","h") <> "N/A" then
    asp_write("<tr>")
    asp_write("<td align=center class=tabdata >")
        asp_write("10")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_Get("WiFi5GInfo_Entry9", "HostName","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry9", "IP","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry9", "MAC","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry9", "Rssi0","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry9", "Rssi1","s")
    asp_write("</td>")
    asp_write("<td align=center class=tabdata >")
        tcWebApi_staticGet("WiFi5GInfo_Entry9", "Rssi2","s")
    asp_write("</td>")
asp_write("</tr>")
end if
asp_write("</table>")

if tcWebApi_staticGet("WiFi5GInfo_Entry10", "IP","h") <> "N/A" then
    asp_write("<input type=button name=MORE  value=More... onClick=javascript:window.open('/cgi-bin/more_rssi_list_5.asp')>")
end if 
   
%>

