<html>
<head>
<title></title>
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<SCRIPT language=JavaScript>
function onClickNext()
{
	window.location="/cgi-bin/wzExistAccount_true.asp";
}

function onClickExit()
{
	if (confirm("<%tcWebApi_get("String_Entry","LoginFailJS0Text","s")%>")) 
	{
		window.close();
	}
}
</SCRIPT>
<BODY leftMargin=0 topMargin=0>
<form name="wzCloseform" method="post">
<TABLE cellSpacing=0 cellPadding=0 width=500 align=center border=0 bgcolor="#FFFFFF" style="margin-top:50px;">
	<TBODY>
		<TR>
			<TD vAlign=baseline width=500 height=5></TD>
		</TR>
	</TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=500 align=center border=0 bgcolor="#FFFFFF">
	<TBODY>
		<TR>
			<TD vAlign=center align=left>
				<img src="/logo.png" tppabs="logo.png" width="160" height="100">
			</TD>
			<TD class=model vAlign=bottom align=right width=300 height=50>
			</TD>
		</TR>
		<TR>
			<TD width=500 colSpan=2>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<TABLE  height=2 cellSpacing=0 cellPadding=0 width=500 align=center border=0 bgcolor="#FFFFFF">
	<TBODY>
		<TR>
			<TD>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<TABLE height=35 cellSpacing=0 cellPadding=0 width=500 align=center border=0 color="#FF9933" bgcolor="#FFFFFF">
	<TBODY>
		<TR>
			<TD class=headline width=500>
				&nbsp;<%tcWebApi_get("String_Entry","LoginFail0Text","s")%>
			</TD>
		</TR>
	</TBODY>
</TABLE>
<TABLE cellSpacing=0 cellPadding=2 width=500 align=center border=0 bgcolor="#FFFFFF">
	<TBODY>
		<TR>
			<TD width=40>&nbsp;</TD>
			<TD class=tabdata align=right width=150>&nbsp;</TD>
			<TD class=tabdata align=left width=310>&nbsp;</TD>
		</TR>
		<TR>
			<TD width=40>&nbsp;</TD>
			
        <TD class=tabdata colSpan=2> <p><%tcWebApi_get("String_Entry","URLfilterURLIndexText","s")%></p>
		  <p><%tcWebApi_get("String_Entry","LoginFail1Text","s")%></p>	<!-- foxconn steve add -->
          <p><%tcWebApi_get("String_Entry","LoginFail2Text","s")%></p>
          <p><%tcWebApi_get("String_Entry","LoginFail3Text","s")%></p>	<!-- foxconn steve add -->
          </TD>
		</TR>
		<TR>
			<TD width=40>&nbsp;</TD>
			<TD class=tabdata align=right width=150>&nbsp;</TD>
			<TD class=tabdata align=left>&nbsp;</TD>
		</TR>
		<TR>
			<TD height=25>
		</TD>
		</TR>
	</TBODY>
</TABLE>

</FORM>
</BODY>
</HTML>
