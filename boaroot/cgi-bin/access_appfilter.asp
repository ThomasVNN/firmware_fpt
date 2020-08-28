<%
If request_form("NoChange_or_Save") = "1" Then 
	tcWebApi_set("AppFilter_Entry","Activate","APPFilter_status")
	tcWebApi_set("AppFilter_Entry","Block_ICQ","ICQ_allowance")
	tcWebApi_set("AppFilter_Entry","Block_MSN","MSN_allowance")	
	tcWebApi_set("AppFilter_Entry","Block_YMSG","YMSG_allowance")	
	tcWebApi_set("AppFilter_Entry","Block_RTSP","RA_allowance")
	tcWebApi_commit("AppFilter_Entry")
End If
%>

<HTML><HEAD>
<META http-equiv=Content-Script-Type content=text/javascript>
<META http-equiv=Content-Style-Type content=text/css>
<META http-equiv=Content-Type content="text/html; charset=&#10;<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">

<style  type="text/css">

*{color:  #404040;}

table td
{
margin:5 0;padding:5 0;
}
</style>


<SCRIPT language=javascript>
function switchFilterType(object)
{
  var index = object.selectedIndex;
	switch(index)
	{
		case 0:
			window.location='access_ipfilter.asp';
			break;
		case 2:
			window.location='access_URLfilter.asp';
			break;
	}
}

</SCRIPT>

<META content="MSHTML 6.00.2900.3059" name=GENERATOR></HEAD>
<BODY>
<FORM name=APPFILTERform action="/cgi-bin/access_appfilter.asp" method=post>

<table width="760px" border="0"  cellpadding="0" cellspacing="0">
<tr><td colspan="5" height="60">&nbsp;</td></tr>
<tr>
<td width="10" >&nbsp; </td>
<td width="150" height="15" ></td>
<td  colspan="3" valign="middle" class="title-main"><%tcWebApi_get("String_Entry","FilterText","s")%></td>
</tr>
</table>



<TABLE cellSpacing=0 cellPadding=0 width=760 bgColor=#ffffff 
border=0>
  <TBODY>
  <TR>
    	<TD  width=150 height=5></TD>
    	<TD width=10>&nbsp;</TD>
    	<TD width=150></TD>
    	<TD width=10></TD>
    	<TD width=440></TD>
  </TR>
  <TR>
    	<TD class=light-orange></TD>
    	<TD class=light-orange></TD>
    	<TD class="title-sub" height=25> <%tcWebApi_get("String_Entry","MIUFilterTypeText","s")%>  </TD>
    	<TD class=tabdata></TD>
    	<TD class=tabdata></TD>
  </TR>
  <TR>
    	<TD class=light-orange>&nbsp;</TD>
    	<TD class=light-orange></TD>
    	<TD class=tabdata><DIV align=right> <%tcWebApi_get("String_Entry","FilterTypeIndexText","s")%> </DIV></TD>
    	<TD class=tabdata><DIV align=center>:</DIV></TD>
    	<TD class=tabdata>
		<SELECT onchange=switchFilterType(this) size=1 name=FILTERTYPE_index>
				<OPTION ><%tcWebApi_get("String_Entry","FILTERTYPE_index0","s")%>
				<OPTION SELECTED><%tcWebApi_get("String_Entry","FILTERTYPE_index1","s")%>
				<OPTION><%tcWebApi_get("String_Entry","FILTERTYPE_index2","s")%>
		</SELECT>
	</TD>
  </TR>

  <TR>
    	<TD colspan="5" height="15"></TD>
  </TR>

  
  <TR>
    	<TD class=light-orange></TD>
    	<TD class=light-orange></TD>
    	<TD class="title-sub" height=25 colspan="3"> <%tcWebApi_get("String_Entry","FilterApplicationEditingText","s")%>  </TD>
  </TR>
  <TR>
    	<TD class=light-orange>&nbsp;</TD>
    	<TD class=light-orange></TD>
    	<TD class=tabdata><DIV align=right> <%tcWebApi_get("String_Entry","FilterApplicationText","s")%>  </DIV></TD>
    	<TD class=tabdata><DIV align=center>:</DIV></TD>
    	<TD class=tabdata>
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Activate","h") = "1" then asp_Write("checked") end if %>   value=1 name=APPFilter_status><%tcWebApi_get("String_Entry","FilterActivatedText","s")%> 
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Activate","h") = "0" then asp_Write("checked") end if 
    							 if tcWebApi_get("AppFilter_Entry","Activate","h") = "N/A" then asp_Write("checked") end if %> value=0 name=APPFilter_status>  <%tcWebApi_get("String_Entry","FilterDeactivatedText","s")%> 
    	</TD>
  </TR>
  <TR>
    	<TD class=light-orange>&nbsp;</TD>
    	<TD class=light-orange></TD>
    	<TD class=tabdata><DIV align=right> <%tcWebApi_get("String_Entry","FilterICQText","s")%>  </DIV></TD>
    	<TD class=tabdata><DIV align=center>:</DIV></TD>
    	<TD class=tabdata>
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Block_ICQ","h") = "0" then asp_Write("checked") end if %> value=0 name=ICQ_allowance>  <%tcWebApi_get("String_Entry","FilterAllowText","s")%> 
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Block_ICQ","h") = "1" then asp_Write("checked") end if 
    							 if tcWebApi_get("AppFilter_Entry","Block_ICQ","h") = "N/A" then asp_Write("checked") end if %> value=1 name=ICQ_allowance>  <%tcWebApi_get("String_Entry","FilterDenyText","s")%>  
    	</TD>
  </TR>
  <TR>
    	<TD class=light-orange>&nbsp;</TD>
    	<TD class=light-orange></TD>
    	<TD class=tabdata><DIV align=right> <%tcWebApi_get("String_Entry","FilterMSNText","s")%>  </DIV></TD>
    	<TD class=tabdata><DIV align=center>:</DIV></TD>
    	<TD class=tabdata>
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Block_MSN","h") = "0" then asp_Write("checked") end if %> value=0 name=MSN_allowance>  <%tcWebApi_get("String_Entry","FilterAllowText","s")%>  
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Block_MSN","h") = "1" then asp_Write("checked") end if 
    							 if tcWebApi_get("AppFilter_Entry","Block_MSN","h") = "N/A" then asp_Write("checked") end if %> value=1 name=MSN_allowance>  <%tcWebApi_get("String_Entry","FilterDenyText","s")%> 
    	</TD>
  </TR>
  <TR>
    	<TD class=light-orange>&nbsp;</TD>
    	<TD class=light-orange></TD>
    	<TD class=tabdata><DIV align=right> <%tcWebApi_get("String_Entry","FilterYMSGText","s")%>  </DIV></TD>
    	<TD class=tabdata><DIV align=center>:</DIV></TD>
    	<TD class=tabdata>
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Block_YMSG","h") = "0" then asp_Write("checked") end if %> value=0 name=YMSG_allowance>  <%tcWebApi_get("String_Entry","FilterAllowText","s")%>  
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Block_YMSG","h") = "1" then asp_Write("checked") end if 
    							 if tcWebApi_get("AppFilter_Entry","Block_YMSG","h") = "N/A" then asp_Write("checked") end if %> value=1 name=YMSG_allowance>  <%tcWebApi_get("String_Entry","FilterDenyText","s")%>  
    	</TD>
  </TR>
  <TR>
    	<TD class=light-orange>&nbsp;</TD>
    	<TD class=light-orange></TD>
    	<TD class=tabdata><DIV align=right> <%tcWebApi_get("String_Entry","FilterAudioVideoText","s")%>  </DIV></TD>
    	<TD class=tabdata><DIV align=center>:</DIV></TD>
    	<TD class=tabdata>
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Block_RTSP","h") = "0" then asp_Write("checked") end if %> value=0 name=RA_allowance>  <%tcWebApi_get("String_Entry","FilterAllowText","s")%>  
    		<INPUT type=radio <% if tcWebApi_get("AppFilter_Entry","Block_RTSP","h") = "1" then asp_Write("checked") end if 
    							 if tcWebApi_get("AppFilter_Entry","Block_RTSP","h") = "N/A" then asp_Write("checked") end if %> value=1 name=RA_allowance>  <%tcWebApi_get("String_Entry","FilterDenyText","s")%>  
    	</TD>
  </TR>
  <TR>
    	<TD class=light-orange></TD>
    	<TD class=light-orange></TD>
    	<TD>&nbsp;</TD>
    	<TD>&nbsp;</TD>
    	<TD>&nbsp;</TD>
  </TR>
  </TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=760  bgColor=#ffffff 
border=0>
<TBODY>
  <TR>
    	<TD width=160 height=42></TD>
    	<TD class=orange width=160>&nbsp;</TD>
    	<INPUT TYPE="HIDDEN" NAME="NoChange_or_Save" VALUE="0">
    	<TD class=orange width=440>
    		<INPUT type=submit value=<%tcWebApi_get("String_Entry","ButtonSaveText","s")%> name=APPFilterApply onclick="document.APPFILTERform.NoChange_or_Save.value = 1">
     		<INPUT type=reset value=<%tcWebApi_get("String_Entry","ButtonCancelText","s")%> name=APPFilterCancel> 
	</TD>
  </TR>
</TBODY>
</TABLE>
</FORM>
</BODY>
</HTML>
