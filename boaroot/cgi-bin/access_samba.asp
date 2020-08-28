<%
If Request_Form("Sambaflag")="1" then 
	TCWebApi_set("Samba_Entry","Active","Samba_active")
	if TCWebAPI_get("Samba_Entry", "Active", "h") = "Yes" then
		TCWebAPI_set("Samba_Entry","Passwd","newSambaPassword")
		TCWebAPI_set("Samba_Entry","WorkGroup","WorkGroup")
		TCWebAPI_set("Samba_Entry","NetBiosName","NetBiosName")
	end if
	/*commit changes*/
	TCWebAPI_commit("Samba_Entry")	
End If
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css" tppabs="/style.css">

<style  type="text/css">

*{color:  #404040;}
</style>

<script language="JavaScript" src="OutVariant.asp"></script>
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
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

function isValidNameEx(name) {
   var i = 0;	
   
   for ( i = 0; i < name.length; i++ ) {
      if ( isNameUnsafeEx(name.charAt(i)) == true ){
		return false;
	}
   }

   return true;
}

function isNameUnsafeEx(compareChar)
{	
   if( (compareChar.charCodeAt(0) > 47&& compareChar.charCodeAt(0) < 58)||
   	(compareChar.charCodeAt(0) > 64&& compareChar.charCodeAt(0) < 91)||
   	(compareChar.charCodeAt(0) > 96&& compareChar.charCodeAt(0) < 123))
   	
  // if ( compareChar.charCodeAt(0) > 32
  //      && compareChar.charCodeAt(0) < 127)
      return false; // found no unsafe chars, return false
   else
      return true;
}	

function Sambasave() 
{
	if(document.Samba_form.Samba_active[0].checked)
	{
		if(isValidNameEx(document.Samba_form.newSambaPassword.value) == false )
		{
			alert("<%tcWebApi_get("String_Entry","SambaJS0Text","s")%>");
			document.Samba_form.newSambaPassword.focus();
			return false;
		}
		if(isValidNameEx(document.Samba_form.confirmSambaPassword.value) == false )
		{
			document.Samba_form.confirmSambaPassword.focus();
			alert("<%tcWebApi_get("String_Entry","SambaJS1Text","s")%>");
			return false;
		}
		if(isValidNameEx(document.Samba_form.WorkGroup.value) == false )
		{
			document.Samba_form.WorkGroup.focus();
			alert("<%tcWebApi_get("String_Entry","SambaJS2Text","s")%>");
			return false;
		}
		if(isValidNameEx(document.Samba_form.NetBiosName.value) == false )
		{
			document.Samba_form.NetBiosName.focus();
			alert("<%tcWebApi_get("String_Entry","SambaJS3Text","s")%>");
			return false;
		}
		if((document.Samba_form.newSambaPassword.value.length == 0)||(document.Samba_form.newSambaPassword.value.length >15))
		{
			alert("<%tcWebApi_get("String_Entry","SambaJS4Text","s")%>");
			document.Samba_form.newSambaPassword.focus();
			return false;
		}
		if((document.Samba_form.confirmSambaPassword.value.length == 0)||(document.Samba_form.confirmSambaPassword.value.length > 15))
		{
			alert("<%tcWebApi_get("String_Entry","SambaJS4Text","s")%>");
			document.Samba_form.confirmSambaPassword.focus();
			return false;
		}
		if((document.Samba_form.WorkGroup.value.length == 0)||(document.Samba_form.WorkGroup.value.length > 15))
		{
			alert("<%tcWebApi_get("String_Entry","SambaJS5Text","s")%>");
			document.Samba_form.WorkGroup.focus();
			return false;
		}
		if((document.Samba_form.NetBiosName.value.length == 0)||(document.Samba_form.NetBiosName.value.length > 15))
		{
			alert("<%tcWebApi_get("String_Entry","SambaJS6Text","s")%>");
			document.Samba_form.NetBiosName.focus();
			return false;
		}

		if (document.Samba_form.newSambaPassword.value != document.Samba_form.confirmSambaPassword.value) 
		{
        	alert("<%tcWebApi_get("String_Entry","SambaJS7Text","s")%>");
        	return false;
    	}
	//cindy add 
		if(document.Samba_form.newSambaPassword.value !='<%tcWebApi_get("Samba_Entry","Passwd","s")%>')
        	alert("<%tcWebApi_get("String_Entry","SambaJS8Text","s")%>");
	//cindy add 
	}
  showSpin();//cindy add 
  document.Samba_form.Sambaflag.value=1;
  document.Samba_form.submit();
}

function sambaOff(off){
	if(off){
	document.getElementById("showsamba").style.display="none";//foxconn cindy add 
  	document.Samba_form.newSambaPassword.disabled = true;
	document.Samba_form.confirmSambaPassword.disabled = true;
	document.Samba_form.WorkGroup.disabled = true;
	document.Samba_form.NetBiosName.disabled = true;	
	}
	else{
	document.getElementById("showsamba").style.display="block";//foxconn cindy add 
	document.Samba_form.newSambaPassword.disabled = false;
	document.Samba_form.confirmSambaPassword.disabled = false;
	document.Samba_form.WorkGroup.disabled = false;
	document.Samba_form.NetBiosName.disabled = false;		
	}
}
function doLoad()
{
/*cindy delete
	if(document.Samba_form.elements[1].checked)
		sambaOff(1);
	else
		sambaOff(0);
*/
	if(document.Samba_form.newSambaPassword != null)
		document.Samba_form.newSambaPassword.value = sambaPwd;
	if(document.Samba_form.confirmSambaPassword != null)
		document.Samba_form.confirmSambaPassword.value = sambaPwd;
}
</script>

<style  type="text/css">

*{color:  #404040;}

table td
{
margin:5 0;padding:5 0;
}
</style>

</head><body onLoad="doLoad()">
<FORM METHOD="POST" ACTION="/cgi-bin/access_samba.asp" name="Samba_form">
<div id="pagestyle">
	<div id="contenttype">
		<div id="block1">
			<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;" >
				<tr height="25px" class="bgcolor">
					<td  align="left" class="title-main" style="padding-left:20px;"><%tcWebApi_get("String_Entry","SambaServerText","s")%></td>
                                </tr>
                        </table>

			<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
			    	<tr height="30px"> 
					<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","SambaText","s")%></td>
	     				<td align=left class="tabdata">
		     				<INPUT TYPE="RADIO" NAME="Samba_active"  VALUE="Yes"  onClick="sambaOff(0);" <% If TCWebApi_get("Samba_Entry","Active","h") = "Yes" then asp_Write("checked") end if%> ><%tcWebApi_get("String_Entry","SambaActivatedText","s")%>
		     				&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="Samba_active"  VALUE="No"  onClick="sambaOff(1);" <% If TCWebApi_get("Samba_Entry","Active","h") = "No" then asp_Write("checked") end if%> ><%tcWebApi_get("String_Entry","SambaDeactivatedText","s")%>  </td>
   				 </tr>
			</table>

	<!--cindy modified start 0313-->
		<% if TCWebApi_get("Samba_Entry","Active","h") = "Yes" then %>
			<div id="showsamba" >
		<% else %>
			<div id="showsamba" style="display:none;">
		<% end if%>
	<!--cindy modified end 0313-->
				<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
					 <tr height="30px"> 
						    <td width="250px" align=left class="tabdata" style="padding-left:20px;">  <%tcWebApi_get("String_Entry","SambaUsernameText","s")%>  </td>
						    <td align=left class="tabdata"> <strong>   <% tcWebApi_get("Account_Entry0","username","s") %></strong> </td>
                                         </tr>
    
					 <tr height="30px">  
					    	  <td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","SambaNewPasswordText","s")%></td>
					   	   <td align=left class="tabdata"> <INPUT TYPE="PASSWORD" NAME="newSambaPassword" SIZE="32" MAXLENGTH="31" VALUE="" ><%tcWebApi_get("String_Entry","SambaJS9Text","s")%></td>
                                         </tr>
					 
					 <tr height="30px">  
						   <td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","SambaConfirmPasswordText","s")%> </td>
						   <td align=left class="tabdata"> <INPUT TYPE="PASSWORD" NAME="confirmSambaPassword" SIZE="32" MAXLENGTH="31" VALUE="" > </td>
                                         </tr>
					    
					 <tr height="30px">  
					      <td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","SambaWorkGroupText","s")%>  </td>
					      <td align=left class="tabdata">  <INPUT TYPE="TEXT" NAME="WorkGroup" SIZE="32" MAXLENGTH="31" VALUE="<% If TCWebApi_get("Samba_Entry","WorkGroup","h") <> "N/A" then TCWebApi_get("Samba_Entry","WorkGroup","s") end if%>" > </td>
                                         </tr>
					 
					 <tr height="30px">  
					      <td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","SambaNetBIOSNameText","s")%>  </td>
					      <td align=left class="tabdata">  <INPUT TYPE="TEXT" NAME="NetBiosName" SIZE="32" MAXLENGTH="31" VALUE="<% If TCWebApi_get("Samba_Entry","NetBiosName","h") <> "N/A" then TCWebApi_get("Samba_Entry","NetBiosName","s") end if%>" > </td>
                                         </tr>
				  </table>
			  </div>
		</div>
		
		<div id="button0">
			<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" style="margin:5px 0px;" >
				<tr height="25px">
					<td  align=left class="title-main" style="white-space:nowrap;padding-left:20px;"><%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%></td>
                                </tr>
			</table>
			
			<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata"  >
				 <tr height="40px">  
				    <td colspan="2" align=left class="tabdata" style="padding-left:20px;">
						<INPUT TYPE="HIDDEN" NAME="Sambaflag" VALUE="0">
						<INPUT TYPE="BUTTON" NAME="SaveBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="Sambasave();">
				    </td>
				    <td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
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
					<td align=center colSpan=3 style="background-color:transparent;font-family: Arial,Helvetica,sans-serif;"><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%></font></td>
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
