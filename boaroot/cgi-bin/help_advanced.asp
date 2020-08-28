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
			<tbody>
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640" style="margin:5px 0px;"  >
			  			<tr height="25px" class="bgcolor">
							<td style="padding-left:20px;">
								<span class="help-header">
			    						<%tcWebApi_get("String_Entry","HelpIndexAdvSetupText","s")%>
								</span>
							</td>
			  			</tr>
					</table>
				</div>
                                                                                 
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640" style="padding-left:20px;padding-right:20px;"  >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
					      			<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexFirewallText","s")%>
							      	</span><br>
							      	<span class="help-text">
						    			<%tcWebApi_get("String_Entry","HelpAdvTip0Text","s")%>
						  		</span>
					    		</td>
					  	</tr>
					</table>
				</div>
				                                                                             
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"  >                                                                         
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexRoutingText","s")%>
							      	</span><br>
							      	<span class="help-text">					      
						    			<%tcWebApi_get("String_Entry","HelpAdvTip1Text","s")%>						  
						  		</span>
					    		</td>
					  	</tr>

					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-sub">
							      		<%tcWebApi_get("String_Entry","HelpAdvTip2Text","s")%>
							      	</span><br>      
							      	<span class="help-text">
							      		<%tcWebApi_get("String_Entry","HelpAdvTip3Text","s")%>
							      		<!-- Foxconn alan add -->
							      		<%tcWebApi_get("String_Entry","HelpAdvTip3TextExt","s")%>
							      		<%tcWebApi_get("String_Entry","HelpAdvTip4Text","s")%>  
							      		<!--cindy delete 09/07
								  	<%tcWebApi_get("String_Entry","HelpAdvTip5Text","s")%>
								  	-->
								</span>	
							</td>
					  	</tr>
					</table>
				</div>
<!--cindy delete 09/06                      
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640" style="padding-left:20px;padding-right:20px;"   >                                                                                         
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpIndexNATText","s")%>
							      	</span><br>
							      	<span class="help-text">
							      		<%tcWebApi_get("String_Entry","HelpAdvTip6Text","s")%>
							      		<%tcWebApi_get("String_Entry","HelpAdvTip6TextExt","s")%>
							         	<%tcWebApi_get("String_Entry","HelpAdvTip7Text","s")%>
							      	</span> 
					    		</td>
					  	</tr>

					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
						      		<span class="help-sub">
						      			NAT :: DMZ
						      		</span><br>
						      		<span class="help-text">
						      			<%tcWebApi_get("String_Entry","HelpAdvTip8Text","s")%>
						      		</span>
					    		</td>
					  	</tr>

					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
						      		<span class="help-sub">
						      			<%tcWebApi_get("String_Entry","HelpAdvTip9Text","s")%>
						      		</span><br>
							  	<span class="help-text">
							  		<%tcWebApi_get("String_Entry","HelpAdvTip10Text","s")%>
						       		<%tcWebApi_get("String_Entry","HelpAdvTip11Text","s")%> 
						        	</span>
					     		</td>
					  	</tr>
	
					  	<tr>
					    		<td bgcolor="#FFFFFF" style="text-align:justify;text-justify:auto;">
					      			<span class="help-sub">
					      				<%tcWebApi_get("String_Entry","HelpAdvTip12Text","s")%>
					      			</span><br>
					      			<span class="help-text">
					        			<%tcWebApi_get("String_Entry","HelpAdvTip13Text","s")%>
					        			<%tcWebApi_get("String_Entry","HelpAdvTip13TextExt","s")%>
									<%tcWebApi_get("String_Entry","HelpAdvTip14Text","s")%>
									<%tcWebApi_get("String_Entry","HelpAdvTip14TextExt","s")%>
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
									<%tcWebApi_get("String_Entry","HelpIndexQoSText","s")%>	
								</span>
								<br>
								<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpAdvTip15Text","s")%>	
								</span>
							</td>
						</tr>

					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
					    			<span class="help-sub">					    
							    		<%tcWebApi_get("String_Entry","HelpAdvTip16Text","s")%>					    
							    	</span><br>
								<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpAdvTip17Text","s")%>
									<%tcWebApi_get("String_Entry","HelpAdvTip17TextExt","s")%>
									<%tcWebApi_get("String_Entry","HelpAdvTip18Text","s")%>						
								</span>
							</td>
					  	</tr>

					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
								<span class="help-sub">
									<%tcWebApi_get("String_Entry","HelpAdvTip19Text","s")%>
								</span><br>
								<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpAdvTip20Text","s")%>
								</span>
							</td>
						</tr>

					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
								<span class="help-sub">
									<%tcWebApi_get("String_Entry","HelpAdvTip21Text","s")%>
								</span><br>
								<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpAdvTip22Text","s")%>
								</span>
							</td>
						</tr>

					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;">
								<span class="help-sub">
									<%tcWebApi_get("String_Entry","HelpAdvTip23Text","s")%>
								</span>
								<br>
								<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpAdvTip24Text","s")%>
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
									<%tcWebApi_get("String_Entry","HelpIndexVLANText","s")%>
								</span><br>
								<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpAdvTip25Text","s")%>						
								</span>
								
								<p style="margin-left: 18.0pt">
									<span class="help-text">
										<%tcWebApi_get("String_Entry","HelpAdvTip26Text","s")%>
									</span>
								</p>
								
								<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") <> "Yes" then%>
									<p  style="margin-left: 18.0pt">
										<span class="help-text">
											<%tcWebApi_get("String_Entry","HelpAdvTip27Text","s")%>										
										</span>
									</p>
								<%End if%>
								
								<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpAdvTip28Text","s")%>
									<%tcWebApi_get("String_Entry","HelpAdvTip28TextExt","s")%>
									<%tcWebApi_get("String_Entry","HelpAdvTip29Text","s")%>
									<%tcWebApi_get("String_Entry","HelpAdvTip29TextExt","s")%>
								</span>
							</td>
						</tr>
						
						<tr>
							<td style="text-align:justify;text-justify:auto;">
								<span class="help-sub">
									<%tcWebApi_get("String_Entry","HelpAdvTip30Text","s")%>
								</span><br>
								<span class="help-text">
									<%tcWebApi_get("String_Entry","HelpAdvTip31Text","s")%>
								</span>
							</td>
					  	</tr>
					</table>
				</div>
-->				
				<%if tcWebApi_get("WebCustom_Entry","haveXPON","h") <> "Yes" then%>					
					<%if tcWebApi_get("WebCustom_Entry","isCwmpVDSLSupport","h") <> "Yes" then%>                          
						<div id="block1">
							<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"  >
							  	<tr>
							    		<td style="text-align:justify;text-justify:auto;">
									      	<span class="help-main">
									      		<%tcWebApi_get("String_Entry","HelpIndexADSLText","s")%>
										</span><br>
									      	<span class="help-text">
									      		<%tcWebApi_get("String_Entry","HelpAdvTip32Text","s")%>
										</span>
							    		</td>
							  	</tr>  

							  	<tr>
							    		<td style="text-align:justify;text-justify:auto;">
									    	<span class="help-sub">
									    		<%tcWebApi_get("String_Entry","HelpAdvTip33Text","s")%>
									    	</span><br>
										<span class="help-text">
											<%tcWebApi_get("String_Entry","HelpAdvTip34Text","s")%>
										</span>
									</td>
							  	</tr>
							  	
							  	<tr>
							    		<td style="text-align:justify;text-justify:auto;">
							    			<span class="help-sub">
									    		<%tcWebApi_get("String_Entry","HelpAdvTip35Text","s")%>
									    	</span><br>
										<span class="help-text">
											<%tcWebApi_get("String_Entry","HelpAdvTip36Text","s")%>
										</span>
									</td>
							  	</tr>  
							</table>
						</div>
 					<%End if%> 
 					
				 	<%if tcWebApi_get("WebCustom_Entry","isCwmpVDSLSupport","h") = "Yes" then%>                          
						<div id="block1">
							<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"  >
							  	<tr>
							    		<td style="text-align:justify;text-justify:auto;">
									      	<span class="help-main">
									      		<%tcWebApi_get("String_Entry","HelpIndexVDSLText","s")%>
										</span><br>
									      	<span class="help-text">
									      		<%tcWebApi_get("String_Entry","HelpAdvTip37Text","s")%>
										</span>
							    		</td>
							  	</tr>  

							  	<tr>
							    		<td style="text-align:justify;text-justify:auto;">
									    	<span class="help-sub">
									    		<%tcWebApi_get("String_Entry","HelpAdvTip38Text","s")%>
									    	</span><br>
										<span class="help-text">
											<%tcWebApi_get("String_Entry","HelpAdvTip39Text","s")%>
										</span>
									</td>
							  	</tr>

							  	<tr>
							    		<td style="text-align:justify;text-justify:auto;">
									    	<span class="help-sub">
									    		<%tcWebApi_get("String_Entry","HelpAdvTip40Text","s")%>
									    	</span><br>
										<span class="help-text">
											<%tcWebApi_get("String_Entry","HelpAdvTip41Text","s")%>
										</span>
									</td>
							  	</tr>  
							</table>
						</div>
				 	<%End if%> 
					<%if tcWebApi_get("WebCustom_Entry","isALGSupported","h") = "Yes" then%>                          
						<div id="block1">
							<table cellspacing=0 cellpadding=0 border=0 width="640"   style="padding-left:20px;padding-right:20px;" >
							  	<tr>
							    		<td style="text-align:justify;text-justify:auto;">
									      	<span class="help-main">
									      		<%tcWebApi_get("String_Entry","HelpIndexALGText","s")%>  
									      	</span><br>
									      	<span class="help-text">
									      		<%tcWebApi_get("String_Entry","HelpAdvTip101Text","s")%>
									      	</span>
							    		</td>
							  	</tr>  
							</table>
						</div>
					<%End if%> 
				<%End if%>

<!--Cindy add ALG Switch 09/06-->
						<div id="block1">
							<table cellspacing=0 cellpadding=0 border=0 width="640"   style="padding-left:20px;padding-right:20px;" >
							  	<tr>
							    		<td style="text-align:justify;text-justify:auto;">
									      	<span class="help-main">
									      		<%tcWebApi_get("String_Entry","HelpIndexALGText","s")%>  
									      	</span><br>
									      	<span class="help-text">
									      		<%tcWebApi_get("String_Entry","HelpAdvTip101Text","s")%>
									      	</span>
							    		</td>
							  	</tr>  
							</table>
						</div>
<!--Cindy add ALG Switch 09/06-->
			</tbody>
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
