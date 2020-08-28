<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
		<meta http-equiv=Content-Script-Type content=text/javascript>
		<meta http-equiv=Content-Style-Type content=text/css>
		<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
		<link rel="stylesheet" type="text/css" href="/style.css">
		
	</head>

	<body text=#000000 bgcolor=#ffffff>
		<div id="pagestyle"><!--cindy add for border 11/28-->
		<div id="contenttype">
			<div id="block1">
				<table cellspacing=0 cellpadding=0 border=0 width="640" style="margin:5px 0px;">
		  			<tr height="25px" class="bgcolor">
					    	<td style="padding-left:20px;">
						    	<span class="help-header">
		    						<%tcWebApi_get("String_Entry","HelpIndexStatusText","s")%>
						    	</span>
					    	</td>
		  			</tr>
			  	</table>
		 	 </div>
		  
			<%if tcWebApi_get("WebCustom_Entry","isCwmpVDSLSupport","h") <> "Yes" then%> 
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;" >
			  			<tr>
			    				<td style="text-align:justify;text-justify:auto;">
								<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexDevInfoText","s")%>
							      	</span><br>
							      	<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpStatusTip0Text","s")%>	   
								</span>
			    				</td>
			  			</tr>
			  		</table>
		  		</div>
		  
			  	<div id="block1">
			  		<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;" >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
					      			<span class="help-main">
					      				<%tcWebApi_get("String_Entry","HelpIndexSysLogText","s")%>
					      			</span><br>
					      			<span class="help-text">
					        			<%tcWebApi_get("String_Entry","HelpStatusTip1Text","s")%>
					      			</span> 
					    		</td>							   
					  	</tr>
			   		</table>
			   	</div>
		   
			   	<div id="block1">
			   		<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;" >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
					      			<span class="help-main">
					      				<%tcWebApi_get("String_Entry","HelpIndexStatsText","s")%>
								</span><br>
					      			<span class="help-text">
					         			<%tcWebApi_get("String_Entry","HelpStatusTip2Text","s")%>
					      			</span> 
					    		</td>
					  	</tr>
			 		</table>
			  	</div>
<!--cindy add device table and wireless signal information 09/07-->
			   	<div id="block1">
			   		<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;" >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
					      			<span class="help-main">
					      				<%tcWebApi_get("String_Entry","HelpStatusTip7Text","s")%>
								</span><br>
					      			<span class="help-text">
					         			<%tcWebApi_get("String_Entry","HelpStatusTip8Text","s")%>
					      			</span> 
					    		</td>
					  	</tr>
			 		</table>
			  	</div>
			   	<div id="block1">
			   		<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;" >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
					      			<span class="help-main">
					      				<%tcWebApi_get("String_Entry","HelpStatusTip9Text","s")%>
								</span><br>
					      			<span class="help-text">
					         			<%tcWebApi_get("String_Entry","HelpStatusTip10Text","s")%>
					      			</span> 
					    		</td>
					  	</tr>
			 		</table>
			  	</div>
<!--cindy add device table and wireless signal information 09/07-->
			<%End if%>


			<%if tcWebApi_get("WebCustom_Entry","isCwmpVDSLSupport","h") = "Yes" then%> 
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640" style="padding-left:20px;padding-right:20px;"  >
					 	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
					      			<span class="help-main">
					      				<%tcWebApi_get("String_Entry","HelpIndexDevInfoText","s")%>
								</span><br>
					      			<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpStatusTip7Text","s")%>	   
						  		</span>
					    		</td>
					  	</tr>
				  	</table>
				</div>
				  
			   	<div id="block1">
			   	  	<table cellspacing=0 cellpadding=0 border=0 width="640" style="padding-left:20px;padding-right:20px;"   >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexSysLogText","s")%>
								</span><br>
							      	<span class="help-text">
							        	<%tcWebApi_get("String_Entry","HelpStatusTip8Text","s")%>
							      	</span> 
					    		</td>
					  	</tr>
				  	</table>
				  </div>
				    
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;" >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
						      		<span class="help-main">
						      			<%tcWebApi_get("String_Entry","HelpIndexStatsText","s")%>
								</span><br>
						      		<span class="help-text">
						         		<%tcWebApi_get("String_Entry","HelpStatusTip9Text","s")%>
					      			</span> 
					    		</td>
					  	</tr>
					</table>
				</div>
				  
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640" style="padding-left:20px;padding-right:20px;"  >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-sub">
							      		<%tcWebApi_get("String_Entry","HelpStatusTip10Text","s")%>
							      	</span><br>
							      	<span class="help-text">
							        	<%tcWebApi_get("String_Entry","HelpStatusTip11Text","s")%>
									<%tcWebApi_get("String_Entry","HelpStatusTip12Text","s")%>
									<%tcWebApi_get("String_Entry","HelpStatusTip13Text","s")%>
							      	</span> 
					    		</td>
					  	</tr> 
					</table>
				</div>
			<%End if%>
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
						<td align=center colSpan=3 style="color:#404040;background-color:transparent;font-family: Arial,Helvetica,sans-serif;"><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%> </font></td>
			        	</tr>
					<tr height="10">
						<td width="20">&nbsp;</td>
						<td width="250">&nbsp;</td>
						<td width="420"></td>
			         	</tr>
	                	</table>
			<%end if%>
	</body>
</html>
