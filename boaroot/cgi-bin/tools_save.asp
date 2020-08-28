<%
If Request_Form("saveFlag") = "1" then
	tcWebApi_save()
end if
%>

<html><head>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" href="/style.css" type="text/css">
<script language="JavaScript">
function doSave(){
	document.tools_save.saveFlag.value = 1;
	document.tools_save.submit();
	return;
}	
</script>
<style  type="text/css">

*{color:  #404040;}

table td
{
margin:5 0;padding:5 0;
}
</style>
</head><body>
<FORM METHOD="POST" ACTION="/cgi-bin/tools_save.asp" name="tools_save">
<INPUT TYPE="HIDDEN" NAME="saveFlag" VALUE="0">
<table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr>
<td height="5" class="light-orange" colspan="5">&nbsp;</td></tr><tr>
<td width="150" height="30" class="title-main">
<%tcWebApi_get("String_Entry","SaveConfigurationText","s")%> </td><td width="10" class="black">&nbsp;</td><td width="150"></td><td width="10"> </td><td width="440"></td></tr><tr>
<td class="light-orange">&nbsp;</td><td class="light-orange"></td><td class="tabdata"><div align=right>
  </div></td><td class="tabdata"><div align=center></div></td>
<td class="tabdata"> <img src=/exclamation.gif>&nbsp;<%tcWebApi_get("String_Entry","SaveCommentText","s")%> 	
</td></tr><tr>
<td class="light-orange">&nbsp;</td><td class="light-orange"></td><td class="tabdata">&nbsp;</td><td class="tabdata">&nbsp;</td><td class="tabdata">
</td></tr><tr>
    <td class="light-orange">&nbsp;</td><td class="light-orange"></td><td width="150">&nbsp;</td><td width="10">&nbsp;</td><td width="440">&nbsp;</td></tr></table><table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="160" height="42" >&nbsp;</td><td width="160" class="orange">&nbsp;</td><td width="440" class="orange">
	    <INPUT TYPE="SUBMIT" NAME="SaveBtn" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="doSave();">	</td></tr></table></div></form>
</body></html>
