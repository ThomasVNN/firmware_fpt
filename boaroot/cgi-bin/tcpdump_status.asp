
<% 
asp_write("<table width=500px border=0 cellpadding=0 cellspacing=0 bgcolor=#FFFFFF >");

If tcWebApi_get("Tcpdump_Pcap","TcpdumpStatus","h")="0"then  
asp_write("<tr height=30>")
    asp_write("<th width=20px align=left class=tabdata>")
    	&nbsp;
    asp_write("</th>")
    asp_write("<td width=250px align=left class=tabdata>")
	tcWebApi_get("String_Entry","NavigationTcpDumpStatusText","s")
    asp_write("</td>")
    asp_write("<th align=left class=tabdata><font color=#0E4DA2>")
      tcWebApi_get("String_Entry","NavigationTcpDumpIdleText","s")
    asp_write("<font></th>")
asp_write("</tr>")
end if

If tcWebApi_get("Tcpdump_Pcap","TcpdumpStatus","h")="1" then 
asp_write("<tr height=30>")
    asp_write("<th width=20px align=left class=tabdata>")
    	&nbsp;
    asp_write("</th>")
    asp_write("<td width=250px align=left class=tabdata>")
	tcWebApi_get("String_Entry","NavigationTcpDumpStatusText","s")
    asp_write("</td>")
    asp_write("<th align=left class=tabdata><font color=#FF9933>")
    tcWebApi_get("String_Entry","NavigationTcpDumpCaptureingText","s")
    asp_write("<font></th>")
asp_write("</tr>")
end if

If tcWebApi_get("Tcpdump_Pcap","TcpdumpStatus","h")="2"  then
asp_write("<tr height=30>")
    asp_write("<th width=20px align=left class=tabdata>")
    	&nbsp;
    asp_write("</th>")
    asp_write("<td width=250px align=left class=tabdata>")
	tcWebApi_get("String_Entry","NavigationTcpDumpStatusText","s")
    asp_write("</td>")
    asp_write("<th align=left class=tabdata><font color=#4DB848>")
    tcWebApi_get("String_Entry","NavigationTcpDumpFinishText","s")
    asp_write("<font></th>")
asp_write("</tr>")
end if
asp_write("</table>")
%>

