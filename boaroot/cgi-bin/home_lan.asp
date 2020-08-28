<%
If Request_Form("isIPv6Supported") <> "1" Then
	tcWebApi_set("Wan_PVC","IPVERSION","IPv4/IPv6")
End If

If Request_Form("lanFlag") <> "" Then

	tcWebApi_set("WebCurSet_Entry","lan_id","lan_VC")
	
		TCWebApi_set("Lan_Dhcp","type","dhcpTypeRadio")
	
	If Request_Form("aliasFlag")="Yes" Then
		TCWebApi_set("WebCurSet_Entry","lanAlias_id","lan_Alias_VC")
		TCWebApi_set("LanAlias_Entry","IP","uiViewAliasIPAddr")
		TCWebApi_set("LanAlias_Entry","netmask","uiViewAliasNetMask")	
		If Request_Form("dhcpFlag") ="0" Then		
			tcWebApi_commit("LanAlias")
		End If
	End If
	
        TCWebApi_set("Lan_Entry","IP","uiViewIPAddr")
        TCWebApi_set("Lan_Entry","netmask","uiViewNetMask")
       TCWebApi_set("Lan_Isolate","IsolateEable","isolate_client")
       TCWebApi_set("Lan_LoopGuard","Status","LoopGuard")
       If Request_Form("isolateigmpFlag") <> "1" Then
       	  TCWebApi_set("Lan_Isolate","IsolateIGMP","Isolate_IGMP")
       else
       	  TCWebApi_set("Lan_Isolate","IsolateIGMP","ActiveIsolateIGMP")
       end if
       TCWebApi_set("Lan_NATSession","Active","Limit_natsession")
        
    if tcwebApi_get("WebCustom_Entry","isC1SFUSupported","h") <> "Yes" then
	    if tcwebApi_get("WebCustom_Entry","isSNOOPSupported","h") = "Yes" then
	    		TCWebApi_set("Lan_Snoop","snoopEnable","lan_snoop")	
	    		TCWebApi_set("Lan_Snoop","igmpforwifi","WIFI_IGMP")
	    else   
	        TCWebApi_set("Lan_IgmpSnoop","igmpsnoopEnable","lan_Igmpsnoop")		
	    end if
    end if

	if tcwebApi_get("WebCustom_Entry","isDasanVtagTransSupported","h") = "Yes" then
    		TCWebApi_set("XPON_Common","LanVidTransparent","vlan_transparent")
    		tcWebApi_commit("XPON_Common")
    end if

    If Request_Form("isIPv6Supported") = "1" Then   
    	TCWebApi_set("Lan_Snoop","groupNum","snoopGroupNum")
    End if	     
    if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then
        TCWebApi_set("Lan_Entry","IP6","uiViewIPv6Addr")
        TCWebApi_set("Lan_Entry","PREFIX6","uiViewIPv6Prefix")
    end if
        
    if tcwebApi_get("WebCustom_Entry","isC1SFUSupported","h") <> "Yes" then    
        TCWebApi_set("LanRipd_Entry","RIPVERSION","lan_RIP")
        TCWebApi_set("LanRipd_Entry","DIRECTION","lan_RIP_Dir")
    end if

	if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then
		If Request_Form("isIPv6Supported") = "1" Then 
			if tcwebApi_get("WebCustom_Entry","isRipngSupported","h") = "Yes" then
				TCWebApi_set("LanRipd_Entry","RIPNGENABLE","ripngEnableRadio")
				If Request_Form("ripngEnableRadio") = "1" Then 
					TCWebApi_set("LanRipd_Entry","RIPNGDIRECTION","lan_Ripng_Dir")
				End if
			end if
		End if
	end if
	if tcwebApi_get("WebCustom_Entry","isSNOOPSupported","h") <> "Yes" then
		if tcwebApi_get("WebCustom_Entry","isMLDSupported","h") = "Yes" then
			TCWebApi_set("Lan_MldSnoop","mldsnoopEnable","lan_Mldsnoop")
		end if
	end if
	if tcwebApi_get("WebCustom_Entry","isBridgeMacLimitSupported","h") = "Yes" then
			TCWebApi_set("Lan_BridgeMacLimit","macLimitTotal","uiMacLimitTotal")
			TCWebApi_set("Lan_BridgeMacLimit","macLimitPort1","uiMacLimitPort1")
			TCWebApi_set("Lan_BridgeMacLimit","macLimitPort2","uiMacLimitPort2")
			TCWebApi_set("Lan_BridgeMacLimit","macLimitPort3","uiMacLimitPort3")
			TCWebApi_set("Lan_BridgeMacLimit","macLimitPort4","uiMacLimitPort4")
	end if
	if tcwebApi_get("WebCustom_Entry","isStdioTimeoutSupported","h") = "Yes" then
			TCWebApi_set("GUI_Entry0","StdioTimeout","StdioTimeOut")
			tcWebApi_commit("GUI_Entry0");
	end if
	If tcWebApi_get("Lan_EtherMedia","enable","h") = "support" Then 
        	TCWebApi_set("Lan_EtherMedia","port0","EtherMedia0")
	        if tcWebApi_get("Info_Ether","is4PortsEther","h") = "Yes" Then
        	        TCWebApi_set("Lan_EtherMedia","port1","EtherMedia1")
                	TCWebApi_set("Lan_EtherMedia","port2","EtherMedia2")
	                TCWebApi_set("Lan_EtherMedia","port3","EtherMedia3")
        	End If
        End If 

        If Request_Form("dhcpFlag") ="0" Then
                tcWebApi_commit("LanRipd_Entry")
				tcWebApi_save()
                tcWebApi_commit("Lan")
        End If

	if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then
        If Request_Form("dhcpTypeRadio")="0" Then
                TCWebApi_unset("DhcpRelay_Entry")
                'TCWebApi_unset("Dproxy_Entry")
                If Request_Form("dhcpFlag") ="0" Then
                        tcWebApi_commit("DhcpRelay_Entry")
                        tcWebApi_commit("Dhcpd_Common")
                        'tcWebApi_commit("Dproxy_Entry")
                End If
        End If
        
        If Request_Form("dhcpTypeRadio")="1" Then
			If Request_Form("dhcpFlag") ="0" Then
			IF request_Form("DHCPFilterFlag")="Yes" then
				TCWebApi_unset("Dhcpd_Common")
			end if
			end if
                TCWebApi_set("Dhcpd_Common","start","StartIp")
                TCWebApi_set("Dhcpd_Common","end","EndIp")
                TCWebApi_set("Dhcpd_Common","pool_count","PoolSize")
                TCWebApi_set("Dhcpd_Common","lease","dhcp_LeaseTime")
				
				' set dhcp port filter value to cfg node 
				If Request_Form("dhcpFlag") ="0" Then
				if request_Form("DHCPFilterFlag") = "Yes" then
					if request_Form("QoS1PortsFlag") = "Yes" then
						TCWebApi_set("Dhcpd_Common","eth0","DHCPPhyPortEth0")
					elseif request_Form("DHCPZY1PortsFlag") = "Yes" then
						TCWebApi_set("Dhcpd_Common","eth0.1","DHCPPhyPortEth0")
					else
						TCWebApi_set("Dhcpd_Common","eth0.1","DHCPPhyPortEth0")
						TCWebApi_set("Dhcpd_Common","eth0.2","DHCPPhyPortEth1")
					end if
					if request_Form("QoS2PortsFlag") <> "Yes" then
						if request_Form("QoS1PortsFlag") <> "Yes" then
							TCWebApi_set("Dhcpd_Common","eth0.3","DHCPPhyPortEth2")
							TCWebApi_set("Dhcpd_Common","eth0.4","DHCPPhyPortEth3")
						end if
					end if
					'TCWebAPI_set("Dhcpd_Common","usb0","DHCPPhyPortUsb0")
					if request_Form("wlanISExist") = "On" then
						if TCWebAPI_get("WLan_Common","BssidNum","h") = "1" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortRa0")
						elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "2" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortWLANMssid0")
							if TCWebAPI_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then
							TCWebAPI_set("Dhcpd_Common","ra1","DHCPPhyPortWLANMssid1")
							end if
						elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "3" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortWLANMssid0")
							if TCWebAPI_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then
							TCWebAPI_set("Dhcpd_Common","ra1","DHCPPhyPortWLANMssid1")
							end if						
							TCWebAPI_set("Dhcpd_Common","ra2","DHCPPhyPortWLANMssid2")
						elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "4" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortWLANMssid0")
							if TCWebAPI_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then
							TCWebAPI_set("Dhcpd_Common","ra1","DHCPPhyPortWLANMssid1")
							end if						
							TCWebAPI_set("Dhcpd_Common","ra2","DHCPPhyPortWLANMssid2")
							TCWebAPI_set("Dhcpd_Common","ra3","DHCPPhyPortWLANMssid3")	
						end if
					end if
				if request_Form("wlan11acISExist") = "On" then
						if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then
							TCWebAPI_set("Dhcpd_Common","rai0","DHCPPhyPortRai0")
						elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "2" then
							TCWebAPI_set("Dhcpd_Common","rai0","DHCPPhyPortWLAN11acMssid0")
							TCWebAPI_set("Dhcpd_Common","rai1","DHCPPhyPortWLAN11acMssid1")
						elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "3" then
							TCWebAPI_set("Dhcpd_Common","rai0","DHCPPhyPortWLAN11acMssid0")
							TCWebAPI_set("Dhcpd_Common","rai1","DHCPPhyPortWLAN11acMssid1")
							TCWebAPI_set("Dhcpd_Common","rai2","DHCPPhyPortWLAN11acMssid2")
						elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "4" then
							TCWebAPI_set("Dhcpd_Common","rai0","DHCPPhyPortWLAN11acMssid0")
							TCWebAPI_set("Dhcpd_Common","rai1","DHCPPhyPortWLAN11acMssid1")
							TCWebAPI_set("Dhcpd_Common","rai2","DHCPPhyPortWLAN11acMssid2")
							TCWebAPI_set("Dhcpd_Common","rai3","DHCPPhyPortWLAN11acMssid3")	
						end if
				end if
				end if
				end if
                If Request_Form("option60Flag")="Yes" Then
                        TCWebApi_set("Dhcpd_Option60","start","ConPoolStartIp")
                        TCWebApi_set("Dhcpd_Option60","pool_count","ConPoolPoolSize")
                        TCWebApi_set("Dhcpd_Option60","VendorID","VendorClassID")
                        TCWebApi_set("Dhcpd_Option60","lease","dhcp_LeaseTime")
                        If Request_Form("dhcpFlag") ="0" Then				
                                tcWebApi_commit("Dhcpd_Option60")
                        End If
                End If

                tcWebApi_set("Dhcpd_Common","Active","DNSproxy")
                TCWebApi_set("Dhcpd_Common","type","dnsTypeRadio")
                TCWebApi_set("Dhcpd_Common","Primary_DNS","PrimaryDns")
                TCWebApi_set("Dhcpd_Common","Secondary_DNS","SecondDns")
                                        
                If Request_form("delnum") <> "" Then
                        tcWebApi_set("WebCurSet_Entry","dhcpd_id","delnum")
                        tcWebApi_unset("Dhcpd_Entry")	
                elseif Request_Form("addFlag")="1" Then
                        if Request_form("emptyEntry") <> "" then
                        tcWebApi_set("WebCurSet_Entry","dhcpd_id","emptyEntry")				
                        tcWebApi_set("Dhcpd_Entry","IP","IpAddr")
                        tcWebApi_set("Dhcpd_Entry","MAC","MACAddr")
                        end if
                end if	

                TCWebApi_unset("DhcpRelay_Entry")
                If Request_Form("dhcpFlag") ="0" Then
                        tcWebApi_commit("DhcpRelay_Entry")
                        tcWebApi_commit("Dhcpd_Common")
                        'tcWebApi_commit("Dproxy_Entry")
                End If
        End If
        
        If Request_Form("dhcpTypeRadio")="2" Then
                TCWebApi_set("DhcpRelay_Entry","Server","ServerIp")
	            'TCWebApi_unset("Dproxy_Entry")
                If Request_Form("dhcpFlag") ="0" Then
                        tcWebApi_commit("DhcpRelay_Entry")
                        tcWebApi_commit("Dhcpd_Common")
                        'tcWebApi_commit("Dproxy_Entry")
                End If
        End If
		

		tcWebApi_set("DyVLAN_Common","Type","OUIDeviceSeleradio")	

	if Request_Form("ouiFlag")="3" Then
		tcWebApi_set("WebCurSet_Entry","DyVlan_Index","IndexOfOUI")
		If Request_Form("OUIDeviceSeleradio")="STB" Then
			tcWebApi_set("DyVLAN_Entry","STB_OUI","uiOUI")
                elseif Request_Form("OUIDeviceSeleradio")="Voip" Then
                        tcWebApi_set("DyVLAN_Entry","Voip_OUI","uiOUI")
                End If
                If Request_Form("dhcpFlag") ="0" Then
                	tcWebApi_commit("DyVLAN_Entry")	
                End If
        End If

elseif tcWebApi_get("DeviceInfo", "isCYSFU", "h") = "Yes" then
        If Request_Form("dhcpTypeRadio")="0" Then
                TCWebApi_unset("DhcpRelay_Entry")
                'TCWebApi_unset("Dproxy_Entry")
                If Request_Form("dhcpFlag") ="0" Then
                        tcWebApi_commit("DhcpRelay_Entry")
                        tcWebApi_commit("Dhcpd_Common")
                        'tcWebApi_commit("Dproxy_Entry")
                End If
        End If
        
        If Request_Form("dhcpTypeRadio")="1" Then
			If Request_Form("dhcpFlag") ="0" Then
			IF request_Form("DHCPFilterFlag")="Yes" then
				TCWebApi_unset("Dhcpd_Common")
			end if
			end if
                TCWebApi_set("Dhcpd_Common","start","StartIp")
                TCWebApi_set("Dhcpd_Common","end","EndIp")
                TCWebApi_set("Dhcpd_Common","pool_count","PoolSize")
                TCWebApi_set("Dhcpd_Common","lease","dhcp_LeaseTime")
				
				' set dhcp port filter value to cfg node 
				If Request_Form("dhcpFlag") ="0" Then
				if request_Form("DHCPFilterFlag") = "Yes" then
					if request_Form("QoS1PortsFlag") = "Yes" then
						TCWebApi_set("Dhcpd_Common","eth0","DHCPPhyPortEth0")
					else
						TCWebApi_set("Dhcpd_Common","eth0.1","DHCPPhyPortEth0")
						TCWebApi_set("Dhcpd_Common","eth0.2","DHCPPhyPortEth1")
					end if
					if request_Form("QoS2PortsFlag") <> "Yes" then
						if request_Form("QoS1PortsFlag") <> "Yes" then
							TCWebApi_set("Dhcpd_Common","eth0.3","DHCPPhyPortEth2")
							TCWebApi_set("Dhcpd_Common","eth0.4","DHCPPhyPortEth3")
						end if
					end if
					'TCWebAPI_set("Dhcpd_Common","usb0","DHCPPhyPortUsb0")
					if request_Form("wlanISExist") = "On" then
						if TCWebAPI_get("WLan_Common","BssidNum","h") = "1" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortRa0")
						elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "2" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortWLANMssid0")
							if TCWebAPI_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then
							TCWebAPI_set("Dhcpd_Common","ra1","DHCPPhyPortWLANMssid1")
							end if
						elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "3" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortWLANMssid0")
							if TCWebAPI_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then
							TCWebAPI_set("Dhcpd_Common","ra1","DHCPPhyPortWLANMssid1")
							end if						
							TCWebAPI_set("Dhcpd_Common","ra2","DHCPPhyPortWLANMssid2")
						elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "4" then
							TCWebAPI_set("Dhcpd_Common","ra0","DHCPPhyPortWLANMssid0")
							if TCWebAPI_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then
							TCWebAPI_set("Dhcpd_Common","ra1","DHCPPhyPortWLANMssid1")
							end if						
							TCWebAPI_set("Dhcpd_Common","ra2","DHCPPhyPortWLANMssid2")
							TCWebAPI_set("Dhcpd_Common","ra3","DHCPPhyPortWLANMssid3")	
						end if
					end if
				if request_Form("wlan11acISExist") = "On" then
						if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then
							TCWebAPI_set("Dhcpd_Common","rai0","DHCPPhyPortRai0")
						elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "2" then
							TCWebAPI_set("Dhcpd_Common","rai0","DHCPPhyPortWLAN11acMssid0")
							TCWebAPI_set("Dhcpd_Common","rai1","DHCPPhyPortWLAN11acMssid1")
						elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "3" then
							TCWebAPI_set("Dhcpd_Common","rai0","DHCPPhyPortWLAN11acMssid0")
							TCWebAPI_set("Dhcpd_Common","rai1","DHCPPhyPortWLAN11acMssid1")
							TCWebAPI_set("Dhcpd_Common","rai2","DHCPPhyPortWLAN11acMssid2")
						elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "4" then
							TCWebAPI_set("Dhcpd_Common","rai0","DHCPPhyPortWLAN11acMssid0")
							TCWebAPI_set("Dhcpd_Common","rai1","DHCPPhyPortWLAN11acMssid1")
							TCWebAPI_set("Dhcpd_Common","rai2","DHCPPhyPortWLAN11acMssid2")
							TCWebAPI_set("Dhcpd_Common","rai3","DHCPPhyPortWLAN11acMssid3")	
						end if
				end if
				end if
				end if
                If Request_Form("option60Flag")="Yes" Then
                        TCWebApi_set("Dhcpd_Option60","start","ConPoolStartIp")
                        TCWebApi_set("Dhcpd_Option60","pool_count","ConPoolPoolSize")
                        TCWebApi_set("Dhcpd_Option60","VendorID","VendorClassID")
                        TCWebApi_set("Dhcpd_Option60","lease","dhcp_LeaseTime")
                        If Request_Form("dhcpFlag") ="0" Then				
                                tcWebApi_commit("Dhcpd_Option60")
                        End If
                End If

                tcWebApi_set("Dhcpd_Common","Active","DNSproxy")
                TCWebApi_set("Dhcpd_Common","type","dnsTypeRadio")
                TCWebApi_set("Dhcpd_Common","Primary_DNS","PrimaryDns")
                TCWebApi_set("Dhcpd_Common","Secondary_DNS","SecondDns")
                                        
                If Request_form("delnum") <> "" Then
                        tcWebApi_set("WebCurSet_Entry","dhcpd_id","delnum")
                        tcWebApi_unset("Dhcpd_Entry")	
                elseif Request_Form("addFlag")="1" Then
                        if Request_form("emptyEntry") <> "" then
                        tcWebApi_set("WebCurSet_Entry","dhcpd_id","emptyEntry")				
                        tcWebApi_set("Dhcpd_Entry","IP","IpAddr")
                        tcWebApi_set("Dhcpd_Entry","MAC","MACAddr")
                        end if
                end if	

                TCWebApi_unset("DhcpRelay_Entry")
                If Request_Form("dhcpFlag") ="0" Then
                        tcWebApi_commit("DhcpRelay_Entry")
                        tcWebApi_commit("Dhcpd_Common")
                        'tcWebApi_commit("Dproxy_Entry")
                End If
        End If
        
        If Request_Form("dhcpTypeRadio")="2" Then
                TCWebApi_set("DhcpRelay_Entry","Server","ServerIp")
	            'TCWebApi_unset("Dproxy_Entry")
                If Request_Form("dhcpFlag") ="0" Then
                        tcWebApi_commit("DhcpRelay_Entry")
                        tcWebApi_commit("Dhcpd_Common")
                        'tcWebApi_commit("Dproxy_Entry")
                End If
        End If
		

		tcWebApi_set("DyVLAN_Common","Type","OUIDeviceSeleradio")	

	if Request_Form("ouiFlag")="3" Then
		tcWebApi_set("WebCurSet_Entry","DyVlan_Index","IndexOfOUI")
		If Request_Form("OUIDeviceSeleradio")="STB" Then
			tcWebApi_set("DyVLAN_Entry","STB_OUI","uiOUI")
                elseif Request_Form("OUIDeviceSeleradio")="Voip" Then
                        tcWebApi_set("DyVLAN_Entry","Voip_OUI","uiOUI")
                End If
                If Request_Form("dhcpFlag") ="0" Then
                	tcWebApi_commit("DyVLAN_Entry")	
                End If
        End If

 end if
End If
	
if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then 
	If Request_Form("isIPv6Supported") = "1" Then 
		

	
			If Request_Form("radvdFlag")="1" Then
				TCWebApi_set("Radvd_Entry","Enable","radvdEnableFlag")
				If Request_Form("radvdEnableFlag")="1" Then
					TCWebApi_set("Radvd_Entry","Mode","radvdModeFlag")
				if tcwebApi_get("WebCustom_Entry","isRaFlagSetSupported","h") = "Yes" then
					TCWebApi_set("Radvd_Entry","M_Flag","radvdManagedAddrflag")
					TCWebApi_set("Radvd_Entry","O_Flag","radvdOtherConfigflag")
				end if
				End If
			End If
			
			If Request_Form("radvdFlag")="0" Then
				TCWebApi_set("Radvd_Entry","Enable","radvdEnableFlag")
				If Request_Form("radvdEnableFlag")="1" Then
					TCWebApi_set("Radvd_Entry","Mode","radvdModeFlag")
					if tcwebApi_get("WebCustom_Entry","isRaFlagSetSupported","h") = "Yes" then
					TCWebApi_set("Radvd_Entry","M_Flag","radvdManagedAddrflag")
					TCWebApi_set("Radvd_Entry","O_Flag","radvdOtherConfigflag")
					end if
					If Request_Form("radvdModeFlag")="1" Then
						TCWebApi_set("Radvd_Entry","PrefixIPv6","uiViewIPv6PrefixRadvd")
						TCWebApi_set("Radvd_Entry","Prefixv6Len","uiViewIPv6PrefixLenRadvd")
						TCWebApi_set("Radvd_Entry","PreferredLifetime", "uiPreferredLifetimeRadvd")
						TCWebApi_set("Radvd_Entry","ValidLifetime","uiValidLifetimeRadvd")
						If Request_Form("dhcpFlag") ="0" Then					
							tcWebApi_commit("Radvd_Entry")
						End If
					End If
				End If		
			End If
			
			If Request_Form("dhcp6sFlag")="1" Then
				TCWebApi_set("Dhcp6s_Entry","Enable","dhcp6sEnableFlag")
				TCWebApi_set("Dhcp6s_Entry","Mode","dhcp6sModeFlag")						
				TCWebApi_set("Dhcp6s_Entry","DNS_Mode","dhcp6sdnsmode")	
			End If
			
			If Request_Form("dhcp6sFlag")="0" Then
				
					TCWebApi_set("Dhcp6s_Entry","Enable","dhcp6sEnableFlag")
					
				If Request_Form("dhcp6sEnableFlag") = "1" Then
					TCWebApi_set("Dhcp6s_Entry","Mode","dhcp6sModeFlag")
		 			TCWebApi_set("Dhcp6s_Entry","DNS_Mode","dhcp6sdnsmode")	
					If Request_Form("dhcp6sModeFlag") = "1" Then
							TCWebApi_set("Dhcp6s_Entry","PrefixIPv6","uiViewIPv6DHCPPrefix")
							TCWebApi_set("Dhcp6s_Entry","Prefixv6Len","uiViewIPv6DHCPPrefixLen")
							TCWebApi_set("Dhcp6s_Entry","PreferredLifetime", "uiPreferredLifetimeDHCP6")
							TCWebApi_set("Dhcp6s_Entry","ValidLifetime","uiValidLifetimeDHCP6")
					End if
					If Request_Form("dhcp6sdnsmode") = "1" Then
							TCWebApi_set("Dhcp6s_Entry","DNSserver","uiPrimaryDNSDHCP6")
							TCWebApi_set("Dhcp6s_Entry","SecDNSserver","uiSecondaryDNSDHCP6")						
					End if
				End if
				
				If Request_Form("dhcpFlag") ="0" Then
					tcWebApi_commit("Radvd_Entry")
					tcWebApi_commit("Dhcp6s_Entry")	
				End if	
			End If

End If
end if
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" href="/style.css" type="text/css">
<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/jsl.js"></script>
<script language="JavaScript" type="text/javascript" src="/val.js"></script>
<script language="JavaScript" type="text/javascript" src="/pvc.js"></script>
<script language="JavaScript" type="text/javascript" src="/ip.js"></script>
<script language="JavaScript" type='text/javascript' src="/ip_new.js"></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<script type="text/javascript" src="/spin.js" ></script>
<!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
<style>
*{color:  #404040;}

</style>

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

/*  modified by Andrew Nguyen
function showTable(id,header,data,keyIndex){
	var html = ["<table id=client_list width=580 border=1  cellpadding=1 cellspacing=0  bordercolor=#CCCCCC bgcolor=#FFFFFF>"];
	// 1.generate table header
	html.push("<tr>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + " align=center class=tabdata>" +"<STRONG><FONT color=#000000>"+ header[i][1] +" </strong>"+ "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
	for(var i =0; i<data.length; i++){
		if(data[i][keyIndex] != "N/A"){
			html.push("<tr>");
			for(var j=0; j<data[i].length; j++){
				html.push("<td align=center class=tabdata>" + data[i][j] + "</td>");
			}
			html.push("</tr>");
		}
	}
	html.push("</table>");
	if(parseInt(document.uiViewLanForm.LeaseNum.value)>10)
	{
		html.push("<input type=button name=MORE  value=More... onClick=javascript:window.open(\"/cgi-bin/more_client_list.asp\")>")
	}
	document.getElementById(id).innerHTML = html.join('');
}
*/
function doDelete(i)
{
	document.uiViewLanForm.delnum.value=i;
	document.uiViewLanForm.submit();
}


function checkPhysicalPort(){

	if(document.forms[0].DHCPPhyPortEth0.checked)
		document.forms[0].DHCPPhyPortEth0.value = "Yes";
	else
		document.forms[0].DHCPPhyPortEth0.value = "No";
		
	if (document.forms[0].DHCP1PortsFlag.value != "Yes" && document.forms[0].DHCPZY1PortsFlag.value != "Yes")
		if(document.forms[0].DHCPPhyPortEth1.checked)
			document.forms[0].DHCPPhyPortEth1.value = "Yes";
		else
			document.forms[0].DHCPPhyPortEth1.value = "No";
		
	if (   document.forms[0].DHCP2PortsFlag.value != "Yes" 
			&& document.forms[0].DHCP1PortsFlag.value != "Yes" 
			&& document.forms[0].DHCPZY1PortsFlag.value != "Yes") 
	{
		if(document.forms[0].DHCPPhyPortEth2.checked)
			document.forms[0].DHCPPhyPortEth2.value = "Yes";
		else
			document.forms[0].DHCPPhyPortEth2.value = "No";		
			
		if(document.forms[0].DHCPPhyPortEth3.checked)
			document.forms[0].DHCPPhyPortEth3.value = "Yes";
		else
			document.forms[0].DHCPPhyPortEth3.value = "No";
	}
/*		
	if(document.forms[0].DHCPPhyPortUsb0.checked)
		document.forms[0].DHCPPhyPortUsb0.value = "Yes";
	else
		document.forms[0].DHCPPhyPortUsb0.value = "No";

*/
	if (document.forms[0].wlanISExist.value == "On") {
		if (document.forms[0].DHCPMBSSIDNumberFlag.value == "1") {	
			if(document.forms[0].DHCPPhyPortRa0.checked)
				document.forms[0].DHCPPhyPortRa0.value = "Yes";
			else
				document.forms[0].DHCPPhyPortRa0.value = "No";
		}
		if(document.forms[0].DHCPMBSSIDNumberFlag.value == "2"){
			if(document.forms[0].DHCPPhyPortWLANMssid0.checked)
				document.forms[0].DHCPPhyPortWLANMssid0.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLANMssid0.value = "No"
<%if tcWebApi_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then %>
			if(document.forms[0].DHCPPhyPortWLANMssid1.checked)
				document.forms[0].DHCPPhyPortWLANMssid1.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLANMssid1.value = "No"
<%end if%>														
		}
		if(document.forms[0].DHCPMBSSIDNumberFlag.value == "3"){
			if(document.forms[0].DHCPPhyPortWLANMssid0.checked){
				document.forms[0].DHCPPhyPortWLANMssid0.value = "Yes"
			}
			else
				document.forms[0].DHCPPhyPortWLANMssid0.value = "No"
<%if tcWebApi_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then %>
			if(document.forms[0].DHCPPhyPortWLANMssid1.checked)
				document.forms[0].DHCPPhyPortWLANMssid1.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLANMssid1.value = "No"
<%end if%>																	
			if(document.forms[0].DHCPPhyPortWLANMssid2.checked)
				document.forms[0].DHCPPhyPortWLANMssid2.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLANMssid2.value = "No"
		}
		if(document.forms[0].DHCPMBSSIDNumberFlag.value == "4"){	
			if(document.forms[0].DHCPPhyPortWLANMssid0.checked){	
				document.forms[0].DHCPPhyPortWLANMssid0.value = "Yes"
			}
			else
				document.forms[0].DHCPPhyPortWLANMssid0.value = "No"
<%if tcWebApi_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then %>
			if(document.forms[0].DHCPPhyPortWLANMssid1.checked)
				document.forms[0].DHCPPhyPortWLANMssid1.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLANMssid1.value = "No"
<%end if%>																	
			if(document.forms[0].DHCPPhyPortWLANMssid2.checked)
				document.forms[0].DHCPPhyPortWLANMssid2.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLANMssid2.value = "No"
			if(document.forms[0].DHCPPhyPortWLANMssid3.checked)
				document.forms[0].DHCPPhyPortWLANMssid3.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLANMssid3.value = "No"
		}
	}
	if (document.forms[0].wlan11acISExist.value == "On") {
		if (document.forms[0].DHCPMBSSID11acNumberFlag.value == "1") {	
			if(document.forms[0].DHCPPhyPortRai0.checked)
				document.forms[0].DHCPPhyPortRai0.value = "Yes";
			else
				document.forms[0].DHCPPhyPortRai0.value = "No";
		}
		if(document.forms[0].DHCPMBSSID11acNumberFlag.value == "2"){
			if(document.forms[0].DHCPPhyPortWLAN11acMssid0.checked)
				document.forms[0].DHCPPhyPortWLAN11acMssid0.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid0.value = "No"
			if(document.forms[0].DHCPPhyPortWLAN11acMssid1.checked)
				document.forms[0].DHCPPhyPortWLAN11acMssid1.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid1.value = "No"
		}
		if(document.forms[0].DHCPMBSSID11acNumberFlag.value == "3"){
			if(document.forms[0].DHCPPhyPortWLAN11acMssid0.checked){
				document.forms[0].DHCPPhyPortWLAN11acMssid0.value = "Yes"
			}
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid0.value = "No"
			if(document.forms[0].DHCPPhyPortWLAN11acMssid1.checked)
				document.forms[0].DHCPPhyPortWLAN11acMssid1.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid1.value = "No"
			if(document.forms[0].DHCPPhyPortWLAN11acMssid2.checked)
				document.forms[0].DHCPPhyPortWLAN11acMssid2.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid2.value = "No"
		}
		if(document.forms[0].DHCPMBSSID11acNumberFlag.value == "4"){	
			if(document.forms[0].DHCPPhyPortWLAN11acMssid0.checked){	
				document.forms[0].DHCPPhyPortWLAN11acMssid0.value = "Yes"
			}
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid0.value = "No"
			if(document.forms[0].DHCPPhyPortWLAN11acMssid1.checked)
				document.forms[0].DHCPPhyPortWLAN11acMssid1.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid1.value = "No"
			if(document.forms[0].DHCPPhyPortWLAN11acMssid2.checked)
				document.forms[0].DHCPPhyPortWLAN11acMssid2.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid2.value = "No"
			if(document.forms[0].DHCPPhyPortWLAN11acMssid3.checked)
				document.forms[0].DHCPPhyPortWLAN11acMssid3.value = "Yes"
			else
				document.forms[0].DHCPPhyPortWLAN11acMssid3.value = "No"
		}
	}
}

function StringCheck(val)
{
    re = /^[^\s]+$/;
    if( re.test(val) )
        return true;
    else
        return false;
}

function doCheckmacAddr(){
	var macstr = document.uiViewLanForm.MACAddr.value;
var maclen = macstr.length;
	var tmp = macstr.toUpperCase();
	document.uiViewLanForm.MACAddr.value = tmp;
if(maclen != 0){
		var findpos = macstr.search("^([0-9A-Fa-f]{2})(:[0-9A-Fa-f]{2}){5}$");
		if( findpos != 0 )
		{
			alert("<%tcWebApi_get("String_Entry","LANJS0Text","s")%>" + macstr);
		}	
		return findpos;
	}
	return 0;
}

/*wang check that whether wan IP and LAN local IP in the same subnet (start) */
function InSameSubnet(IPAddr1,MASK1,IPAddr2,MASK2)
{

   var ipAddr1 = IPAddr1.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
   var mask1 = MASK1.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
   var ipAddr2 =IPAddr2.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
   var mask2 = MASK2.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
   var digits1 = ipAddr1[0].split(".");
   var digits2 = mask1[0].split(".");
   var digits3 = ipAddr2[0].split(".");
   var digits4 = mask2[0].split(".");

 
	   if((((digits1[0] & digits2[0]) == (digits3[0] & digits2[0]))&&
		((digits1[1] & digits2[1]) == (digits3[1] & digits2[1]))&&
		((digits1[2] & digits2[2]) == (digits3[2] & digits2[2]))&&
		((digits1[3] & digits2[3]) == (digits3[3] & digits2[3])))||
		(((digits1[0] & digits4[0]) == (digits3[0] & digits4[0]))&&
		((digits1[1] & digits4[1]) == (digits3[1] & digits4[1]))&&
		((digits1[2] & digits4[2]) == (digits3[2] & digits4[2]))&&
		((digits1[3] & digits4[3]) == (digits3[3] & digits4[3]))))
	    {
	  	      alert("<%tcWebApi_get("String_Entry","LANJS55Text","s")%>");
                   return 1;  }

    return 0;
	
}   /*wang end*/

function doUserModeUiMgmtIpValidate()
{
    var value;
    var value_temp;
    
    value = document.uiViewLanForm.uiViewIPAddr.value;
    value_temp = document.uiViewLanForm.uiViewNetMask.value;
    if(inValidNetAddr(value,value_temp))
        return false;
    <%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>	
	//jrchen add		
	value = document.uiViewLanForm.isIPv6Supported.value;
	if(value == 1){
		//check if IPv6 address/prefix field is not inputed
		if(document.uiViewLanForm.uiViewIPv6Addr.value != "" || document.uiViewLanForm.uiViewIPv6Prefix.value != ""){
			//check IPv6 Address format	
			value = document.uiViewLanForm.uiViewIPv6Addr.value;	
			if(inValidIPv6Addr(value))
				return false;	
			if(false == isGlobalIpv6Address(value)){
				alert('<%tcWebApi_get("String_Entry","LANJS1Text","s")%>' + value);
				return false;
			}
	
			//jrchen add
			//check IPv6 Prefix format
			value = document.uiViewLanForm.uiViewIPv6Prefix.value;
			if(inValidIPv6Prefix(value))
				return false;
		}
	}
<% end if %>	
				        
	if("Yes" == document.uiViewLanForm.aliasFlag.value)
	{	
		var mask = document.uiViewLanForm.uiViewNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits2 = mask[0].split(".");
		var lanip = document.uiViewLanForm.uiViewIPAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits3 = lanip[0].split(".");
		
		value = document.uiViewLanForm.uiViewAliasIPAddr.value;
        value_temp = document.uiViewLanForm.uiViewAliasNetMask.value;
        if(inValidNetAddr(value,value_temp))
             return false;
		var mask = document.uiViewLanForm.uiViewAliasNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits4 = mask[0].split(".");
		var lanip = document.uiViewLanForm.uiViewAliasIPAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits5 = lanip[0].split("."); 
			
		if(document.uiViewLanForm.uiViewIPAddr.value == document.uiViewLanForm.uiViewAliasIPAddr.value)
		{
			alert("<%tcWebApi_get("String_Entry","LANJS2Text","s")%>" );
			return false;
		}
		
		for(i=0;i<4;i++)
		{
			if((digits3[i] & digits2[i])!= (digits5[i] & digits2[i]))
				break;
		}
		if(i==4)
		{
			 alert("<%tcWebApi_get("String_Entry","LANJS46Text","s")%>");
			 return false; 
		}
		
		for(i=0;i<4;i++)
		{
			if((digits3[i] & digits4[i])!= (digits5[i] & digits4[i]))
				break;
		}
		if(i==4)
		{
			 alert("<%tcWebApi_get("String_Entry","LANJS47Text","s")%>");
			 return false; 
		}
	}
}
function doAdminUiMgmtIpValidate()
{
	var value;

	if(document.uiViewLanForm.dhcpTypeRadio[0].checked)    //cindy modify [1]->[0] 11/17
	 {
    	value = document.uiViewLanForm.StartIp.value;
    	if(inValidIPAddr(value))
        return false;
		if("Yes" == document.uiViewLanForm.aliasFlag.value)
		{
			if(!doPoolRangeAlias())
				return false;
		}
		else
		{
		if(!doPoolRange())
		return false;
		}
		
		/* set physical port value */
		if ("Yes" == document.uiViewLanForm.DHCPFilterFlag.value)
			checkPhysicalPort();
		
      	if("Yes" == document.uiViewLanForm.option60Flag.value)
	{	
		value = document.uiViewLanForm.ConPoolStartIp.value;
		if(inValidIPAddr(value))
			return false;

		value = document.uiViewLanForm.ConPoolPoolSize.value;
    		if(value.match("[^0-9]") != null) {
        		alert("<%tcWebApi_get("String_Entry","LANJS3Text","s")%>");
       	 		return false;
    		}
    		
         	if(!doConditionalPoolRange())
        		return false;
			
	}
	
      if(document.uiViewLanForm.dnsTypeRadio[1].selected)
      {  
      	value = document.uiViewLanForm.PrimaryDns.value;
    	if(inValidIPAddr(value))
        	return false;  
          
      	value = document.uiViewLanForm.SecondDns.value;
    	if(inValidIPAddr(value))
        	return false;  
      } 
      if(doValidateServer())
      	return false;  

<%if tcwebApi_get("WebCustom_Entry","isDhcpStaticSupported","h")="Yes" then%>	
	if(StringCheck(document.uiViewLanForm.IpAddr.value) || StringCheck(document.uiViewLanForm.MACAddr.value))
		{
			if(document.uiViewLanForm.emptyEntry.value == "N/A")
			{
				alert("<%tcWebApi_get("String_Entry","LANJS4Text","s")%>" );
				return false;
			} 
			value = document.uiViewLanForm.IpAddr.value;
			if(inValidIPAddr(value))
			return false; 
				
			if(doCheckmacAddr())
			return false;	
			
			if(!doStaticTableRange())
			return false;			
				
			document.uiViewLanForm.addFlag.value = "1";
		}
		if(document.uiViewLanForm.staticNum.value != "0"){
		if(document.uiViewLanForm.tmpStartIp.value != document.uiViewLanForm.StartIp.value)
		{
			if(confirm("<%tcWebApi_get("String_Entry","LANJS5Text","s")%>") == false)
				return false;
		}
		if(document.uiViewLanForm.tmpPoolCount.value != document.uiViewLanForm.PoolSize.value)
		{
			if(confirm("<%tcWebApi_get("String_Entry","LANJS6Text","s")%>") == false)
				return false;
		}
		}
    <% end if %>            
    }
    if(document.uiViewLanForm.dhcpTypeRadio[2].checked)
    {
    	value = document.uiViewLanForm.ServerIp.value;
    	 if(inValidIPAddr(value))
    	 	return false;
    }
}
function uiMgmtIpDoValidate() {
	if(doUserModeUiMgmtIpValidate()==false)
		return false;
<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
	if(document.uiViewLanForm.userMode.value != 1)
	{
		if(doAdminUiMgmtIpValidate()==false)
			return false;
	}
<%elseif tcWebApi_get("DeviceInfo", "isCYSFU", "h") = "Yes" then%>
	if(document.uiViewLanForm.userMode.value != 1)
	{
		if(doAdminUiMgmtIpValidate()==false)
			return false;
	}
<% end if %> 
    return true;
}
function reloadAdminAction()
{
	if(!dhcpRelayCheck()){
		return false;
	}
	
	onloadCheck();
	
	if(document.uiViewLanForm.dhcpTypeRadio[1].checked)//cindy modify [0]->[1] 11/17
	{
		document.getElementById("dhcp_enabled_div0").style.display="none";
		document.getElementById("dhcp_relay_div").style.display="none";
		<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
		document.getElementById("dhcp_client_div").style.display="none";
		<% end if %>
	}
	else if(document.uiViewLanForm.dhcpTypeRadio[0].checked)//cindy modify [1]->[0] 11/17
	{
		document.getElementById("dhcp_enabled_div0").style.display="";
		document.getElementById("dhcp_relay_div").style.display="none";
		<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
		document.getElementById("dhcp_client_div").style.display="none";
		<% end if %>
	}
	else if(document.uiViewLanForm.dhcpTypeRadio[2].checked)
	{
		document.getElementById("dhcp_enabled_div0").style.display="none";
		document.getElementById("dhcp_relay_div").style.display="";
		<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
		document.getElementById("dhcp_client_div").style.display="none";
		<% end if %>
	}
	<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
	else if(document.uiViewLanForm.dhcpTypeRadio[3].checked)
	{
		document.getElementById("dhcp_enabled_div0").style.display="none";
		document.getElementById("dhcp_relay_div").style.display="none";
		document.getElementById("dhcp_client_div").style.display="";
	}
	<% else %>
	else
	;
	<% end if %>
	return;
}
function reloadUsermodeAction()
{
	return;
}
function doReload() {
	reloadUsermodeAction();
<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
	if(document.uiViewLanForm.userMode.value !=1){
		reloadAdminAction();
	}
<%elseif tcWebApi_get("DeviceInfo", "isCYSFU", "h") = "Yes" then%>
	if(document.uiViewLanForm.userMode.value !=1){
		reloadAdminAction();
	}
<% end if %> 
	return;
}

function doUserModeDispaly()
{
	return;
}
function doAdminDispaly()
{
<% If tcWebApi_get("Lan_Dhcp","type","h") = "0" Then%>
	{
		document.getElementById("dhcp_enabled_div0").style.display="none";
		document.getElementById("dhcp_relay_div").style.display="none";
		<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
		document.getElementById("dhcp_client_div").style.display="none";
		<% end if %>
	}
	<% end if %>

	<% If tcWebApi_get("Lan_Dhcp","type","h") = "1" Then%>
	{
		document.getElementById("dhcp_enabled_div0").style.display="";
		document.getElementById("dhcp_relay_div").style.display="none";
		<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
		document.getElementById("dhcp_client_div").style.display="none";
		<% end if %>
	}
	<% end if %>

	<% If tcWebApi_get("Lan_Dhcp","type","h") = "2" Then%>
	{
		document.getElementById("dhcp_enabled_div0").style.display="none";
		document.getElementById("dhcp_relay_div").style.display="";
		<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
		document.getElementById("dhcp_client_div").style.display="none";
		<% end if %>
	}
	<% end if %>
	
	<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
	<% If tcWebApi_get("Lan_Dhcp","type","h") = "3" Then%>
	{
		document.getElementById("dhcp_enabled_div0").style.display="none";
		document.getElementById("dhcp_relay_div").style.display="none";
		document.getElementById("dhcp_client_div").style.display="";
	}
	<% end if %>
	<% end if %>
	return;
}
function doDisplay() {
	doUserModeDispaly();
	if(document.forms[0].userMode.value != 1)
	{
		doAdminDispaly();
	}
	return;
}
function doValidateRange(startIP,endIP) {
    var staddress;
    var edaddress;
    var cnt;

    staddress=startIP.split(".");
    edaddress=endIP.split(".");
    for(cnt=0; cnt < 4; cnt++) {
        if(Number(edaddress[cnt])<Number(staddress[cnt])) {
            alert("<%tcWebApi_get("String_Entry","LANJS44Text","s")%>");
	return false;
}
    }
    return true;
}

function doValidateServer() {
    var Element;
    var ElementValue;

    Element = document.uiViewLanForm.PoolSize;
    ElementValue = Element.value;
    if(ElementValue.match("[^0-9]") != null) {
        alert("<%tcWebApi_get("String_Entry","LANJS7Text","s")%>");
        return true;
    }
    Element = document.uiViewLanForm.dhcp_LeaseTime;
    ElementValue = Element.value;
    if(ElementValue.match("[^0-9]") != null) {
        alert("<%tcWebApi_get("String_Entry","LANJS8Text","s")%>");
        return true;
    }
    if(!StringCheck(ElementValue))
	{
		alert("<%tcWebApi_get("String_Entry","LANJS9Text","s")%>");
		return true;
	}
	if(!parseInt(ElementValue))
		document.uiViewLanForm.dhcp_LeaseTime.value = 259200;
    Element = document.uiViewLanForm.StartIp;
    ElementValue = Element.value;
    if(inValidIPAddr(Element.value)) return true;
    if(doValidateRange(ElementValue,Element.value)!=true) return true;
	return false;
}

function poolcheck(st,pool,value,Mvalue){
	if( (pool > 254) || (st+pool) > ((Mvalue & st) + value - 1) )
	{
	//mtk04880: for resolving bug 12324 : showing alert twice
	//  alert("<%tcWebApi_get("String_Entry","LANJS10Text","s")%>");
		return false;
	}else
	{
		return true;
	}
}
function ip_poolcheck(st,pool,Mvalue,rouip){
	var digits1 = st[0].split(".");
	var stIP = parseInt(digits1[0]<<24|digits1[1]<<16|digits1[2]<<8|digits1[3]);
	var digits2 = Mvalue[0].split(".");
	var maskvalue = parseInt(digits2[0]<<24|digits2[1]<<16|digits2[2]<<8|digits2[3]);
	var digits3 = rouip[0].split(".");
	var lanipvalue = parseInt(digits3[0]<<24|digits3[1]<<16|digits3[2]<<8|digits3[3]);
	if(((lanipvalue&(~maskvalue))>=(stIP&(~maskvalue))) && ((lanipvalue&(~maskvalue))<((stIP&(~maskvalue))+pool)))
	{
		return false;
	}else
	{
		return true;
	}
} 

function ip_poolcheckAlias(st,pool,Mvalue,rouip,aMvalue,aip){
	var digits1 = st[0].split(".");
	var stIP = parseInt(digits1[0]<<24|digits1[1]<<16|digits1[2]<<8|digits1[3]);
	var digits2 = Mvalue[0].split(".");
	var maskvalue = parseInt(digits2[0]<<24|digits2[1]<<16|digits2[2]<<8|digits2[3]);
	var digits3 = rouip[0].split(".");
	var lanipvalue = parseInt(digits3[0]<<24|digits3[1]<<16|digits3[2]<<8|digits3[3]);
	var digits4 = aMvalue[0].split(".");
	var amaskvalue = parseInt(digits4[0]<<24|digits4[1]<<16|digits4[2]<<8|digits4[3]);
	var digits5 = aip[0].split(".");
	var aipvalue = parseInt(digits5[0]<<24|digits5[1]<<16|digits5[2]<<8|digits5[3]);

	var tmpipvalue = 1;
	var tmpmaskvalue = 1;
	
	if((lanipvalue&maskvalue)==(stIP&maskvalue)){
		tmpipvalue = lanipvalue;
		tmpmaskvalue = maskvalue;
	}else if((aipvalue&amaskvalue)==(stIP&amaskvalue)){
		tmpipvalue = aipvalue;
		tmpmaskvalue = amaskvalue;
	}else
		return false;
	
 	if(((tmpipvalue&(~tmpmaskvalue))>=(stIP&(~tmpmaskvalue))) && ((tmpipvalue&(~tmpmaskvalue))<((stIP&(~tmpmaskvalue))+pool)))
	{
		return false;
	}else
	{
		return true;
	}
} 

function checkPoolOverlap(startIP1, num1, startIP2, num2)
{
	var digits1 = startIP1[0].split(".");
	var digits2 = startIP2[0].split(".");
	for(i=0;i<4;i++)
	{
		if(parseInt(digits1[i]) < parseInt(digits2[i]))
		{
			if(parseInt(digits1[3])+num1-1 >= parseInt(digits2[3]))
				return true;
			else
				return false;
		}
		if(parseInt(digits1[i]) > parseInt(digits2[i]))
		{
			if(parseInt(digits2[3])+num2-1 >= parseInt(digits1[3]))
				return true;
			else
				return false;
		}
	}
	return true;
}

<%if tcwebApi_get("WebCustom_Entry","isDhcpStaticSupported","h")="Yes" then%>
function doStaticTableRange()
{
	var sIP = document.uiViewLanForm.StartIp.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var digits = sIP[0].split(".");
	var num = document.uiViewLanForm.PoolSize.value.match("^[0-9]{1,3}$");
	var mask = document.uiViewLanForm.uiViewNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits2 = mask[0].split(".");	
	var staticIP = document.uiViewLanForm.IpAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var staticdigits = staticIP[0].split(".");
	
	var stIP = parseInt(digits[3]);
	var Pool_num = parseInt(num);
	var staticIP = parseInt(staticdigits[3]);
	var isIpValid = 1;
	var total = parseInt(document.uiViewLanForm.staticNum.value);
	var leaseTotal = parseInt(document.uiViewLanForm.LeaseNum.value);
	
	for(i=0;i<4;i++)
	{
	  if((digits2[i] & digits[i]) != (digits2[i] & staticdigits[i])){	
			isIpValid = 0;
			break;
		}
	}
	if("Yes" == document.uiViewLanForm.aliasFlag.value){
		var mask = document.uiViewLanForm.uiViewAliasNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits3= mask[0].split(".");
		if(isIpValid == 0){
		for(i=0;i<4;i++)
		{
		  if((digits3[i] & digits[i]) != (digits3[i] & staticdigits[i])){	
				isIpValid = 0;
				break;
			}
		}
		}
	}
	if(isIpValid == 0){
		alert("<%tcWebApi_get("String_Entry","LANJS11Text","s")%>");                                   						
		return false;
	}
	
    if( staticIP <  stIP || staticIP >= stIP+Pool_num)
	{
	   alert("<%tcWebApi_get("String_Entry","LANJS12Text","s")%>");
	return false;
	}


	var table=document.getElementById("static_list");
	for(j=1; j<=total; j++)
	{	
		var str1 = table.rows[j].cells[1].innerHTML.replace(" ","");
		var str2 = table.rows[j].cells[2].innerHTML.replace(" ","");
		if( str1 == document.uiViewLanForm.IpAddr.value)
		{
			   alert("<%tcWebApi_get("String_Entry","LANJS13Text","s")%>");
			 return false;
		 }
		 if(str2 == document.uiViewLanForm.MACAddr.value)
		{
			   alert("<%tcWebApi_get("String_Entry","LANJS14Text","s")%>");
			 return false;
		 }
	}
/*	
	var table=document.getElementById("client_list").contentWindow.document.getElementById("dhcplist");
	
	for(j=1; j<=leaseTotal; j++)
	{	
		if(table.rows[j].cells[2].innerText == document.uiViewLanForm.IpAddr.value)
		{
			   alert("<%tcWebApi_get("String_Entry","LANJS15Text","s")%>");
			 return false;
		 }
		 if(table.rows[j].cells[3].innerText == document.uiViewLanForm.MACAddr.value)
		{
			   alert("<%tcWebApi_get("String_Entry","LANJS16Text","s")%>");
			 return false;
		 }
	}
*/
	return true;
}
<% End If %>
function doPoolRange()
{
	var sIP = document.uiViewLanForm.StartIp.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var digits = sIP[0].split(".");
 	var num = document.uiViewLanForm.PoolSize.value.match("^[0-9]{1,3}$");
	var mask = document.uiViewLanForm.uiViewNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits2 = mask[0].split(".");
	var lanip = document.uiViewLanForm.uiViewIPAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var digits3 = lanip[0].split(".");

	var stIP = parseInt(digits[3]);
	var Pool_num = parseInt(num);
	var Mask = parseInt(digits2[3]);
	
	if(!StringCheck(document.uiViewLanForm.PoolSize.value))
	{
		alert("<%tcWebApi_get("String_Entry","LANJS17Text","s")%>");
		return false;
	}
  if(document.uiViewLanForm.uiViewIPAddr.value == document.uiViewLanForm.StartIp.value)
	{
		alert("<%tcWebApi_get("String_Entry","LANJS18Text","s")%>");   	                                   								
		return false;
	}
	
	for(i=0;i<4;i++)
	{
	  if((digits2[i] & digits3[i]) != (digits2[i] & digits[i]))
		{
			alert("<%tcWebApi_get("String_Entry","LANJS19Text","s")%>");                                   						
			return false;
		}
	}
		
  if( (digits2[0]== 255) && (digits2[1] == 255) && (digits2[2] == 255) )
	{
		for( n=0; n<7; n++ )
     {
       k = (256 >> n) ;
       if((256 - k) == digits2[3])
       {
    	   if( !poolcheck(stIP,Pool_num,k,Mask) ){
    	   	//mtk04880: for resolving bug 12324 : showing alert twice
    	   	alert("<%tcWebApi_get("String_Entry","LANJS10Text","s")%>");
    	   	return false;
    	   }
         
       }
     }
	}else
	{
		if(Pool_num > 254)
		{
	  	alert("<%tcWebApi_get("String_Entry","LANJS20Text","s")%>"); 	                                   								
			return false;
		}
	}
	if( !ip_poolcheck(sIP,Pool_num,mask,lanip) ){
		//alert("DHCP IP Pool can not contain Router Local IP!!");
	  	alert("<%tcWebApi_get("String_Entry","LANJS48Text","s")%>"); 
		return false;
	} 
	return true;
}

function doPoolRangeAlias()
{
	var sIP = document.uiViewLanForm.StartIp.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var digits = sIP[0].split(".");
 	var num = document.uiViewLanForm.PoolSize.value.match("^[0-9]{1,3}$");
	
	var mask_local = document.uiViewLanForm.uiViewNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits2 = mask_local[0].split(".");
	var lanip_local = document.uiViewLanForm.uiViewIPAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var digits3 = lanip_local[0].split(".");

	var mask = document.uiViewLanForm.uiViewAliasNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits4 = mask[0].split(".");
	var lanip = document.uiViewLanForm.uiViewAliasIPAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits5 = lanip[0].split(".");
	var MaskAlias = parseInt(digits4[3]);
	var validMainFlag = 1;
	var validAliasFlag = 1;
	var validDhcpMainFlag = 1;
	var validDhcpAliasFlag = 1;
	
    var stIP = parseInt(digits[3]);
  	var Pool_num = parseInt(num);
	var Mask = parseInt(digits2[3]);
	
	if(!StringCheck(document.uiViewLanForm.PoolSize.value))
	{
		alert("<%tcWebApi_get("String_Entry","LANJS21Text","s")%>");
		return false;
	}
 	if(document.uiViewLanForm.uiViewIPAddr.value == document.uiViewLanForm.StartIp.value)
	{
		alert("<%tcWebApi_get("String_Entry","LANJS22Text","s")%>");   	                                   								
		return false;
	}
 	if(document.uiViewLanForm.uiViewAliasIPAddr.value == document.uiViewLanForm.StartIp.value)
	{
		alert("<%tcWebApi_get("String_Entry","LANJS23Text","s")%>");   	                                   								
		return false;
	}
	
	for(i=0;i<4;i++)
	{
	  if((digits2[i] & digits3[i]) != (digits2[i] & digits[i]))
		{
			validMainFlag = 0;
			break;
			//alert("DHCP Start IP and Router Local IP are not in the same subnet");                                   						
			//return false;
		}
	}
	for(i=0;i<4;i++)
	{
		 if((digits4[i] & digits5[i]) != (digits4[i] & digits[i]))
		{
			validAliasFlag = 0;
			break;
			//alert("DHCP Start IP and Router Local Alias IP are not in the same subnet");                                   						
			//return false;
		}
	}
	
	if((validMainFlag == 0) && (validAliasFlag == 0))
	{
		alert("<%tcWebApi_get("String_Entry","LANJS24Text","s")%>");
		return false;
	}
	if(Pool_num > 254)
	{
	 	alert("<%tcWebApi_get("String_Entry","LANJS25Text","s")%>"); 	                                   								
		return false;
	}
	if(validMainFlag == 1)
	{
		if( (digits2[0]== 255) && (digits2[1] == 255) && (digits2[2] == 255) )
		{
			for( n=0; n<7; n++ )
     			{
       				k = (256 >> n) ;
       				if((256 - k) == digits2[3])
       				{
    	   				if( !poolcheck(stIP,Pool_num,k,Mask) )
    	   				{   
						validDhcpMainFlag = 0;
        					break;
        				}
       				}
     			}
		}
	}

	if(validAliasFlag == 1)
	{
		if( (digits4[0]== 255) && (digits4[1] == 255) && (digits4[2] == 255) )
		{
			for( n=0; n<7; n++ )
     			{
       			k = (256 >> n) ;
       			if((256 - k) == digits4[3])
       			{
    	   				if( !poolcheck(stIP,Pool_num,k,MaskAlias) )
    	   				{
						validDhcpAliasFlag = 0;
        					break;		
					}
       			}
     			}
		}
	}
	
	if( ((validMainFlag == 1 && validAliasFlag == 1) && ((validDhcpMainFlag | validDhcpAliasFlag) == 0)) 
	|| (validMainFlag == 1 && validDhcpMainFlag == 0)
	|| (validAliasFlag == 1 && validDhcpAliasFlag == 0) )
	{
		alert("<%tcWebApi_get("String_Entry","LANJS25Text","s")%>"); 	            
		return false;
	}
	if( !ip_poolcheckAlias(sIP,Pool_num,mask_local,lanip_local,mask,lanip) ){
		//alert("DHCP IP Pool can not contain Router Local IP!!");
		alert("<%tcWebApi_get("String_Entry","LANJS48Text","s")%>"); 	            
		return false;
	}
	
	return true;
}

function doConditionalPoolRange()
{
	var sIP = document.uiViewLanForm.StartIp.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var digits = sIP[0].split(".");
 	var num = document.uiViewLanForm.PoolSize.value.match("^[0-9]{1,3}$");
	var mask = document.uiViewLanForm.uiViewNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
	var digits2 = mask[0].split(".");
	var lanip = document.uiViewLanForm.uiViewIPAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var digits3 = lanip[0].split(".");

    	var stIP = parseInt(digits[3]);
  	var Pool_num = parseInt(num);
	var Mask = parseInt(digits2[3]);

	var validMainFlag = 1;
	var validAliasFlag = 1;
	var validDhcpMainFlag = 1;
	var validDhcpAliasFlag = 1;

	var conPoolStartIP = document.uiViewLanForm.ConPoolStartIp.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  	var digits6 = conPoolStartIP[0].split(".");
 	var conPoolNum = document.uiViewLanForm.ConPoolPoolSize.value.match("^[0-9]{1,3}$");

  	var conPoolStartIPValue = parseInt(digits6[3]);
  	var conPoolNumValue = parseInt(conPoolNum);
  	
	if(document.uiViewLanForm.uiViewIPAddr.value == document.uiViewLanForm.ConPoolStartIp.value)
	{
		alert("<%tcWebApi_get("String_Entry","LANJS26Text","s")%>");   	                                   								
		return false;
	}
	
 	for(i=0;i<4;i++)
	{
		if((digits2[i] & digits3[i]) != (digits2[i] & digits6[i]))
	  	{
			validMainFlag = 0;
			break;
			//alert("DHCP Start IP and Router Local IP are not in the same subnet");                                   						
			//return false;
	  	}
	}

	if("Yes" == document.uiViewLanForm.aliasFlag.value)
	{
		var mask = document.uiViewLanForm.uiViewAliasNetMask.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits4 = mask[0].split(".");
		var lanip = document.uiViewLanForm.uiViewAliasIPAddr.value.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
		var digits5 = lanip[0].split(".");
		var MaskAlias = parseInt(digits4[3]);

		if(document.uiViewLanForm.uiViewAliasIPAddr.value == document.uiViewLanForm.ConPoolStartIp.value)
		{
			alert("<%tcWebApi_get("String_Entry","LANJS27Text","s")%>");   	                                   								
			return false;
		}
		for(i=0;i<4;i++)
		{
			 if((digits4[i] & digits5[i]) != (digits4[i] & digits6[i]))
			{
				validAliasFlag = 0;
				break;
				//alert("DHCP Start IP and Router Local Alias IP are not in the same subnet");                                   						
				//return false;
			}
		}
		
	}


 	if("Yes" == document.uiViewLanForm.aliasFlag.value)
 	{
 		if((validMainFlag == 0) && (validAliasFlag == 0))
		{
			alert("<%tcWebApi_get("String_Entry","LANJS28Text","s")%>");
			return false;
		}

 	}
       else
 	{
 		if(validMainFlag == 0)
		{
			alert("<%tcWebApi_get("String_Entry","LANJS29Text","s")%>");
			return false;
		}

 	}
 
	if(document.uiViewLanForm.StartIp.value == document.uiViewLanForm.ConPoolStartIp.value)
	{
		alert("<%tcWebApi_get("String_Entry","LANJS30Text","s")%>"); 
		return false;
	}
	if(checkPoolOverlap(sIP, Pool_num, conPoolStartIP, conPoolNumValue) == true)
	{
		alert("<%tcWebApi_get("String_Entry","LANJS31Text","s")%>");
		return false;
	} 
	if(conPoolNumValue > 254)
	{
	 	alert("<%tcWebApi_get("String_Entry","LANJS32Text","s")%>"); 	                                   								
		return false;
	}
	
	if(validMainFlag == 1)
	{
		if( (digits2[0]== 255) && (digits2[1] == 255) && (digits2[2] == 255) )
		{
			for( n=0; n<7; n++ )
     			{
       			k = (256 >> n) ;
       			if((256 - k) == digits2[3])
       			{
    	  				if( !poolcheck(conPoolStartIPValue,conPoolNumValue,k,Mask) )
    	  				{
						validDhcpMainFlag = 0;
        					break;
					}
       			}
     			}
		}
	}
	if(validAliasFlag == 1)
	{
		if("Yes" == document.uiViewLanForm.aliasFlag.value)
		{
			if( (digits4[0]== 255) && (digits4[1] == 255) && (digits4[2] == 255) )
			{
				for( n=0; n<7; n++ )
     				{
       				k = (256 >> n) ;
       				if((256 - k) == digits4[3])
       				{
    						if( !poolcheck(conPoolStartIPValue,conPoolNumValue,k,MaskAlias) )
    						{
							validDhcpAliasFlag = 0;
       						break;
       					}
     					}
				}
			}
		}
	}

	if( ((validMainFlag == 1 && validAliasFlag == 1) && ((validDhcpMainFlag | validDhcpAliasFlag) == 0)) 
	|| (validMainFlag == 1 && validDhcpMainFlag == 0)
	|| (validAliasFlag == 1 && validDhcpAliasFlag == 0) )
	{
		alert("<%tcWebApi_get("String_Entry","LANJS32Text","s")%>"); 
		return false;
	}
	return true;
}

function inValidIPv6PrefixDHCP6S(Address) {
	var address1 = Address.match("^[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}::$"); 
	var address2 = Address.match("^[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}::$");
	var address3 = Address.match("^[0-9A-Fa-f]{1,4}:[0-9A-Fa-f]{1,4}::$"); 
	var address4 = Address.match("^[0-9A-Fa-f]{1,4}::$");
	
	  if( (address1 != null) || (address2 != null) || (address3 != null) || (address4 != null) ) { 
  	
  	return true;
  }
		alert("<%tcWebApi_get("String_Entry","LANJS43Text","s")%>"); 
  return false;
}

function doUserModeSave()
{
	var form = document.uiViewLanForm;
	if (!uiMgmtIpDoValidate())
		return false;
    <%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
	if (form.isIPv6Supported.value == 1 )
	{
		if(!checkAllIPv6Options())
			return false;
	}
    <% end if %> 	
	return true;
}

function doAdminSave()
{
	var form = document.uiViewLanForm;
	if(!dhcpRelayCheck()){
		return false;
	}
	<% if tcWebApi_get("GUI_Entry0","DyVlan","h") = "support" then %>
	if(true == uiOUICheck(document.uiViewLanForm.uiOUI))
		return false;
	document.uiViewLanForm.ouiFlag.value = 3;
<% End If %>
	return true;
}

function uiSave() {
//cindy add start 12/28
if(blockStartIP()==false)
	return;
if(blockEndIP()==false)
	return;
//cindy add end 12/28	
if(checkIpPool()==false)//amy add 2/28
	return;

	var form = document.uiViewLanForm;
	var straliasori = "<% tcWebApi_get("LanAlias_Entry","Active","s") %>";
	if (straliasori == "Yes") {
		if (form.uiViewAliasIPAddr.value == "0.0.0.0") {
			form.uiViewAliasNetMask.value = "0.0.0.0";
			form.aliasFlag.value = "No";
		}
	}
	
	if(false == doUserModeSave())
		return;
<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
	if(document.uiViewLanForm.userMode.value != 1)
		if(false == doAdminSave())
			return;
<%elseif tcWebApi_get("DeviceInfo", "isCYSFU", "h") = "Yes" then%>
	if(document.uiViewLanForm.userMode.value != 1)
		if(false == doAdminSave())
			return;
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isBridgeMacLimitSupported","h") = "Yes" then %>
		if(false == doMacLimitCheck()){
			return;
		}
<% end if %>
<% if tcWebApi_get("WebCustom_Entry","isStdioTimeoutSupported","h") = "Yes" then %>
		if(false == checkStdioTimeOut()){
			return;
		}
<% end if %>
	if (straliasori == "Yes") {
		form.aliasFlag.value = "Yes";
	}
	//wang add to solve wan ip and lan local ip in the same subnet	
    var value;
    var value_temp;
    var value2;
    var value_temp2;
    value = document.uiViewLanForm.uiViewIPAddr.value;
    value_temp = document.uiViewLanForm.uiViewNetMask.value;
		 <%if tcWebApi_get("DeviceInfo_PVC0","WanIP","h") <> "N/A" then%>
			value2= "<%TCWebApi_get("DeviceInfo_PVC0","WanIP","s")%>";
   			 value_temp2 ="<%TCWebApi_get("DeviceInfo_PVC0","WanSubMask","s")%>";
		 var vvv=InSameSubnet(value,value_temp,value2,value_temp2);
		if(vvv)	
			return;
	<%end if%>
		<%if tcWebApi_get("DeviceInfo_PVC1","WanIP","h") <> "N/A" then%>
	 	 value2 = "<%TCWebApi_get("DeviceInfo_PVC1","WanIP","s")%>";
   		value_temp2 ="<%TCWebApi_get("DeviceInfo_PVC1","WanSubMask","s")%>";
		if(InSameSubnet(value,value_temp,value2,value_temp2))	
			return ;
	<% end if %>
		<%if tcWebApi_get("DeviceInfo_PVC2","WanIP","h") <> "N/A" then%>
	 	 value2 = "<%TCWebApi_get("DeviceInfo_PVC2","WanIP","s")%>";
   		 value_temp2 ="<%TCWebApi_get("DeviceInfo_PVC2","WanSubMask","s")%>";
		if(InSameSubnet(value,value_temp,value2,value_temp2))	
			return ;
	<% end if %>
		<%if tcWebApi_get("DeviceInfo_PVC3","WanIP","h") <> "N/A" then%>
	 	value2 = "<%TCWebApi_get("DeviceInfo_PVC3","WanIP","s")%>";
   		 value_temp2 ="<%TCWebApi_get("DeviceInfo_PVC3","WanSubMask","s")%>";
		if(InSameSubnet(value,value_temp,value2,value_temp2))	
			return ;
	<% end if %>
		<%if tcWebApi_get("DeviceInfo_PVC4","WanIP","h") <> "N/A" then%>
	 	value2 = "<%TCWebApi_get("DeviceInfo_PVC4","WanIP","s")%>";
   		 value_temp2 ="<%TCWebApi_get("DeviceInfo_PVC4","WanSubMask","s")%>";
		if(InSameSubnet(value,value_temp,value2,value_temp2))	
			return ;
	<% end if %>
		<%if tcWebApi_get("DeviceInfo_PVC5","WanIP","h") <> "N/A" then%>
	 	value2 = "<%TCWebApi_get("DeviceInfo_PVC5","WanIP","s")%>";
   		value_temp2 ="<%TCWebApi_get("DeviceInfo_PVC5","WanSubMask","s")%>";
		if(InSameSubnet(value,value_temp,value2,value_temp2))	
			return ;
	<% end if %>
		<%if tcWebApi_get("DeviceInfo_PVC6","WanIP","h") <> "N/A" then%>
	 	  value2 = "<%TCWebApi_get("DeviceInfo_PVC6","WanIP","s")%>";
   		value_temp2 ="<%TCWebApi_get("DeviceInfo_PVC6","WanSubMask","s")%>";
		if(InSameSubnet(value,value_temp,value2,value_temp2))	
			return ;
	<% end if %>
		<%if tcWebApi_get("DeviceInfo_PVC7","WanIP","h") <> "N/A" then%>
	 	  value2 = "<%TCWebApi_get("DeviceInfo_PVC7","WanIP","s")%>";
   		 value_temp2 ="<%TCWebApi_get("DeviceInfo_PVC7","WanSubMask","s")%>";
		if(InSameSubnet(value,value_temp,value2,value_temp2))	
			return ;
	<% end if %>
	//wang add end

	if(document.uiViewLanForm.isolate_client[0].checked){
		document.uiViewLanForm.isolateigmpFlag.value = 1;
	}else{
		document.uiViewLanForm.isolateigmpFlag.value = 0;
	}	
	showSpin();//cindy add 
	document.uiViewLanForm.dhcpFlag.value = 0;
	document.uiViewLanForm.submit();
}

function checkAllIPv6Options( )
{
//jrchen add			
	var value;
	// = document.uiViewLanForm.ipv6Flag.value;
	var form = document.uiViewLanForm;
	//if(value == 1)
	if(document.uiViewLanForm.uiViewIPv6Addr.value != "" || document.uiViewLanForm.uiViewIPv6Prefix.value != "")
	{
	//check IPv6 Address format	
	value = document.uiViewLanForm.uiViewIPv6Addr.value;	
	if(inValidIPv6Addr(value))
		return false;	
	
	if(false == isGlobalIpv6Address(value)){
		alert('<%tcWebApi_get("String_Entry","LANJS33Text","s")%>' + value);
		return false;
	}
		//jrchen add
		//check IPv6 Prefix format
	value = document.uiViewLanForm.uiViewIPv6Prefix.value;
	if(!inValidPrefixLen(value))
		return false;
	}
	
 	if(form.radvdRadio[1].checked)
	{
		if( form.radvdModeFlag.value == 1)
		{
			if(! inValidIPv6PrefixDHCP6S(form.uiViewIPv6PrefixRadvd.value) )
				return false;
			if(!checkRadvdEnable( ) )
				return false;
		}		
	}
		if(form.dhcp6sEnableRadio[0].checked)//cindy modify [1]->[0] 11/17
	{
		//if(! inValidIPv6Prefix(form.uiViewIPv6PrefixRadvd.value) )
		//	return;
		//if(!inValidIPv6PrefixDHCP6S(form.uiViewIPv6DHCPPrefix.value) )
			//return;
		if(!checkDHCP6SMode())
			return false;
	//cindy add for check dnsv6 20190815
		if(!checkDNSv6Number())
			return false;
	//cindy add for check dnsv6 20190815
	}    	
	document.uiViewLanForm.radvdFlag.value = 0;
	document.uiViewLanForm.dhcp6sFlag.value = 0;
	return true;
}
function checkRadvdEnable( )
{
	form = document.uiViewLanForm;
	var ret;
	if(form.radvdRadio[1].checked)
	{
		ret = checkRadvdInput( );
	}
	
	return ret;
}

	
	
function checkRadvdInput( )
{
	form = document.uiViewLanForm;
	
	if(!inValidIPv6PrefixDHCP6S(form.uiViewIPv6PrefixRadvd.value) )
		return false;
	if(!inValidPrefixLen(form.uiViewIPv6PrefixLenRadvd.value) )
		return false;
	if(!invalidLifetimeValue(form.uiPreferredLifetimeRadvd.value) )
		return false;
	if(!invalidLifetimeValue(form.uiValidLifetimeRadvd.value) )
		return false;
        var preferredlifetime = parseInt(form.uiPreferredLifetimeRadvd.value);
        var validlifetime = parseInt(form.uiValidLifetimeRadvd.value);
        if((validlifetime) <= (preferredlifetime) )
       {
                    alert("<%tcWebApi_get("String_Entry","LANJS45Text","s")%>");

                    return false;
    
       }
	return true
}

function checkDHCP6SMode( )
{
		form = document.uiViewLanForm;
		
		if(form.dhcp6sModeFlag.value == 1)
	{
		 if(!checkDHCP6SParam() )
		 	return false;
	}
	return true;
}


function checkDHCP6SParam()
{
	form = document.uiViewLanForm;
	if(!inValidIPv6PrefixDHCP6S(form.uiViewIPv6DHCPPrefix.value) )
		return false;
	if(!inValidPrefixLen(form.uiViewIPv6DHCPPrefixLen.value) )
		return false;		
	if(!invalidLifetimeValue(form.uiPreferredLifetimeDHCP6.value) )
		return false;
	if(!invalidLifetimeValue(form.uiValidLifetimeDHCP6.value) )
		return false;
        var preferredlifetime = parseInt(form.uiPreferredLifetimeDHCP6.value);
        var validlifetime = parseInt(form.uiValidLifetimeDHCP6.value);
        if((validlifetime) <= (preferredlifetime) )
       {
                    alert("<%tcWebApi_get("String_Entry","LANJS45Text","s")%>");

                    return false;
       }

	//if(inValidIPv6Addr(form.uiPrimaryDNSDHCP6.value) )
	//	return false;
	//if(inValidIPv6Addr(form.uiSecondaryDNSDHCP6.value) )
	//	return false;
		
	return true;
}
//cindy add for check dnsv6 20190815
 function checkDNSv6Number()
 {
	var pridns=document.uiViewLanForm.uiPrimaryDNSDHCP6.value;
	var secdns=document.uiViewLanForm.uiSecondaryDNSDHCP6.value;
	
	if(document.uiViewLanForm.dhcp6sdnsmode[1].selected)
	{
	if(inValidIPv6Addr(form.uiPrimaryDNSDHCP6.value) )
		return false;
	if(inValidIPv6Addr(form.uiSecondaryDNSDHCP6.value) )
		return false;
	}
	return true;
}
//cindy add for check dnsv6 20190815
function inValidPrefixLen(value1) {

	
	if(value1.match("[^0-9]") != null)  {

        alert("<%tcWebApi_get("String_Entry","LANJS34Text","s")%>");
    	                    
        return false;
    }
	var PrefixLen = parseInt(value1);
	if (value1=="") {

        alert("<%tcWebApi_get("String_Entry","LANJS35Text","s")%>");

		return false;
	}
	if ( (PrefixLen > 64) || (PrefixLen < 16) ) {

        alert("<%tcWebApi_get("String_Entry","LANJS36Text","s")%>");

		return false;
	}
	return true;
}

function invalidLifetimeValue(value1) {
	var form = document.uiViewLanForm;
	
	if(value1.match("[^0-9]") != null)  {

        alert("<%tcWebApi_get("String_Entry","LANJS37Text","s")%>");
    	                    
        return false;
    }
	var lifetime = parseInt(value1);
	if (value1 == "") {

        alert("<%tcWebApi_get("String_Entry","LANJS38Text","s")%>");

		return false;
	}
	if ( (lifetime > 4294967295) || (lifetime < 300) ) {

        alert("<%tcWebApi_get("String_Entry","LANJS39Text","s")%>");

		return false;
	}
	return true;
}

function changeDNSRelay()
{
	if(document.uiViewLanForm.dnsTypeRadio[0].selected)
	{		autoDNSRelay();}
	if(document.uiViewLanForm.dnsTypeRadio[1].selected)
	{		manualDNSRelay();}
}
function autoDNSRelay()
{
	//document.uiViewLanForm.PrimaryDns.disabled = true;
	//document.uiViewLanForm.SecondDns.disabled = true;
	setDisplay('hiddendns_div0', 0);
	setDisplay('hiddendns_div1', 0);
}	

function manualDNSRelay()
{
	//document.uiViewLanForm.PrimaryDns.disabled = false;
	//document.uiViewLanForm.SecondDns.disabled = false;
	setDisplay('hiddendns_div0', 1);
	setDisplay('hiddendns_div1', 1);
}

function dhcpRelayCheckFail()
{
	document.uiViewLanForm.dhcpTypeRadio[2].disabled = true;
	document.uiViewLanForm.ServerIp.disabled = true;
}

function disableTheAliasIp()
{
	if(document.uiViewLanForm.dhcpTypeRadio[3].checked)
	{
		document.uiViewLanForm.uiViewAliasIPAddr.disabled = true;
		document.uiViewLanForm.uiViewAliasNetMask.disabled = true;
	}
	else
	{
		document.uiViewLanForm.uiViewAliasIPAddr.disabled = false;
		document.uiViewLanForm.uiViewAliasNetMask.disabled = false;
	}
}
function userModeOnloadCheck()
{
	return;
}

function adminOnloadCheck()
{
<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
	disableTheAliasIp();
<% End If %>
<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
	if(document.uiViewLanForm.dhcpTypeRadio[0].checked)//cindy modify [1]->[0] 11/17
	{
		if(document.uiViewLanForm.dnsTypeRadio[0].selected)	
			autoDNSRelay();
		else if(document.uiViewLanForm.dnsTypeRadio[1].selected)
			manualDNSRelay();
	}
	if(document.uiViewLanForm.dhcpTypeRadio[2].checked)
	{
		if(!dhcpRelayCheck())
		{
			dhcpRelayCheckFail();
		}
	}
<%elseif tcWebApi_get("DeviceInfo", "isCYSFU", "h") = "Yes" then%>
	if(document.uiViewLanForm.dhcpTypeRadio[0].checked)//cindy modify [1]->[0] 11/17
	{
		if(document.uiViewLanForm.dnsTypeRadio[0].selected)	
			autoDNSRelay();
		else if(document.uiViewLanForm.dnsTypeRadio[1].selected)
			manualDNSRelay();
	}
	if(document.uiViewLanForm.dhcpTypeRadio[2].checked)
	{
		if(!dhcpRelayCheck())
		{
			dhcpRelayCheckFail();
		}
	}
<% end if %> 
}
function onloadCheck()
{
	userModeOnloadCheck();
	doigmpforwifiChange();//wang add 20170919
	//doIsolateIGMPChange();//wang add 20171228
	/***wang add, when use bridge mode, DHCP shold be disable 20180102***/
	<% if tcWebApi_get("Wan_PVC","ISP","h") = "3" Then %>
		document.uiViewLanForm.dhcpTypeRadio[1].checked = true;
		document.uiViewLanForm.dhcpTypeRadio[0].disabled = true;
		document.uiViewLanForm.dhcpTypeRadio[1].disabled = true;
	<% else %>
		document.uiViewLanForm.dhcpTypeRadio[0].disabled = false;
		document.uiViewLanForm.dhcpTypeRadio[1].disabled = false;	
	<% end if %> 
	/***wang add end***/
	if(document.uiViewLanForm.userMode.value !=1)
	{
		adminOnloadCheck();
	}
	return;

}

function dhcpRelayCheck()
{
	//alert("run here 1");
	if(document.uiViewLanForm.dhcpTypeRadio[2].checked){
		//alert("run here 2");
		if(document.uiViewLanForm.defaultRoute_isp.value == 3){
			alert("<%tcWebApi_get("String_Entry","LANJS40Text","s")%>");
			return false;
		}
	}
	return true;
}
function radvdChanged()
{	
		//var form = document.uiViewLanForm;
		//form.uiViewIPv6PrefixRadvd.disabled = true;
		//form.uiViewIPv6PrefixLenRadvd.disabled = true;
		//form.uiPreferredLifetimeRadvd.disabled = true;
		//form.uiValidLifetimeRadvd.disabled = true;
		//form.radvdEnableFlag.value = 0;
		//form.radvdFlag.value = 1;
		//document.uiViewLanForm.submit();


	with (document.uiViewLanForm){
		radvdFlag.value = 1;
		if (radvdRadio[0].checked == true){
			setDisplay('div_radvden', 0);
			radvdEnableFlag.value = 0;
		}
		else {
			setDisplay('div_radvden', 0);//cindy modify 1->0
			radvdEnableFlag.value = 1;
			radvdModeChanged();
		}
	}
}

function radvdModeChanged( )
{
		//var  form = document.uiViewLanForm;
		//form.uiViewIPv6PrefixRadvd.disabled = false;
		//form.uiViewIPv6PrefixLenRadvd.disabled = false;
		//form.uiPreferredLifetimeRadvd.disabled = false;
		//form.uiValidLifetimeRadvd.disabled = false;
		//form.radvdEnableFlag.value = 1;		
		//form.radvdFlag.value = 1;
		//document.uiViewLanForm.submit();

		with (document.uiViewLanForm){
		radvdFlag.value = 1;
		if (radvdModeRadio[0].checked){
			radvdModeFlag.value = 0;
			setDisplay('div_radvdprelen', 0);
			setDisplay('div_radvdprelite', 0);
			setDisplay('div_radvdvate', 0);
		}
		else {
			radvdModeFlag.value = 1;
			setDisplay('div_radvdprelen', 1);
			setDisplay('div_radvdprelite', 1);
			setDisplay('div_radvdvate', 1);
		}
	}
}

function dhcp6sChanged()
{
		//var form = document.uiViewLanForm;
		//form.uiViewIPv6PrefixRadvd.disabled = true;
		//form.uiViewIPv6PrefixLenRadvd.disabled = true;
		//form.uiPreferredLifetimeRadvd.disabled = true;
		//form.uiValidLifetimeRadvd.disabled = true;		
		//form.dhcp6sEnableFlag.value = 0;
		//form.dhcp6sFlag.value = 1;
		//document.uiViewLanForm.submit();
		
	with (document.uiViewLanForm){
		dhcp6sFlag.value = 1;
		if (dhcp6sEnableRadio[1].checked == true){//cindy modify [0]->[1] 11/17
			setDisplay('div_dhcp6sen', 0);
			dhcp6sEnableFlag.value = 0;
		}
		else {
			setDisplay('div_dhcp6sen', 1);
			dhcp6sEnableFlag.value = 1;
			dhcp6sModeChanged();
			dhcp6sDNSModeChanged();//cindy add 20190814
		}
	}
}

function ripngEnableChanged() 
{
	if(document.uiViewLanForm.ripngEnableRadio[0].checked)
		setDisplay('div_ripng_direction', 0);
	else
		setDisplay('div_ripng_direction', 1);
}

function dhcp6sModeChanged()
{
	//var form = document.uiViewLanForm;	
	//form.dhcp6sModeFlag.value = 0;		
	//form.dhcp6sFlag.value = 1;
	//document.uiViewLanForm.submit();
	
	with (document.uiViewLanForm){
		dhcp6sFlag.value = 1;
		if (dhcp6sModeRadio[0].selected){
			dhcp6sModeFlag.value = 0;
			setDisplay('div_dhcp6sprelen', 0);
			setDisplay('div_dhcp6splite', 0);
			setDisplay('div_dhcp6svate', 0);
		}
		else {
			dhcp6sModeFlag.value = 1;
			setDisplay('div_dhcp6sprelen', 1);
			setDisplay('div_dhcp6splite', 1);
			setDisplay('div_dhcp6svate', 1);
		}
	}
}

//foxconn cindy add for DNSv6 mode option 20190814
function dhcp6sDNSModeChanged()
{
	with (document.uiViewLanForm){
		dhcp6sFlag.value = 1;
		if (dhcp6sdnsmode[0].selected){
			setDisplay('div_dhcp6sdns1', 0);
			setDisplay('div_dhcp6sdns2', 0);
		}
		else {
			setDisplay('div_dhcp6sdns1', 1);
			setDisplay('div_dhcp6sdns2', 1);
		}
	}
}
//foxconn cindy add for DNSv6 mode option 20190814

function dhcp6sModeAuto()
{
	var form = document.uiViewLanForm;
	
	form.dhcp6sModeFlag.value = 2;
		
	form.dhcp6sFlag.value = 1;
	document.uiViewLanForm.submit();
}

function dhcp6sPDEnable()
{
	var form = document.uiViewLanForm;
	form.dhcp6sPDFlag.value = 1;
	form.dhcp6sFlag.value = 1;
	document.uiViewLanForm.submit();
}

function dhcp6sPDDisable()
{
	var form = document.uiViewLanForm;
	form.dhcp6sPDFlag.value = 0;
	form.dhcp6sFlag.value = 1;
	document.uiViewLanForm.submit();
}

<% if tcWebApi_get("GUI_Entry0","DyVlan","h") = "support" then %>

function doIndexOfOUIChange(index)
{
	if(document.uiViewLanForm.OUIDeviceSeleradio[0].checked)
	{
		if(document.uiViewLanForm.IndexOfOUI.selectedIndex == 0)
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.stb_index_0.value;
		}
		else if(document.uiViewLanForm.IndexOfOUI.selectedIndex == 1)
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.stb_index_1.value;
		}
		else if(document.uiViewLanForm.IndexOfOUI.selectedIndex == 2)
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.stb_index_2.value;
		}
		else if(document.uiViewLanForm.IndexOfOUI.selectedIndex == 3)
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.stb_index_3.value;
		}
		else
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.stb_index_4.value;
		}
	}
	else
	{
		if(document.uiViewLanForm.IndexOfOUI.selectedIndex == 0)
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.voip_index_0.value;
		}
		else if(document.uiViewLanForm.IndexOfOUI.selectedIndex == 1)
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.voip_index_1.value;
		}
		else if(document.uiViewLanForm.IndexOfOUI.selectedIndex == 2)
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.voip_index_2.value;
		}
		else if(document.uiViewLanForm.IndexOfOUI.selectedIndex == 3)
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.voip_index_3.value;
		}
		else
		{
			document.uiViewLanForm.uiOUI.value = document.uiViewLanForm.voip_index_4.value;
		}
	}
	
}

function uiOUICheck(OUI)
{
	var OUIname = OUI.value;
	var i;
	if( (OUIname.length != 6) && (OUIname.length != 0))
	{
		alert("<%tcWebApi_get("String_Entry","LANJS41Text","s")%>");
		document.uiViewLanForm.uiOUI.focus();
		return true;
	}
	
	for ( var i = 0; i < OUIname.length; i++ )
	{
		var c = OUIname.charCodeAt(i);
		if(!(
		((c >= 48) && (c <= 57))
		||((c >= 65) && (c <= 70))
		||((c >= 97) && (c <= 102))
		))
		{
			alert("<%tcWebApi_get("String_Entry","LANJS42Text","s")%>");
			document.uiViewLanForm.uiOUI.focus();
			return true;
		}
	}
	return false;
}
<% End If %>
<% if tcWebApi_get("WebCustom_Entry","isBridgeMacLimitSupported","h") = "Yes" then %>
function doMacLimitCheck(){
	var limitTotal=document.uiViewLanForm.uiMacLimitTotal;
	var limitPort1=document.uiViewLanForm.uiMacLimitPort1;
	var limitPort2=document.uiViewLanForm.uiMacLimitPort2;
	var limitPort3=document.uiViewLanForm.uiMacLimitPort3;
	var limitPort4=document.uiViewLanForm.uiMacLimitPort4;
	if(inValidMacLimit(limitTotal.value)==false){
		limitTotal.focus();
		return false;
	}
	if(inValidMacLimit(limitPort1.value)==false){
		limitPort1.focus();
		return false;
	}
	if(inValidMacLimit(limitPort2.value)==false){
		limitPort2.focus();
		return false;
	}
	if(inValidMacLimit(limitPort3.value)==false){
		limitPort3.focus();
		return false;
	}
	if(inValidMacLimit(limitPort4.value)==false){
		limitPort4.focus();
		return false;
	}
	return true;
}
function inValidMacLimit(value) {
	if (value=="") {

        alert("<%tcWebApi_get("String_Entry","LANJS49Text","s")%>");

		return false;
	}
	if(value.match("[^0-9]") != null)  {

        alert("<%tcWebApi_get("String_Entry","LANJS50Text","s")%>");
    	                    
        return false;
    }
	var Limit = parseInt(value);
	if ( (Limit > 255) || (Limit < 0) ) {

        alert("<%tcWebApi_get("String_Entry","LANJS51Text","s")%>");

		return false;
	}
	return true;
}
<% End If %>
<%if tcwebApi_get("WebCustom_Entry","isStdioTimeoutSupported","h") = "Yes" then%>
function checkStdioTimeOut(){
	var obj=document.getElementsByName("StdioTimeOut")[0];
	if(obj.value==""){
		alert("<%tcWebApi_get("String_Entry","LANJS52Text","s")%>")
		return false;
	}
	if(obj.value.match("[^0-9]") != null){
		alert("<%tcWebApi_get("String_Entry","LANJS53Text","s")%>");     
    return false;
	}
	var Limit = parseInt(obj.value);
	if ( (Limit > 3600) || (Limit < 0) ) {
        alert("<%tcWebApi_get("String_Entry","LANJS54Text","s")%>");
		return false;
	}
	return true;
}
<% End If %>
//cindy add start 0911
function blockIP(){
 IP=document.uiViewLanForm.uiViewIPAddr;
 StartIP=document.uiViewLanForm.StartIp;
 PoolSize=document.uiViewLanForm.PoolSize;
 EndIP=document.uiViewLanForm.EndIp;
var IPdigits = IP.value.split(".");
var addr1 = Number(IPdigits[0]);
var addr2 = Number(IPdigits[1]);
var addr3 = Number(IPdigits[2]);
var addr4 = Number(IPdigits[3]);
if((addr4>0)&(addr4<200)){
StartIP.value=addr1+"."+addr2+"."+addr3+"."+(addr4+1);
EndIP.value=addr1+"."+addr2+"."+addr3+"."+254;
PoolSize.value=255-(addr4+1);
}
else if((addr4>=200)&(addr4<=254)){
StartIP.value=addr1+"."+addr2+"."+addr3+"."+1;
EndIP.value=addr1+"."+addr2+"."+addr3+"."+(addr4-1);
PoolSize.value=addr4-1;
}
else{
        alert("<%tcWebApi_get("String_Entry","LANJS56Text","s")%>");
}
}

function blockStartIP(){
 StartIP=document.uiViewLanForm.StartIp;
 PoolSize=document.uiViewLanForm.PoolSize;
 EndIP=document.uiViewLanForm.EndIp;

var StartIPdigits = StartIP.value.split(".");
var Startaddr3 = Number(StartIPdigits[2]);
var Startaddr4 = Number(StartIPdigits[3]);

var EndIPdigits = EndIP.value.split(".");
var Endaddr3 = Number(EndIPdigits[2]);
var Endaddr4 = Number(EndIPdigits[3]);
if(Startaddr4<=Endaddr4){
PoolSize.value=Endaddr4-Startaddr4+1;
}
else if(Startaddr4>254){
        alert("<%tcWebApi_get("String_Entry","LANJS57Text","s")%>");
	return false;
}
else if(Startaddr4>Endaddr4){
        alert("<%tcWebApi_get("String_Entry","LANJS59Text","s")%>");
	return false;
}

if(Endaddr3<Startaddr3)
{
        alert("<%tcWebApi_get("String_Entry","LANJS59Text","s")%>");
	return false;
}
	return true;
}

function blockEndIP(){
 StartIP=document.uiViewLanForm.StartIp;
 PoolSize=document.uiViewLanForm.PoolSize;
 EndIP=document.uiViewLanForm.EndIp;
var StartIPdigits = StartIP.value.split(".");
var Startaddr3 = Number(StartIPdigits[2]);
var Startaddr4 = Number(StartIPdigits[3]);

var EndIPdigits = EndIP.value.split(".");
var Endaddr3 = Number(EndIPdigits[2]);
var Endaddr4 = Number(EndIPdigits[3]);
if(Endaddr4>=Startaddr4){
PoolSize.value=Endaddr4-Startaddr4+1;
}
else if(Endaddr4>254){
        alert("<%tcWebApi_get("String_Entry","LANJS58Text","s")%>");
	return false;
}
else if(Endaddr4<Startaddr4){
        alert("<%tcWebApi_get("String_Entry","LANJS59Text","s")%>");
	return false;
}

if(Endaddr3<Startaddr3)
{
        alert("<%tcWebApi_get("String_Entry","LANJS59Text","s")%>");
	return false;
}
	return true;
}
//cindy add end 0911
//amy add start 02/28
function checkIpPool()
{
 StartIP=document.uiViewLanForm.StartIp;
 EndIP=document.uiViewLanForm.EndIp;
var StartIPdigits = StartIP.value.split(".");
var Startaddr1= Number(StartIPdigits[0]);
var Startaddr2 = Number(StartIPdigits[1]);
var Startaddr3 = Number(StartIPdigits[2]);


var EndIPdigits = EndIP.value.split(".");
var Endaddr1= Number(EndIPdigits[0]);
var Endaddr2 = Number(EndIPdigits[1]);
var Endaddr3= Number(EndIPdigits[2]);

if((Startaddr1==Endaddr1) && (Startaddr2==Endaddr2) &&(Startaddr3==Endaddr3) )
	return true;
else
	{
	alert("<%tcWebApi_get("String_Entry","LANJS60Text","s")%>");
	return false;
	}
}
//amy add end 02/28.
//wang add start 201709119
function doigmpforwifiChange(){
	var temp = document.getElementsByName("lan_snoop");
	if(temp[0].checked)
	{
		document.getElementById("igmpforwifi").style.display="";
	}else
		{
		document.getElementById("igmpforwifi").style.display="none";
	}
}
//wang add end

//wang add start for isolate igmp 20171228
function doIsolateIGMPChange(){
	var temp = document.getElementsByName("isolate_client");
	if(temp[0].checked)
	{
		document.getElementById("isolate_igmp").style.display = "none";

	}
	else
	{
		document.getElementById("isolate_igmp").style.display = "";
	}
	
}
//end
</script>
</head>


	<body onLoad="onloadCheck()">
		<FORM METHOD="POST" ACTION="/cgi-bin/home_lan.asp" name="uiViewLanForm">
			<INPUT TYPE="HIDDEN" NAME="lan_VC" value="0">
			<INPUT TYPE="HIDDEN" NAME="lan_Alias_VC" value="0">
			<INPUT TYPE="HIDDEN" NAME="aliasFlag" value="<%tcWebApi_get("LanAlias_Entry","Active","s")%>">
			<INPUT TYPE="HIDDEN" NAME="defaultRoute" value="<%tcWebApi_CurrentDefaultRoute()%>">
			<INPUT TYPE="HIDDEN" NAME="isIgmpMaxGroupSupported" VALUE="<%tcWebApi_get("WebCustom_Entry","isIgmpMaxGroupSupported","s")%>">
			<%tcWebApi_get("WebCurSet_Entry","wan_pvc","defaultRoute")%>
			<INPUT TYPE="HIDDEN" NAME="defaultRoute_isp" value="<%tcWebApi_get("Wan_PVC","ISP","s")%>">
			<INPUT type="HIDDEN" name="staticNum" value="<%TcWebApi_get("Dhcpd","Static_Num","s")%>">
			<INPUT type="HIDDEN" name="LeaseNum" value="<%TcWebApi_get("DhcpLease","LeaseNum","s")%>">
			<INPUT type="HIDDEN" name="emptyEntry" value="<%TcWebApi_get("Dhcpd","Empty_Entry","s")%>">
			<INPUT TYPE="HIDDEN" NAME="addFlag" VALUE="0">
			<INPUT TYPE="HIDDEN" NAME="delnum">
			<INPUT TYPE="HIDDEN" NAME="tmpStartIp" value="<%tcWebApi_get("Dhcpd_Common","start","s")%>">
			<INPUT TYPE="HIDDEN" NAME="tmpEndIp" value="<%tcWebApi_get("Dhcpd_Common","end","s")%>">
			<INPUT type="HIDDEN" NAME="tmpPoolCount" value="<%tcWebApi_get("Dhcpd_Common","pool_count","s")%>">
			<INPUT TYPE="HIDDEN" NAME="option60Flag" value="<%tcWebApi_get("Dhcpd_Option60","Active","s")%>">
			<INPUT type="HIDDEN" NAME="isIPv6Supported" value="<% if tcWebApi_get("Info_Ether","isIPv6Supported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
			<INPUT type="HIDDEN" NAME="ipv6Flag" value="<% if tcWebApi_get("Wan_PVC","IPVERSION","h") = "IPv4/IPv6" then asp_write("1") else asp_write("0") end if %>">
			<INPUT type="hidden" name="userMode" value="<%if tcwebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then asp_write("0") else asp_write("1") end if%>">

			<% if tcWebApi_get("GUI_Entry0","DyVlan","h") = "support" then %>
				<INPUT type="HIDDEN" NAME="stb_index_0" value="<%tcWebApi_staticGet("DyVLAN_Entry0","STB_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="stb_index_1" value="<%tcWebApi_staticGet("DyVLAN_Entry1","STB_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="stb_index_2" value="<%tcWebApi_staticGet("DyVLAN_Entry2","STB_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="stb_index_3" value="<%tcWebApi_staticGet("DyVLAN_Entry3","STB_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="stb_index_4" value="<%tcWebApi_staticGet("DyVLAN_Entry4","STB_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="voip_index_0" value="<%tcWebApi_staticGet("DyVLAN_Entry0","Voip_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="voip_index_1" value="<%tcWebApi_staticGet("DyVLAN_Entry1","Voip_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="voip_index_2" value="<%tcWebApi_staticGet("DyVLAN_Entry2","Voip_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="voip_index_3" value="<%tcWebApi_staticGet("DyVLAN_Entry3","Voip_OUI","s") %>">
				<INPUT type="HIDDEN" NAME="voip_index_4" value="<%tcWebApi_staticGet("DyVLAN_Entry4","Voip_OUI","s") %>">
			<% end if %>
			
			<INPUT TYPE="HIDDEN" NAME="isolateigmpFlag" VALUE="0">
			<INPUT TYPE="HIDDEN" NAME="ActiveIsolateIGMP" VALUE="Yes">

			<div id="pagestyle"><!--cindy add for border 11/28-->
<div id="contenttype">
				<div id="block1"><!--cindy add for id="block1" 12/07-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
							<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANLocalIPText","s")%></td>
						</tr>
					</table>

					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
						<tr height="30px">
							<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANIPAddressText","s")%></td>
							<td align=left class="tabdata"> <INPUT TYPE="TEXT" NAME="uiViewIPAddr" SIZE="15" MAXLENGTH="15" onblur=blockIP(); VALUE="<%If tcWebApi_get("Lan_Entry","IP","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP","s") end if%>" >	
							    <INPUT TYPE="HIDDEN" NAME="dhcpFlag" VALUE="1">
							    <INPUT TYPE="HIDDEN" NAME="lanFlag" VALUE="0">
							    <INPUT TYPE="HIDDEN" NAME="DNSproxy" VALUE='Yes'> 
							</td>
						</tr>

						<tr height="30px">
							<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANMaskText","s")%></td>
							<td align=left class="tabdata"><INPUT TYPE="TEXT" NAME="uiViewNetMask" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("Lan_Entry","netmask","h") <> "N/A" then tcWebApi_get("Lan_Entry","netmask","s") end if%>" ></td>
						</tr>

						<% If tcWebApi_get("LanAlias_Entry","Active","h") = "Yes" Then%>
						  	<tr>
							    	<td height="24" class="light-orange">&nbsp;</td>
							    	<td class="light-orange">&nbsp;</td>
							    	<td class="tabdata"><div align=right><%tcWebApi_get("String_Entry","LANAliasIPText","s")%></div></td>
							    	<td class="tabdata"><div align=center>:</div></td>
							    	<td class="tabdata">
							    		<INPUT TYPE="TEXT" NAME="uiViewAliasIPAddr" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("LanAlias_Entry","IP","h") <> "N/A" then tcWebApi_get("LanAlias_Entry","IP","s") end if%>" >
									<%tcWebApi_get("String_Entry","LANAliasIPInfoText","s")%>
								</td>	
						 	</tr>

							<tr>
							    	<td class="light-orange">&nbsp;</td>
							    	<td class="light-orange">&nbsp;</td>
							    	<td class="tabdata"> <div align=right><%tcWebApi_get("String_Entry","LANAliasMaskText","s")%> </div></td>
							    	<td class="tabdata"><div align=center>:</div></td>
							    	<td class="tabdata"><INPUT TYPE="TEXT" NAME="uiViewAliasNetMask" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("LanAlias_Entry","netmask","h") <> "N/A" then tcWebApi_get("LanAlias_Entry","netmask","s") end if%>" ></td>
						    	</tr>
						<% End If %>	
					</table>
				</div><!--cindy add for id="block1" 12/07-->

				<table style="display:none;" width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed"><!--wang add display:none for this optiong is for need 20171228-->
					<%if tcwebApi_get("WebCustom_Entry","isC1SFUSupported","h") <> "Yes" then%>
						<%if tcwebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then%>
							<%if tcwebApi_get("WebCustom_Entry","isC1HGUSupported","h") <> "Yes" then%>
								<tr height="30px" style="display:none;"><!-- style="display:none"--><!--wang hidde snoop switch, to solve that 5g wifi can't jion multicast when snoop deactive -->
									<td align=left class="tabdata" style="width:250px;padding-left:20px;"> 
										<%if tcwebApi_get("WebCustom_Entry","isSNOOPSupported","h") = "Yes" then%>
											<%tcWebApi_get("String_Entry","LANIgmpSnoopText","s")%>
									</td>
								    	<td align=left class="tabdata"><!--wang change LANSnoopText to LANIgmpSnoopText-->
								 		<%else%>
								     			<%tcWebApi_get("String_Entry","LANIgmpSnoopText","s")%>
								     	</td>
								     	<td align=left class="tabdata">
										<%end if%>

								   		<%if tcwebApi_get("WebCustom_Entry","isSNOOPSupported","h") = "Yes" then%>
								               	<INPUT NAME="lan_snoop" TYPE="RADIO" VALUE="Yes" onClick="doigmpforwifiChange();" <% If TCWebApi_get("Lan_Snoop","snoopEnable","h") = "Yes" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANStatus0Text","s")%> 		
											&nbsp;&nbsp;&nbsp;&nbsp;
											<INPUT TYPE="RADIO" NAME="lan_snoop" VALUE="No" onClick="doigmpforwifiChange();" <% If TCWebApi_get("Lan_Snoop","snoopEnable","h") = "No" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANStatus1Text","s")%> 
									</td>
								</tr>
								   		<%else%> 
											<INPUT NAME="lan_Igmpsnoop" TYPE="RADIO" VALUE="Yes" <% If TCWebApi_get("Lan_IgmpSnoop","igmpsnoopEnable","h") = "Yes" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANStatus0Text","s")%> 		
											&nbsp;&nbsp;&nbsp;&nbsp;
											<INPUT TYPE="RADIO" NAME="lan_Igmpsnoop" VALUE="No" <% If TCWebApi_get("Lan_IgmpSnoop","igmpsnoopEnable","h") = "No" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANStatus1Text","s")%> 
									</td>
								</tr>
										<%end if%>
							<%end if%>	
						<%end if%>

						<%if tcwebApi_get("WebCustom_Entry","isDasanVtagTransSupported","h") = "Yes" then%>
							<tr height="30px">
								<td width="250px" align=left class="tabdata" style="padding-left:20px;">     <%tcWebApi_get("String_Entry","LANVtagTransparent","s")%></td>
						     		<td align=left class="tabdata">
									<INPUT TYPE="RADIO" NAME="vlan_transparent" VALUE="Yes" <% If TCWebApi_get("XPON_Common","LanVidTransparent","h") = "Yes" then asp_Write("checked") end if%> >		 Activated 		
									&nbsp;&nbsp;&nbsp;&nbsp;
									<INPUT TYPE="RADIO" NAME="vlan_transparent" VALUE="No" <% If TCWebApi_get("XPON_Common","LanVidTransparent","h") = "No" then asp_Write("checked") end if%> > Deactivated 
								</td>
							</tr>
						<%end if%>

						<%if tcwebApi_get("WebCustom_Entry","isSNOOPSupported","h") <> "Yes" then%>	
							<%if tcwebApi_get("WebCustom_Entry","isMLDSupported","h") = "Yes" then%>
								<tr height="30px">
									<td width="250px" align=left class="tabdata" style="padding-left:20px;">  <%tcWebApi_get("String_Entry","LANMldSnoopText","s")%> </td>
									<td align=left class="tabdata">
										<INPUT TYPE="RADIO" NAME="lan_Mldsnoop" VALUE="Yes" <% If TCWebApi_get("Lan_MldSnoop","mldsnoopEnable","h") = "Yes" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANStatus0Text","s")%> 		
										&nbsp;&nbsp;&nbsp;&nbsp;
										<INPUT TYPE="RADIO" NAME="lan_Mldsnoop" VALUE="No" <% If TCWebApi_get("Lan_MldSnoop","mldsnoopEnable","h") = "No" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANStatus1Text","s")%> 
									</td>
								</tr>
							<%end if%>
						<%end if%>

						<%if tcwebApi_get("WebCustom_Entry","isSNOOPSupported","h") = "Yes" then%>
							<%if tcWebApi_get("WebCustom_Entry", "isIgmpMaxGroupSupported", "h") = "Yes" then %> 
							    	<tr>
									<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","LANSnoopNumText","s")%> </td>
									<td align=left class="tabdata">
							    			<INPUT TYPE="TEXT" NAME="snoopGroupNum" SIZE="4" MAXLENGTH="4" VALUE="<%If tcWebApi_get("Lan_Snoop","groupNum","h") <> "N/A" then tcWebApi_get("Lan_Snoop","groupNum","s") end if%>" >	
							    		</td>
							    	</tr>
							<%end if%>
						<%end if%>

						<tr style="display:none"><!--wang add this style-->
						    	<td class="light-orange">&nbsp;</td>
						    	<td class="light-orange"></td>
						    	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANDynamicRouteText","s")%> </div></td>
						    	<td width="10" class="tabdata"><div align=center>:</div></td>
						    	<td class="tabdata">
						        	<SELECT NAME="lan_RIP" SIZE="1">
									<OPTION value="RIP1" <% if tcWebApi_get("LanRipd_Entry","RIPVERSION","h") = "RIP1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANRIP1Text","s")%>
									<OPTION value="RIP2" <% if tcWebApi_get("LanRipd_Entry","RIPVERSION","h") = "RIP2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANRIP2Text","s")%>
								</SELECT> 
								<%tcWebApi_get("String_Entry","LANDirectionText","s")%> 
								<SELECT NAME="lan_RIP_Dir" SIZE="1">
									<OPTION value="None" <% if tcWebApi_get("LanRipd_Entry","DIRECTION","h") = "None" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANDirection0Text","s")%>
									<OPTION value="Both" <% if tcWebApi_get("LanRipd_Entry","DIRECTION","h") = "Both" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANDirection1Text","s")%>
									<OPTION value="IN Only" <% if tcWebApi_get("LanRipd_Entry","DIRECTION","h") = "IN Only" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANDirection2Text","s")%>
									<OPTION value="OUT Only" <% if tcWebApi_get("LanRipd_Entry","DIRECTION","h") = "OUT Only" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANDirection3Text","s")%>
								</SELECT>
	</td></tr>
					<%end if%>

					<%if tcwebApi_get("WebCustom_Entry","isStdioTimeoutSupported","h") = "Yes" then%>	
					 	<tr>
						    	<td class="light-orange">&nbsp;</td>
						    	<td class="light-orange"></td>
						    	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANStdioTimeoutText","s")%> </div></td>
						    	<td width="10" class="tabdata"><div align=center>:</div></td>
						    	<td class="tabdata">
					                	<INPUT TYPE="TEXT" NAME="StdioTimeOut" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("GUI_Entry0","StdioTimeout","h") <>"N/A" then tcWebApi_get("GUI_Entry0","StdioTimeout","s") else asp_Write("0") end if%>" >
					                	<%tcWebApi_get("String_Entry","LANStdioTimeoutTipsText","s")%>
    </td></tr>
					<%end if%>	

					<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
					 	<% if tcWebApi_get("Info_Ether","isIPv6Supported","h") = "Yes" then %>
							<% If tcWebApi_get("WebCustom_Entry","isRipngSupported","h") = "Yes" Then %>
						        	<tr>
									<td width="150" height="30" class="light-orange">&nbsp;</td>
						                	<td width="10" class="light-orange">&nbsp;</td>
						       		<td width="150" class="tabdata"><div align=right>   <%tcWebApi_get("String_Entry","LANRipngText","s")%></div></td>
					                		<td width="10" class="tabdata"><div align=center>:</div></td>
					                		<td width="440" class="tabdata"> 
										<INPUT TYPE="RADIO" NAME="ripngEnableRadio" VALUE="0"  onClick="ripngEnableChanged()" <%If tcWebApi_get("LanRipd_Entry","RIPNGENABLE","h") <> "1" then asp_Write("checked") end if%> > 			                 
					                       		<%tcWebApi_get("String_Entry","LANRipngDisableText","s")%>					                  
										&nbsp;&nbsp;&nbsp;&nbsp;

										<INPUT TYPE="RADIO" NAME="ripngEnableRadio" VALUE="1"  onClick="ripngEnableChanged()" <%If tcWebApi_get("LanRipd_Entry","RIPNGENABLE","h") = "1" then asp_Write("checked") end if%> > 
					                 			<%tcWebApi_get("String_Entry","LANRipngEnableText","s")%>
					                   		</td>
					      			</tr>
					      
							      <tr id="div_ripng_direction">
							      		<td class="light-orange">&nbsp;</td>
							      		<td class="light-orange"></td>
							  		<td class="tabdata">
							  			<div align=right> 
							  		  		<%tcWebApi_get("String_Entry","LANRipngDirectionText","s")%>
							  		  	</div>
							  		</td>
							  		<td width="10" class="tabdata"><div align=center>:</div></td><td class="tabdata">
										<SELECT NAME="lan_Ripng_Dir" SIZE="1">
											<OPTION <% if tcWebApi_get("LanRipd_Entry","RIPNGDIRECTION","h") = "None" then asp_Write("selected") end if %>>  <%tcWebApi_get("String_Entry","LANDirection0Text","s")%>
											<OPTION <% if tcWebApi_get("LanRipd_Entry","RIPNGDIRECTION","h") = "Both" then asp_Write("selected") end if %>> <%tcWebApi_get("String_Entry","LANDirection1Text","s")%>
											<OPTION <% if tcWebApi_get("LanRipd_Entry","RIPNGDIRECTION","h") = "IN Only" then asp_Write("selected") end if %>> <%tcWebApi_get("String_Entry","LANDirection2Text","s")%>
											<OPTION <% if tcWebApi_get("LanRipd_Entry","RIPNGDIRECTION","h") = "OUT Only" then asp_Write("selected") end if %>>  <%tcWebApi_get("String_Entry","LANDirection3Text","s")%>
										</SELECT>
									</td>
							      	</tr>	
							      
					      			<script language="JavaScript" type="text/JavaScript">
					           	 		ripngEnableChanged();
					      			</script>
					      		<% end if %>
					      	<% end if %>
					<% end if %>    
				</table>
				<!--hide end-->
  
				<div id="block1"><!--wang 20171228 -->
				 	<% If tcWebApi_get("GPON_ONU","OnuType","h") = "2" Then%>	 
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">
						     		<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","LANLimitNATSeesionTitleText","s")%></td>
							</tr>   
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >
						  	<!--cindy add for limit nat session 11/04-->
							<tr height="30px">
	<td align=left class="tabdata" style="padding-left:20px;width:250px;"><%tcWebApi_get("String_Entry","LANLimitNATSeesionText","s")%></td>
	<td align=left class="tabdata">
									<INPUT NAME="Limit_natsession" TYPE="RADIO" VALUE="1" <% If TCWebApi_get("Lan_NATSession","Active","h") = "1" then asp_Write("checked") end if%> >      <%tcWebApi_get("String_Entry","LANLimitNATSeesion0Text","s")%> 	
									&nbsp;&nbsp;&nbsp;&nbsp;
									<INPUT TYPE="RADIO" NAME="Limit_natsession" VALUE="0" <% If TCWebApi_get("Lan_NATSession","Active","h") = "0" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANLimitNATSeesion1Text","s")%> 
								</td>
							</tr>
							<!--cindy add for limit nat session 11/04-->
						</table>
					<% end if %>
				</div><!--end block1 wang-->
  
				<!--wang add start for isolate all lan client 20171012-->
				<div id="block1"><!--cindy add for id="block1" 12/07-->
					<% If tcWebApi_get("GPON_ONU","OnuType","h") = "2" Then%>	 
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">
					     			<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","LANIsolate0Text","s")%></td>
							</tr>
</table>
					     
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >
							<tr height="30px">
								<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","LANIsolate1Text","s")%></td>
								<td align=left class="tabdata">
									<INPUT NAME="isolate_client" TYPE="RADIO" VALUE="Yes" onClick="doIsolateIGMPChange();" <% If TCWebApi_get("Lan_Isolate","IsolateEable","h") = "Yes" then asp_Write("checked") end if%> >      <%tcWebApi_get("String_Entry","LANIsolate3Text","s")%> 	
									&nbsp;&nbsp;&nbsp;&nbsp;
									<INPUT TYPE="RADIO" NAME="isolate_client" VALUE="No" onClick="doIsolateIGMPChange();" <% If TCWebApi_get("Lan_Isolate","IsolateEable","h") = "No" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANIsolate2Text","s")%> 	
								</td>
							</tr>

							<!--wang add start for isolate igmp 20171228-->
						<% if TCWebAPI_get("Lan_Isolate", "IsolateEable", "h") = "Yes" then %>
							<tr id = "isolate_igmp" style="height:30px;display:none;">
						<% else %>
                                             <tr id = "isolate_igmp" style="height:30px;">
                                      <% end if %>
								<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","LANIsolateIGMPText","s")%></td>
								<td align=left class="tabdata">
									<INPUT NAME="Isolate_IGMP" TYPE="RADIO" VALUE="Yes" <% If TCWebApi_get("Lan_Isolate","IsolateIGMP","h") = "Yes" then asp_Write("checked") end if%> >      <%tcWebApi_get("String_Entry","LANStatus0Text","s")%> 	
									&nbsp;&nbsp;&nbsp;&nbsp;
									<INPUT TYPE="RADIO" NAME="Isolate_IGMP" VALUE="No" <% If TCWebApi_get("Lan_Isolate","IsolateIGMP","h") = "No" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANStatus1Text","s")%> 	
								</td>
							</tr>
							<!--wang add end-->

							<!--wang add start for IGMP for Wireless 2017-09-17-->
							<tr id = "igmpforwifi" style="height:30px;">
								<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","LANBlockIGMPtoWIFIText","s")%></td>
								<td align=left class="tabdata">
									<INPUT NAME="WIFI_IGMP" TYPE="RADIO" VALUE="Yes" <% If TCWebApi_get("Lan_Snoop","igmpforwifi","h") = "Yes" then asp_Write("checked") end if%> >      <%tcWebApi_get("String_Entry","LANStatus0Text","s")%> 	
									&nbsp;&nbsp;&nbsp;&nbsp;
									<INPUT TYPE="RADIO" NAME="WIFI_IGMP" VALUE="No" <% If TCWebApi_get("Lan_Snoop","igmpforwifi","h") = "No" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","LANStatus1Text","s")%> 	
								</td>
							</tr>
							<!--wang add end-->
						</table>
					<% End If %>
					<!--/*foxconn cindy add for loopguard function enable/disable 20190416*/-->
					<div style="display:none;">
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
							<tr height="25px" style="width:100%;background:#e6e6e6;">
					     			<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","LANLoopGuardText","s")%></td>
							</tr>
						</table>
						
						<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed" >
							<tr id = "loopguard" style="height:30px;">
								<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","LANLoopGuard0Text","s")%></td>
								<td align=left class="tabdata">
									<INPUT NAME="LoopGuard" TYPE="RADIO" VALUE="1" <% If TCWebApi_get("Lan_LoopGuard","Status","h") = "1" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","LANLoopGuard1Text","s")%> 	
									&nbsp;&nbsp;&nbsp;&nbsp;
									<INPUT NAME="LoopGuard" TYPE="RADIO" VALUE="0" <% If TCWebApi_get("Lan_LoopGuard","Status","h") = "0" then asp_Write("checked")  elseIf tcWebApi_get("Lan_LoopGuard","Status","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","LANLoopGuard2Text","s")%> 	
								</td>
							</tr>
						</table>
					</div>
					<!--/*foxconn cindy add for loopguard function enable/disable 20190416*/-->
				</div><!--cindy add for id="block1" 12/07-->
				<!--end-->


<div id="block1"><!--cindy add for id="block1" 12/07-->
					<%if tcwebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then%>
						<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
							   		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANDHCPServerText","s")%></td>
							     	</tr>
</table>
							    
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
							 	<% If tcWebApi_get("GPON_ONU","OnuType","h") = "2" Then%>	    
							  		<tr height="30px">
							    			<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","LANDHCPText","s")%> </td>
							     			<td align=left class="tabdata">
										  	<!--cindy add 11/17-->
											<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="1" <%If tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP1Text","s")%> 
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="0" <%If tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("checked") elseIf tcWebApi_get("Lan_Dhcp","type","h") = "N/A" then asp_Write("checked")  end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP0Text","s")%> 
										  	<!--cindy add 11/17-->
							  
										  	<!--cindy delete 11/17
										        <INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="0" <%If tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("checked") elseIf tcWebApi_get("Lan_Dhcp","type","h") = "N/A" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP0Text","s")%> 
										        &nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="1" <%If tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP1Text","s")%> 
											-->
        &nbsp;&nbsp;&nbsp;&nbsp;<div style="display:none"><INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="2" <%If tcWebApi_get("Lan_Dhcp","type","h") = "2" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP2Text","s")%> </div>
											<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>		
												<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="3" <%If tcWebApi_get("Lan_Dhcp","type","h") = "3" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP3Text","s")%> 
											<% End If %>
							    			</td>
							  		</tr>
							  	<% End If %>
							</table>

						<%elseif tcWebApi_get("DeviceInfo", "isCYSFU", "h") = "Yes" then%>
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
							    		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANDHCPServerText","s")%></td>
							  	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
							  	<tr height="30px">
								    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","LANDHCPText","s")%></td>
								     	<td align=left class="tabdata">
							  			<!--cindy add 11/17-->
							        		<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="1" <%If tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP1Text","s")%> 
        &nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="0" <%If tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("checked") elseIf tcWebApi_get("Lan_Dhcp","type","h") = "N/A" then asp_Write("checked")  end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP0Text","s")%> 
							  			<!--cindy add 11/17-->
							   			<!--cindy delete 11/17
							        		<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="0" <%If tcWebApi_get("Lan_Dhcp","type","h") = "0" then asp_Write("checked") elseIf tcWebApi_get("Lan_Dhcp","type","h") = "N/A" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP0Text","s")%> 
							       		&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="1" <%If tcWebApi_get("Lan_Dhcp","type","h") = "1" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP1Text","s")%> 
										-->
							        		<div id='hiddenitems' style='display:none'>
        &nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="2" <%If tcWebApi_get("Lan_Dhcp","type","h") = "2" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP2Text","s")%> 
											<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>		
		&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="dhcpTypeRadio" VALUE="3" <%If tcWebApi_get("Lan_Dhcp","type","h") = "3" then asp_Write("checked") end if%> onClick="doReload()"> <%tcWebApi_get("String_Entry","LANDHCP3Text","s")%> 
											<% End If %>
										</div>
							    		</td>
							  	</tr>
							</table>
						<%end if%>
					<%end if %>

					<%if tcwebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then%>
						<% If tcWebApi_get("GUI_Entry0","dhcpClientMode","h") = "support" Then%>
							<div id="dhcp_client_div">
								<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
									<tr>
										<td class="light-orange" width="150">&nbsp;</td><td class="light-orange" width="10">&nbsp;</td>
										<td class="tabdata" width="150">
											<div align=right>
											 	<%tcWebApi_get("String_Entry","LANReservationIPText","s")%> 
											</div>
										</td>
										<td class="tabdata" width="10"><div align=center>:</div></td>
		<td class="tabdata"> <%If tcWebApi_get("LanAlias_Entry","IP","h") <> "N/A" then tcWebApi_get("LanAlias_Entry","IP","s") else asp_Write("0.0.0.0") end if%>
										</td>
									</tr>
								</table>
							</div>
						<% End If %>
<% end if %>
				</div><!--cindy add for id="block1" 12/07-->

<% If tcWebApi_get("GPON_ONU","OnuType","h") = "2" Then%>	 

				<div id="dhcp_enabled_div0">
					<div id="block1">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">
								<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANDHCPAddresspoolText","s")%></td>
							</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
							<tr height="30px">
								<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","LANStartIPText","s")%></td>
							     	<td align=left class="tabdata">
							        	<INPUT TYPE="TEXT" NAME="StartIp" SIZE="15" MAXLENGTH="15" onblur=blockStartIP(); VALUE="<%If tcWebApi_get("Dhcpd_Common","start","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","start","s") end if%>" >	        
								</td>
							</tr>
							<!--cindy delete ip pool count-->
							<tr style="display:none;height:30px;">
								<td width="250px" align=left class="tabdata" style="padding-left:20px;"><%tcWebApi_get("String_Entry","LANIPPoolText","s")%> </td>
							     	<td align=left class="tabdata">
							        	<INPUT TYPE="TEXT" NAME="PoolSize" SIZE="15" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Dhcpd_Common","pool_count","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","pool_count","s") end if%>" >	        
							 	</td>
							</tr>
     <!--cindy add end ip-->
							
							<tr height="30px">
								<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","LANEndIPText","s")%></td>
							     	<td align=left class="tabdata">
							        	<INPUT TYPE="TEXT" NAME="EndIp" SIZE="15" MAXLENGTH="15" onblur=blockEndIP(); VALUE="<%If tcWebApi_get("Dhcpd_Common","end","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","end","s") end if%>" >	        
							 	</td>
							</tr>
							<!--cindy add end ip-->
							     
							<% If tcWebApi_get("Dhcpd_Option60","Active","h") = "Yes" Then%>
								<tr>
									<td class="light-orange">&nbsp;</td>
									<td class="light-orange">&nbsp;</td>
									<td class="tabdata">
										<div align=right>
							     				<%tcWebApi_get("String_Entry","LANConStartIPText","s")%>     
							     			</div>
							     		</td>
							     		<td class="tabdata"><div align=center>:</div></td>
							     		<td class="tabdata">
							        		<INPUT TYPE="TEXT" NAME="ConPoolStartIp" SIZE="15" MAXLENGTH="15" VALUE="<%If tcWebApi_get("Dhcpd_Option60","start","h") <>"N/A" then tcWebApi_get("Dhcpd_Option60","start","s") end if%>" >	        
							     		</td>
							     	</tr>
							     	<tr>
							     		<td class="light-orange">&nbsp;</td>
							     		<td class="light-orange">&nbsp;</td>
							     		<td class="tabdata">
							     			<div align=right>
							     				<%tcWebApi_get("String_Entry","LANConPoolCountText","s")%>     
							     			</div>
							     		</td>
							     		<td class="tabdata"><div align=center>:</div></td>
							     		<td class="tabdata">
							        		<INPUT TYPE="TEXT" NAME="ConPoolPoolSize" SIZE="15" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Dhcpd_Option60","pool_count","h") <>"N/A" then tcWebApi_get("Dhcpd_Option60","pool_count","s") end if%>" >	        
							     		</td>
							     	</tr>
								<tr>
									<td class="light-orange">&nbsp;</td>
									<td class="light-orange">&nbsp;</td>
									<td class="tabdata">
										<div align=right>
							     				<%tcWebApi_get("String_Entry","LANVendorText","s")%>     
							     			</div>
							     		</td>
							     		<td class="tabdata"><div align=center>:</div></td>
							     		<td class="tabdata">
							        		<INPUT TYPE="TEXT" NAME="VendorClassID" SIZE="15" MAXLENGTH="64" VALUE="<%If tcWebApi_get("Dhcpd_Option60","VendorID","h") <>"N/A" then tcWebApi_get("Dhcpd_Option60","VendorID","s") end if%>" >	        
							     		</td>
							     	</tr>
							<% End If %>	    

							<tr height="30px">
							    	<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","LANLeaseTimeText","s")%></td>
							     	<td align=left class="tabdata">
							        	<INPUT TYPE="TEXT" NAME="dhcp_LeaseTime" SIZE="6" MAXLENGTH="6" VALUE="<%If tcWebApi_get("Dhcpd_Common","lease","h") <>"N/A" then tcWebApi_get("Dhcpd_Common","lease","s") else asp_Write("0") end if%>" >
							        	<%tcWebApi_get("String_Entry","LANLeaseTimeCommText","s")%>	        
							     	</td>
							</tr>
						</table> 


<% if tcWebApi_get("WebCustom_Entry","isPortFltSupported","h") = "Yes" then %> 
						<table width="620" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
								 <tr>
									<td width="150" class="light-orange">&nbsp;</td>
									<td class="light-orange"></td>
									<td width="150" class="tabdata" align=right> <%tcWebApi_get("String_Entry","QosPhysicalPortsText","s")%> </td>
									<td class="tabdata" align=center>:</td>
									<td width="440" height="39" class="tabdata">
										<table border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
											<tr>
												<% if tcWebApi_get("WebCustom_Entry","is1PSupported","h") = "Yes" then %>
													<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortEth0" <%if TCWebAPI_get("Dhcpd_Common", "eth0", "h") = "Yes" then asp_write("checked") end if %>></td>
												<% elseif tcWebApi_get("WebCustom_Entry","isZY1PSupported","h") = "Yes" then %>
													<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortEth0" <%if TCWebAPI_get("Dhcpd_Common", "eth0.1", "h") = "Yes" then asp_write("checked") end if %>></td>
												<% else %>
													<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortEth0" <%if TCWebAPI_get("Dhcpd_Common", "eth0.1", "h") = "Yes" then asp_write("checked") end if %>></td>
													<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortEth1" <%if TCWebAPI_get("Dhcpd_Common", "eth0.2", "h") = "Yes" then asp_write("checked") end if %>></td>						
												<%end if%>
												
												<% if tcWebApi_get("WebCustom_Entry","is2PSupported","h") <> "Yes" then %>
													<% if tcWebApi_get("WebCustom_Entry","is1PSupported","h") <> "Yes" then %>
														<% if tcWebApi_get("WebCustom_Entry","isZY1PSupported","h") <> "Yes" then %>
															<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortEth2" <%if TCWebAPI_get("Dhcpd_Common", "eth0.3", "h") = "Yes" then asp_write("checked") end if %>></td>
															<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortEth3" <%if TCWebAPI_get("Dhcpd_Common", "eth0.4", "h") = "Yes" then asp_write("checked") end if %>></td>
														<%end if%>
													<%end if%>
												<%end if%>
           <!-- <td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortUsb0" <%if TCWebAPI_get("Dhcpd_Common", "usb0", "h") = "Yes" then asp_write("checked") end if %>></td>-->
												
												<% if tcWebApi_get("Info_WLan","isExist","h") = "On" then %>
													<%if TCWebAPI_get("WLan_Common","BssidNum","h") = "1" then%>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortRa0" <%if TCWebAPI_get("Dhcpd_Common", "ra0", "h") = "Yes" then asp_write("checked") end if %>></td>			
													<%end if%>
												<% end if %>
												<% if tcWebApi_get("Info_WLan11ac","isExist","h") = "On" then %>
													<%if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then%>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortRai0" <%if TCWebAPI_get("Dhcpd_Common", "rai0", "h") = "Yes" then asp_write("checked") end if %>></td>			
													<%end if%>
												<% end if %>												
											</tr>
											<tr class="tabdata">
												<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qoseth0Text","s")%> </td>
												<% if tcWebApi_get("WebCustom_Entry","isZY1PSupported","h") <> "Yes" then %>
													<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qoseth1Text","s")%> </td>
													<% if tcWebApi_get("WebCustom_Entry","is2PSupported","h") <> "Yes" then %>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qoseth2Text","s")%> </td>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qoseth3Text","s")%> </td>
													<% end if %>
												<% end if %>
<!-- <td class="tabdata" align=center> usb0 </td> -->
												
												<% if tcWebApi_get("Info_WLan","isExist","h") = "On" then %>
													<%if TCWebAPI_get("WLan_Common","BssidNum","h") = "1" then%>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosra0Text","s")%> </td>
													<% end if %>
												<% end if %>
												<% if tcWebApi_get("Info_WLan11ac","isExist","h") = "On" then %>
													<%if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "1" then%>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
													<% end if %>
												<% end if %>
											</tr>
											<% if tcWebApi_get("Info_WLan","isExist","h") = "On" then %>
												<%if TCWebAPI_get("WLan_Common","BssidNum","h") = "2" then%>
													<tr>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid0" <%if TCWebAPI_get("Dhcpd_Common","ra0","h") = "Yes" then asp_write("checked") end if %>></td>
														<%if tcWebApi_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then %>
															<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid1" <%if TCWebAPI_get("Dhcpd_Common","ra1","h") = "Yes" then asp_write("checked") end if %>></td>
														<%end if%>
													</tr>
													<tr class="tabdata">
														<td class="tabdata" align=center> ra0 </td>
														<%if tcWebApi_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then %>
															<td class="tabdata" align=center> ra1 </td>
														<%end if%>
													</tr>													
												<%elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "3" then%>
													<tr>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid0" <%if TCWebAPI_get("Dhcpd_Common","ra0","h") = "Yes" then asp_write("checked") end if %>></td>
														<%if tcWebApi_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then %>
															<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid1" <%if TCWebAPI_get("Dhcpd_Common","ra1","h") = "Yes" then asp_write("checked") end if %>></td>
														<%end if%>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid2" <%if TCWebAPI_get("Dhcpd_Common","ra2","h") = "Yes" then asp_write("checked") end if %>></td>	
													</tr>
													<tr class="tabdata">
														<td class="tabdata" align=center> ra0 </td>
														<%if tcWebApi_get("WebCustom_Entry", "isFonV2Support", "h")<>"Yes" then %>
															<td class="tabdata" align=center> ra1 </td>
														<%end if%>
														<td class="tabdata" align=center> ra2 </td>
													</tr>
												<%elseif TCWebAPI_get("WLan_Common","BssidNum","h") = "4" then%>
													<tr>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid0" <%if TCWebAPI_get("Dhcpd_Common","ra0","h") = "Yes" then asp_write("checked") end if %>></td>
														<%if tcWebApi_get("WebCustom_Entry","isFonV2Support","h") <> "Yes" then %>
															<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid1" <%if TCWebAPI_get("Dhcpd_Common","ra1","h") = "Yes" then asp_write("checked") end if %>></td>
														<%end if%>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid2" <%if TCWebAPI_get("Dhcpd_Common","ra2","h") = "Yes" then asp_write("checked") end if %>></td>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLANMssid3" <%if TCWebAPI_get("Dhcpd_Common","ra3","h") = "Yes" then asp_write("checked") end if %>></td>
													</tr>
													<tr class="tabdata">
														<td class="tabdata" align=center> ra0 </td>
														<%if tcWebApi_get("WebCustom_Entry","isFonV2Support","h") <> "Yes" then %>
															<td class="tabdata" align=center> ra1 </td>
														<%end if%>
														<td class="tabdata" align=center> ra2 </td>
														<td class="tabdata" align=center> ra3 </td>
													</tr>

												<%end if%>
											<%end if%>
											<% if tcWebApi_get("Info_WLan11ac","isExist","h") = "On" then %>
												<%if TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "2" then%>
													<tr>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid0" <%if TCWebAPI_get("Dhcpd_Common","rai0","h") = "Yes" then asp_write("checked") end if %>></td>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid1" <%if TCWebAPI_get("Dhcpd_Common","rai1","h") = "Yes" then asp_write("checked") end if %>></td>
													</tr>
													<tr class="tabdata">
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai1Text","s")%> </td>
													</tr>
												<%elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "3" then%>
													<tr>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid0" <%if TCWebAPI_get("Dhcpd_Common","rai0","h") = "Yes" then asp_write("checked") end if %>></td>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid1" <%if TCWebAPI_get("Dhcpd_Common","rai1","h") = "Yes" then asp_write("checked") end if %>></td>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid2" <%if TCWebAPI_get("Dhcpd_Common","rai2","h") = "Yes" then asp_write("checked") end if %>></td>	
													</tr>
													<tr class="tabdata">
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai1Text","s")%> </td>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai2Text","s")%> </td>
													</tr>
												<%elseif TCWebAPI_get("WLan11ac_Common","BssidNum","h") = "4" then%>
													<tr>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid0" <%if TCWebAPI_get("Dhcpd_Common","rai0","h") = "Yes" then asp_write("checked") end if %>></td>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid1" <%if TCWebAPI_get("Dhcpd_Common","rai1","h") = "Yes" then asp_write("checked") end if %>></td>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid2" <%if TCWebAPI_get("Dhcpd_Common","rai2","h") = "Yes" then asp_write("checked") end if %>></td>
														<td width="40" align=center><INPUT TYPE="CHECKBOX" NAME="DHCPPhyPortWLAN11acMssid3" <%if TCWebAPI_get("Dhcpd_Common","rai3","h") = "Yes" then asp_write("checked") end if %>></td>
													</tr>
													<tr class="tabdata">
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai0Text","s")%> </td>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai1Text","s")%> </td>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai2Text","s")%> </td>
														<td class="tabdata" align=center> <%tcWebApi_get("String_Entry","Qosrai3Text","s")%> </td>
													</tr>

												<%end if%>
											<%end if%>
										</table>
									</td>
								</tr>
						</table>
<% end if %><!--end "WebCustom_Entry","isPortFltSupported"-->


						<%if tcWebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then%>
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
							    		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANDNSText","s")%></td>
							    	</tr>
</table>
							    
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
							    	<!-- Foxconn alan modify LAN DNS node from Dproxy_Entry to Dhcpd_Common (2017.8.24) -->
							    	<tr height="30px">
							    		<td align=left width="250px" class="tabdata" style="padding-left:20px;">
							    			<%tcWebApi_get("String_Entry","LANDNSRelayText","s")%>
							    		</td>
							     		<td align=left class="tabdata">
								     		<!--cindy delete 12/07
									    	<INPUT TYPE="RADIO" NAME="dnsTypeRadio" VALUE="0" onClick="autoDNSRelay()" <%If tcWebApi_get("Dhcpd_Common","type","h") = "0" then asp_Write("checked") elseif  tcWebApi_get("Dhcpd_Common","type","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","LANAutomaticallyText","s")%> 
									    	&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="dnsTypeRadio" VALUE="1" onClick="manualDNSRelay()" <%If tcWebApi_get("Dhcpd_Common","type","h") = "1" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","LANManuallyText","s")%> 
										-->
										<!--cindy add from radio to select 12/07-->
										<select name="dnsTypeRadio" size="1" onchange="changeDNSRelay();">
											<option value="0"  <%If tcWebApi_get("Dhcpd_Common","type","h") = "0" then asp_Write("selected") elseif  tcWebApi_get("Dhcpd_Common","type","h") = "N/A" then asp_Write("checked")  end if%>><%tcWebApi_get("String_Entry","LANAutomaticallyText","s")%> 
											<option value="1"  <%If tcWebApi_get("Dhcpd_Common","type","h") = "1" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","LANManuallyText","s")%> 
										</select>
										<!--cindy add from radio to select 12/07-->
							     		</td>
							     	</tr>
							     
							    	<tr height="30px" id="hiddendns_div0">
							    		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","LANPrimaryDNSText","s")%></td>
							     		<td align=left class="tabdata" width="30px">
							        		<INPUT TYPE="TEXT" NAME="PrimaryDns" SIZE="15" MAXLENGTH="15" VALUE="<% If tcWebApi_get("Dhcpd_Common","type","h") = "1" then tcWebApi_get("Dhcpd_Common","Primary_DNS","s") else asp_Write("N/A") end if %>" >	        
							     		</td>
							     	</tr>

							    	<tr height="30px" id="hiddendns_div1">
							    		<td width="250px" align=left class="tabdata" style="padding-left:20px;"> <%tcWebApi_get("String_Entry","LANSecondaryDNSText","s")%> </td>
							     		<td align=left class="tabdata" width="300px">
							        		<INPUT TYPE="TEXT" NAME="SecondDns" SIZE="15" MAXLENGTH="15" VALUE="<% If tcWebApi_get("Dhcpd_Common","type","h") = "1" then tcWebApi_get("Dhcpd_Common","Secondary_DNS","s") else asp_Write("N/A") end if %>" >	        
							     		</td>
							     	</tr>
							</table>
<%end if%>  
</div><!--id="block1"-->
	 
<!--wang add dhcp reservation table 20180123-->
<%if tcWebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then%>
<div id="block1">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">								<%if tcwebApi_get("WebCustom_Entry","isDhcpStaticSupported","h")="Yes" then%>	
							    			<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANReservationText","s")%></td>
							    		</tr>
</table>
							    
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
								    	<tr height="30px">
										<td align=left class="tabdata" style=" width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","LANReservationIPText","s")%></td>
      <td align=left class="tabdata"> <INPUT TYPE="TEXT" NAME="IpAddr" SIZE="15" MAXLENGTH="15" VALUE="" ></td>
								       </tr>
								    	<tr height="30px">
								    		<td align=left class="tabdata" style=" width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","LANReservationMACText","s")%></td>
										<td align=left class="tabdata" width="300px"> <INPUT TYPE="TEXT" NAME="MACAddr" SIZE="15" MAXLENGTH="17" VALUE="" ></td>
								    	</tr>
								    
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
      <td class="title-main" align=left style="padding-left:20px;"> <%tcWebApi_get("String_Entry","LANReservation1Text","s")%></td>
    </tr>	 
  </table>
								       		
  <table width="620" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
	<tr>
      <td align=left class="tabdata">
        <table id="static_list" border=0  cellpadding=1 cellspacing=0>
          <tr height=30px>
            <td width="120px" align=center class=tabdata><STRONG><FONT color=#000000><%tcWebApi_get("String_Entry","LANSTABLEINDEXText","s")%></strong></td>
            <td width="180px" align=center class=tabdata><STRONG><FONT color=#000000><%tcWebApi_get("String_Entry","LANSTABLEIPText","s")%></strong></td>
            <td width="200px" align=center class=tabdata><STRONG><FONT color=#000000><%tcWebApi_get("String_Entry","LANSTABLEMACText","s")%></strong></td> 
            <td width="180px" align=center class=tabdata><STRONG><FONT color=#000000><%tcWebApi_get("String_Entry","NaTDMZ3Text","s")%></strong></td>
												</tr>
								       			<%if tcwebApi_get("Dhcpd_Entry0","IP","h")<>"N/A" then%>
          <tr height=30px>
            <td align=center class=topborderstyle>1</td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry0","IP","s") %></td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry0","MAC","s") %></td>
            <td align=center class=topborderstyle ><input class="button3" TYPE="button" NAME="RemoveBtn" value="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" onClick="doDelete(0);"></td>
													</tr>
												<%end if%>
												<%if tcwebApi_get("Dhcpd_Entry1","IP","h")<>"N/A" then%>
          <tr height=30px>
            <td align=center class=topborderstyle>2</td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry1","IP","s") %></td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry1","MAC","s") %></td>
            <td align=center class=topborderstyle ><input class="button3" TYPE="button" NAME="RemoveBtn" value="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" onClick="doDelete(1);"></td>
													</tr>
												<%end if%>
												<%if tcwebApi_get("Dhcpd_Entry2","IP","h")<>"N/A" then%>
          <tr height=30px>
            <td align=center class=topborderstyle>3</td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry2","IP","s") %></td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry2","MAC","s") %></td>
            <td align=center class=topborderstyle ><input class="button3" TYPE="button" NAME="RemoveBtn" value="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" onClick="doDelete(2);"></td>
													</tr>
												<%end if%>
												<%if tcwebApi_get("Dhcpd_Entry3","IP","h")<>"N/A" then%>
          <tr height=30px>
            <td align=center class=topborderstyle>4</td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry3","IP","s") %></td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry3","MAC","s") %></td>
            <td align=center class=topborderstyle ><input class="button3" TYPE="button" NAME="RemoveBtn" value="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" 
            onClick="doDelete(3);"></td>
													</tr>
												<%end if%>
												<%if tcwebApi_get("Dhcpd_Entry4","IP","h")<>"N/A" then%>
          <tr height=30px>
            <td align=center class=topborderstyle>5</td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry4","IP","s") %></td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry4","MAC","s") %></td>
            <td align=center class=topborderstyle e><input class="button3" TYPE="button" NAME="RemoveBtn" value="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" 
            onClick="doDelete(4);"></td>
													</tr>
												<%end if%>
												<%if tcwebApi_get("Dhcpd_Entry5","IP","h")<>"N/A" then%>
          <tr height=30px>
            <td align=center class=topborderstyle>6</td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry5","IP","s") %></td>
            <td align=center class=topborderstyle><%  tcwebApi_staticGet("Dhcpd_Entry5","MAC","s") %></td>
            <td align=center class=topborderstyle ><input class="button3" TYPE="button" NAME="RemoveBtn" value="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" 
            onClick="doDelete(5);"></td>
													</tr>
												<%end if%>
												<%if tcwebApi_get("Dhcpd_Entry6","IP","h")<>"N/A" then%>
          <tr height=30px>
            <td align=center class=topborderstyle>7</td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry6","IP","s") %></td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry6","MAC","s") %></td>
            <td align=center class=topborderstyle ><input class="button3" TYPE="button" NAME="RemoveBtn" value="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" 
            onClick="doDelete(6);"></td>
													</tr>
												<%end if%>
												<%if tcwebApi_get("Dhcpd_Entry7","IP","h")<>"N/A" then%>
          <tr height=30px>
            <td align=center class=topborderstyle>8</td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry7","IP","s") %></td>
            <td align=center class=topborderstyle><% tcwebApi_staticGet("Dhcpd_Entry7","MAC","s") %></td>
            <td align=center class=topborderstyle ><input class="button3" TYPE="button" NAME="RemoveBtn" value="<%tcWebApi_get("String_Entry","NaTDMZ4Text","s")%>" 
            onClick="doDelete(7);"></td>
													</tr>
												<%end if%> 
											</table>
  										</td>
							  		</tr>		
  </table>

  </td>
 </tr>		
								<%End if%>	
							 </table>
</div>
<%End if%>	

</div><!--id="dhcp_enabled_div0"-->
						<%end if%>  

				<%if tcWebApi_get("WebCurSet_Entry","UserMode","h")<>"1" then%>
<% If tcWebApi_get("Lan_Dhcp","type","h") = "2" Then%>
					<div id="dhcp_relay_div">
						<table width="760" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
							<tr height="30px">
							    	<td align=left width="250px" class="tabdata" style="padding-left:20px;">
     <%tcWebApi_get("String_Entry","LANServerIPText","s")%> </td>
							     	<td align=left class="tabdata">
							        	<INPUT TYPE="TEXT" NAME="ServerIp" SIZE="15" MAXLENGTH="15" VALUE=<%If tcWebApi_get("DhcpRelay_Entry","Server","h") <>"N/A" then tcWebApi_get("DhcpRelay_Entry","Server","s") end if%> >	        
							    	</td>
							</tr>
				     		</table>
					</div>
				<%end if%>  
<%end if%> 
     
				<% if tcWebApi_get("GUI_Entry0","DyVlan","h") = "support" then %>
					<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
					     	<tr>
					     		<td colspan="5" height="10">&nbsp;</td>
					     	</tr>
					     	<tr> 
							<td width="150" height="30"> </td>
							<td width="10" ></td>
							<td width="150"  class="title-main1">  <%tcWebApi_get("String_Entry","LANOUIText","s")%> </td>
							<td width="12" > </td>
							<td width="438"> </td>
						</tr>
						<tr>
							<td class=light-orange width=150></td>
							<td class=light-orange width=10>&nbsp;</td>
							<td class=tabdata width=150><DIV align=right><%tcWebApi_get("String_Entry","LANOUIDeviceText","s")%></DIV></td>
							<td class=tabdata><DIV align=center>:</DIV></td>
							<td class=tabdata>
								<INPUT  type=radio <% If tcWebApi_get("DyVLAN_Common" , "Type" , "h") = "STB" then asp_Write("checked") end if %> value=STB name=OUIDeviceSeleradio><%tcWebApi_get("String_Entry","LANSTBText","s")%>
								&nbsp;&nbsp;&nbsp;&nbsp;<INPUT  type=radio <% If tcWebApi_staticGet("DyVLAN_Common" , "Type" , "h") = "Voip" then asp_Write("checked") end if %> value=Voip name=OUIDeviceSeleradio><%tcWebApi_get("String_Entry","LANVoIPText","s")%>
								<INPUT type=hidden value=0 name=ouiFlag>
							</td>
						</tr>
						<tr>
							<td class=light-orange width=150>&nbsp;</td>
							<td class=light-orange width=10></td>
							<td class=tabdata width=150><DIV align=right><%tcWebApi_get("String_Entry","LANIndexText","s")%></DIV></td>
							<td class=tabdata><DIV align=center>:</DIV></td>
							<td class=tabdata>
								<SELECT onchange=doIndexOfOUIChange(this.selectedIndex) size=1 name=IndexOfOUI>
									<OPTION value="0" <% if tcWebApi_get("WebCurSet_Entry","DyVlan_Index","h") = "0" then asp_Write("selected") end if %>>1
									<OPTION value="1" <% if tcWebApi_staticGet("WebCurSet_Entry","DyVlan_Index","h") = "1" then asp_Write("selected") end if %>>2
									<OPTION value="2" <% if tcWebApi_staticGet("WebCurSet_Entry","DyVlan_Index","h") = "2" then asp_Write("selected") end if %>>3
									<OPTION value="3" <% if tcWebApi_staticGet("WebCurSet_Entry","DyVlan_Index","h") = "3" then asp_Write("selected") end if %>>4
									<OPTION value="4" <% if tcWebApi_staticGet("WebCurSet_Entry","DyVlan_Index","h") = "4" then asp_Write("selected") end if %>>5
									</OPTION>
								</SELECT>
							</td>
						</tr>
						<tr>
							<td class=light-orange>&nbsp;</td>
							<td class=light-orange></td>
							<td class=tabdata><DIV id=OUIId align=right><%tcWebApi_get("String_Entry","LANOUIText","s")%></DIV></td>
							<td class=tabdata><DIV align=center>:</DIV></td>
							<td class=tabdata>
								<% if tcWebApi_get("DyVLAN_Common","Type","h") = "STB" then %>
									<INPUT maxLength=6 size=6 value="<% tcWebApi_staticGet("DyVLAN_Entry","STB_OUI","s") %>" name=uiOUI>
								<% End If %>
								<% if tcWebApi_staticGet("DyVLAN_Common","Type","h") = "Voip" then %>
									<INPUT maxLength=6 size=6 value="<% tcWebApi_staticGet("DyVLAN_Entry","Voip_OUI","s") %>" name=uiOUI>
								<% End If %>
							</td>
						</tr> 
					</table>
				<% End If %>  

				<%if tcWebApi_get("DeviceInfo", "isSFU", "h") <> "Yes" then%>
				 	<% if tcWebApi_get("Info_Ether","isIPv6Supported","h") = "Yes" then %>	
						<div id="block1"><!--cindy add 12/08-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
						        		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANIPv6Text","s")%>   </td>
						      		</tr>
 </table>   
							  
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
							  	<tr height="30px"> 
							      		<td align=left class="tabdata" style="width:250px;padding-left:20px;">  <%tcWebApi_get("String_Entry","LANIPv6GlobalText","s")%></td>
							      		<td align=left class="tabdata" style="white-space:nowrap;"> 
							      			<INPUT TYPE="TEXT" NAME="uiViewIPv6Addr" SIZE="30" MAXLENGTH="39" VALUE="<%If tcWebApi_get("Lan_Entry","IP6","h") <> "N/A" then tcWebApi_get("Lan_Entry","IP6","s") end if%>">
							          		<font size=+1>&nbsp;/&nbsp; 
							          			<INPUT TYPE="TEXT" NAME="uiViewIPv6Prefix" SIZE="3" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Lan_Entry","PREFIX6","h") <> "N/A" then tcWebApi_get("Lan_Entry","PREFIX6","s") end if%>">
							          		</font>
							          	</td>
							      </tr>
						     
								<tr height="30px" style="display:none">
									<td align=left class="title-main" style="width:250px;padding-left:20px;">   
										<%tcWebApi_get("String_Entry","LANRadvdText","s")%> 
									</td>
								</tr>
								     
								<tr height="30px" style="display:none">
									<td align=left class="tabdata" style="width:250px;padding-left:20px;">   
							 			<%tcWebApi_get("String_Entry","LANRadvdEnableText","s")%> 
							 		</td>
									<td align=left class="tabdata">
							   			<INPUT TYPE="RADIO" NAME="radvdRadio" VALUE="0" onClick="radvdChanged()" <%If tcWebApi_get("Radvd_Entry","Enable","h") = "0" then asp_Write("checked") elseif  tcWebApi_get("Radvd_Entry","Enable","h") = "N/A" then asp_Write("checked") end if%> > 
							           		<%tcWebApi_get("String_Entry","LANRadvdEnable0Text","s")%>  
							           		<INPUT TYPE="RADIO" NAME="radvdRadio" VALUE="1" onClick="radvdChanged()" <%If tcWebApi_get("Radvd_Entry","Enable","h") = "1" then asp_Write("checked") end if%> > 
							           		<%tcWebApi_get("String_Entry","LANRadvdEnable1Text","s")%> 
							 		</td>
									<INPUT TYPE="HIDDEN" NAME="radvdEnableFlag" VALUE=<%  tcWebApi_get("Radvd_Entry","Enable","s") %> >
									<INPUT TYPE="HIDDEN" NAME="radvdFlag"  >
							     	</tr>
							</table>

							<div id="div_radvden" style="display:none;">
								<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
									<tr id="div_radvdmode">
								        	<td width="150" height="30" class="light-orange">&nbsp;</td>
								        	<td width="10" class="light-orange">&nbsp;</td>
								        	<td width="150" class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","LANRadvdModeText","s")%>  </div></td>
								        	<td width="10" class="tabdata"><div align=center>:</div></td>
								        	<td width="440" class="tabdata"> 
								        		<INPUT TYPE="RADIO" NAME="radvdModeRadio" VALUE="0" onClick="radvdModeChanged()" <%If tcWebApi_get("Radvd_Entry","Mode","h") = "0" then asp_Write("checked") elseif  tcWebApi_get("Radvd_Entry","Mode","h") = "N/A" then asp_Write("checked") end if%> >
								           		<%tcWebApi_get("String_Entry","LANRadvdMode0Text","s")%> 
								         	 	&nbsp;&nbsp;&nbsp;&nbsp;
								         	 	<INPUT TYPE="RADIO" NAME="radvdModeRadio" VALUE="1" onClick="radvdModeChanged()" <%If tcWebApi_get("Radvd_Entry","Mode","h") = "1" then asp_Write("checked") end if%> > 
								           		<%tcWebApi_get("String_Entry","LANRadvdMode1Text","s")%>  
								           	</td>
										<INPUT TYPE="HIDDEN" NAME="radvdModeFlag" VALUE=<%  tcWebApi_get("Radvd_Entry","Mode","s") %> >
								     	</tr>	
								     	
									<tr id="div_radvdprelen">
								        	<td class="light-orange">&nbsp;</td>
								        	<td class="light-orange">&nbsp;</td>
								        	<td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","LANPrefixText","s")%> </div></td>
								        	<td class="tabdata"><div align=center>:</div></td>
								        	<td class="tabdata"> 
								        		<INPUT TYPE="TEXT" NAME="uiViewIPv6PrefixRadvd" SIZE="39" MAXLENGTH="39" VALUE="<%If tcWebApi_get("Radvd_Entry","PrefixIPv6","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PrefixIPv6","s") end if%>"> 
								          		<font size=+1>&nbsp;/&nbsp;  
								          			<INPUT TYPE="TEXT" NAME="uiViewIPv6PrefixLenRadvd" SIZE="3" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Radvd_Entry","Prefixv6Len","h") <> "N/A" then tcWebApi_get("Radvd_Entry","Prefixv6Len","s") end if%>">
								          		</font>
								          	</td>
								      	</tr>
								      	
									<tr id="div_radvdprelite">
								        	<td height="27" class="light-orange">&nbsp;</td>
								        	<td class="light-orange">&nbsp;</td>
								        	<td class="tabdata"><div align=right>  <%tcWebApi_get("String_Entry","LANPreferredLifetimeText","s")%>  </div></td>
								        	<td class="tabdata"><div align=center>:</div></td>
								        	<td class="tabdata"> 
								        		<INPUT TYPE="TEXT" NAME="uiPreferredLifetimeRadvd" SIZE="30" MAXLENGTH="15" VALUE="<%If tcWebApi_get("Radvd_Entry","PreferredLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","PreferredLifetime","s") end if%>"> 
								        	</td>
								      	</tr>
								      	
								      	<tr id="div_radvdvate"> 
								        	<td class="light-orange">&nbsp;</td>
								        	<td class="light-orange">&nbsp;</td>
								        	<td class="tabdata">
								        		<div align=right>  
								        			<%tcWebApi_get("String_Entry","LANValidLifetimeText","s")%>  
								          		</div>
								          	</td>
								        	<td class="tabdata"><div align=center>:</div></td>
								        	<td class="tabdata"> <input type="TEXT" name="uiValidLifetimeRadvd" size="30" maxlength="15" value="<%If tcWebApi_get("Radvd_Entry","ValidLifetime","h") <> "N/A" then tcWebApi_get("Radvd_Entry","ValidLifetime","s") end if%>"></td>
								      	</tr>
								      	
									<% if tcWebApi_get("WebCustom_Entry","isRaFlagSetSupported","h") = "Yes" then %>
									  	<tr>
								    			<td class="light-orange">&nbsp;</td>
								    			<td class="light-orange"></td>
								    			<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANRAFlagSetText","s")%> </div></td><td width="10" class="tabdata"><div align=center>:</div></td>
								          		<td class="tabdata"><%tcWebApi_get("String_Entry","LANManagedAddrText","s")%>
									            		<SELECT NAME="radvdManagedAddrflag" SIZE="1">
													<OPTION value="off" <% if tcWebApi_get("Radvd_Entry","M_Flag","h") = "off" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANoffText","s")%>
													<OPTION value="on" <% if tcWebApi_get("Radvd_Entry","M_Flag","h") = "on" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANonText","s")%>
												</SELECT>
								             			<%tcWebApi_get("String_Entry","LANOtherConfigText","s")%>  
								            			<SELECT NAME="radvdOtherConfigflag" SIZE="1">
													<OPTION value="off" <% if tcWebApi_get("Radvd_Entry","O_Flag","h") = "off" then asp_Write("selected") end if %>>off
													<OPTION value="on" <% if tcWebApi_get("Radvd_Entry","O_Flag","h") = "on" then asp_Write("selected") end if %>>on
												</SELECT>
											</td>
										</tr>
									<% End If %> 
						    		</table>
						    	</div>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
							        	<td align=left class="title-main" style="width:250px;padding-left:20px;">  <%tcWebApi_get("String_Entry","LANDHCPv6Text","s")%>   </td>
							      	</tr>
</table>
							      
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
							      	<tr height="30px">
									<td align=left style="padding-left:20px;width:250px;"class="tabdata"><%tcWebApi_get("String_Entry","LANDHCPv6ServerText","s")%></td>
							        	<td align=left class="tabdata">
										<!--cindy add 11/17-->
							        		<INPUT TYPE="RADIO" NAME="dhcp6sEnableRadio" VALUE="1" onClick="dhcp6sChanged()" <%If tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" then asp_Write("checked") end if%> > 
							           		<%tcWebApi_get("String_Entry","LANDHCPv6Server1Text","s")%>  
							           		&nbsp;&nbsp;&nbsp;&nbsp;
							           		<INPUT TYPE="RADIO" NAME="dhcp6sEnableRadio" VALUE="0" onClick="dhcp6sChanged()" <%If tcWebApi_get("Dhcp6s_Entry","Enable","h") = "0" then asp_Write("checked") elseif  tcWebApi_get("Dhcp6s_Entry","Enable","h") = "N/A" then asp_Write("checked")end if%> > 
							           		<%tcWebApi_get("String_Entry","LANDHCPv6Server0Text","s")%> 
										<!--cindy add 11/17-->
										
							   			<!--cindy delete 11/17
							        		<INPUT TYPE="RADIO" NAME="dhcp6sEnableRadio" VALUE="0" onClick="dhcp6sChanged()" <%If tcWebApi_get("Dhcp6s_Entry","Enable","h") = "0" then asp_Write("checked") elseif  tcWebApi_get("Dhcp6s_Entry","Enable","h") = "N/A" then asp_Write("checked") end if%> > 
							           		<%tcWebApi_get("String_Entry","LANDHCPv6Server0Text","s")%>  &nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="dhcp6sEnableRadio" VALUE="1" onClick="dhcp6sChanged()" <%If tcWebApi_get("Dhcp6s_Entry","Enable","h") = "1" then asp_Write("checked") end if%> > 
							           		<%tcWebApi_get("String_Entry","LANDHCPv6Server1Text","s")%> 
							      			-->
							           	</td>
									<INPUT TYPE="HIDDEN" NAME="dhcp6sEnableFlag" VALUE=<% tcWebApi_get("Dhcp6s_Entry","Enable","s") %> >
									<INPUT TYPE="HIDDEN" NAME="dhcp6sFlag"  >								  
									<INPUT TYPE="HIDDEN" NAME="dhcp6sModeFlag" VALUE=<% tcWebApi_get("Dhcp6s_Entry","Mode","s") %> >
									<INPUT TYPE="HIDDEN" NAME="dhcp6sPDFlag" VALUE=<% tcWebApi_get("Dhcp6s_Entry","PDvar","s") %> >
									<INPUT TYPE="HIDDEN" NAME="dhcp6sModeSubmitFlag"  >
							      	</tr>
							</table>
      
							<div id="div_dhcp6sen">
								<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
									<tr height="30px">
								        	<td align=left class="tabdata" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","LANDHCPv6ModeText","s")%></td>
								        	<td align class="tabdata">
								 			<!--
								        		<INPUT TYPE="RADIO" NAME="dhcp6sModeRadio" VALUE="0"  onClick="dhcp6sModeChanged()" <%If tcWebApi_get("Dhcp6s_Entry","Mode","h") = "0" then asp_Write("checked") elseif  tcWebApi_get("Dhcp6s_Entry","Mode","h") = "N/A" then asp_Write("checked") end if%> > 
								           		<%tcWebApi_get("String_Entry","LANDHCPv6Mode0Text","s")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								        		<INPUT TYPE="RADIO" NAME="dhcp6sModeRadio" VALUE="1"  onClick="dhcp6sModeChanged()" <%If tcWebApi_get("Dhcp6s_Entry","Mode","h") = "1" then asp_Write("checked") end if%> > 
								           		<%tcWebApi_get("String_Entry","LANDHCPv6Mode1Text","s")%>   
								    			-->
										    	<select name="dhcp6sModeRadio" size="1" onchange="dhcp6sModeChanged()">
												<option value="0" <% if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "0" then asp_Write("selected") elseif  tcWebApi_get("Dhcp6s_Entry","Mode","h") = "N/A" then asp_Write("selected") end if %>> <%tcWebApi_get("String_Entry","LANDHCPv6Mode0Text","s")%>
												<option value="1" <% if tcWebApi_get("Dhcp6s_Entry","Mode","h") = "1" then asp_Write("selected") end if %>> <%tcWebApi_get("String_Entry","LANDHCPv6Mode1Text","s")%>
										    	</select>
								       	</td>
								      	</tr>
								      
								     	<tr id="div_dhcp6sprelen" height="30px"> 
								        	<td class="tabdata" align=left style="width:250px;padding-left:20px;">  <%tcWebApi_get("String_Entry","LANPrefixText","s")%></td>
								        	<td align=left class="tabdata" style="white-space:nowrap;">
								        		<INPUT TYPE="TEXT" NAME="uiViewIPv6DHCPPrefix" SIZE="30" MAXLENGTH="39" VALUE="<%If tcWebApi_get("Dhcp6s_Entry","PrefixIPv6","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PrefixIPv6","s") end if%>">
								          		<font size=+1>&nbsp;/&nbsp; 
								          			<INPUT TYPE="TEXT" NAME="uiViewIPv6DHCPPrefixLen" SIZE="3" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Dhcp6s_Entry","Prefixv6Len","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","Prefixv6Len","s") end if%>">
								          		</font>
								          	</td>
								      	</tr>
								      
								      	<tr id="div_dhcp6splite" height="30px"> 
								        	<td class="tabdata" align=left style="width:250px;padding-left:20px;">  <%tcWebApi_get("String_Entry","LANPreferredLifetimeText","s")%></td>
								        	<td align=left class="tabdata"> 
								        		<INPUT TYPE="TEXT" NAME="uiPreferredLifetimeDHCP6" SIZE="30" MAXLENGTH="15" VALUE="<%If tcWebApi_get("Dhcp6s_Entry","PreferredLifetime","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","PreferredLifetime","s") end if%>"> 
								        	</td>
								      	</tr>
								      
								      	<tr id="div_dhcp6svate" height="30px"> 
								        	<td class="tabdata" align=left style="width:250px;padding-left:20px;">  <%tcWebApi_get("String_Entry","LANValidLifetimeText","s")%> </td>
								        	<td align-left class="tabdata"> 
								        		<INPUT TYPE="TEXT" NAME="uiValidLifetimeDHCP6" SIZE="30" MAXLENGTH="15" VALUE="<%If tcWebApi_get("Dhcp6s_Entry","ValidLifetime","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","ValidLifetime","s") end if%>"> 
								        	</td>
								      	</tr>
									  
									<tr height="30px">
								        	<td align=left class="tabdata" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","LANDNSSERVERMODETEXT","s")%></td>
								        	<td align class="tabdata">
										    	<select name="dhcp6sdnsmode" size="1" onchange="dhcp6sDNSModeChanged()">
												<option value="0" <% if tcWebApi_get("Dhcp6s_Entry","DNS_Mode","h") = "0" then asp_Write("selected") elseif  tcWebApi_get("Dhcp6s_Entry","DNS_Mode","h") = "N/A" then asp_Write("selected") end if %>> <%tcWebApi_get("String_Entry","LANDHCPv6Mode0Text","s")%>
												<option value="1" <% if tcWebApi_get("Dhcp6s_Entry","DNS_Mode","h") = "1" then asp_Write("selected") end if %>> <%tcWebApi_get("String_Entry","LANDHCPv6Mode1Text","s")%>
										    	</select>
								       	</td>
								      	</tr>
							
									<tr id="div_dhcp6sdns1">
								        	<td class="tabdata" align=left style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANPrimaryDNSText","s")%></td>
								         	<td align=left class="tabdata">
								        		<INPUT TYPE="TEXT" NAME="uiPrimaryDNSDHCP6" SIZE="39" MAXLENGTH="39" VALUE="<%If tcWebApi_get("Dhcp6s_Entry","DNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","DNSserver","s") end if%>">
								          		<font size=+1>&nbsp;</font> 
								          	</td>
								     	</tr>
									 
									<tr id="div_dhcp6sdns2" height="30px">
								     		<td class="tabdata" align=left style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","LANSecondaryDNSText","s")%></td>
								      		<td align=left class="tabdata">
								        		<INPUT TYPE="TEXT" NAME="uiSecondaryDNSDHCP6" SIZE="39" MAXLENGTH="39" VALUE="<%If tcWebApi_get("Dhcp6s_Entry","SecDNSserver","h") <> "N/A" then tcWebApi_get("Dhcp6s_Entry","SecDNSserver","s") end if%>">
								          		<font size=+1>&nbsp;</font> 
								          	</td>
								     	</tr>	
								</table>
							</div><!--id="div_dhcp6sen"-->
								    
							<script language="JavaScript" type="text/JavaScript">
								radvdChanged();
								dhcp6sChanged();
							</script>
						</div><!--cindy add for id="block1" 12/08 -->
					<% end if %>
				<% end if %>
									
        			<% If tcWebApi_get("Lan_EtherMedia","enable","h") = "support" Then %>
			        	<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
			    	 		<tr>
			    	 			<td colspan="5" height="10">&nbsp;</td>
			    	 		</tr>
			    	 		
			             		<tr>
				                	<td width="150" height="30" > </td>
				                	<td width="10" >&nbsp;</td>
				                	<td width="150" class="title-main1"> <%tcWebApi_get("String_Entry","LANMediaTypeText","s")%> </td>
				                	<td width="10" > </td>
				                	<td width="440"> </td>
			        		</tr>
			        		
				        	<tr>
				                	<td class="light-orange">&nbsp;</td>
				                	<td class="light-orange">&nbsp;</td>
				                	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANMediaPort1Text","s")%> </div></td>
				                	<td class="tabdata"><div align=center>:</div></td>
				                	<td class="tabdata">
				                        	<SELECT NAME="EtherMedia0" SIZE="1">
						                	<OPTION value="Auto" <% if tcWebApi_get("Lan_EtherMedia","port0","h") = "Auto" then asp_Write("selected") elseif tcWebApi_get("Lan_EtherMedia","port0","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType0Text","s")%></OPTION>
						                	<OPTION value="100_Full" <% if tcWebApi_get("Lan_EtherMedia","port0","h") = "100_Full" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType1Text","s")%></OPTION>
				                                	<OPTION value="100_Half" <% if tcWebApi_get("Lan_EtherMedia","port0","h") = "100_Half" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType2Text","s")%></OPTION>
				                                	<OPTION value="10_Full" <% if tcWebApi_get("Lan_EtherMedia","port0","h") = "10_Full" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType3Text","s")%></OPTION>
				                                	<OPTION value="10_Half" <% if tcWebApi_get("Lan_EtherMedia","port0","h") = "10_Half" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType4Text","s")%></OPTION>
						        	</SELECT>
				                	</td>
				        	</tr>
				        	
				        	<% If tcWebApi_get("Info_Ether","is4PortsEther","h") = "Yes" Then%>
				        		<tr>
					                	<td class="light-orange">&nbsp;</td>
					                	<td class="light-orange">&nbsp;</td>
					                	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANMediaPort2Text","s")%> </div></td>
					                	<td class="tabdata"><div align=center>:</div></td>
					                	<td class="tabdata">
					                        	<SELECT NAME="EtherMedia1" SIZE="1">
							                	<OPTION value="Auto" <% if tcWebApi_get("Lan_EtherMedia","port1","h") = "Auto" then asp_Write("selected") elseif tcWebApi_get("Lan_EtherMedia","port1","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType0Text","s")%></OPTION>
							                	<OPTION value="100_Full" <% if tcWebApi_get("Lan_EtherMedia","port1","h") = "100_Full" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType1Text","s")%></OPTION>
					                                	<OPTION value="100_Half" <% if tcWebApi_get("Lan_EtherMedia","port1","h") = "100_Half" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType2Text","s")%></OPTION>
					                                	<OPTION value="10_Full" <% if tcWebApi_get("Lan_EtherMedia","port1","h") = "10_Full" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType3Text","s")%></OPTION>
					                                	<OPTION value="10_Half" <% if tcWebApi_get("Lan_EtherMedia","port1","h") = "10_Half" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType4Text","s")%></OPTION>
							        	</SELECT>
					                	</td>
					        	</tr>
					        	
					        	<tr>
					                	<td class="light-orange">&nbsp;</td>
					                	<td class="light-orange">&nbsp;</td>
					                	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANMediaPort3Text","s")%> </div></td>
					                	<td class="tabdata"><div align=center>:</div></td>
					                	<td class="tabdata">
					                        	<SELECT NAME="EtherMedia2" SIZE="1">
							                	<OPTION value="Auto" <% if tcWebApi_get("Lan_EtherMedia","port2","h") = "Auto" then asp_Write("selected") elseif tcWebApi_get("Lan_EtherMedia","port2","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType0Text","s")%></OPTION>
							                	<OPTION value="100_Full" <% if tcWebApi_get("Lan_EtherMedia","port2","h") = "100_Full" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType1Text","s")%></OPTION>
					                                	<OPTION value="100_Half" <% if tcWebApi_get("Lan_EtherMedia","port2","h") = "100_Half" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType2Text","s")%></OPTION>
					                                	<OPTION value="10_Full" <% if tcWebApi_get("Lan_EtherMedia","port2","h") = "10_Full" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType3Text","s")%></OPTION>
					                                	<OPTION value="10_Half" <% if tcWebApi_get("Lan_EtherMedia","port2","h") = "10_Half" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType4Text","s")%></OPTION>
							        	</SELECT>
					                	</td>
					        	</tr>
					        	
					        	<tr>
					                	<td class="light-orange">&nbsp;</td>
					                	<td class="light-orange">&nbsp;</td>
					                	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANMediaPort4Text","s")%> </div></td>
					                	<td class="tabdata"><div align=center>:</div></td>
					                	<td class="tabdata">
					                        	<SELECT NAME="EtherMedia3" SIZE="1">
							                	<OPTION value="Auto" <% if tcWebApi_get("Lan_EtherMedia","port3","h") = "Auto" then asp_Write("selected") elseif tcWebApi_get("Lan_EtherMedia","port3","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType0Text","s")%></OPTION>
							                	<OPTION value="100_Full" <% if tcWebApi_get("Lan_EtherMedia","port3","h") = "100_Full" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType1Text","s")%></OPTION>
					                                	<OPTION value="100_Half" <% if tcWebApi_get("Lan_EtherMedia","port3","h") = "100_Half" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType2Text","s")%></OPTION>
					                                	<OPTION value="10_Full" <% if tcWebApi_get("Lan_EtherMedia","port3","h") = "10_Full" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType3Text","s")%></OPTION>
					                                	<OPTION value="10_Half" <% if tcWebApi_get("Lan_EtherMedia","port3","h") = "10_Half" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","LANMediaPortType4Text","s")%></OPTION>
							        	</SELECT>
					                	</td>
					        	</tr>
			        		<% end if %>
			        	</table>
			  	<% end if %>

				<% if tcWebApi_get("WebCustom_Entry","isBridgeMacLimitSupported","h") = "Yes" then %>
					<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
						<tr>
				              	<td width="150" height="30" > </td>
				                	<td width="10" >&nbsp;</td>
				                	<td width="150" class="title-main1"> <%tcWebApi_get("String_Entry","LANBridgeMacLimitText","s")%> </td>
				                	<td width="10" > </td>
				                	<td width="440"> </td>
						</tr>
						
					      	<tr>
				                	<td class="light-orange">&nbsp;</td>
				                	<td class="light-orange">&nbsp;</td>
				                	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANBridgeMacLimitTotal","s")%> </div></td>
				                	<td class="tabdata"><div align=center>:</div></td>
				                	<td class="tabdata">
				                     	<INPUT TYPE="TEXT" NAME="uiMacLimitTotal" SIZE="3" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Lan_BridgeMacLimit","macLimitTotal","h") <> "N/A" then tcWebApi_get("Lan_BridgeMacLimit","macLimitTotal","s") else asp_Write("0") end if%>">
				                	</td>
				        	</tr>
				        	
				        	<tr>
				                	<td class="light-orange">&nbsp;</td>
				                	<td class="light-orange">&nbsp;</td>
				                	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANBridgeMacLimitPort1","s")%> </div></td>
				                	<td class="tabdata"><div align=center>:</div></td>
				                	<td class="tabdata">                	
				                     	<INPUT TYPE="TEXT" NAME="uiMacLimitPort1" SIZE="3" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Lan_BridgeMacLimit","macLimitPort1","h") <> "N/A" then tcWebApi_get("Lan_BridgeMacLimit","macLimitPort1","s") else asp_Write("0") end if%>">
				                     	&nbsp;&nbsp;
				                     	<%tcWebApi_get("String_Entry","LANBridgeMacLimitPort2","s")%>&nbsp;:
				                     	<INPUT TYPE="TEXT" NAME="uiMacLimitPort2" SIZE="3" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Lan_BridgeMacLimit","macLimitPort2","h") <> "N/A" then tcWebApi_get("Lan_BridgeMacLimit","macLimitPort2","s") else asp_Write("0") end if%>">
				                     	&nbsp;&nbsp;
				                	</td>
				        	</tr>
				        	
				        	<tr>
				                 	<td class="light-orange">&nbsp;</td>
				                	<td class="light-orange">&nbsp;</td>
				                	<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","LANBridgeMacLimitPort3","s")%> </div></td>
				                	<td class="tabdata"><div align=center>:</div></td>
				                	<td class="tabdata">
				                     	<INPUT TYPE="TEXT" NAME="uiMacLimitPort3" SIZE="3" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Lan_BridgeMacLimit","macLimitPort3","h") <> "N/A" then tcWebApi_get("Lan_BridgeMacLimit","macLimitPort3","s") else asp_Write("0") end if%>">
				                     	&nbsp;&nbsp;
				                     	<%tcWebApi_get("String_Entry","LANBridgeMacLimitPort4","s")%>&nbsp;:
				                     	<INPUT TYPE="TEXT" NAME="uiMacLimitPort4" SIZE="3" MAXLENGTH="3" VALUE="<%If tcWebApi_get("Lan_BridgeMacLimit","macLimitPort4","h") <> "N/A" then tcWebApi_get("Lan_BridgeMacLimit","macLimitPort4","s") else asp_Write("0") end if%>">
				                     	&nbsp;&nbsp;
				                	</td>
				        	</tr>
					</table>
				<% end if %>

				<div id="button0">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
	<tr height="25px">		
		<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;"><%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%></td>
						</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
						<tr height="40" >
						    	<td width="250px" align=left class="tabdata" style="padding-left:20px;">
						        	<INPUT TYPE="button" NAME="SaveBtn" class="button1" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="uiSave()"> 
								<INPUT TYPE="HIDDEN" NAME="DHCPMBSSIDNumberFlag" VALUE="<%tcWebApi_get("WLan_Common","BssidNum","s")%>">
								<INPUT TYPE="HIDDEN" NAME="DHCP2PortsFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","is2PSupported","s")%>">
								<INPUT TYPE="HIDDEN" NAME="DHCP1PortsFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","is1PSupported","s")%>">
								<INPUT TYPE="HIDDEN" NAME="DHCPZY1PortsFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","isZY1PSupported","s")%>">
								<INPUT TYPE="HIDDEN" NAME="DHCPFilterFlag" VALUE="<%tcWebApi_get("WebCustom_Entry","isPortFltSupported","s")%>">
								<INPUT TYPE="HIDDEN" NAME="wlanISExist" VALUE="<%tcWebApi_get("Info_WLan","isExist","s")%>">
								<INPUT TYPE="HIDDEN" NAME="wlan11acISExist" VALUE="<%tcWebApi_get("Info_WLan11ac","isExist","s")%>">
								<INPUT TYPE="HIDDEN" NAME="DHCPMBSSID11acNumberFlag" VALUE="<%tcWebApi_get("WLan11ac_Common","BssidNum","s")%>">
							</td>
							<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->
						</tr>
					</table>
				</div><!--cindy add for id="button0" 12/08-->
</div><!--id="contenttype"-->
			</div><!--cindy add for border 11/28-->

		<%if tcWebApi_get("WebCustom_Entry","isPONCASupported","h") = "Yes" then %>
			<table width="690" border="0" cellpadding="0" cellspacing="0">
				<tr height="30">
					<td width="20">&nbsp;</td>
					<td width="250">&nbsp;</td>
					<td width="420"></td>
				</tr>	
				<tr>
					<td align=center colSpan=3 style="background-color:transparent;font-family: Arial,Helvetica,sans-serif;"><font size=2><%tcWebApi_get("String_Entry", "CopyrightText", "s")%> </font></td>
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
	<script language="JavaScript">
		doDisplay();
	</script>
</html>
