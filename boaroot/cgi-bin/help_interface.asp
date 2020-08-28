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
				<table cellspacing=0 cellpadding=0 border=0 width="640" style="margin:5px 0px;"  >
					<tr height="25px" class="bgcolor">
						<td style="padding-left:20px;">
							<span class="help-header">
					    			<%tcWebApi_get("String_Entry","HelpIndexInteSetupText","s")%>
							</span>
						</td>
					</tr>
				</table>
			</div>
                                            
<!--cindy add quick start information 09/06-->
			<div id="block1">
				<table cellspacing=0 cellpadding=0 border=0 width="640" style="padding-left:20px;padding-right:20px;"  >  
				  	<tr>
				    		<td>
						      	<span class="help-main">
					    			<%tcWebApi_get("String_Entry","HelpIndexQuickText","s")%>
							</span><br>	
						</td>
					</tr>
					<tr>
						<td style="text-align:justify;text-justify:auto;">
						      	<span class="help-text">
							    		<%tcWebApi_get("String_Entry","HelpQuickTip0Text","s")%>
						      	</span>
					      </td>
					</tr>
				</table>
			</div>
<!--cindy add quick start information 09/06-->
			<div id="block1">
				<table cellspacing=0 cellpadding=0 border=0 width="640" style="padding-left:20px;padding-right:20px;"  >  
				  	<tr>
				    		<td>
						      	<span class="help-main">
						      		<%tcWebApi_get("String_Entry","HelpIndexInteSetupText","s")%>
							</span><br>	
						</td>
				  	</tr>
				  	
				  	<tr>
						<td style="text-align:justify;text-justify:auto;">
						      	<span class="help-sub">
						      		<%tcWebApi_get("String_Entry","HelpInterfTip2Text","s")%>
						      	</span><br>
							<span class="help-text">
							  	<%tcWebApi_get("String_Entry","HelpInterfTip0Text","s")%>
							  	<!-- Foxconn alan remove
							  	<%tcWebApi_get("String_Entry","HelpInterfTip1Text","s")%>  
							   	-->
							</span>
				    		</td>
				  	</tr>	
				  	
					<tr>
					    	<td style="text-align:justify;text-justify:auto;">
						      	<span class="help-sub">
						      		<%tcWebApi_get("String_Entry","HelpInterfTip3Text","s")%>
						      	</span>    
						      	<span class="help-text">
						      	<!--cindy delete 09/07
								<%tcWebApi_get("String_Entry","HelpInterfTip4Text","s")%>
								<%tcWebApi_get("String_Entry","HelpInterfTip4TextExt","s")%>
							-->		
								<%tcWebApi_get("String_Entry","HelpInterfTip5Text","s")%>
								<%tcWebApi_get("String_Entry","HelpInterfTip5TextExt","s")%>
								<%tcWebApi_get("String_Entry","HelpInterfTip6Text","s")%>
							</span>
						</td>
					</tr>
			<!--cindy delete 09/07
					<tr>
					      	<td style="text-align:justify;text-justify:auto;">
					        	<span class="help-sub">
					        		<%tcWebApi_get("String_Entry","HelpInterfTip7Text","s")%>
					        	</span><br>
						    	<span class="help-text">
						        	<%tcWebApi_get("String_Entry","HelpInterfTip8Text","s")%>	    
						        	<%tcWebApi_get("String_Entry","HelpInterfTip9Text","s")%>
						        	<%tcWebApi_get("String_Entry","HelpInterfTip10Text","s")%>		
						    	</span>
						</td>
					</tr>
			-->		
					<tr>
					    	<td style="text-align:justify;text-justify:auto;">
					      		<span class="help-sub">
					        		<%tcWebApi_get("String_Entry","HelpInterfTip11Text","s")%>      
					      		</span><br>
					      		<span class="help-text">
					        		<%tcWebApi_get("String_Entry","HelpInterfTip12Text","s")%>       
							</span>
						</td>
					</tr>
			<!--cindy delete 09/07
					<tr>
					    	<td style="text-align:justify;text-justify:auto;">
					      		<span class="help-sub">
					      			<%tcWebApi_get("String_Entry","HelpInterfTip13Text","s")%>
					      		</span><br>
					      		<span class="help-text">
								<b><i><%tcWebApi_get("String_Entry","HelpInterfTip14Text","s")%> </i></b>&nbsp;
								<span class="MsoNormal"><span lang=EN-US><%tcWebApi_get("String_Entry","HelpInterfTip15Text","s")%></span></span>
							</span>
						</td>
					</tr>

					<tr>
					    	<td style="text-align:justify;text-justify:auto;">
						      	<span class="help-sub">
						      		<%tcWebApi_get("String_Entry","HelpInterfTip16Text","s")%>
						      	</span><br>
						      	<span class="help-text">
						      		<%tcWebApi_get("String_Entry","HelpInterfTip17Text","s")%>
						      		<%tcWebApi_get("String_Entry","HelpInterfTip18Text","s")%>		
							</span>
						</td>
					</tr>
			-->		
					<tr>
					    	<td style="text-align:justify;text-justify:auto;">
						      	<span class="help-sub">
						      		<%tcWebApi_get("String_Entry","HelpInterfTip19Text","s")%>
						      	</span><br>
						      	<span class="help-text">
								<%tcWebApi_get("String_Entry","HelpInterfTip20Text","s")%>
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
						      		<%tcWebApi_get("String_Entry","HelpInterfTip21Text","s")%>
						      	</span><br>
						      	<span class="help-text">
						      		<%tcWebApi_get("String_Entry","HelpInterfTip22Text","s")%>
							</span>
				    		</td>
				  	</tr>
			<!--cindy delete 09/07
				  	<tr>
				    		<td style="text-align:justify;text-justify:auto;">
					      		<span class="help-sub">
					      			<%tcWebApi_get("String_Entry","HelpInterfTip23Text","s")%> 
					      		</span><br>
					      		<span class="help-text">
						    		<%tcWebApi_get("String_Entry","HelpInterfTip24Text","s")%>
						  	</span>
				    		</td>
				  	</tr>
			-->  	
				    	<tr>
				    		<td style="text-align:justify;text-justify:auto;">
					      		<span class="help-sub">
					      			<%tcWebApi_get("String_Entry","HelpInterfTip25Text","s")%>
					      		</span><br>
					      		<span class="help-text">
						    		<%tcWebApi_get("String_Entry","HelpInterfTip26Text","s")%>
					  		</span>
				    		</td>
				  	</tr>
				  	
				    	<tr>
				      		<td style="text-align:justify;text-justify:auto;"> 
					        	<span class="help-sub">
					        		<%tcWebApi_get("String_Entry","HelpInterfTip27Text","s")%>
					        	</span><br>
					        	<span class="help-text"> 
						        	<%tcWebApi_get("String_Entry","HelpInterfTip28Text","s")%>
						        	<%tcWebApi_get("String_Entry","HelpInterfTip29Text","s")%> 
					        	</span>
				      		</td>
				    	</tr>
				    
				    	<tr>
				      		<td style="text-align:justify;text-justify:auto;"> 
						    	<span class="help-sub">
						    		<%tcWebApi_get("String_Entry","HelpInterfTip30Text","s")%> 
						    	</span><br>
					        	<span class="help-text"> 
					        		<%tcWebApi_get("String_Entry","HelpInterfTip31Text","s")%>
								<%tcWebApi_get("String_Entry","HelpInterfTip32Text","s")%>
							</span> 
					  	</td>
				    	</tr>

				  	<tr>
				    		<td style="text-align:justify;text-justify:auto;">
					      		<span class="help-sub">
					      			<%tcWebApi_get("String_Entry","HelpInterfTip33Text","s")%>
					      		</span><br>
						  	<span class="help-text">
						  		<%tcWebApi_get("String_Entry","HelpInterfTip34Text","s")%>
							</span>
						</td>
				  	</tr>
				</table>
			</div>
			
			<% if tcWebApi_get("Info_WLan","isExist","h") = "N/A" then%>
			<%else%>
				<div id="block1">
					<table cellspacing=0 cellpadding=0 border=0 width="640"  style="padding-left:20px;padding-right:20px;"  >
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;"> 
							      	<span class="help-main">
							      		<%tcWebApi_get("String_Entry","HelpInterfTip35Text","s")%>
							      	</span><br>
							      	<span class="help-text">  
							       	<%tcWebApi_get("String_Entry","HelpInterfTip36Text","s")%>     
								</span>
					    		</td>
					  	</tr>
					  	
					  	<!-- saffi removed + the WEP help info -->
					 	<!-- <tr>
					    	<td> 
					      	<span class="help-sub">
					      
					      	<%tcWebApi_get("String_Entry","HelpInterfTip37Text","s")%>
					      
					      	</span><br>
					      	<span class="help-text">
					       <%tcWebApi_get("String_Entry","HelpInterfTip38Text","s")%>
					       
						-->
					       <!-- Foxconn alan add -->
						<!--
					       <%tcWebApi_get("String_Entry","HelpInterfTip38TextExt","s")%>
						   <%tcWebApi_get("String_Entry","HelpInterfTip39Text","s")%>       
							
						  </span>
					    	</td>
					  	</tr> -->  
								<!-- saffi removed - the WEP help info 
					  	<tr>
					    	<td>&nbsp;</td>
					  	</tr>
						-->
						
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;"> 
							      	<span class="help-sub">
							      		<%tcWebApi_get("String_Entry","HelpInterfTip40Text","s")%> 
							      	</span><br>
							      	<span class="help-text">
							       	<%tcWebApi_get("String_Entry","HelpInterfTip41Text","s")%>        
								</span>
					    		</td>
					  	</tr>   
					  
					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;"> 
							      	<span class="help-sub">
							      		<%tcWebApi_get("String_Entry","HelpInterfTip42Text","s")%>
							      	</span><br>
							      	<span class="help-text">  
							        	<%tcWebApi_get("String_Entry","HelpInterfTip43Text","s")%>    
							        	<!-- Foxconn alan add -->
							  <!--cindy delete      	
							        	<%tcWebApi_get("String_Entry","HelpInterfTip43TextExt","s")%>    
									<%tcWebApi_get("String_Entry","HelpInterfTip44Text","s")%>
							   -->	
									<!-- Foxconn alan add -->
									<%tcWebApi_get("String_Entry","HelpInterfTip44TextExt","s")%>
								</span>
					    		</td>
					  	</tr>

					  	<tr>
					    		<td style="text-align:justify;text-justify:auto;"> 
							      	<span class="help-sub">
							      		<%tcWebApi_get("String_Entry","HelpInterfTip45Text","s")%>
							      	</span><br>
							      	<span class="help-text">   
							       	<%tcWebApi_get("String_Entry","HelpInterfTip46Text","s")%>    
							       	<!-- Foxconn alan add -->
							       	<%tcWebApi_get("String_Entry","HelpInterfTip46TextExt","s")%>    
								</span>
					    		</td>
					  	</tr>  
					  
					  	<!--<tr>
					    		<td>&nbsp;</td>
					  	</tr>-->
					</table>
				</div>
			<%end if%>
<!--Cindy add NAT and QOS information 09/06-->
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
			  <!--cindy delete 09/07     	
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
			-->
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
			  <!--cindy delete 09/07     	
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
			-->		  	
					</table>
				</div>
<!--Cindy add NAT and QOS information 09/06-->
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
