<%
If Request_Form("wlanWEPFlag")="1" Then
	'tcWebApi_set("WebCurSet_Entry","wlan_id","wlan_VC")
	tcWebApi_set("WebCurSet_Entry","wlan_id","SSID_INDEX")
	tcWebApi_set("WLan_Common","BssidNum","BssidNum")
	TCWebApi_set("WLan_Common","Country","Countries_Channels")
	if Request_Form("ChangeCountry")="1" then
		TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
		TCWebApi_set("WLan11ac_Common","Channel","AutoChannel")
	end if
	TCWebApi_set("WLan_Common","APOn","wlan_APenable")
	If TCWebApi_get("WebCustom_Entry","isFonV2Support","h") = "Yes" Then
		If TCWebApi_get("FonNet_Entry","Active","h") = "Yes" Then
			If Request_Form("wlan_APenable")="1" Then
				tcWebApi_constSet("FonNet_Entry","Enable","Yes")		
			Else
				tcWebApi_constSet("FonNet_Entry","Enable","No")		
			End if
		End if
	End if
	TCWebApi_set("WLan_Common","Channel","Channel_ID")
	TCWebApi_set("WLan_Common","BeaconPeriod","BeaconInterval")
  	TCWebApi_set("WLan_Common","RTSThreshold","RTSThreshold")
	TCWebApi_set("WLan_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan_Common","DtimPeriod","DTIM")
	TCWebApi_set("WLan_Common","WirelessMode","WirelessMode")
	TCWebApi_set("WLan_Common","TxPower","TxPower")
	If Request_Form("Is11nMode") = "1" then
		TCWebApi_set("WLan_Common","HT_BW","WLANChannelBandwidth")
		if Request_Form("WLANChannelBandwidth")="1" then
			'TCWebApi_set("WLan_Common","HT_EXTCHA","WLANExtensionChannel")
			TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
			if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
				tcWebApi_set("WLan_Common","HT_BSSCoexistence","Wlan_HTBW40M")
			end if
		end if
		TCWebApi_set("WLan_Common","HT_GI","WLANGuardInterval")
		TCWebApi_set("WLan_Entry","HT_MCS","WLANMCS")
		If Request_Form("is11nSpecComply","h") = "Yes" Then	
			TCWebApi_set("WLan_Common","HT_AutoBA","wlan_AMPDU")
			TCWebApi_set("WLan_Common","HT_AMSDU","wlan_AMSDU")
			TCWebApi_set("WLan_Common","HT_OpMode","wlan_Greenfiled")
			TCWebApi_set("WLan_Common","HT_STBC","wlan_STBC")
			TCWebApi_set("WLan_Common","HT_DisallowTKIP","wlan_DisallowTKIP")
		end if
	else
		TCWebApi_set("WLan_Common","HT_BW","HTBW")
		TCWebApi_set("WLan_Entry","HT_MCS","HTMCSAUTO")
		TCWebApi_set("WLan_Entry","WMM","WMM_Selection")
	end IF
	If Request_Form("StationNum") <> "" then
		TCWebApi_set("WLan_Entry","MbssMaxStaNum","StationNum")
	End if
	TCWebApi_set("WLan_Common","11nMode","Is11nMode")
	If Request_Form("WirelessMode") = "0" then
		TCWebApi_set("WLan_Common","BasicRate","BasicRate_Value1")
	elseif Request_Form("WirelessMode") = "1" then
		TCWebApi_set("WLan_Common","BasicRate","BasicRate_Value2")
	else
		TCWebApi_set("WLan_Common","BasicRate","BasicRate_Value3")
	end if
	TCWebApi_set("WLan_Entry","SSID","ESSID")
	TCWebApi_set("WLan_Common","BeaconPeriod","BeaconInterval")
	TCWebApi_set("WLan_Entry","HideSSID","ESSID_HIDE_Selection")
	If Request_Form("isPerSSIDSupport") = "1" then
	TCWebApi_set("WLan_Entry","EnableSSID","ESSID_Enable_Selection")
	end if
	'TCWebApi_set("WLan_Entry","WMM","WMM_Selection")
	if Request_form("WLAN_FltActive") = "0" then
		TCWebApi_set("WLan_Entry","AccessPolicy","WLAN_FltActive")
	else
		TCWebApi_set("WLan_Entry","AccessPolicy","WLAN_FltAction")
	end if
	if Request_Form("isWPSSupported") = "1" then
	if Request_Form("SSID_INDEX") = "0" then
		'TCWebApi_set("WLan_Entry","WPS","UseWPS_Selection")
		if Request_Form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
		else
			TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeNone")
		end if
		if Request_form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan_Entry","WPSMode","WPSMode_Selection")
			if Request_form("WPSMode_Selection") = "0" then
				TCWebApi_set("WLan_Entry","WPSPinMode","WPSPinMode_Selection")
				TCWebApi_set("WLan_Entry","enrolleePinCode","WPSEnrolleePINCode")
			end if
		end if
	end if
	end if
	
	if Request_Form("Mac_filter_flag")="2" Then  
	     if Request_Form("Mac_filter_id")="0" Then
            TCWebApi_set("WLan_Entry","WLan_MAC0","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id")="1" Then
            TCWebApi_set("WLan_Entry","WLan_MAC1","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id")="2" Then
            TCWebApi_set("WLan_Entry","WLan_MAC2","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id")="3" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC3","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id")="4" Then
            TCWebApi_set("WLan_Entry","WLan_MAC4","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id")="5" Then
            TCWebApi_set("WLan_Entry","WLan_MAC5","LAN_Device_mac_select")
            TCWebApi_set("WLan_Entry","edit_Num5","Mac_filter_id")
         elseif Request_Form("Mac_filter_id")="6" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC6","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id")="7" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC7","LAN_Device_mac_select") 
         end if
    end if
    if Request_Form("Mac_filter_flag")="1" Then
         if Request_Form("Mac_filter_id")="0" Then
            TCWebApi_set("WLan_Entry","WLan_MAC0","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="1" Then
            TCWebApi_set("WLan_Entry","WLan_MAC1","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="2" Then
            TCWebApi_set("WLan_Entry","WLan_MAC2","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="3" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC3","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="4" Then
            TCWebApi_set("WLan_Entry","WLan_MAC4","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="5" Then
            TCWebApi_set("WLan_Entry","WLan_MAC5","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="6" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC6","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="7" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC7","LAN_Manual_Mac")
         end if
     end if

	TCWebApi_set("WLan_Entry","AuthMode","WEP_Selection")
end if

If Request_Form("CountryChange")="1" Then
	'tcWebApi_set("WebCurSet_Entry","wlan_id","wlan_VC")
	tcWebApi_set("WebCurSet_Entry","wlan_id","SSID_INDEX")
	TCWebApi_set("WLan_Common","Country","Countries_Channels")
	if Request_Form("ChangeCountry")="1" then
		TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
		TCWebApi_set("WLan11ac_Common","Channel","AutoChannel")
	end if
	if Request_Form("Countries_Channels") = "CANADA" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "COLOMBIA" then
   		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")	
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "DOMINICAN REPUBLIC" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "GUATEMALA" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "MEXICO" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "NORWAY" then 
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "PANAMA" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "PUERTO RICO" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "UNITED STATES" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "TAIWAN" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "UZBEKISTAN" then			             
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	elseif Request_Form("Countries_Channels") = "SPAIN" then			             
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion2")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion2")			
	elseif Request_Form("Countries_Channels") = "FRANCE" then			             
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion3")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion3")			
	elseif Request_Form("Countries_Channels") = "JAPAN" then			             
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion5")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion5")
	elseif Request_Form("Countries_Channels") = "VIETNAM" then
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion0")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion0")
	else
		'TCWebApi_set("WLan_Entry","CountryRegion","CountryRegion1")
		TCWebApi_set("WLan_Common","CountryRegion","CountryRegion1")
	end if

	if Request_Form("ChangeCountry")="1" then
		if Request_Form("Countries_Channels") = "ARGENTINA" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand3")
		elseif Request_Form("Countries_Channels") = "ARMENIA" then	
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
		elseif Request_Form("Countries_Channels") = "AUSTRIA" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "AZERBAIJAN" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
		elseif Request_Form("Countries_Channels") = "BELGIUM" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "BELIZE" then 
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "BOLIVIA" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "BRAZIL" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "BRUNEI DARUSSALAM" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "BULGARIA" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "CHINA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "CROATIA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
		elseif Request_Form("Countries_Channels") = "CYPRUS" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "CZECH REPUBLIC" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
		elseif Request_Form("Countries_Channels") = "DENMARK" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "EGYPT" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
		elseif Request_Form("Countries_Channels") = "ESTONIA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "FINLAND" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "FRANCE" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")	
		elseif Request_Form("Countries_Channels") = "GEORGIA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")			
		elseif Request_Form("Countries_Channels") = "GERMANY" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "GREECE" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "HUNGARY" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "ICELAND" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "INDONESIA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")			
		elseif Request_Form("Countries_Channels") = "IRAN" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "IRELAND" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "ITALY" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "JAPAN" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "KOREA DEMOCRATIC" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
		elseif Request_Form("Countries_Channels") = "KOREA REPUBLIC" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
		elseif Request_Form("Countries_Channels") = "LATVIA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "LITHUANIA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "LUXEMBOURG" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "MONACO" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
		elseif Request_Form("Countries_Channels") = "NETHERLANDS" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "PERU" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")			
		elseif Request_Form("Countries_Channels") = "PHILIPPINES" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand4")
		elseif Request_Form("Countries_Channels") = "POLAND" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "PORTUGAL" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "SLOVAKIA" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "SLOVENIA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "SOUTH AFRICA" then			             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "SPAIN" then             
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")			
		elseif Request_Form("Countries_Channels") = "SWEDEN" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "SWITZERLAND" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "TAIWAN" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand3")
		elseif Request_Form("Countries_Channels") = "TRINIDAD AND TOBAGO" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
		elseif Request_Form("Countries_Channels") = "TUNISIA" then 
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
		elseif Request_Form("Countries_Channels") = "TURKEY" then  
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand2")
		elseif Request_Form("Countries_Channels") = "UNITED KINGDOM" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")	
		elseif Request_Form("Countries_Channels") = "URUGUAY" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
		elseif Request_Form("Countries_Channels") = "UZBEKISTAN" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand1")
		elseif Request_Form("Countries_Channels") = "VENEZUELA" then
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand5")
		else
			TCWebApi_set("WLan11ac_Common","CountryRegionABand","CountryRegionABand0")
		end if
	end if
	
End If
IF Request_Form("wlanWEPFlag")="2" Then
	tcWebApi_set("WebCurSet_Entry","wlan_id","SSID_INDEX")	
End if
If Request_Form("wlanWEPFlag")="3" Then
	if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then	
	TCWebApi_set("WLan_Common","HT_TxStream","TxStream_Action")	
	TCWebApi_set("WLan_Common","HT_RxStream","RxStream_Action")	
	end if	
	TCWebApi_set("WLan_Entry","AuthMode","WEP_Selection")	
	'tcWebApi_set("WebCurSet_Entry","wlan_id","wlan_VC")
	tcWebApi_set("WebCurSet_Entry","wlan_id","SSID_INDEX")
	tcWebApi_set("WLan_Common","BssidNum","BssidNum")
	TCWebApi_set("WLan_Common","Country","Countries_Channels")
	if Request_Form("ChangeCountry")="1" then
		TCWebApi_set("WLan11ac_Common","Country","Countries_Channels")
		TCWebApi_set("WLan11ac_Common","Channel","AutoChannel")
	end if
	TCWebApi_set("WLan_Common","Channel","Channel_ID")
	TCWebApi_set("WLan_Common","APOn","wlan_APenable")
	If TCWebApi_get("WebCustom_Entry","isFonV2Support","h") = "Yes" Then
		If TCWebApi_get("FonNet_Entry","Active","h") = "Yes" Then
			If Request_Form("wlan_APenable")="1" Then
				tcWebApi_constSet("FonNet_Entry","Enable","Yes")		
			Else
				tcWebApi_constSet("FonNet_Entry","Enable","No")		
			End if
		End if
	End if
	TCWebApi_set("WLan_Common","BeaconPeriod","BeaconInterval")
  TCWebApi_set("WLan_Common","RTSThreshold","RTSThreshold")
	'TCWebApi_set("WLan_Entry","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan_Common","FragThreshold","FragmentThreshold")
	TCWebApi_set("WLan_Common","DtimPeriod","DTIM")
	TCWebApi_set("WLan_Common","WirelessMode","WirelessMode")
	TCWebApi_set("WLan_Common","TxPower","TxPower")
if Request_Form("RTDEVICE") = "7615"  then
	TCWebApi_set("WLan_Common","ITxBfEn","WLanITxBfEn")
	TCWebApi_set("WLan_Common","ETxBfEnCond","WLanETxBfEnCond")
	TCWebApi_set("WLan_Common","ETxBfIncapable","WLanETxBfIncapable")
end if	
	If Request_Form("Is11nMode") = "1" then
		TCWebApi_set("WLan_Common","HT_BW","WLANChannelBandwidth")
		if Request_Form("WLANChannelBandwidth")="1" then
			'TCWebApi_set("WLan_Common","HT_EXTCHA","WLANExtensionChannel")
			TCWebApi_set("WLan_Common","HT_EXTCHA","ExtChannFlag")
			if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then
				tcWebApi_set("WLan_Common","HT_BSSCoexistence","Wlan_HTBW40M")
			end if
		end if
		TCWebApi_set("WLan_Common","HT_GI","WLANGuardInterval")
		TCWebApi_set("WLan_Entry","HT_MCS","WLANMCS")
		If Request_Form("is11nSpecComply","h") = "Yes" Then		
			TCWebApi_set("WLan_Common","HT_AutoBA","wlan_AMPDU")
			TCWebApi_set("WLan_Common","HT_AMSDU","wlan_AMSDU")
			TCWebApi_set("WLan_Common","HT_OpMode","wlan_Greenfiled")
			TCWebApi_set("WLan_Common","HT_STBC","wlan_STBC")
			TCWebApi_set("WLan_Common","HT_DisallowTKIP","wlan_DisallowTKIP")
		End if
	else
		TCWebApi_set("WLan_Common","HT_BW","HTBW")
		TCWebApi_set("WLan_Entry","HT_MCS","HTMCSAUTO")
		TCWebApi_set("WLan_Entry","WMM","WMM_Selection")
	end IF
	If Request_Form("StationNum") <> "" then
		TCWebApi_set("WLan_Entry","MbssMaxStaNum","StationNum")
	End if
	TCWebApi_set("WLan_Common","11nMode","Is11nMode")	
	TCWebApi_set("WLan_Entry","SSID","ESSID")
	TCWebApi_set("WLan_Common","BeaconPeriod","BeaconInterval")	
	TCWebApi_set("WLan_Entry","HideSSID","ESSID_HIDE_Selection")
	TCWebApi_set("WLan_Entry","BandSteering","Bandsteering_Selection")
	If Request_Form("isPerSSIDSupport") = "1" then
	TCWebApi_set("WLan_Entry","EnableSSID","ESSID_Enable_Selection")
	end if
	
	TCWebApi_set("WLan_Entry","WMM","WMM_Selection")

	if Request_Form("isDot1XSupported")  = "1" then
		if Request_Form("WEP_Selection")  = "Radius-WEP64" then
			TCWebApi_set("WLan_Common","session_timeout_interval","radiusSVR_ReAuthInter1")
			TCWebApi_set("WLan_Entry","RADIUS_Server","radiusSVR_IP1")
			TCWebApi_set("WLan_Entry","RADIUS_Port","radiusSVR_Port1")
			TCWebApi_set("WLan_Entry","RADIUS_Key","radiusSVR_Key1")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Server","bakradiusSVR_IP1")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Port","bakradiusSVR_Port1")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Key","bakradiusSVR_Key1")
			end if
		elseif Request_Form("WEP_Selection")  = "Radius-WEP128"  then
			TCWebApi_set("WLan_Common","session_timeout_interval","radiusSVR_ReAuthInter2")
			TCWebApi_set("WLan_Entry","RADIUS_Server","radiusSVR_IP2")
			TCWebApi_set("WLan_Entry","RADIUS_Port","radiusSVR_Port2")
			TCWebApi_set("WLan_Entry","RADIUS_Key","radiusSVR_Key2")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Server","bakradiusSVR_IP2")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Port","bakradiusSVR_Port2")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Key","bakradiusSVR_Key2")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA"  then
			TCWebApi_set("WLan_Common","session_timeout_interval","radiusSVR_ReAuthInter3")
			TCWebApi_set("WLan_Entry","RekeyInterval","WPARekeyInter3")			
			TCWebApi_set("WLan_Entry","RADIUS_Server","radiusSVR_IP3")
			TCWebApi_set("WLan_Entry","RADIUS_Port","radiusSVR_Port3")
			TCWebApi_set("WLan_Entry","RADIUS_Key","radiusSVR_Key3")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Server","bakradiusSVR_IP3")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Port","bakradiusSVR_Port3")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Key","bakradiusSVR_Key3")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA2"  then
			If Request_Form("isWPA2PreAuthSupported","h") = "Yes" Then
				TCWebApi_set("WLan_Entry","PreAuth","wlan_PreAuth")
			end if
			TCWebApi_set("WLan_Common","session_timeout_interval","radiusSVR_ReAuthInter4")
			TCWebApi_set("WLan_Entry","RekeyInterval","WPARekeyInter4")
			TCWebApi_set("WLan_Entry","RADIUS_Server","radiusSVR_IP4")
			TCWebApi_set("WLan_Entry","RADIUS_Port","radiusSVR_Port4")
			TCWebApi_set("WLan_Entry","RADIUS_Key","radiusSVR_Key4")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Server","bakradiusSVR_IP4")				
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Port","bakradiusSVR_Port4")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Key","bakradiusSVR_Key4")
			end if
		elseif Request_Form("WEP_Selection")  = "WPA1WPA2"  then
			TCWebApi_set("WLan_Common","session_timeout_interval","radiusSVR_ReAuthInter5")
			TCWebApi_set("WLan_Entry","RekeyInterval","WPARekeyInter5")
			TCWebApi_set("WLan_Entry","RADIUS_Server","radiusSVR_IP5")
			TCWebApi_set("WLan_Entry","RADIUS_Port","radiusSVR_Port5")
			TCWebApi_set("WLan_Entry","RADIUS_Key","radiusSVR_Key5")
			if Request_Form("isDot1XEnhanceSupported") = "1" then
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Server","bakradiusSVR_IP5")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Port","bakradiusSVR_Port5")
				TCWebApi_set("WLan_Entry","BAK_RADIUS_Key","bakradiusSVR_Key5")
			end if
		end if	
	end if	
	if Request_form("WLAN_FltActive") = "0" then
		TCWebApi_set("WLan_Entry","AccessPolicy","WLAN_FltActive")
	else
		TCWebApi_set("WLan_Entry","AccessPolicy","WLAN_FltAction")
	end if
	if Request_Form("isWPSSupported") = "1" then	
	if Request_Form("SSID_INDEX") = "0" then
		'TCWebApi_set("WLan_Entry","WPS","UseWPS_Selection")
		if Request_Form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
		else
			TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeNone")
		end if
		if Request_form("UseWPS_Selection") = "1" then
			TCWebApi_set("WLan_Entry","WPSMode","WPSMode_Selection")
			if Request_form("WPSMode_Selection") = "0" then
				TCWebApi_set("WLan_Entry","WPSPinMode","WPSPinMode_Selection")
				TCWebApi_set("WLan_Entry","enrolleePinCode","WPSEnrolleePINCode")
			end if
		end if
	end if	
	end if		
	if Request_Form("isWDSSupported") = "1" then
		TCWebApi_set("WLan_WDS","WdsEnable","WLAN_WDS_Active")
		if Request_form("WLAN_WDS_Active") = "1" then
			if Request_Form("WEP_Selection") = "OPEN" then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_NONE")
			elseif Request_Form("WEP_Selection") = "WEP-64Bits"  then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_WEP")
			elseif Request_Form("WEP_Selection") = "WEP-128Bits" then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_WEP")
			elseif Request_Form("WEP_Selection") = "Radius-WEP64" then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_WEP")
			elseif Request_Form("WEP_Selection") = "Radius-WEP128" then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_WEP")
			elseif Request_Form("WEP_Selection") = "WPAPSK" then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA2PSK" then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPAPSKWPA2PSK"  then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA"  then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA2"  then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan_WDS","WdsKey","WDS_Key")
			elseif Request_Form("WEP_Selection") = "WPA1WPA2"  then
				TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_Selection")
				TCWebApi_set("WLan_WDS","WdsKey","WDS_Key")
			end if
				
			TCWebApi_set("WLan_WDS","Wds_MAC0","WLANWDS_PEER_MAC1")
			TCWebApi_set("WLan_WDS","Wds_MAC1","WLANWDS_PEER_MAC2")
			TCWebApi_set("WLan_WDS","Wds_MAC2","WLANWDS_PEER_MAC3")
			TCWebApi_set("WLan_WDS","Wds_MAC3","WLANWDS_PEER_MAC4")
		end if
	end if			
	if Request_Form("Mac_filter_flag") = "2" Then
	     if Request_Form("Mac_filter_id") = "0" Then
            TCWebApi_set("WLan_Entry","WLan_MAC0","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id") = "1" Then
            TCWebApi_set("WLan_Entry","WLan_MAC1","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id") = "2" Then
            TCWebApi_set("WLan_Entry","WLan_MAC2","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id") = "3" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC3","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id") = "4" Then
            TCWebApi_set("WLan_Entry","WLan_MAC4","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id") = "5" Then
            TCWebApi_set("WLan_Entry","WLan_MAC5","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id") = "6" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC6","LAN_Device_mac_select")
         elseif Request_Form("Mac_filter_id") = "7" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC7","LAN_Device_mac_select")
         end if
    end if
    if Request_Form("Mac_filter_flag")="1" Then
         if Request_Form("Mac_filter_id")="0" Then
            TCWebApi_set("WLan_Entry","WLan_MAC0","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="1" Then
            TCWebApi_set("WLan_Entry","WLan_MAC1","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="2" Then
            TCWebApi_set("WLan_Entry","WLan_MAC2","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="3" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC3","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="4" Then
            TCWebApi_set("WLan_Entry","WLan_MAC4","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="5" Then
            TCWebApi_set("WLan_Entry","WLan_MAC5","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="6" Then 
            TCWebApi_set("WLan_Entry","WLan_MAC6","LAN_Manual_Mac")
         elseif Request_Form("Mac_filter_id")="7" Then
            TCWebApi_set("WLan_Entry","WLan_MAC7","LAN_Manual_Mac")
         end if
     end if
	'TCWebApi_set("WLan_Entry","WEPAuthType","WEP_TypeSelection")
	'TCWebApi_set("WLan_Entry","DefaultKeyID","DefWEPKey")	
	'TCWebApi_set("WLan_Entry","Key1Str","WEP_Key1")	
	'TCWebApi_set("WLan_Entry","Key2Str","WEP_Key2")		
	'TCWebApi_set("WLan_Entry","Key3Str","WEP_Key3")		
	'TCWebApi_set("WLan_Entry","Key4Str","WEP_Key4")	
	'TCWebApi_set("WLan_Entry","AuthMode","WEP_Selection")
	'TCWebApi_set("WLan_Entry","EncrypType","TKIP_Selection")	
	'TCWebApi_set("WLan_Entry","WPAPSK","PreSharedKey")
	'TCWebApi_set("WLan_Entry","RekeyInterval","keyRenewalInterval")	
	if Request_Form("WEP_Selection") = "WEP-64Bits"  then
		TCWebApi_set("WLan_Entry","WEPAuthType","WEP_TypeSelection1")
		TCWebApi_set("WLan_Entry","DefaultKeyID","DefWEPKey3")
		TCWebApi_set("WLan_Entry","Key1Str","WEP_Key13")	
		TCWebApi_set("WLan_Entry","Key2Str","WEP_Key23")		
		TCWebApi_set("WLan_Entry","Key3Str","WEP_Key33")		
		TCWebApi_set("WLan_Entry","Key4Str","WEP_Key43")
		if Request_Form("RTDEVICE") = "7615"  then
			if Request_form("WLAN_WDS_Active") = "1" then
				TCWebApi_set("WLan_WDS","WdsKey","WEP_Key")
			end if
		end if
	elseif Request_Form("WEP_Selection")  = "WEP-128Bits" then
		TCWebApi_set("WLan_Entry","WEPAuthType","WEP_TypeSelection2")
		TCWebApi_set("WLan_Entry","DefaultKeyID","DefWEPKey4")
		TCWebApi_set("WLan_Entry","Key1Str","WEP_Key14")	
		TCWebApi_set("WLan_Entry","Key2Str","WEP_Key24")		
		TCWebApi_set("WLan_Entry","Key3Str","WEP_Key34")		
		TCWebApi_set("WLan_Entry","Key4Str","WEP_Key44")
		if Request_Form("RTDEVICE") = "7615"  then
			if Request_form("WLAN_WDS_Active") = "1" then
				TCWebApi_set("WLan_WDS","WdsKey","WEP_Key")
			end if
		end if
	elseif Request_Form("WEP_Selection")  = "Radius-WEP64" then
		TCWebApi_set("WLan_Entry","DefaultKeyID","DefWEPKey1")
		TCWebApi_set("WLan_Entry","Key1Str","WEP_Key11")	
		TCWebApi_set("WLan_Entry","Key2Str","WEP_Key21")		
		TCWebApi_set("WLan_Entry","Key3Str","WEP_Key31")		
		TCWebApi_set("WLan_Entry","Key4Str","WEP_Key41")				
		if Request_Form("RTDEVICE") = "7615"  then
			if Request_form("WLAN_WDS_Active") = "1" then
				TCWebApi_set("WLan_WDS","WdsKey","WEP_Key")
			end if
		end if				
	elseif Request_Form("WEP_Selection")  = "Radius-WEP128" then
		TCWebApi_set("WLan_Entry","DefaultKeyID","DefWEPKey2")
		TCWebApi_set("WLan_Entry","Key1Str","WEP_Key12")	
		TCWebApi_set("WLan_Entry","Key2Str","WEP_Key22")		
		TCWebApi_set("WLan_Entry","Key3Str","WEP_Key32")		
		TCWebApi_set("WLan_Entry","Key4Str","WEP_Key42")
		if Request_Form("RTDEVICE") = "7615"  then
			if Request_form("WLAN_WDS_Active") = "1" then
				TCWebApi_set("WLan_WDS","WdsKey","WEP_Key")
			end if
		end if
	elseif Request_Form("WEP_Selection")  = "WPAPSK" then
		TCWebApi_set("WLan_Entry","WPAPSK","PreSharedKey2")
		TCWebApi_set("WLan_Entry","EncrypType","TKIP_Selection5")
		TCWebApi_set("WLan_Entry","RekeyInterval","keyRenewalInterval2")
	elseif Request_Form("WEP_Selection")  = "WPA2PSK" then
		TCWebApi_set("WLan_Entry","WPAPSK","PreSharedKey1")
		TCWebApi_set("WLan_Entry","EncrypType","TKIP_Selection4")
		TCWebApi_set("WLan_Entry","RekeyInterval","keyRenewalInterval1")
	elseif Request_Form("WEP_Selection")  = "WPAPSKWPA2PSK"  then
		TCWebApi_set("WLan_Entry","WPAPSK","PreSharedKey3")
		TCWebApi_set("WLan_Entry","EncrypType","TKIP_Selection6")
		TCWebApi_set("WLan_Entry","RekeyInterval","keyRenewalInterval3")
	elseif Request_Form("WEP_Selection")  = "WPA"  then
		TCWebApi_set("WLan_Entry","EncrypType","TKIP_Selection1")
	elseif Request_Form("WEP_Selection")  = "WPA2"  then
		TCWebApi_set("WLan_Entry","EncrypType","TKIP_Selection2")
	elseif Request_Form("WEP_Selection")  = "WPA1WPA2"  then
		TCWebApi_set("WLan_Entry","EncrypType","TKIP_Selection3")
	end if
	
	if Request_Form("isWPSSupported") = "1" then
	TCWebApi_set("WLan_Entry","WPSConfStatus","WPSConfigured")
	end if			
	if Request_Form("ChangeCountry")="1" then
		tcWebApi_commit("WLan11ac_Common")
	end if
	tcWebApi_commit("WLan_Entry")	
	if tcWebApi_get("WebCustom_Entry","isFonV2Support","h") = "Yes" then
		tcWebApi_commit("FonNet_Entry")
	end if
End If
if Request_Form("isWDSSupported") = "1" then
	If Request_Form("wlanWEPFlag")="4" Then
		TCWebApi_set("WLan_WDS","WdsEncrypType","WDS_EncrypType_Selection")
	End If
End If
if Request_Form("isWPSSupported") = "1" then
If Request_Form("WpsStart")="1" Then
	TCWebApi_set("Info_WLan","WPSActiveStatus","WpsStart")
	TCWebApi_set("WLan_Entry","WPSConfMode","WpsConfModeAll")
	if Request_form("WPSMode_Selection") = "0" then
		TCWebApi_set("WLan_Entry","WPSPinMode","WPSPinMode_Selection") 
		TCWebApi_set("WLan_Entry","enrolleePinCode","WPSEnrolleePINCode")
	end if
	TCWebApi_set("WLan_Entry","WPSMode","WPSMode_Selection")
	'TCWebApi_set("WLan_Entry","WPSConfStatus","WPSConfigured")
	tcWebApi_commit("WLan_Entry")
	if tcWebApi_get("WebCustom_Entry","isFonV2Support","h") = "Yes" then
		tcWebApi_commit("FonNet_Entry")
	end if
End If
If Request_Form("WpsOOB")="1" Then
	TCWebApi_set("Info_WLan","WPSOOBActive","WpsOOB")
	tcWebApi_commit("WLan_Entry")
	if tcWebApi_get("WebCustom_Entry","isFonV2Support","h") = "Yes" then
		tcWebApi_commit("FonNet_Entry")
	end if
end if

If Request_Form("WpsGenerate") = "1" then
	TCWebApi_set("Info_WLan","WPSGenPinCode","WpsGenerate")
	TCWebApi_commit("WLan_Entry")
	if tcWebApi_get("WebCustom_Entry","isFonV2Support","h") = "Yes" then
		tcWebApi_commit("FonNet_Entry")
	end if
end if
end if

if Request_form("delnum") <> "" then
	if Request_Form("delnum")="0" Then
       TCWebApi_set("WLan_Entry","WLan_MAC0","unsetmacaddr")
    elseif Request_Form("delnum")="1" Then
       TCWebApi_set("WLan_Entry","WLan_MAC1","unsetmacaddr")
    elseif Request_Form("delnum")="2" Then
       TCWebApi_set("WLan_Entry","WLan_MAC2","unsetmacaddr")
    elseif Request_Form("delnum")="3" Then 
       TCWebApi_set("WLan_Entry","WLan_MAC3","unsetmacaddr")
    elseif Request_Form("delnum")="4" Then
       TCWebApi_set("WLan_Entry","WLan_MAC4","unsetmacaddr")
    elseif Request_Form("delnum")="5" Then
       TCWebApi_set("WLan_Entry","WLan_MAC5","unsetmacaddr")
    elseif Request_Form("delnum")="6" Then 
       TCWebApi_set("WLan_Entry","WLan_MAC6","unsetmacaddr")
    elseif Request_Form("delnum")="7" Then
       TCWebApi_set("WLan_Entry","WLan_MAC7","unsetmacaddr")
    end if
		TCWebAPI_commit("WLan_Entry")
end if

%>
 
		<%If Request_Form("WpsStart") ="1"  Then%>
		
			<script language="JavaScript">
				function Reload(){
				window.location.href=window.location.href; 
				window.location.reload;

				}
			setTimeout("Reload()",2000);

			</script>
		<%End If%>

 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="utf-8" dir="ltr" lang="utf-8">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=11;IE=10;IE=9; IE=8; IE=7; IE=EDGE">
<meta http-equiv=Content-Script-Type content=text/javascript>
<meta http-equiv=Content-Style-Type content=text/css>
<meta http-equiv=Content-Type content="text/html; charset=<%tcWebApi_get("String_Entry","textTTNETCharSet","s")%>">
<link rel="stylesheet" type="text/css" href="/style.css">
<style>
*{color:  #404040;}

#WPSAPPinMode input:hover
{
display:inline-block;
background:#1a6f98;
color:#fff;
outline:0;
}
</style>

<script language="JavaScript" src="/general.js"></script>
<script language="JavaScript" type="text/javascript" src="/ip_new.js"></script>
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
				
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
var wpsenable;
<%end if%>
var wepidx;
var WEPSelectIndex;
function doCheckWepSelectIndex()
{
	var wlan=document.WLAN;
	<%if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
	WEPSelectIndex = wlan.WEP_Selection.selectedIndex + 1;
	//alert("WEPSelectIndex = "+WEPSelectIndex);
	<%else%>
	WEPSelectIndex = wlan.WEP_Selection.selectedIndex;
	<%end if%>
	return true;	
}

//Foxconn alan add start for get WIFI_2.4G_RSSI_Information.log file
function download_RSSI_information()
{
	var cfg = '/WIFI_2.4G_RSSI_Information.log';
	var code = 'location.assign("' + cfg + '")';
	eval(code);
}
//Foxconn alan add end

<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function doStartWPS(){
	if((document.WLAN.WPSMode_Selection[0].selected)&&(document.WLAN.isInWPSing.value==0))
	{
	 	var pincode = document.WLAN.WPSEnrolleePINCode;
        var len = pincode.value.length;
	//foxconn steve modify start
		var pinmode = document.WLAN.WPSPinMode_Selection.value;
	if(pinmode==1){
		if(doPINCodeCheck(pincode) == false)
		{
			return ;
		}
	}
	<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") <> "1"  then %>
	<%if tcWebApi_get("WLan_Entry", "WPSConfStatus", "h") = "2" then %>
		if(pinmode==1 && len <= 0){
		//foxconn steve modify end
	    	alert("<%tcWebApi_get("String_Entry","WirelessJS32Text","s")%>");
		return;
	}
    <%end if%>
	<%end if%>

	}

	if(document.WLAN.isInWPSing.value==0){//xyyou???
		alert("<%tcWebApi_get("String_Entry","WirelessJS0Text","s")%>");
	}
	document.WLAN.WpsStart.value = 1;
	document.WLAN.submit();
}

function doResetOOB(){
	document.WLAN.WpsOOB.value = 1;
	document.WLAN.submit();
}

function doGenerate(){
	document.WLAN.WpsGenerate.value = "1";
	document.WLAN.submit();
}
<%end if%>

function doWEPTypeChange(){

}
function strESSIDCheck(str) {
//Foxconn alan remove for bug 0000058: SSID not support Vietnamese
if(str.value.match(/[^\x00-\xff]/g)){
	alert("<%tcWebApi_get("String_Entry","WirelessJS1Text","s")%>");
	return true;
}

if(document.WLAN.ESSID.value.length <= 0){
	alert("<%tcWebApi_get("String_Entry","WirelessJS2Text","s")%>");
	return true;
}
return false;
}
function doRegionCheck(){
	var vCountryName = document.WLAN.Countries_Channels.value;
	var ctlCountryRegion = document.WLAN.hCountryRegion;
	var ctlCountryRegion0 = document.WLAN.CountryRegion0;
	var ctlCountryRegion1 = document.WLAN.CountryRegion1;
	var ctlCountryRegion2 = document.WLAN.CountryRegion2;
	var ctlCountryRegion3 = document.WLAN.CountryRegion3;
	var ctlCountryRegion5 = document.WLAN.CountryRegion5;
	//Foxconn alan add for FPT test wifi country code issue (20171101)
	var vCountryName1 = document.WLAN.Countries_Channels.value;
	vCountryName1 = "<%tcWebApi_get("WLan_Common","Country","s")%>";
	//Foxconn alan add end (20171101)
	if(vCountryName == "CANADA")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "COLOMBIA")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "DOMINICAN REPUBLIC")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "GUATEMALA")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "MEXICO")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "NORWAY")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "PANAMA")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "PUERTO RICO")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "UNITED STATES")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "TAIWAN")
		ctlCountryRegion.value = ctlCountryRegion0.value;
	else if (vCountryName == "UZBEKISTAN")			             
		ctlCountryRegion.value = ctlCountryRegion0.value;		
	else if (vCountryName == "JAPAN")			             
		ctlCountryRegion.value = ctlCountryRegion5.value;		
//Foxconn alan add for country set
//cindy add because some mobilephone can not support the channel 12-13 20190903
	else if (vCountryName == "VIETNAM")			             
		ctlCountryRegion.value = ctlCountryRegion0.value;	
//cindy add because some mobilephone can not support the channel 12-13 20190903
//	else if (vCountryName == "SPAIN")			             
//		ctlCountryRegion.value = ctlCountryRegion2.value;		
//	else if (vCountryName == "FRANCE")			             
//		ctlCountryRegion.value = ctlCountryRegion3.value;		
	else
		ctlCountryRegion.value = ctlCountryRegion1.value;

	RefreshPage();
	
	document.WLAN.CountryChange.value = 1; 
	//Foxconn alan add for FPT test wifi country code issue (20171101)
	if(vCountryName == vCountryName1)
		document.WLAN.ChangeCountry.value = 0;
	else
		document.WLAN.ChangeCountry.value = 1;
	//Foxconn alan add end (20171101)
	//document.WLAN.submit();
}
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function dowpscheck(){
//modified by fred to support WPS2.0

	var wlan=document.WLAN;
if(wlan.SSID_INDEX.value==0){	
	if(wlan.UseWPS_Selection[0].checked == true){

	//check if WscV2Supported
	<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") = "1"  then %>

		if (wlan.ESSID_HIDE_Selection[1].checked == true){
			alert("<%tcWebApi_get("String_Entry","WirelessJS33Text","s")%>");
		  wlan.UseWPS_Selection[1].checked = true;
		  return 0;
		}
		if (WEPSelectIndex != 0 && WEPSelectIndex != 3 && WEPSelectIndex != 4 && WEPSelectIndex != 5 && WEPSelectIndex != 8 && WEPSelectIndex != 9 && WEPSelectIndex != 10)
		{
			alert("<%tcWebApi_get("String_Entry","WirelessJS35Text","s")%>");
			wlan.WEP_Selection.selectedIndex = wepidx;
					
		if(wpsenable)
		{
			wlan.UseWPS_Selection[0].checked = true;
		}else{
			wlan.UseWPS_Selection[1].checked = true;
		}
			return 0;
		}
		
		if(((WEPSelectIndex == 3) && (wlan.TKIP_Selection5.value== "TKIP"))||((WEPSelectIndex==4) && (wlan.TKIP_Selection4.value== "TKIP"))|| ((WEPSelectIndex==5) && (wlan.TKIP_Selection6.value== "TKIP")))
		{//WPAPSK ,WPA2PSK and WPAPSKWPA2PSK with TKIP
			
			
			alert("<%tcWebApi_get("String_Entry","WirelessJS34Text","s")%>");
			wlan.UseWPS_Selection[1].checked = true;
			return 0;
		}
		else if(((WEPSelectIndex == 8) && (wlan.TKIP_Selection1.value== "TKIP"))||((WEPSelectIndex==9) && (wlan.TKIP_Selection2.value== "TKIP"))|| ((WEPSelectIndex==10) && (wlan.TKIP_Selection3.value== "TKIP")))
		{	//WPA, WPA2 and WPAWPA2 with TKIP
			alert("<%tcWebApi_get("String_Entry","WirelessJS34Text","s")%>");
			wlan.UseWPS_Selection[1].checked = true;
			return 0;
		}

		return 1;
	<%end if%>

	//do simple check if only WPS 1.0 supported, use original check code in 1.0
	<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") <> "1"  then %>
	//WEPSelectIndex 1=WEP64,2=WEP128,3=Radius-WEP64,4=Radius-WEP128
	//Foxconn alan change
	if(WEPSelectIndex == 6 || WEPSelectIndex == 7){
	//if(WEPSelectIndex == 1 || WEPSelectIndex == 2 || WEPSelectIndex == 6 || WEPSelectIndex == 7){
		alert("<%tcWebApi_get("String_Entry","WirelessJS3Text","s")%>");
		if(wpsenable){
			wlan.UseWPS_Selection[0].checked = true;
		}else{
			wlan.UseWPS_Selection[1].checked = true;
		}
		//wlan.WEP_Selection.selectedIndex = wepidx;
		return 0;
	}else{
		return 1;
	}
	
	<%end if%>

	}
	else{
		return 1;
	}
}else{
	return 1;
}
}
<%end if%>
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
//function doBroadcastSSIDChange(){
function doBroadcastSSIDChange(){

	//check if WscV2Supported
	<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") = "1"  then %>
	
	var wlan=document.WLAN;
	
	if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) && (wlan.ESSID_HIDE_Selection[1].checked == true))
	{
			var rv = confirm("<%tcWebApi_get("String_Entry","WirelessJS36Text","s")%>");
			if (rv == false)
			{
			wlan.ESSID_HIDE_Selection[0].checked = true;
				wlan.ESSID_HIDE_Selection[1].checked = false;
			}
			else
			{
				wlan.ESSID_HIDE_Selection[0].checked = false;
				wlan.ESSID_HIDE_Selection[1].checked = true;
				wlan.UseWPS_Selection[0].checked = false;
				wlan.UseWPS_Selection[1].checked = true;
			}
	}
        doLoad();
	<%end if%>
	
	return 1;
	
}

function doEncryptionChange(object){

	//check if WscV2Supported
	<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") = "1"  then %>
	
	var wlan=document.WLAN;
				
	if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) && (object.value == "TKIP"))
	{

			var rv = confirm("<%tcWebApi_get("String_Entry","WirelessJS36Text","s")%>");
			if (rv == false)
			{
			object.value="AES";
			}
			else
			{
				object.value = "TKIP";
				wlan.UseWPS_Selection[0].checked = false;
				wlan.UseWPS_Selection[1].checked = true;
			}

	}
	doLoad();
	<%end if%>
	return 1;
}
<%end if%>

function doWEPChange(){
	doCheckWepSelectIndex();
	var wlan=document.WLAN;
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") = "1"  then %>
	if ((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) && (WEPSelectIndex != 0 && WEPSelectIndex != 3 && WEPSelectIndex != 4 && WEPSelectIndex != 5 && WEPSelectIndex != 8 && WEPSelectIndex != 9 && WEPSelectIndex != 10))
	{
		var rv = confirm("<%tcWebApi_get("String_Entry","WirelessJS36Text","s")%>");
		if (rv == false)
		{
			wlan.WEP_Selection.selectedIndex = wepidx;
		}
		else
		{
			wlan.UseWPS_Selection[0].checked = false;
			wlan.UseWPS_Selection[1].checked = true;
		}			
	}
	else if ((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true)
		 && (WEPSelectIndex == 3 || WEPSelectIndex == 4 || WEPSelectIndex == 5 || WEPSelectIndex == 8 || WEPSelectIndex == 9 || WEPSelectIndex == 10))
	{
		if(((WEPSelectIndex == 3) && (wlan.TKIP_Selection5.value== "TKIP"))||((WEPSelectIndex==4) && (wlan.TKIP_Selection4.value== "TKIP"))|| ((WEPSelectIndex==5) && (wlan.TKIP_Selection6.value== "TKIP")))
		{//WPAPSK ,WPA2PSK and WPAPSKWPA2PSK with TKIP
			var rv = confirm("<%tcWebApi_get("String_Entry","WirelessJS36Text","s")%>");
			if (rv == false)
			{
				wlan.WEP_Selection.selectedIndex = wepidx;
			}
			else
			{
				wlan.UseWPS_Selection[0].checked = false;
				wlan.UseWPS_Selection[1].checked = true;
			}
		}
		else if(((WEPSelectIndex == 8) && (wlan.TKIP_Selection1.value== "TKIP"))||((WEPSelectIndex==9) && (wlan.TKIP_Selection2.value== "TKIP"))|| ((WEPSelectIndex==10) && (wlan.TKIP_Selection3.value== "TKIP")))
		{	//WPA,WPA2 and WPAWPA2 with TKIP
			var rv = confirm("<%tcWebApi_get("String_Entry","WirelessJS36Text","s")%>");
			if (rv == false)
			{
				wlan.WEP_Selection.selectedIndex = wepidx;
			}
			else
			{
				wlan.UseWPS_Selection[0].checked = false;
				wlan.UseWPS_Selection[1].checked = true;
			}	
		}
	}
	<%end if%>

	//do simple check if only WPS 1.0 supported, use original check code in 1.0
	<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") <> "1"  then %>
	//Foxconn alan change
	if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) &&(WEPSelectIndex == 6 || WEPSelectIndex == 7))
	//if((wlan.SSID_INDEX.value==0) && (wlan.UseWPS_Selection[0].checked == true) &&(WEPSelectIndex == 1 || WEPSelectIndex == 2 || WEPSelectIndex == 6 || WEPSelectIndex == 7))
	{
		alert("<%tcWebApi_get("String_Entry","WirelessJS3Text","s")%>");
		wlan.WEP_Selection.selectedIndex = wepidx;
	}
	<%end if%>
<%end if%>	
	if(WEPSelectIndex == 0)
	{
		var rv = confirm("<%tcWebApi_get("String_Entry","WirelessJS38Text","s")%>");
		if (rv == false)
		{
			wlan.WEP_Selection.selectedIndex = wepidx;
		}
	}

		document.WLAN.wlanWEPFlag.value = 1;
			
		doLoad();
}

function doWEPChange2(){
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	if(dowpscheck()){
<%end if%>
		document.WLAN.wlanWEPFlag.value = 1;
		//if(document.WLAN.WEP_Selection.selectedIndex != 9){
		if(WEPSelectIndex != 9){
		<%if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
			document.WLAN.WEP_Selection.selectedIndex = 8;
		<%else%>
			document.WLAN.WEP_Selection.selectedIndex = 9;
		<%end if%>
			document.WLAN.submit();
		}
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	}
<%end if%>
}
function doWDSEncrypTypeChange(){
		document.WLAN.wlanWEPFlag.value = 4;
		//document.WLAN.submit();
}

function doSSIDChange(){
	//alert(document.WLAN.SSID_INDEX.value);
	document.WLAN.wlanWEPFlag.value = 2;
	document.WLAN.submit();
}

function doWirelessModeChange(){

//cindy add start because 802.11n mode don't support SKIP encryption Type 08/24
	var wiremode=document.WLAN.WirelessMode.selectedIndex;
	if(wiremode=="2"){
			document.WLAN.TKIP_Selection4.disabled=true;
			document.WLAN.TKIP_Selection5.disabled=true;
			document.WLAN.TKIP_Selection6.disabled=true;
	}
	else{
			document.WLAN.TKIP_Selection4.disabled=false;
			document.WLAN.TKIP_Selection5.disabled=false;
			document.WLAN.TKIP_Selection6.disabled=false;
	}	
//cindy add end because 802.11n mode don't support SKIP encryption Type 08/24
	
	document.WLAN.wlanWEPFlag.value = 1;
	if(document.WLAN.WirelessMode.selectedIndex>=2){//cindy modify 3->2
		document.WLAN.Is11nMode.value=1;
	}else{
		document.WLAN.Is11nMode.value=0;
		document.getElementById("11nMode_1_div").style.display="none";//wang add this sentence
		<% If tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %>
		document.WLAN.WLanTxBeamForming[3].selected = true;
//		document.getElementById("WLanTxBeamForming").style.display="none";
		<%end if%>
	}
	//document.WLAN.submit();
	doLoad();
}

function doChannelBandwidthChange(){
	document.WLAN.wlanWEPFlag.value = 1;
	//if(document.WLAN.WLANExtensionChannel.selectedIndex==0){
	//	document.WLAN.ExtChannFlag.value = 0;
	//}else{
	//	document.WLAN.ExtChannFlag.value = 1;
	//}
	//document.WLAN.submit();
	doLoad();
}

function doExtChannChange(){
	if(document.WLAN.WLANExtensionChannel.selectedIndex==0){
		document.WLAN.ExtChannFlag.value = 0;
	}else{
		document.WLAN.ExtChannFlag.value = 1;
	}
}

function doExtChaLockChange() {
	if(document.WLAN.WirelessMode.selectedIndex >= 2){//cindy modify 3->2
		<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if((document.WLAN.WLANChannelBandwidth.selectedIndex == 1)||(document.WLAN.WLANChannelBandwidth.selectedIndex == 2)){
		<%else %>
		if(document.WLAN.WLANChannelBandwidth.selectedIndex == 1){
		<%end if%>
			document.WLAN.wlanWEPFlag.value = 1;
			//document.WLAN.submit();
			doLoad();
		}
	}
}
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
function doWPSUseChange(){
	if(dowpscheck()){
		document.WLAN.wlanWEPFlag.value = 1;
		//wang modify start
	<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>	
		if(document.WLAN.wlan_VC.value==0){
			if(document.WLAN.UseWPS_Selection[0].checked == true)
				document.getElementById("WPSConfMode_1_div").style.display="";
			else
				document.getElementById("WPSConfMode_1_div").style.display="none";
	}
	<%end if%>         //wang modify end	
			 
	//	RefreshPage();                             //wang delete it 
	//       doLoad(); //added by fredli       //wang delete it 
	}
}

function doWPSModeChange(){
	//foxconn steve modify start
	var wpsmode = document.WLAN.WPSMode_Selection;	
		if(wpsmode[0].selected)
		{
		document.getElementById("WPSMode_SelectionDiv").style.display="";
		document.getElementById("WPSMode_SelectionDiv1").style.display="";

		}else
			{
		document.getElementById("WPSMode_SelectionDiv").style.display="none";
		document.getElementById("WPSMode_SelectionDiv1").style.display="none";

}
	//foxconn steve modify end
}

//foxconn steve add start
function doWPSPinModeChange(){
	var pinmode = document.WLAN.WPSPinMode_Selection.value;
	if(pinmode==1)
		{
	
		document.getElementById("WPSAPPinMode").style.display="none";
		document.getElementById("WPSSTAPinMode").style.display="";
	}else
		{
		document.getElementById("WPSAPPinMode").style.display="";
		document.getElementById("WPSSTAPinMode").style.display="none";
	}

}
//foxconn steve add end
<%end if%>
function wpapskCheck(object) {
	var keyvalue=object.value;
	var wpapsklen=object.value.length;
	
   	if(wpapsklen >= 8 && wpapsklen < 64) {
    	if(keyvalue.match(/[^\x00-\xff]/g))
   	    {
//			alert("wpapsk Key should be between 8 and 63 ASCII characters(except \',\') or 64 Hex string.");
			alert("<%tcWebApi_get("String_Entry","WirelessJS25Text","s")%>");
			return true;
//   	    } else {
//   	        for ( i = 0; i < wpapsklen; i++)
//   	        if (keyvalue.charAt(i) == ','){
////			   alert("wpapsk Key should be between 8 and 63 ASCII characters(except \',\') or 64 Hex string.");
//			   alert("<%tcWebApi_get("String_Entry","WirelessJS25Text","s")%>");
//			   return true;
//   	        }
   	    }
	}else if(wpapsklen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
//				alert('wpapsk Key Hex value error!');
				alert("<%tcWebApi_get("String_Entry","WirelessJS26Text","s")%>");
				return true;
			}
		}
	}else {
//    	alert('wpapsk Key length error!');
    	alert("<%tcWebApi_get("String_Entry","WirelessJS27Text","s")%>");
		return true;
	}			
	return false;
}

function RadiusKeyCheck(object) {
	var keyvalue=object.value;
	var radiuskeylen=object.value.length;
	
   	if(radiuskeylen < 8) {
    	alert('<%tcWebApi_get("String_Entry","WirelessJS40Text","s")%>');
		return true;
	}else if(radiuskeylen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert('<%tcWebApi_get("String_Entry","WirelessJS39Text","s")%>');
				return true;
			}
		}
	}else if(radiuskeylen > 64) {
    	alert('<%tcWebApi_get("String_Entry","WirelessJS40Text","s")%>');
		return true;
	}			
	return false;
}

function WDSKeyCheck(object) {
	var keyvalue=object.value;
	var wdskeylen=object.value.length;
	
   	if(wdskeylen < 8) {
    	alert('<%tcWebApi_get("String_Entry","WirelessJS8Text","s")%>');
		return true;
	}else if(wdskeylen==64){
		for(i=0;i<64;i++){
			var c=keyvalue.charAt(i);
			if(doHexCheck(c)<0){
				alert('<%tcWebApi_get("String_Entry","WirelessJS7Text","s")%>');
				return true;
			}
		}
	}else if(wdskeylen > 64) {
    	alert('<%tcWebApi_get("String_Entry","WirelessJS8Text","s")%>');
		return true;
	}			
	return false;
}

function doHexCheck(c)
{
  if ((c >= "0")&&(c <= "9"))
  {
    return 1;
  }
  else if ((c >= "A")&&(c <= "F"))
  {
    return 1;
  }
  else if ((c >= "a")&&(c <= "f"))
  {
    return 1;
  }

  return -1;
}

function doNonSympolCheck(c)
{
	if ((c >= "0")&&(c <= "9"))
	{
		return 1;
	}
	else if ((c >= "A")&&(c <= "Z"))
	{
		return 1;
	}
	else if ((c >= "a")&&(c <= "z"))
	{
		return 1;
	}

  return -1;
}

function doKEYcheck(object)
{
	var index = object.value.indexOf("0x");
	len=object.value.length;
	
	if(len == 0){
		return true;
	}

	//if(document.WLAN.WEP_Selection.selectedIndex==1)
	if(WEPSelectIndex==1)
	{
//	        if(len==5)/*wep 64*/
//	        {
//		        for(i=0;i<len;i++)
//		        {
//			var c = object.value.charAt(i);	
//			if(doNonSympolCheck(c)==-1)
//			{
//				alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
//					return false;
//			}
//		}
//	}
	if(len==5)/*wep 64*/
	{
		return true;
	}
	else if(len==10)/*wep 64*/
	{
		for(i=0;i<len;i++)
		{
			var c = object.value.charAt(i);	
			if(doHexCheck(c)==-1)
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
					return false;
			}
		}
	}
	//	else if(len==12)/*wep 64*/
	//	{
	//		if(index==0)
	//	{
	//		    for ( i = 2; i < len; i++ )
	//		{
	//			var c = object.value.charAt(i);	
	//			if(doHexCheck(c)==-1)
	//			{
	//				alert("Invalid Key Value");
	//				return;
	//			}
	//		}
	//	}
	//		else
	//		{
	//			alert("Invalid Key Value");
	//			return;
	//		}
	//	}
		else
		{
			alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
			return false;
		}
	}
	//else if(document.WLAN.WEP_Selection.selectedIndex==2)
	else if(WEPSelectIndex==2)
	{
//		if(len==13)/*wep 128*/
//	{
//		for(i=0;i<len;i++)
//		{
//			var c = object.value.charAt(i);	
//			if(doNonSympolCheck(c)==-1)
//			{
//				alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
//					return false;
//			}
//		}
//	}
	if(len==13)/*wep 128*/
	{
		return true;
	}
	else if(len==26)/*wep 128*/
	{
		for(i=0;i<len;i++)
		{
			var c = object.value.charAt(i);	
			if(doHexCheck(c)==-1)
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
					return false;
			}
		}
	}
		//else if(len==28)/*wep 128*/
		//{
		//	if(index==0)
		//	{
		//	    for ( i = 2; i < len; i++ )
		//		{
		//			var c = object.value.charAt(i);	
		//			if(doHexCheck(c)==-1)
		//			{
		//				alert("Invalid Key Value");
		//				return;
		//			}
		//		}
		//	}
		//	else
		//	{
		//		alert("Invalid Key Value");
		//		return;
		//	}
		//}
		else
		{
			alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
			return false;
		}
	}
	if(document.WLAN.isDot1XSupported.value==1)
	{
		//if(document.WLAN.WEP_Selection.selectedIndex==6)
		if(WEPSelectIndex==6)
		{
//	        if(len==5)/*wep 64*/
//	        {
//		        for(i=0;i<len;i++)
//		        {
//					var c = object.value.charAt(i);	
//					if(doNonSympolCheck(c)==-1)
//					{
//						alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
//						return false;
//					}
//				}
//			}
			if(len==5)/*wep 64*/
			{
				return true;
			}
			else if(len==10)/*wep 64*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
						return false;
					}
				}
			}
			else
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
				return false;
			}
		}
		//else if(document.WLAN.WEP_Selection.selectedIndex==7)
		else if(WEPSelectIndex==7)
		{
//			if(len==13)/*wep 128*/
//			{
//				for(i=0;i<len;i++)
//				{
//					var c = object.value.charAt(i);	
//					if(doNonSympolCheck(c)==-1)
//					{
//						alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
//						return false;
//					}
//				}
//			}
			if(len==13)/*wep 128*/
			{
				return true;
			}
			else if(len==26)/*wep 128*/
			{
				for(i=0;i<len;i++)
				{
					var c = object.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
						return false;
					}
				}
			}
			else
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
				return false;
			}
		}
	}
	return true;
}

function doMACcheck(object)
{
  var szAddr = object.value;
  var len = szAddr.length;
  var errMsg = "Invalid MAC Address";

  if ( len == 0 )
  {
    object.value ="00:00:00:00:00:00";
    return;
  }

  if ( len == 12 )
  {
    var newAddr = "";
    var i = 0;

    for ( i = 0; i < len; i++ )
    {
      var c = szAddr.charAt(i);
      
      if ( doHexCheck(c) < 0 )
      {
      alert("<%tcWebApi_get("String_Entry","WirelessJS10Text","s")%>");        object.focus();
        return;
      }
      if ( (i == 2) || (i == 4) || (i == 6) || (i == 8) || (i == 10) )
        newAddr = newAddr + ":";
      newAddr = newAddr + c;
    }
    object.value = newAddr;
    return;
  }
  else if ( len == 17 )
  {
    var i = 2;
    var c0 = szAddr.charAt(0);
    var c1 = szAddr.charAt(1);

    if ( (doHexCheck(c0) < 0) || (doHexCheck(c1) < 0) )
    {
       alert("<%tcWebApi_get("String_Entry","WirelessJS10Text","s")%>");       	object.focus();
      return;
    }
    
    i = 2;
    while ( i < len )
    {
      var c0 = szAddr.charAt(i);
      var c1 = szAddr.charAt(i+1);
      var c2 = szAddr.charAt(i+2);  
      if ( (c0 != ":") || (doHexCheck(c1) < 0) || (doHexCheck(c2) < 0) )
      {
         alert("<%tcWebApi_get("String_Entry","WirelessJS10Text","s")%>");         	object.focus();
        return;
      }
      i = i + 3;
    }
    return; 
  }
  else
  {
  alert("<%tcWebApi_get("String_Entry","WirelessJS10Text","s")%>");     	object.focus();
    return;
  }
}

function isNumeric(s)
{
  var len= s.length;
  var ch;
  if(len==0)
    return false;
  for( i=0; i< len; i++)
  {
    ch= s.charAt(i);
    if( ch > '9' || ch < '0')
    {
      return false;
    }
  }
  return true;
}

function checkBeacon(value) 
{
  if (!isNumeric(value)) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS11Text","s")%>" + value);    return true;
  }
  if (value < 20 || value > 999) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS12Text","s")%>");    return true;  	
  }
  return false;
}

function checkRTS(value) 
{
  if (!isNumeric(value)) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS11Text","s")%>" + value);    return true;
  }
  if (value < 1500 || value > 2347) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS13Text","s")%>");    return true;  	
  }
  return false;
}

function checkFrag(value) 
{
  if (!isNumeric(value)) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS11Text","s")%>" + value);    return true;
  }
  if (value < 256 || value > 2346) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS14Text","s")%>");    return true;  	
  }
  if (value % 2) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS15Text","s")%>");    return true;  	
  }
  return false;
}

function checkDTIM(value) 
{
  if (!isNumeric(value)) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS11Text","s")%>" + value);    return true;
  }
  if (value < 1 || value > 255) {
    alert("<%tcWebApi_get("String_Entry","WirelessJS16Text","s")%>");		return true;
	}	
	return false;
}
<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
function checkStationNum(value, limit) 
{
	if (!isNumeric(value) || parseInt(value,10) < 0 || parseInt(value,10) > parseInt(limit,10)){
    	alert("Station Number value must be between 0 and " + limit);
		return true;
	}	
	return false;
}
<%End If%>
function checkRekeyinteral(value, flag) 
{
	if (!isNumeric(value)) {
		if(flag == 1){
			alert("<%tcWebApi_get("String_Entry","WirelessJS28Text","s")%>"); 
		}else{
			alert("<%tcWebApi_get("String_Entry","WirelessJS29Text","s")%>");
		}
		return true;
	}
	if (value < 10 || value > 4194303) {
		if(flag == 1){
			alert("<%tcWebApi_get("String_Entry","WirelessJS30Text","s")%>");
		}else{
			alert("<%tcWebApi_get("String_Entry","WirelessJS31Text","s")%>");
		}	
		return true;
	}	
	return false;
}

function quotationCheck(object, limit_len) {
	var len = object.value.length;
	var c;
	var i, j = 0;
    for (i = 0; i < len; i++)
    {
	 	var c = object.value.charAt(i);
      
	  	if (c == '"')
		{
			j += 6;
		}
		else
			j++;
    }
   	if (j > limit_len-1)
	{
    alert('<%tcWebApi_get("String_Entry","WirelessJS17Text","s")%>');		return true;
	}	
	return false;
}

function ValidateChecksum(PIN)
{
	var accum = 0;
	accum += 3 * (((PIN - PIN % 10000000) / 10000000) % 10);
	accum += 1 * (((PIN - PIN % 1000000) / 1000000) % 10);
	accum += 3 * (((PIN - PIN % 100000) / 100000) % 10);
	accum += 1 * (((PIN - PIN % 10000) / 10000) % 10);
	accum += 3 * (((PIN - PIN % 1000) / 1000) % 10);
	accum += 1 * (((PIN - PIN % 100) / 100) % 10);
	accum += 3 * (((PIN - PIN % 10) / 10) % 10);
	accum += 1 * (((PIN - PIN % 1) / 1) % 10);
	if ((accum % 10) == 0)
		return true;
	else
		return false;
}

<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") = "1"  then %>
//interface for future use
function ValidateChecksum_4(PIN)
{
		return true;
}

function ignoreSpaces(string) {
   var temp = "";
   string = '' + string;
   splitstring = string.split(" ");
   for(i = 0; i < splitstring.length; i++)
       temp += splitstring[i];
   return temp;
}

function ignoreDash(string) {
   var temp = "";
   string = '' + string;
   splitstring = string.split("-");
   for(i = 0; i < splitstring.length; i++)
       temp += splitstring[i];
   return temp;
}
<%end if%>

function doPINCodeCheck(object)
{
	var len= object.value.length;
	var ch;
<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") = "1"  then %>
	if(len==9)
	{
		
		acutal_value=0;
		ch_4= object.value.charAt(4);
		if( ch_4 != ' ' & ch_4  != '-')
		{
				alert("<%tcWebApi_get("String_Entry","WirelessJS37Text","s")%>");
				return false;
		}
		object.value = ignoreSpaces(object.value);
		object.value = ignoreDash(object.value);
		
		if (ValidateChecksum(Number(object.value)) == false)
		{
			alert("WPS PIN code checksum error!");
			return false;
		}
                return true;
	}

	if(len==8)
	{
		for( i=0; i < len; i++)
		{
			ch= object.value.charAt(i);
			if( ch > '9' || ch < '0')
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS18Text","s")%>");
				return false;
			}
		}
		if (ValidateChecksum(Number(object.value)) == false){
			alert("<%tcWebApi_get("String_Entry","WirelessJS19Text","s")%>");
			return false;		
		}
		return true;
	}

	if(len==4)
	{
		for( i=0; i < len; i++)
		{
			ch= object.value.charAt(i);
			if( ch > '9' || ch < '0')
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS18Text","s")%>");
				return false;
			}
		}
		if (ValidateChecksum_4(Number(object.value)) == false)
		{
			alert("<%tcWebApi_get("String_Entry","WirelessJS19Text","s")%>");
			return false;
		}
		return true;
	}

	if(len==0)
	{
		return true;
	}

	alert("<%tcWebApi_get("String_Entry","WirelessJS37Text","s")%>");
	return false;
<%end if%>

<%if tcWebApi_get("WLan_Entry0","WscV2Support","h") <> "1"  then %>
	if (len > 0)
	{
		if(len < 8)
		{
			alert("<%tcWebApi_get("String_Entry","WirelessJS18Text","s")%>");
			return;
		}
		for( i=0; i < len; i++)
		{
			ch= object.value.charAt(i);
			if( ch > '9' || ch < '0')
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS18Text","s")%>");
				return;
			}
		}
		if (ValidateChecksum(Number(object.value)) == false)
		{
			alert("<%tcWebApi_get("String_Entry","WirelessJS19Text","s")%>");
		}
		return;
	}
<%end if%>	

}
<%end if%>	

<% If tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %>
<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>
var initFlag = true;
function initWLanTxBeamFormingSel()			//init TxBeamforming sel
{
	var ITxBfEn = "<%tcWebApi_get("WLan_Common","ITxBfEn","s")%>";
	var ETxBfEnCond = "<%tcWebApi_get("WLan_Common","ETxBfEnCond","s")%>";
	var ETxBfIncapable = "<%tcWebApi_get("WLan_Common","ETxBfIncapable","s")%>";
	if(ITxBfEn == "1" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		//Both
	{
		document.WLAN.WLanTxBeamForming[0].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "1" && ETxBfIncapable == "0")		//Explicit
	{
		document.WLAN.WLanTxBeamForming[1].selected = true;
	}
	else if(ITxBfEn == "1" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		//Implicit
	{
		document.WLAN.WLanTxBeamForming[2].selected = true;
	}
	else if(ITxBfEn == "0" && ETxBfEnCond == "0" && ETxBfIncapable == "1")		//Disable
	{
		document.WLAN.WLanTxBeamForming[3].selected = true;
	}
	else
	{
		document.WLAN.WLanTxBeamForming[3].selected = true;
	}
	if(document.WLAN.WirelessMode.selectedIndex >= 2)//cindy modify 3->2
	{
//		document.getElementById("WLanTxBeamForming").style.display="";
	}
	else
	{
//		document.getElementById("WLanTxBeamForming").style.display="none";
	}
}

function doVHTTxBeamFormingChange()
{
	if(document.WLAN.WLanTxBeamForming[0].selected == true)			//Both
	{
		document.WLAN.WLanITxBfEn.value = "1";
		document.WLAN.WLanETxBfEnCond.value = "1";
		document.WLAN.WLanETxBfIncapable.value = "0";
	}
	else if(document.WLAN.WLanTxBeamForming[1].selected == true)		//Explicit
	{
		document.WLAN.WLanITxBfEn.value = "0";
		document.WLAN.WLanETxBfEnCond.value = "1";
		document.WLAN.WLanETxBfIncapable.value = "0";
	}
	else if(document.WLAN.WLanTxBeamForming[2].selected == true)		//Implicit
	{
		document.WLAN.WLanITxBfEn.value = "1";
		document.WLAN.WLanETxBfEnCond.value = "0";
		document.WLAN.WLanETxBfIncapable.value = "1";
	}
	else if(document.WLAN.WLanTxBeamForming[3].selected == true)		//Disable
	{
		document.WLAN.WLanITxBfEn.value = "0";
		document.WLAN.WLanETxBfEnCond.value = "0";
		document.WLAN.WLanETxBfIncapable.value = "1";
	}
	else
	{
		document.WLAN.WLanITxBfEn.value = "0";
		document.WLAN.WLanETxBfEnCond.value = "0";
		document.WLAN.WLanETxBfIncapable.value = "1";
	}
}
<% end if %>	
function doSaveWepKEY()			//wepkey save to wds0key~wds3key
{
	var group;
	var curCBX;
	var vAuthMode = document.WLAN.WEP_Selection.value;

	if(vAuthMode == "Radius-WEP64")
		group = document.WLAN.DefWEPKey1;
	else if(vAuthMode == "Radius-WEP128")
		group = document.WLAN.DefWEPKey2;
	else if(vAuthMode == "WEP-64Bits")
		group = document.WLAN.DefWEPKey3;
	else if(vAuthMode == "WEP-128Bits")
		group = document.WLAN.DefWEPKey4;
		
	if(group != null)
	{
		for (var i=0; i<group.length; i++)
		{
			if (group[i].checked)
			break;
		}
	}
	
	if(vAuthMode == "Radius-WEP64")
	{
		switch (i)
		{
			case 0:
				curCBX = document.WLAN.WEP_Key11;
				break;
			case 1:
				curCBX = document.WLAN.WEP_Key21;
				break;
			case 2:
				curCBX = document.WLAN.WEP_Key31;
				break;
			case 3:
				curCBX = document.WLAN.WEP_Key41;
				break;
			default:
			  ;
		}
		document.WLAN.WEP_Key.value = curCBX.value;
	}
	else if(vAuthMode == "Radius-WEP128")
	{
		switch (i)
		{
		case 0:
			curCBX = document.WLAN.WEP_Key12;
			break;
		case 1:
			curCBX = document.WLAN.WEP_Key22;
			break;
		case 2:
			curCBX = document.WLAN.WEP_Key32;
			break;
		case 3:
			curCBX = document.WLAN.WEP_Key42;
			break;
		default:
		  ;
		}
		document.WLAN.WEP_Key.value = curCBX.value;
	}
	else if(vAuthMode == "WEP-64Bits")
	{
		switch (i)
		{
		case 0:
			curCBX = document.WLAN.WEP_Key13;
			break;
		case 1:
			curCBX = document.WLAN.WEP_Key23;
			break;
		case 2:
			curCBX = document.WLAN.WEP_Key33;
			break;
		case 3:
			curCBX = document.WLAN.WEP_Key43;
			break;
		default:
		  ;
		}
		document.WLAN.WEP_Key.value = curCBX.value;
	}
	else if(vAuthMode == "WEP-128Bits")
	{
		switch (i)
		{
		case 0:
			curCBX = document.WLAN.WEP_Key14;
			break;
		case 1:
			curCBX = document.WLAN.WEP_Key24;
			break;
		case 2:
			curCBX = document.WLAN.WEP_Key34;
			break;
		case 3:
			curCBX = document.WLAN.WEP_Key44;
			break;
		default:
		  ;
		}
		document.WLAN.WEP_Key.value = curCBX.value;
	}
}
<%end if%>

//cindy add for Determine if the last digit of the string is a space 07/02
function CheckthelastElementofSSID()
{
var ssidvalue=document.WLAN.ESSID.value;
var ssidlength=ssidvalue.length;
	if(ssidvalue.charAt(ssidlength-1)==" ")
	{
		alert("<%tcWebApi_get("String_Entry","WirelessJS42Text","s")%>");
		return false;
	}
		return true;
}
//cindy add for Determine if the last digit of the string is a space 07/02

function doSave(){
	<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	if(document.WLAN.SSID_INDEX.value==0){
        if(document.WLAN.WPSMode_Selection[0].selected)
        {
	var pincode = document.WLAN.WPSEnrolleePINCode;
	if((doPINCodeCheck(pincode) == false))
	{
	       return false;
	}
        }
	}
	<%end if%>
	<% if tcWebApi_get("Info_WLan","isbharti","h") = "Yes" then %>
	//if(0 == document.WLAN.WEP_Selection.selectedIndex)
	if(0 == WEPSelectIndex)	
	{
		return false;
	}
	<%end if%>
	//wang add 20180206
  
	if(document.WLAN.WLAN_FltActive[0].checked)
	{
	  var j=0;
      for(var i =0; i<tableData.length; i++){
	     var tableValueTmp = tableData[i][1];
		
	     if(tableValueTmp != "N/A" && tableValueTmp != "")
           j=j + 1;
	  }
	  
	  if(document.WLAN.LAN_Device_mac_select[0].selected)
	  { 
	     if(document.WLAN.LAN_Manual_Mac.value != "" && document.WLAN.LAN_Manual_Mac.value != "00:00:00:00:00:00")
	     {

	        if(doMACRepeatCheck()== 0)
	            return false;
	        if(j == 8)
            {
    	       alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText16","s")%>");
    	       return false;
            }
	        for(var i =0; i<tableData.length; i++)
	        {
               	var tableMACAddr0 = tableData[i][1];
               	if (tableMACAddr0 == "N/A" || tableMACAddr0 == "")
               	{
               	  document.WLAN.Mac_filter_id.value = i;
                  break;
                }
	        }
	        document.WLAN.Mac_filter_flag.value = 1;
	     }
	  }
	  else
	  {
	     if(doMACRepeatCheck()== 0)
	        return false;
	     if(j == 8)
         {
    	    alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText16","s")%>");
    	    return false;
         }
	     for(var i =0; i<tableData.length; i++)
	     {          
             var tableMACAddr1 = tableData[i][1];
            if (tableMACAddr1 == "N/A" || tableMACAddr1 == "")
            {
                document.WLAN.Mac_filter_id.value = i;
               	break;
            }
	     }
         document.WLAN.Mac_filter_flag.value = 2;
      }
    }

	//wang add end
	if(checkBeacon(document.WLAN.BeaconInterval.value) ||
		checkRTS(document.WLAN.RTSThreshold.value) ||
		checkFrag(document.WLAN.FragmentThreshold.value) ||
		checkDTIM(document.WLAN.DTIM.value)
	<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
		|| checkStationNum(document.WLAN.StationNum.value, document.WLAN.maxStaNum.value)
	<%End If%>
	){
		return false;
	}
		
	//if(document.WLAN.WEP_Selection.selectedIndex == 3){
	if(WEPSelectIndex == 1){ //wang change 3 to 1. this is the wpapsk encryption
		document.WLAN.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.WLAN.PreSharedKey2)){
			return false;
		}
		
		if(quotationCheck(document.WLAN.PreSharedKey2, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.WLAN.keyRenewalInterval2.value, 0)){
			return false;
		}  			
	}
	//if(document.WLAN.WEP_Selection.selectedIndex == 4){
	if(WEPSelectIndex == 2){//wang change 4 to 2. this is the wpapsk encryption
		document.WLAN.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.WLAN.PreSharedKey1)){
			return false;
		}
		
		if(quotationCheck(document.WLAN.PreSharedKey1, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.WLAN.keyRenewalInterval1.value, 0)){
			return false;
		}  			
	}
	//if(document.WLAN.WEP_Selection.selectedIndex == 5){
	if(WEPSelectIndex == 3){//wang change 5 to 3. this is the wpapsk encryption
		document.WLAN.hRekeyMethod.value = "TIME";
		if (wpapskCheck(document.WLAN.PreSharedKey3)){
			return false;
		}
		
		if(quotationCheck(document.WLAN.PreSharedKey3, 385) ){
			return false;	 
		}
		if(checkRekeyinteral(document.WLAN.keyRenewalInterval3.value, 0)){
			return false;
		}  			
	}
      	
	//if(document.WLAN.WEP_Selection.selectedIndex == 5){
	//	document.WLAN.hRekeyMethod.value = "TIME";		
	//}
	//if(document.WLAN.WEP_Selection.selectedIndex == 1){
	if(WEPSelectIndex == 1){ 
		document.WLAN.hRekeyMethod.value = "DISABLE";
		if((!doKEYcheck(document.WLAN.WEP_Key13))||
		(!doKEYcheck(document.WLAN.WEP_Key23))||
		(!doKEYcheck(document.WLAN.WEP_Key33))||
		(!doKEYcheck(document.WLAN.WEP_Key43))){
			//alert("key check fail");
			return false;
		}
	}
	
	//if(document.WLAN.WEP_Selection.selectedIndex == 2){
	if(WEPSelectIndex == 2){ 
		document.WLAN.hRekeyMethod.value = "DISABLE";
		if((!doKEYcheck(document.WLAN.WEP_Key14))||
		(!doKEYcheck(document.WLAN.WEP_Key24))||
		(!doKEYcheck(document.WLAN.WEP_Key34))||
		(!doKEYcheck(document.WLAN.WEP_Key44))){
			//alert("key check fail");
			return false;
		}
	}
	
	if(document.WLAN.isDot1XSupported.value==1)
	{	
		//if(document.WLAN.WEP_Selection.selectedIndex == 6)
		if(WEPSelectIndex == 6) 
		{
			if((!doKEYcheck(document.WLAN.WEP_Key11))||
			(!doKEYcheck(document.WLAN.WEP_Key21))||
			(!doKEYcheck(document.WLAN.WEP_Key31))||
			(!doKEYcheck(document.WLAN.WEP_Key41)))
			{
				//alert("key check fail");
				return false;
			}
		}
		//if(document.WLAN.WEP_Selection.selectedIndex == 7)
		if(WEPSelectIndex == 7) 
		{
			if((!doKEYcheck(document.WLAN.WEP_Key12))||
			(!doKEYcheck(document.WLAN.WEP_Key22))||
			(!doKEYcheck(document.WLAN.WEP_Key32))||
			(!doKEYcheck(document.WLAN.WEP_Key42)))
			{
				//alert("key check fail");
				return false;
			}
		}
		<%if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
		var vAuthMode = document.WLAN.WEP_Selection.selectedIndex + 1;
		<%else%>
		var vAuthMode = document.WLAN.WEP_Selection.selectedIndex;
		<%end if%>
		//var vAuthMode = document.WLAN.WEP_Selection.selectedIndex;
		//if((document.WLAN.WEP_Selection.selectedIndex == 6) ||(document.WLAN.WEP_Selection.selectedIndex == 7) 
		//|| (document.WLAN.WEP_Selection.selectedIndex == 8) || (document.WLAN.WEP_Selection.selectedIndex == 9)
		//|| (document.WLAN.WEP_Selection.selectedIndex == 10))
		if((WEPSelectIndex == 6) || (WEPSelectIndex == 7) || (WEPSelectIndex == 8) || (WEPSelectIndex == 9)
		|| (WEPSelectIndex == 10))
		{
			if(document.WLAN.isDot1XEnhanceSupported.value == 0)
			{
				if(vAuthMode == 6){
					radiusip = document.WLAN.radiusSVR_IP1.value;
				}
				else if(vAuthMode == 7){
					radiusip = document.WLAN.radiusSVR_IP2.value;
				}
				else if(vAuthMode == 8){
					radiusip = document.WLAN.radiusSVR_IP3.value;
				}
				else if(vAuthMode == 9){
					radiusip = document.WLAN.radiusSVR_IP4.value;
				}
				else if(vAuthMode == 10){
					radiusip = document.WLAN.radiusSVR_IP5.value;
				}								
				
				 if(inValidIPAddr(radiusip))
				 {
					return false;
				 }
			}
			 //serverport
			//radiusport = parseInt(document.WLAN.radiusSVR_Port.value);
			if(vAuthMode == 6){
				radiusport = parseInt(document.WLAN.radiusSVR_Port1.value);
				radiuskey = document.WLAN.radiusSVR_Key1.value;
				if(RadiusKeyCheck(document.WLAN.radiusSVR_Key1))
						return false; 
				session_timeout_interval = document.WLAN.radiusSVR_ReAuthInter1.value;
			}
			else if(vAuthMode == 7){
				radiusport = parseInt(document.WLAN.radiusSVR_Port2.value);
				radiuskey = document.WLAN.radiusSVR_Key2.value;
				if(RadiusKeyCheck(document.WLAN.radiusSVR_Key2))
						return false; 
				session_timeout_interval = document.WLAN.radiusSVR_ReAuthInter2.value;
			}
			else if(vAuthMode == 8){
				radiusport = parseInt(document.WLAN.radiusSVR_Port3.value);
				radiuskey = document.WLAN.radiusSVR_Key3.value;
				if(RadiusKeyCheck(document.WLAN.radiusSVR_Key3))
						return false; 
				session_timeout_interval = document.WLAN.radiusSVR_ReAuthInter3.value;
			}
			else if(vAuthMode == 9){
				radiusport = parseInt(document.WLAN.radiusSVR_Port4.value);
				radiuskey = document.WLAN.radiusSVR_Key4.value;
				if(RadiusKeyCheck(document.WLAN.radiusSVR_Key4))
						return false; 
				session_timeout_interval = document.WLAN.radiusSVR_ReAuthInter4.value;
			}
			else if(vAuthMode == 10){
				radiusport = parseInt(document.WLAN.radiusSVR_Port5.value);
				radiuskey = document.WLAN.radiusSVR_Key5.value;
				if(RadiusKeyCheck(document.WLAN.radiusSVR_Key5))
						return false; 
				session_timeout_interval = document.WLAN.radiusSVR_ReAuthInter5.value;
			}
			if(isNaN(radiusport) || radiusport < 0 || radiusport > 65535)
			{	
				alert("<%tcWebApi_get("String_Entry","WirelessJS21Text","s")%>");
				return false;
			}
			
			// radius share key
			//radiuskey = document.WLAN.radiusSVR_Key.value;
			{
				if (radiuskey.length == 0)
				{
  					alert("<%tcWebApi_get("String_Entry","WirelessJS22Text","s")%>"); 
  					return false; 
				}
			}
			//session_timeout_interval = document.WLAN.radiusSVR_ReAuthInter.value;
			{
				if (session_timeout_interval.length == 0)
				{
  					alert("<%tcWebApi_get("String_Entry","WirelessJS23Text","s")%>"); 
  					return false; 
				}
			}
   		 }
		//if((document.WLAN.WEP_Selection.selectedIndex == 8) //WPA
		//	|| (document.WLAN.WEP_Selection.selectedIndex == 9) //WPA2
		//	|| (document.WLAN.WEP_Selection.selectedIndex == 10)) //WPAWPA2
		if((WEPSelectIndex == 8) || (WEPSelectIndex == 9) || (WEPSelectIndex == 10))
		{
			if(vAuthMode == 8){
				WPARekeyInter = document.WLAN.WPARekeyInter3.value;
			}
			else if(vAuthMode == 9){
				WPARekeyInter = document.WLAN.WPARekeyInter4.value;
			}
			else if(vAuthMode == 10){
				WPARekeyInter = document.WLAN.WPARekeyInter5.value;
			}
			
			if(checkRekeyinteral(WPARekeyInter, 1)){
				return false;	
			}
   		 }
	}
	
	//if wds support meantime AuthMode of MAIN SSID is wpa2psk,wpapsk WPAPSKWPA2PSK , then check wds key 
	if(document.WLAN.isWDSSupported.value==1)
	{
		if(document.WLAN.WLAN_WDS_Active[0].checked == true)//if wds enable ,to check wds_key, or not to check
		{
			if(document.WLAN.isDot1XSupported.value==1)
			{
//				if((document.WLAN.WEP_Selection.selectedIndex == 3) ||
//				(document.WLAN.WEP_Selection.selectedIndex == 4) || (document.WLAN.WEP_Selection.selectedIndex == 5)
//				|| (document.WLAN.WEP_Selection.selectedIndex == 8) || (document.WLAN.WEP_Selection.selectedIndex == 9)
//				|| (document.WLAN.WEP_Selection.selectedIndex == 10))
				if((WEPSelectIndex == 3) || (WEPSelectIndex == 4) || (WEPSelectIndex == 5)
				|| (WEPSelectIndex == 8) || (WEPSelectIndex == 9) || (WEPSelectIndex == 10))
				{
					if (WDSKeyCheck(document.WLAN.WDS_Key))
					{
						return false;
					}
			
					if(quotationCheck(document.WLAN.WDS_Key, 385) )
					{
						return false;	 
					}  			
				}	
			}
			else
			{
//				if((document.WLAN.WEP_Selection.selectedIndex == 3) ||
//				(document.WLAN.WEP_Selection.selectedIndex == 4) || (document.WLAN.WEP_Selection.selectedIndex == 5))
				if((WEPSelectIndex == 3) || (WEPSelectIndex == 4) || (WEPSelectIndex == 5))
				{
					if (WDSKeyCheck(document.WLAN.WDS_Key))
					{
						return false;
					}
					if(quotationCheck(document.WLAN.WDS_Key, 385) )
					{
						return false;	 
					}  			
				}	
			}
		}
	}
	if(quotationCheck(document.WLAN.ESSID, 193)||strESSIDCheck(document.WLAN.ESSID)){
		return;	   
	}
//cindy add for Determine if the last digit of the string is a space 07/02
	if(CheckthelastElementofSSID()==false)
	{
		return;
	}
//cindy add for Determine if the last digit of the string is a space 07/02

/*
	if(!checkSelectedKEY()){
		return false;
	}
*/

	document.WLAN.wlanWEPFlag.value = 3;
	if(document.WLAN.WirelessMode.selectedIndex>=2){//cindy modify 3->2
		document.WLAN.Is11nMode.value=1;
		<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if(document.WLAN.WLANChannelBandwidth.selectedIndex == 2){
			document.WLAN.Wlan_HTBW40M.value = 1;
			document.WLAN.WLANChannelBandwidth.value = 1;
		}
		else if(document.WLAN.WLANChannelBandwidth.selectedIndex == 1){
			document.WLAN.Wlan_HTBW40M.value = 0;
			document.WLAN.WLANChannelBandwidth.value = 1;
		}
		else{
			document.WLAN.WLANChannelBandwidth.value = 0;
		}
		<%end if%>	
	}else{
		document.WLAN.Is11nMode.value=0;
	}
	<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>	
	doSaveWepKEY();
	<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>
	doVHTTxBeamFormingChange();
	<% end if %>	
	<% end if %>	
	showSpin();//cindy add 
	document.WLAN.submit();
}

function checkSelectedKEY(){
	var group;
	var curCBX;
	var vAuthMode = document.WLAN.WEP_Selection.value;
	if(vAuthMode == "Radius-WEP64"){
		group = document.WLAN.DefWEPKey1;
	}
	else if(vAuthMode == "Radius-WEP128"){
		group = document.WLAN.DefWEPKey2;
	}
	else if(vAuthMode == "WEP-64Bits"){
		group = document.WLAN.DefWEPKey3;
	}
	else if(vAuthMode == "WEP-128Bits"){
		group = document.WLAN.DefWEPKey4;
	}

	for (var i=0; i<group.length; i++){
		if (group[i].checked)
		break;
	}
	
	if(vAuthMode == "Radius-WEP64"){
		switch (i)
		{
		case 0:
			curCBX = document.WLAN.WEP_Key11;
			break;
		case 1:
			curCBX = document.WLAN.WEP_Key21;
			break;
		case 2:
			curCBX = document.WLAN.WEP_Key31;
			break;
		case 3:
			curCBX = document.WLAN.WEP_Key41;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "Radius-WEP128"){
		switch (i)
		{
		case 0:
			curCBX = document.WLAN.WEP_Key12;
			break;
		case 1:
			curCBX = document.WLAN.WEP_Key22;
			break;
		case 2:
			curCBX = document.WLAN.WEP_Key32;
			break;
		case 3:
			curCBX = document.WLAN.WEP_Key42;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "WEP-64Bits"){
		switch (i)
		{
		case 0:
			curCBX = document.WLAN.WEP_Key13;
			break;
		case 1:
			curCBX = document.WLAN.WEP_Key23;
			break;
		case 2:
			curCBX = document.WLAN.WEP_Key33;
			break;
		case 3:
			curCBX = document.WLAN.WEP_Key43;
			break;
		default:
		  ;
		}
	}
	else if(vAuthMode == "WEP-128Bits"){
		switch (i)
		{
		case 0:
			curCBX = document.WLAN.WEP_Key14;
			break;
		case 1:
			curCBX = document.WLAN.WEP_Key24;
			break;
		case 2:
			curCBX = document.WLAN.WEP_Key34;
			break;
		case 3:
			curCBX = document.WLAN.WEP_Key44;
			break;
		default:
		  ;
		}
	}
	
	len=curCBX.value.length;
	index = curCBX.value.indexOf("0x");
	
//	if(document.WLAN.WEP_Selection.selectedIndex==1)/*wep 64*/
	if(WEPSelectIndex==1)/*wep 64*/
	{
		if(len==5)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doNonSympolCheck(c)==-1)
				{
					alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==10)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==12)
		{
			if(index==0)
			{
				for(i=2;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
						curCBX.focus();
						return false;
					}
				}
			}
			else
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
				curCBX.focus();
				return false;
			}
		}
		else
		{
			alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
			curCBX.focus();
			return false;
		}
	}
//	else if(document.WLAN.WEP_Selection.selectedIndex==2)/*wep 128*/
	else if(WEPSelectIndex==2)/*wep 128*/
	{
		if(len==13)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doNonSympolCheck(c)==-1)
				{
					alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==26)
		{
			for(i=0;i<len;i++)
			{
				var c = curCBX.value.charAt(i);	
				if(doHexCheck(c)==-1)
				{
					alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
					curCBX.focus();
					return false;
				}
			}
		}
		else if(len==28)
		{
			if(index==0)
			{
				for(i=2;i<len;i++)
				{
					var c = curCBX.value.charAt(i);	
					if(doHexCheck(c)==-1)
					{
						alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
						curCBX.focus();
						return false;
					}
				}
			}
			else
			{
				alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
				curCBX.focus();
				return false;
			}
		}
		else
		{
			alert("<%tcWebApi_get("String_Entry","WirelessJS9Text","s")%>");
			curCBX.focus();
			return false;
		}
	}
}

function checkFocus(value){
	//if(document.form.WEP_Selection.selectedIndex == 0){
	if(WEPSelectIndex == 0){
		document.form.WEP_Selection.focus();
	}
}

function autoWLAN_WDS_Active()
{
	if(document.WLAN.WDS_EncrypType_Selection != null){
		document.WLAN.WDS_EncrypType_Selection.disabled = false;
		document.WLAN.WDS_Key.disabled = false;
	}
	document.WLAN.WLANWDS_PEER_MAC1.disabled = false;
	document.WLAN.WLANWDS_PEER_MAC2.disabled = false;
	document.WLAN.WLANWDS_PEER_MAC3.disabled = false;
	document.WLAN.WLANWDS_PEER_MAC4.disabled = false;
}	

function autoWLAN_WDS_Deactive()
{
	if(document.WLAN.WDS_EncrypType_Selection != null){
		document.WLAN.WDS_EncrypType_Selection.disabled = true;
		document.WLAN.WDS_Key.disabled = true;
	}
	document.WLAN.WLANWDS_PEER_MAC1.disabled = true;
	document.WLAN.WLANWDS_PEER_MAC2.disabled = true;
	document.WLAN.WLANWDS_PEER_MAC3.disabled = true;
	document.WLAN.WLANWDS_PEER_MAC4.disabled = true;
}

function doLoad(){
             
	//cindy  add for remove RTS/CTS
	//disablewifi();
	//disablemacfilter();
	document.getElementById("RTSThreshold").style.display="none";
	//cindy add end 
	document.getElementById("FragmentThreshold").style.display="none";
	//foxconn steve add start
	var ssidIndex = document.WLAN.SSID_INDEX.value;
	if(ssidIndex == 0){
		<% if tcWebApi_get("WLan_Entry","WPSMode","h") = "0" then %>
			document.getElementById("WPSMode_SelectionDiv").style.display="";
			document.getElementById("WPSMode_SelectionDiv1").style.display="";
		<%else %>
			document.getElementById("WPSMode_SelectionDiv").style.display="none";
			document.getElementById("WPSMode_SelectionDiv1").style.display="none";
		<%end if%>

		<% if tcWebApi_get("WLan_Entry","WPSPinMode","h") = "0" then %>
			document.getElementById("WPSAPPinMode").style.display="";
			document.getElementById("WPSSTAPinMode").style.display="none";
		<%else %>
			document.getElementById("WPSAPPinMode").style.display="none";
			document.getElementById("WPSSTAPinMode").style.display="";
		<%end if%>
	}	
	//foxconn steve add end	

	doCheckSSID();
	//Foxconn alan modidy for FPT test wifi country code issue (20171101) 
	//RefreshPage();
	doRegionCheck();
	doCheckWepSelectIndex();	
	<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>
	<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>		
	if(initFlag == true)
	{
		initWLanTxBeamFormingSel();
		initFlag = false;
	}
	<% end if %>
	<% end if %>
	if(document.WLAN.isDot1XSupported.value==1)
	{
		if(document.WLAN.isAuthenTypeSupported.value==1)
		{
			document.getElementById("WEP_Selection_div").style.display="none";
			document.getElementById("WEP_Selection_show_div").style.display="";
			doWEPChange2();
		}
		else
		{
			document.getElementById("WEP_Selection_div").style.display="";
			document.getElementById("WEP_Selection_show_div").style.display="none";
		}
	}	
	if(document.WLAN.WirelessMode.selectedIndex>=2){//cindy modify 3->2
		document.WLAN.Is11nMode.value=1;
		<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
		if((document.WLAN.WLANChannelBandwidth.selectedIndex == 1)||(document.WLAN.WLANChannelBandwidth.selectedIndex == 2)){
		<%else %>
		if(document.WLAN.WLANChannelBandwidth.selectedIndex == 1){
		<%end if%>
			if(document.WLAN.Channel_ID.selectedIndex <= 4){
				document.WLAN.WLANExtensionChannel.selectedIndex = 1;
				document.WLAN.WLANExtensionChannel.disabled = true;
				document.WLAN.ExtChannFlag.value = 1;
			}
			else if(document.WLAN.Channel_ID.selectedIndex >= 8){
				document.WLAN.WLANExtensionChannel.selectedIndex = 0;
				document.WLAN.WLANExtensionChannel.disabled = true;
				document.WLAN.ExtChannFlag.value = 0;
			}
			else{
				document.WLAN.WLANExtensionChannel.disabled = false;
				if(document.WLAN.WLANExtensionChannel.selectedIndex==0){
					document.WLAN.ExtChannFlag.value = 0;
				}else{
					document.WLAN.ExtChannFlag.value = 1;
				}
			}
				
		}
	}else{
		document.WLAN.Is11nMode.value=0;
	}
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
	if(document.WLAN.isInWPSing.value==1){
		document.WLAN.ResetOOB.disabled = true;
		document.WLAN.BUTTON.disabled = true;
		document.WLAN.CancelBtn.disabled = true;
	}
	if(document.WLAN.wlan_VC.value==0){
		wpsenable = document.WLAN.UseWPS_Selection[0].checked;
	}
<%end if%>
//	wepidx = document.WLAN.WEP_Selection.selectedIndex;
	wepidx = WEPSelectIndex;

	if(document.WLAN.isWDSSupported.value==1)
	{
		if(document.WLAN.WLAN_WDS_Active[0].checked == true){//if wds enable
			autoWLAN_WDS_Active();
		}else if(document.WLAN.WLAN_WDS_Active[1].checked == true){//if wds disable
			autoWLAN_WDS_Deactive();
		}
	}
	if(document.WLAN.bharti_ssid2.value==1)
		doloadSSID2();		
}

function doCheckSSID()
{
	var ssid_val = document.WLAN.wlan_VC.value;
	var ssid_optval = document.WLAN.SSID_INDEX.value;
	if(ssid_val != ssid_optval)
	{
		document.WLAN.wlanWEPFlag.value = 2;
		document.WLAN.submit();
	}
}

function doloadSSID2()
{
	if(document.WLAN.SSID_INDEX.selectedIndex == 1)
	{
		var j;
		var frm = document.WLAN;
		for(j = 0; j < frm.elements.length; j++)
		{	
			if(frm.elements[j].type != "hidden")		
				frm.elements[j].disabled = true;
		}
	}
	document.WLAN.SSID_INDEX.disabled = false;
}

var bInit = 1;

function RefreshPage(){
	var autoText = "<%tcWebApi_get("String_Entry","WirelessGuardInterval1Text","s")%>";
	var index = 0;
	var ctlChannel_ID = document.WLAN.Channel_ID;
	var vChannel = ctlChannel_ID.value;
	var vCountryRegion = document.WLAN.hCountryRegion.value;
	if(bInit == 1){
		vChannel = "<%tcWebApi_get("WLan_Common","Channel","s")%>";
		bInit = 0;
	}
	ctlChannel_ID.length = 0;
	if(vCountryRegion == 0){
		ctlChannel_ID.options[index++] = new Option(autoText, "0");
		ctlChannel_ID.options[index++] = new Option("01", "1");
		ctlChannel_ID.options[index++] = new Option("02", "2");
		ctlChannel_ID.options[index++] = new Option("03", "3");
		ctlChannel_ID.options[index++] = new Option("04", "4");
		ctlChannel_ID.options[index++] = new Option("05", "5");
		ctlChannel_ID.options[index++] = new Option("06", "6");
		ctlChannel_ID.options[index++] = new Option("07", "7");
		ctlChannel_ID.options[index++] = new Option("08", "8");
		ctlChannel_ID.options[index++] = new Option("09", "9");
		ctlChannel_ID.options[index++] = new Option("10", "10");
		ctlChannel_ID.options[index++] = new Option("11", "11");
	}else if(vCountryRegion == 2){
		ctlChannel_ID.options[index++] = new Option(autoText, "0");
		ctlChannel_ID.options[index++] = new Option("10", "10");
		ctlChannel_ID.options[index++] = new Option("11", "11");
	}else if(vCountryRegion == 3){
		ctlChannel_ID.options[index++] = new Option(autoText, "0");
		ctlChannel_ID.options[index++] = new Option("10", "10");
		ctlChannel_ID.options[index++] = new Option("11", "11");
		ctlChannel_ID.options[index++] = new Option("12", "12");
		ctlChannel_ID.options[index++] = new Option("13", "13");
	}else if(vCountryRegion == 4){
		ctlChannel_ID.options[index++] = new Option(autoText, "0");
		ctlChannel_ID.options[index++] = new Option("04", "4");
	}else if(vCountryRegion == 5){
		ctlChannel_ID.options[index++] = new Option(autoText, "0");
		ctlChannel_ID.options[index++] = new Option("01", "1");
		ctlChannel_ID.options[index++] = new Option("02", "2");
		ctlChannel_ID.options[index++] = new Option("03", "3");
		ctlChannel_ID.options[index++] = new Option("04", "4");
		ctlChannel_ID.options[index++] = new Option("05", "5");
		ctlChannel_ID.options[index++] = new Option("06", "6");
		ctlChannel_ID.options[index++] = new Option("07", "7");
		ctlChannel_ID.options[index++] = new Option("08", "8");
		ctlChannel_ID.options[index++] = new Option("09", "9");
		ctlChannel_ID.options[index++] = new Option("10", "10");
		ctlChannel_ID.options[index++] = new Option("11", "11");
		ctlChannel_ID.options[index++] = new Option("12", "12");
		ctlChannel_ID.options[index++] = new Option("13", "13");
		ctlChannel_ID.options[index++] = new Option("14", "14");
	}else if(vCountryRegion == 6){
		ctlChannel_ID.options[index++] = new Option(autoText, "0");
		ctlChannel_ID.options[index++] = new Option("03", "3");
		ctlChannel_ID.options[index++] = new Option("04", "4");
		ctlChannel_ID.options[index++] = new Option("05", "5");
		ctlChannel_ID.options[index++] = new Option("06", "6");
		ctlChannel_ID.options[index++] = new Option("07", "7");
		ctlChannel_ID.options[index++] = new Option("08", "8");
		ctlChannel_ID.options[index++] = new Option("09", "9");
	}else{
		ctlChannel_ID.options[index++] = new Option(autoText, "0");
		ctlChannel_ID.options[index++] = new Option("01", "1");
		ctlChannel_ID.options[index++] = new Option("02", "2");
		ctlChannel_ID.options[index++] = new Option("03", "3");
		ctlChannel_ID.options[index++] = new Option("04", "4");
		ctlChannel_ID.options[index++] = new Option("05", "5");
		ctlChannel_ID.options[index++] = new Option("06", "6");
		ctlChannel_ID.options[index++] = new Option("07", "7");
		ctlChannel_ID.options[index++] = new Option("08", "8");
		ctlChannel_ID.options[index++] = new Option("09", "9");
		ctlChannel_ID.options[index++] = new Option("10", "10");
		ctlChannel_ID.options[index++] = new Option("11", "11");
		ctlChannel_ID.options[index++] = new Option("12", "12");
		ctlChannel_ID.options[index++] = new Option("13", "13");
	}
	ctlChannel_ID.options[0].selected=true;
	SelectValue(ctlChannel_ID, vChannel);
	
	if(document.WLAN.Is11nMode.value == "1"){
	//cindy hidden wmm 12/14
		document.getElementById("11nMode_0_div").style.display="none";
	//cindy hidden wmm 12/14
		document.getElementById("11nMode_1_div").style.display="";
	}else{
	//cindy hidden wmm 12/14
		document.getElementById("11nMode_0_div").style.display="none";
	//cindy hidden wmm 12/14
		document.getElementById("11nMode_1_div").style.display="none";
	}
	<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
	if((document.WLAN.WLANChannelBandwidth.value == 1) || (document.WLAN.WLANChannelBandwidth.value == 2))
	<%else %>
	if(document.WLAN.WLANChannelBandwidth.value == "1")
	<%end if%>
	//cindy hidden Extension Channel function 01.02
	//	document.getElementById("HT_BW_1_div").style.display="";
		document.getElementById("HT_BW_1_div").style.display="none";
	//cindy hidden Extension Channel function 01.02
	else
		document.getElementById("HT_BW_1_div").style.display="none";		
	<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>	
	if(document.WLAN.wlan_VC.value==0){
		if(document.WLAN.UseWPS_Selection[0].checked == true)
			document.getElementById("WPSConfMode_1_div").style.display="";
		else
			document.getElementById("WPSConfMode_1_div").style.display="none";
	}

	<%end if%>
	var vAuthMode = document.WLAN.WEP_Selection.value;
	if(document.getElementById("Radius-WEP64_div") != null) 
		document.getElementById("Radius-WEP64_div").style.display="none";
	if(document.getElementById("Radius-WEP128_div") != null)
		document.getElementById("Radius-WEP128_div").style.display="none";
	if(document.getElementById("WPA_div") != null)
		document.getElementById("WPA_div").style.display="none";
	if(document.getElementById("WPA2_div") != null)
		document.getElementById("WPA2_div").style.display="none";
	if(document.getElementById("WPA1WPA2_div") != null)
		document.getElementById("WPA1WPA2_div").style.display="none";
		
	if(vAuthMode == "Radius-WEP64"){
		if(document.getElementById("Radius-WEP64_div") != null) 
			document.getElementById("Radius-WEP64_div").style.display="";
	}
	if(vAuthMode == "Radius-WEP128"){
		if(document.getElementById("Radius-WEP128_div") != null)
			document.getElementById("Radius-WEP128_div").style.display="";
	}
	if(vAuthMode == "WPA"){
		if(document.getElementById("WPA_div") != null)
			document.getElementById("WPA_div").style.display="";
	}
	if(vAuthMode == "WPA2"){
		if(document.getElementById("WPA2_div") != null)
			document.getElementById("WPA2_div").style.display="";
	}
	if(vAuthMode == "WPA1WPA2"){
		if(document.getElementById("WPA1WPA2_div") != null)
			document.getElementById("WPA1WPA2_div").style.display="";
	}
		
	if(document.getElementById("WEP-64Bits_div") != null)
		document.getElementById("WEP-64Bits_div").style.display="none";
	if(document.getElementById("WEP-128Bits_div") != null)
		document.getElementById("WEP-128Bits_div").style.display="none";
	if(document.getElementById("WPA2PSK_div") != null)
		document.getElementById("WPA2PSK_div").style.display="none";
	if(document.getElementById("WPAPSK_div") != null)
		document.getElementById("WPAPSK_div").style.display="none";
	if(document.getElementById("WPAPSKWPA2PSK_div") != null)
		document.getElementById("WPAPSKWPA2PSK_div").style.display="none";	
	if(vAuthMode == "WEP-64Bits"){
		if(document.getElementById("WEP-64Bits_div") != null)
			document.getElementById("WEP-64Bits_div").style.display="";
	}else if(vAuthMode == "WEP-128Bits"){
		if(document.getElementById("WEP-128Bits_div") != null)
			document.getElementById("WEP-128Bits_div").style.display="";
	}else if(vAuthMode == "WPA2PSK"){
		if(document.getElementById("WPA2PSK_div") != null)
			document.getElementById("WPA2PSK_div").style.display="";
	}else if(vAuthMode == "WPAPSK"){
		if(document.getElementById("WPAPSK_div") != null)
			document.getElementById("WPAPSK_div").style.display="";
	}else if(vAuthMode == "WPAPSKWPA2PSK"){
		if(document.getElementById("WPAPSKWPA2PSK_div") != null)
			document.getElementById("WPAPSKWPA2PSK_div").style.display="";	
	}
	
	if(document.getElementById("else_div") != null)
		document.getElementById("else_div").style.display="none";
	if(vAuthMode == "OPEN")
		;
	else if(vAuthMode == "WEP-64Bits")
		;
	else if(vAuthMode == "WEP-128Bits")
		;
	else if(vAuthMode == "Radius-WEP64")
		;
	else if(vAuthMode == "Radius-WEP128")
		;
	else if(document.getElementById("else_div") != null)
		document.getElementById("else_div").style.display="";
}

function SelectValue(o,v){
	for(var i=0; i<o.options.length; i++)
		if(o.options[i].value == v){
		o.options[i].selected=true;
		break;
	}
}

<%if tcWebApi_get("WebCustom_Entry","isFonV2Support","h") = "Yes" Then%>
function deavtiveWifi(){
	    	alert("<%tcWebApi_get("String_Entry","FonDownWifiWarningText","s")%>");
		return true;
}
<%end if%>

//cindy add start 12/14
function disablewifi()
{
if(document.WLAN.wlan_APenable[1].checked==true)
	{
		document.getElementById("hiddenwififunction").style.display="none";
	}
else{
		document.getElementById("hiddenwififunction").style.display="";
	}
}

function disablemacfilter()
{
if(document.WLAN.WLAN_FltActive[1].checked==true)
	{
		document.getElementById("div_macfilter").style.display="none";
	}
else{
		document.getElementById("div_macfilter").style.display="";
	}
}
//cindy add end 12/14

//wang add 201802

function doMACRepeatCheck()
{
  if(document.WLAN.LAN_Device_mac_select[0].selected == true)
     var madaddr = document.WLAN.LAN_Manual_Mac.value;  
  else
     var madaddr = document.WLAN.LAN_Device_mac_select.value;
     
  var macaddrv = madaddr.toUpperCase();
  for(var i =0; i<tableData.length; i++)
  {
	var tableMACAddrTmp = tableData[i][1];
	var tableMACAddr = tableMACAddrTmp.toUpperCase();

     if(macaddrv == tableMACAddr)
     {
         alert("<%tcWebApi_get("String_Entry","QosBandwidthControlText11","s")%>");
	     return 0;
     }	
  }
  return 1;
}
function doMACaddressChange()
{
  if(document.WLAN.LAN_Device_mac_select[0].selected == true)
  {
     document.getElementById("ManuallyMacAddr").style.display=""; 
     if(doMACRepeatCheck() == 0)
        return;
  }
  else{
     document.getElementById("ManuallyMacAddr").style.display="none";
  } 
}

function showTable(id,header,data,keyIndex){
	var html = ["<table id=client_list width=640 border=0  cellpadding=1 cellspacing=0  bordercolor=#CCCCCC>"];
	// 1.generate table header
	html.push("<tr bgcolor=#FFFFFF height=30>");
	for(var i =0; i<header.length; i++){
		html.push("<td width=" + header[i][0] + " align=center class=tablelisttitle>" + header[i][1] + "</td>");
	}
	html.push("</tr>");
	// 2.generate table data
	for(var i =0; i<data.length; i++){
		if(data[i][keyIndex] != "N/A" && data[i][keyIndex] != ""){
			html.push("<tr bgcolor=#FFFFFF height=30 id=tablebutton>");
			for(var j=0; j<(data[i].length - 1); j++){
				html.push("<td align=center  class=topborderstyle>" + data[i][j] + "</td>");
			}
			if(document.WLAN.WLAN_FltAction[0].selected)
			  html.push("<td align=center  class=topborderstyle>" + 
			  "<%tcWebApi_get("String_Entry","WirelessAction0Text","s")%>" + "</td>");
			else
			  html.push("<td align=center  class=topborderstyle>" + 
			  "<%tcWebApi_get("String_Entry","WirelessAction1Text","s")%>" + "</td>");

			html.push('<td align=center  class=topborderstyle> <INPUT TYPE="button" class="button3" NAME="RemoveBtn" VALUE="<%tcWebApi_get("String_Entry","QosBandwidthControlText6","s")%>" onClick=doDeleteRule(' + data[i][j] + ');> </td>');
			html.push("</tr>");
		}
	}
	html.push("</table>");
	document.getElementById(id).innerHTML = html.join('');
}

function doDeleteRule(i)
 {
 	document.WLAN.delnum.value=i;
	document.WLAN.submit();
}
//wang add end

</script>

<script language="JavaScript">
/*cindy delete0919
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
	if(parseInt(document.WLAN.LeaseNum.value)>10)
	{
		html.push("<input type=button name=MORE  value=More... onClick=javascript:window.open(\"/cgi-bin/more_rssi_list_2.asp\")>");
	}

	document.getElementById(id).innerHTML = html.join('');
}
*/
</script>



</head>
<body onLoad="doLoad()">
<FORM METHOD="POST" ACTION="/cgi-bin/home_wireless.asp" name="WLAN">
<INPUT TYPE="HIDDEN" NAME="isWPSSupported" value="<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
<INPUT TYPE="HIDDEN" NAME="WscV2Support" value="<% if tcWebApi_get("WLan_Entry0","WscV2Support","h") = "1" then asp_write("1") else asp_write("0") end if %>">
<INPUT TYPE="HIDDEN" NAME="BasicRate_Value1" VALUE="15">
<INPUT TYPE="HIDDEN" NAME="BasicRate_Value2" VALUE="3">
<INPUT TYPE="HIDDEN" NAME="BasicRate_Value3" VALUE="351">
<INPUT TYPE="HIDDEN" NAME="CountryRegion0" value="0">
<INPUT TYPE="HIDDEN" NAME="CountryRegion1" value="1">
<INPUT TYPE="HIDDEN" NAME="CountryRegion2" value="2">
<INPUT TYPE="HIDDEN" NAME="CountryRegion3" value="3">
<INPUT TYPE="HIDDEN" NAME="CountryRegion5" value="5">
<INPUT TYPE="HIDDEN" NAME="CountryRegion6" value="6">
<!-- Foxconn alan add start for FPT test country code issue (20171102) -->
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand0" value="0">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand1" value="1">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand2" value="2">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand3" value="3">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand4" value="4">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand5" value="5">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand6" value="6">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand7" value="7">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand8" value="8">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand9" value="9">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand10" value="10">
<INPUT TYPE="HIDDEN" NAME="CountryRegionABand11" value="11">
<!-- Foxconn alan add end (20171102) -->
<INPUT TYPE="HIDDEN" NAME="HTMCSAUTO" value="33">
<INPUT TYPE="HIDDEN" NAME="HTBW" value="0">
<%if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
<INPUT TYPE="HIDDEN" NAME="WPSConfigured" value="2">
<INPUT TYPE="HIDDEN" NAME="WpsConfModeAll" value="7">
<INPUT TYPE="HIDDEN" NAME="WpsConfModeNone" value="0">
<INPUT TYPE="HIDDEN" NAME="WpsStart" value="0">
<INPUT TYPE="HIDDEN" NAME="WpsOOB" value="0">
<INPUT TYPE="HIDDEN" NAME="isInWPSing" value="<%tcWebApi_get("Info_WLan","wlanWPStimerRunning","s")%>">
<INPUT TYPE="HIDDEN" NAME="WpsGenerate" value="0">
<%end if%>
<INPUT TYPE="HIDDEN" NAME="Is11nMode"  value="<%tcWebApi_get("WLan_Common","11nMode","s")%>">
<INPUT TYPE="HIDDEN" NAME="is11nSpecComply"  value="<%tcWebApi_get("Info_WLan","is11nSpecComply","s")%>">
<INPUT TYPE="HIDDEN" NAME="isWPA2PreAuthSupported"  value="<%tcWebApi_get("Info_WLan","isWPA2PreAuthSupported","s")%>">
<% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
<INPUT TYPE="HIDDEN" NAME="Wlan_HTBW40M" value="<%tcWebApi_get("WLan_Common","HT_BSSCoexistence","s")%>">
<%end if%>
<INPUT TYPE="HIDDEN" NAME="ExtChannFlag"  value="<%tcWebApi_get("WLan_Common","HT_EXTCHA","s")%>">
<INPUT type="HIDDEN" NAME="isAuthenTypeSupported" value="<% if tcWebApi_get("Info_WLan","isAuthenTypeSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
<INPUT type="HIDDEN" NAME="isDot1XSupported" value="<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
<INPUT type="HIDDEN" NAME="isDot1XEnhanceSupported" value="<% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
<INPUT TYPE="HIDDEN" NAME="wlan_VC" value="<%tcWebApi_get("WebCurSet_Entry","wlan_id","s")%>">
<!--<INPUT TYPE="HIDDEN" NAME="WpsStart" value="<%tcWebApi_get("Info_WLan","WPSActiveStatus","s")%>">
-->
<INPUT TYPE="HIDDEN" NAME="BssidNum" value="<%tcWebApi_get("WLan_Common","BssidNum","s")%>">
<INPUT TYPE="HIDDEN" NAME="CountryName" value="<%tcWebApi_get("WLan_Common","Country","s")%>">
<INPUT TYPE="HIDDEN" NAME="hCountryRegion" value="<%tcWebApi_get("WLan_Common","CountryRegion","s")%>">
<INPUT TYPE="HIDDEN" NAME="hRekeyMethod" value="DISABLE">
<INPUT type="HIDDEN" NAME="isWDSSupported" value="<% if tcWebApi_get("Info_WLan","isWDSSupported","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
<INPUT TYPE="HIDDEN" NAME="WDS_EncrypType_NONE" value="NONE">
<INPUT TYPE="HIDDEN" NAME="WDS_EncrypType_WEP" value="WEP">
<input type="HIDDEN" name="bharti_ssid2" value="<% if tcWebApi_get("Info_WLan","isbharti","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
<INPUT TYPE="HIDDEN" NAME="isPerSSIDSupport" value="<% if tcWebApi_get("WebCustom_Entry","isPerSSIDSupport","h") = "Yes" then asp_write("1") else asp_write("0") end if %>">
<INPUT TYPE="HIDDEN" NAME="RTDEVICE" value="<% tcWebApi_get("WLan_Common","rt_device","s") %>">
<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>
<INPUT TYPE="HIDDEN" NAME="WLanITxBfEn" value="<%tcWebApi_get("WLan_Common","ITxBfEn","s")%>">
<INPUT TYPE="HIDDEN" NAME="WLanETxBfEnCond" value="<%tcWebApi_get("WLan_Common","ETxBfEnCond","s")%>">
<INPUT TYPE="HIDDEN" NAME="WLanETxBfIncapable" value="<%tcWebApi_get("WLan_Common","ETxBfIncapable","s")%>">
<INPUT TYPE="HIDDEN" NAME="WEP_Key" value="0">
<% end if %>

<div id="pagestyle"><!--cindy add for border 11/28-->
<div id="contenttype">
<div id="block1">

	<% If tcWebApi_get("Info_WLan","isExist","h") = "Error" Then%>
	<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
		<tr>
	<td class="tabdata" align=left> <font color="#FF0000" size=+1><%tcWebApi_get("String_Entry","WirelessErrText","s")%></font> </td>
		</tr>
	</table>
	<% Else %>  
	<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
		<tr height="25px" style="width:100%;background:#e6e6e6;">
			<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessAccessPointSetText","s")%></td>
	</tr>
	</table>
	<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
<tr height="30px">
			<td align=left class="tabdata" style="width:250px;padding-left:20px;">	<%tcWebApi_get("String_Entry","WirelessAccessPointText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="wlan_APenable" VALUE="1" onClick="disablewifi();" <% if tcWebApi_get("WLan_Common","APOn","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessAccessPoint0Text","s")%>&nbsp;&nbsp;&nbsp;&nbsp;         
	<% If tcWebApi_get("WebCustom_Entry","isFonV2Support","h") = "Yes" Then%>      
			<INPUT TYPE="RADIO" NAME="wlan_APenable" VALUE="0" onClick="deavtiveWifi();" <% if tcWebApi_get("WLan_Common","APOn","h") = "0" then asp_Write("checked") end if %> <% if tcWebApi_get("WLan_Common","APOn","h") = "N/A" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessAccessPoint1Text","s")%> 
	<% Else %>  
			<INPUT TYPE="RADIO" NAME="wlan_APenable" VALUE="0" onClick="disablewifi();" <% if tcWebApi_get("WLan_Common","APOn","h") = "0" then asp_Write("checked") end if %> <% if tcWebApi_get("WLan_Common","APOn","h") = "N/A" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessAccessPoint1Text","s")%> 
	<% End If %>
		</td>
	</tr>
</table>
</div><!--id="block1"-->

<% if TCWebAPI_get("WLan_Common", "APOn", "h") = "1" then %>
<div id="hiddenwififunction">
<% else %>
<div id="hiddenwififunction" style="display:none;">
<% end if %>
<div id="block1">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessBasicInformation","s")%></td>
</tr>
</table>

<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;">
	<!--cindy add for bandsteering0814-->
<tr style="display:none" height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;">	 <%tcWebApi_get("String_Entry","WirelessBandsteeringText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="Bandsteering_Selection" VALUE="1" <%If tcWebApi_get("WLan_Entry","BandSteering","h") = "1" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","WirelessBandsteering0Text","s")%> 		
			<INPUT TYPE="RADIO" NAME="Bandsteering_Selection" VALUE="0" <%If tcWebApi_get("WLan_Entry","BandSteering","h") = "0" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_Entry","BandSteering","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessBandsteering1Text","s")%> 
		</td>
	</tr>
	<!--cindy add end0814-->

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	
<%tcWebApi_get("String_Entry","WirelessBeaconIntervalText","s")%></td>
<td align=left class="tabdata">
	<INPUT TYPE="TEXT" NAME="BeaconInterval" SIZE="7" MAXLENGTH="4" VALUE="<%If tcWebApi_get("WLan_Common","BeaconPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common","BeaconPeriod","s") else asp_Write("100") end if%>"> <%tcWebApi_get("String_Entry","WirelessIntervalrangeText","s")%> 
</td>
</tr>

<tr id="RTSThreshold" height="30px" style="display:none;">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	
<%tcWebApi_get("String_Entry","WirelessThresholdText","s")%></td>
<td align=left class="tabdata">
	<INPUT TYPE="TEXT" NAME="RTSThreshold" SIZE="7" MAXLENGTH="5" VALUE="<%If tcWebApi_get("WLan_Common","RTSThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","RTSThreshold","s") else asp_Write("2347") end if%>"> <%tcWebApi_get("String_Entry","WirelessThresholdrangeText","s")%> 
</td>
</tr>
	
<tr id ="FragmentThreshold" height="30px" style="display:none;">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	
    <%tcWebApi_get("String_Entry","WirelessFragThresholdText","s")%></td>
<td align=left class="tabdata">
	<INPUT TYPE="TEXT" NAME="FragmentThreshold" SIZE="7" MAXLENGTH="5" VALUE="<%If tcWebApi_get("WLan_Common","FragThreshold","h") <> "N/A" then tcWebApi_get("WLan_Common","FragThreshold","s") else asp_Write("2346") end if%>"> <%tcWebApi_get("String_Entry","WirelessFragThresText","s")%> 
</td>
</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	
		<%tcWebApi_get("String_Entry","WirelessDTIMText","s")%></td>
<td align=left class="tabdata">
	<INPUT TYPE="TEXT" NAME="DTIM" SIZE="7" MAXLENGTH="5" VALUE="<%If tcWebApi_get("WLan_Common","DtimPeriod","h") <> "N/A" then tcWebApi_get("WLan_Common","DtimPeriod","s") else asp_Write("1") end if%>" > <%tcWebApi_get("String_Entry","WirelessDTIMrangeText","s")%> 
</td>
</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	
		<%tcWebApi_get("String_Entry","WirelessModeText","s")%></td>
<td align=left class="tabdata">
	<SELECT NAME="WirelessMode" SIZE="1" onChange="doWirelessModeChange()">
		<OPTION value="1" <% if tcWebApi_get("WLan_Common","WirelessMode","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessMode0Text","s")%>
		<OPTION value="4" <% if tcWebApi_get("WLan_Common","WirelessMode","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessMode1Text","s")%>
	<!--cindy delete 12/18
		<OPTION value="0" <% if tcWebApi_get("WLan_Common","WirelessMode","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessMode2Text","s")%>
	-->
		<OPTION value="6" <% if tcWebApi_get("WLan_Common","WirelessMode","h") = "6" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessMode3Text","s")%>
	<!--cindy delete 12/18
		<OPTION value="7" <% if tcWebApi_get("WLan_Common","WirelessMode","h") = "7" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessMode4Text","s")%>
	-->
		<OPTION value="9" <% if tcWebApi_get("WLan_Common","WirelessMode","h") = "9" then asp_Write("selected") end if %> <%If tcWebApi_get("WLan_Common","WirelessMode","h") = "N/A" then asp_Write("checked") end if%>><%tcWebApi_get("String_Entry","WirelessMode5Text","s")%>
	</SELECT>
</td>
</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	
<font color="#000000"><%tcWebApi_get("String_Entry","WirelessTXPowerText","s")%></font></td>
<td align=left class="tabdata">
	<SELECT NAME="TxPower" SIZE="1" >
		<OPTION value="50" <% if tcWebApi_get("WLan_Common","TxPower","h") = "50" then asp_Write("selected") end if %>>50%
		<OPTION value="60" <% if tcWebApi_get("WLan_Common","TxPower","h") = "60" then asp_Write("selected") end if %>>60%
		<OPTION value="70" <% if tcWebApi_get("WLan_Common","TxPower","h") = "70" then asp_Write("selected") end if %>>70%
		<OPTION value="80" <% if tcWebApi_get("WLan_Common","TxPower","h") = "80" then asp_Write("selected") end if %>>80%
		<OPTION value="90" <% if tcWebApi_get("WLan_Common","TxPower","h") = "90" then asp_Write("selected") end if %>>90%
		<OPTION value="100" <% if tcWebApi_get("WLan_Common","TxPower","h") = "100" then asp_Write("selected") end if %> <%If tcWebApi_get("WLan_Common","TxPower","h") = "N/A" then asp_Write("selected") end if%>>100%
	</SELECT>
</td>
</tr>
	
<% If tcWebApi_get("WebCustom_Entry","isMaxStaNumSupported","h") = "Yes" Then %>
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	
<%tcWebApi_get("String_Entry","WirelessStaNumText","s")%></td>
<td align=left class="tabdata">
	<input type="hidden" name="maxStaNum" value="<%tcWebApi_get("Info_WLan","maxStaNumSupported","s")%>">
	<input name="StationNum" type="text" value="<%if tcWebApi_get("WLan_Entry","MbssMaxStaNum","h") <> "N/A" then tcWebApi_get("WLan_Entry","MbssMaxStaNum","s") else asp_Write("0") end if%>" size="7" maxlength="2" onblur="value=isNumeric(value)?value:'0';">
      <%tcWebApi_get("String_Entry","WirelessStaNumDisp1","s")%><%tcWebApi_get("Info_WLan","maxStaNumSupported","s")%><%tcWebApi_get("String_Entry","WirelessStaNumDisp2","s")%>
</td>
</tr>
<%End If%>

<!-- Foxconn alan remove start
	<% If tcWebApi_get("GUI_Entry2","Schedule","h") = "1" then%>
		<td  class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","SchedulingSettingText","s")%> </div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<input type="button" value="Scheduling" onclick="window.open('/cgi-bin/WLAN_Scheduling.asp','Scheduling','toolbar=no,menubar=no,height=450,width=780,location=0,left=200,top=400');">
		</td>
	<%end if%>
Foxconn alan remove end -->

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	
<%tcWebApi_get("String_Entry","WirelessChannelText","s")%> </td>
<td align=left class="tabdata">
			<SELECT NAME="Countries_Channels" SIZE="1" onChange="doRegionCheck()" >
				
<script language="JavaScript" type='text/javascript'>
/*
	var countryarr = new Array(98);
	countryarr[0]="ALBANIA";
	countryarr[1]="ALGERIA";
	countryarr[2]="ARGENTINA";
	countryarr[3]="ARMENIA";
	countryarr[4]="AUSTRALIA";
	countryarr[5]="AUSTRIA";
	countryarr[6]="AZERBAIJAN";
	countryarr[7]="BAHRAIN";
	countryarr[8]="BELARUS";
	countryarr[9]="BELGIUM";
	countryarr[10]="BELIZE";
	countryarr[11]="BOLIVIA";
	countryarr[12]="BRAZIL";
	countryarr[13]="BRUNEI DARUSSALAM";
	countryarr[14]="BULGARIA";
	countryarr[15]="CANADA";
	countryarr[16]="CHILE";
	countryarr[17]="CHINA";
	countryarr[18]="COLOMBIA";
	countryarr[19]="COSTA RICA";
	countryarr[20]="CROATIA";
	countryarr[21]="CYPRUS";
	countryarr[22]="CZECH REPUBLIC";
	countryarr[23]="DENMARK";
	countryarr[24]="DOMINICAN REPUBLIC";
	countryarr[25]="ECUADOR";
	countryarr[26]="EGYPT";
	countryarr[27]="ELSALVADOR";
	countryarr[28]="FINLAND";
	countryarr[29]="FRANCE";
	countryarr[30]="GEORGIA";
	countryarr[31]="GERMANY";
	countryarr[32]="GREECE";
	countryarr[33]="GUATEMALA";
	countryarr[34]="HONDURAS";
	countryarr[35]="HONGKONG";
	countryarr[36]="HUNGARY";
	countryarr[37]="ICELAND";
	countryarr[38]="INDIA";
	countryarr[39]="INDONESIA";
	countryarr[40]="IRAN";
	countryarr[41]="IRELAND";
	countryarr[42]="ISRAEL";
	countryarr[43]="ITALY";
	countryarr[44]="JAPAN";
	countryarr[45]="KAZAKHSTAN";
	countryarr[46]="KOREA DEMOCRATIC";
	countryarr[47]="KOREA REPUBLIC";
	countryarr[48]="LATVIA";
	countryarr[49]="LEBANON";
	countryarr[50]="LIECHTENSTEIN";
	countryarr[51]="LITHUANIA";
	countryarr[52]="LUXEMBOURG";
	countryarr[53]="MACAU";
	countryarr[54]="MACEDONIA";
	countryarr[55]="MALAYSIA";
	countryarr[56]="MEXICO";
	countryarr[57]="MONACO";
	countryarr[58]="MOROCCO";
	countryarr[59]="NETHERLANDS";
	countryarr[60]="NEW ZEALAND";
	countryarr[61]="NORWAY";
	countryarr[62]="OMAN";
	countryarr[63]="PAKISTAN";
	countryarr[64]="PANAMA";
	countryarr[65]="PERU";
	countryarr[66]="PHILIPPINES";
	countryarr[67]="POLAND";
	countryarr[68]="PORTUGAL";
	countryarr[69]="PUERTO RICO";
	countryarr[70]="QATAR";
	countryarr[71]="ROMANIA";
	countryarr[72]="RUSSIA";
	countryarr[73]="SAUDI ARABIA";
	countryarr[74]="SINGAPORE";
	countryarr[75]="SLOVAKIA";
	countryarr[76]="SLOVENIA";
	countryarr[77]="SOUTH AFRICA";
	countryarr[78]="SPAIN";
	countryarr[79]="SWEDEN";
	countryarr[80]="SWITZERLAND";
	countryarr[81]="SYRIAN ARAB REPUBLIC";
	countryarr[82]="TAIWAN";
	countryarr[83]="THAILAND";
	countryarr[84]="TRINIDAD AND TOBAGO";
	countryarr[85]="TUNISIA";
	countryarr[86]="TURKEY";
	countryarr[87]="UKRAINE";
	countryarr[88]="UNITED ARAB EMIRATES";
	countryarr[89]="UNITED KINGDOM";
	countryarr[90]="UNITED STATES";
	countryarr[91]="URUGUAY";
	countryarr[92]="UZBEKISTAN";
	countryarr[93]="VENEZUELA";
	countryarr[94]="VIETNAM";
	countryarr[95]="YEMEN";
	countryarr[96]="ZIMBABWE";
	countryarr[97]="Undefined";
	
	for(i=0;i<98;i++)
	{
		if(document.WLAN.CountryName.value.match(countryarr[i]) != null)
		{
			document.WLAN.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,true);
			document.WLAN.Countries_Channels[i].selected=true;
		}
		else
		{
			if(countryarr[i].match("TAIWAN") !=null){
				document.WLAN.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],true,false);
				//document.WLAN.Countries_Channels[i].selected=true;
			}
		else{
			document.WLAN.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,false);
			document.WLAN.Countries_Channels[i].selected=false;
		}
	}
}
*/
	var countryarr = new Array(3);
	countryarr[0]="CHINA";
	countryarr[1]="JAPAN";
	countryarr[2]="VIETNAM";
	for(i=0;i<3;i++)
	{
		if(document.WLAN.CountryName.value.match(countryarr[i]) != null)
		{
			document.WLAN.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,true);
			document.WLAN.Countries_Channels[i].selected=true;
		}
		else
		{
			if(countryarr[i].match("TAIWAN") !=null){
				document.WLAN.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],true,false);
				//document.WLAN.Countries_Channels[i].selected=true;
			}
			else{
			document.WLAN.Countries_Channels[i]=new Option(countryarr[i],countryarr[i],false,false);
			document.WLAN.Countries_Channels[i].selected=false;
			}
		}
	}
</script>
			</SELECT>     
			<SELECT NAME="Channel_ID" SIZE="1" onChange="doExtChaLockChange()">
			</SELECT>
         <%tcWebApi_get("String_Entry","WirelessCurrentChannelText","s")%>  
        <%if tcWebApi_get("WLan_Common","Channel","h") = "0" then%>
	        <%If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "N/A" then%>
	        	<INPUT TYPE="TEXT" NAME="CurrentChannel" SIZE="3" MAXLENGTH="2" VALUE="<%If tcWebApi_get("Info_WLan","CurrentChannel","h") <> "0" then tcWebApi_get("Info_WLan","CurrentChannel","s") else asp_Write("auto") end if%>" disabled>
        	<%else%>
    		    <INPUT TYPE="TEXT" NAME="CurrentChannel" SIZE="3" MAXLENGTH="2" VALUE="auto" disabled>
        	<%end if%>
		<%else%>
		<INPUT TYPE="TEXT" NAME="CurrentChannel" SIZE="3" MAXLENGTH="2" VALUE="<%If tcWebApi_get("WLan_Common","Channel","h") <> "N/A" then tcWebApi_get("WLan_Common","Channel","s") end if%>" disabled>
		<%end if%>
		</td>
	</tr>
<!-- Foxconn alan add start for FPT test wifi country code issue (20171101) -->
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">	&nbsp;</td>
<td align=left class="tabdata">
		<div style="color:#FF9933;"><%tcWebApi_get("String_Entry","WirelessCountryNoticeText","s")%></div></td>
	</tr>
<!-- Foxconn alan add end (20171101) -->	
	</table>
</div><!--cindy add id="block1" 12/08-->

<div id="11nMode_1_div">
<div id="block1"><!--id="block1" 12/08-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","Wireless11nSettingsText","s")%> </td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessChannelBandwidthText","s")%> </td>
<td align=left class="tabdata">
<select name="WLANChannelBandwidth" onChange="doChannelBandwidthChange();">
          <option value="0" <% if tcWebApi_get("WLan_Common","HT_BW","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessChannelBandwidth0Text","s")%></option>
		  <% if tcWebApi_get("WebCustom_Entry","isHTBW40M","h") = "Yes" then %>
<!--cindy add-->
				<option value="2" 
				<% if tcWebApi_get("WLan_Common","HT_BW","h") = "1" Then %>
					<% if tcWebApi_get("WLan_Common","HT_BSSCoexistence","h") = "0" then asp_Write("selected") end if %>
				<%End If%>><%tcWebApi_get("String_Entry","WirelessChannelBandwidth2Text","s")%></option>
<!--cindy add-->
				<option value="1" 
				<%if tcWebApi_get("WLan_Common","HT_BSSCoexistence","h") = "1" Then %>
					<%if tcWebApi_get("WLan_Common","HT_BW","h") <> "0" then asp_Write("selected") end if %>
				<%End If%>
				<% if tcWebApi_get("WLan_Common","HT_BW","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessChannelBandwidth1Text","s")%></option>
<!--cindy delete 10/13
				<option value="2" 
				<% if tcWebApi_get("WLan_Common","HT_BW","h") = "1" Then %>
					<% if tcWebApi_get("WLan_Common","HT_BSSCoexistence","h") = "0" then asp_Write("selected") end if %>
				<%End If%>><%tcWebApi_get("String_Entry","WirelessChannelBandwidth2Text","s")%></option>
-->
		<%else %>
		  <option value="1" <% if tcWebApi_get("WLan_Common","HT_BW","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan_Common","HT_BW","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessChannelBandwidth1Text","s")%></option>
		<%end if%>
</select>
 </td>
  </tr>
	</table>

	<div id="HT_BW_1_div">
	<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;display:none;">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
    <%tcWebApi_get("String_Entry","WirelessExtensionChannelText","s")%> </td>
<td align=left class="tabdata">
        <select name="WLANExtensionChannel" onChange="doExtChannChange();">
        <option value="0" <% if tcWebApi_get("WLan_Common","HT_EXTCHA","h") = "0" then asp_Write("selected") end if %><% if tcWebApi_get("WLan_Common","HT_EXTCHA","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessExtensionChannel0Text","s")%></option>
		<option value="1" <% if tcWebApi_get("WLan_Common","HT_EXTCHA","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessExtensionChannel1Text","s")%></option>
        </select>
	</td>
  </tr>
	</table>
	</div>
	
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
    <%tcWebApi_get("String_Entry","WirelessGuardIntervalText","s")%> </td>
<td align=left class="tabdata">
        <select name="WLANGuardInterval">
        <option value="0" <% if tcWebApi_get("WLan_Common","HT_GI","h") = "0" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessGuardInterval0Text","s")%></option>
		<option value="1" <% if tcWebApi_get("WLan_Common","HT_GI","h") = "1" then asp_Write("selected") end if %><% if tcWebApi_get("WLan_Common","HT_GI","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessGuardInterval2Text","s")%></option><!--wang change string 11 to 12 0914-->
        </select>
	</td>
  </tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
    <%tcWebApi_get("String_Entry","WirelessMCSText","s")%> </td>
<td align=left class="tabdata">
        <select name="WLANMCS">
        <option value="0" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "0" then asp_Write("selected") end if %>>0</option>
        <option value="1" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "1" then asp_Write("selected") end if %>>1</option>
		<option value="2" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "2" then asp_Write("selected") end if %>>2</option>
		<option value="3" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "3" then asp_Write("selected") end if %>>3</option>
		<option value="4" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "4" then asp_Write("selected") end if %>>4</option>
		<option value="5" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "5" then asp_Write("selected") end if %>>5</option>
		<option value="6" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "6" then asp_Write("selected") end if %>>6</option>
        <option value="7" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "7" then asp_Write("selected") end if %>>7</option>
		<% if tcWebApi_get("WLan_Common","rt_device","h") = "3092" then %>
        <option value="8" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "8" then asp_Write("selected") end if %>>8</option>
		<option value="9" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "9" then asp_Write("selected") end if %>>9</option>
		<option value="10" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "10" then asp_Write("selected") end if %>>10</option>
		<option value="11" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "11" then asp_Write("selected") end if %>>11</option>
		<option value="12" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "12" then asp_Write("selected") end if %>>12</option>
		<option value="13" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "13" then asp_Write("selected") end if %>>13</option>
		<option value="14" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "14" then asp_Write("selected") end if %>>14</option>
		<option value="15" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "15" then asp_Write("selected") end if %>>15</option>
		<% end if %>
<% if tcWebApi_get("WLan_Common","rt_device","h") = "5392" then %>
        <option value="8" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "8" then asp_Write("selected") end if %>>8</option>
		<option value="9" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "9" then asp_Write("selected") end if %>>9</option>
		<option value="10" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "10" then asp_Write("selected") end if %>>10</option>
		<option value="11" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "11" then asp_Write("selected") end if %>>11</option>
		<option value="12" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "12" then asp_Write("selected") end if %>>12</option>
		<option value="13" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "13" then asp_Write("selected") end if %>>13</option>
		<option value="14" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "14" then asp_Write("selected") end if %>>14</option>
		<option value="15" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "15" then asp_Write("selected") end if %>>15</option>
		<% end if %>
		<% if tcWebApi_get("WLan_Common","rt_device","h") = "7592" then %>
        <option value="8" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "8" then asp_Write("selected") end if %>>8</option>
		<option value="9" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "9" then asp_Write("selected") end if %>>9</option>
		<option value="10" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "10" then asp_Write("selected") end if %>>10</option>
		<option value="11" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "11" then asp_Write("selected") end if %>>11</option>
		<option value="12" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "12" then asp_Write("selected") end if %>>12</option>
		<option value="13" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "13" then asp_Write("selected") end if %>>13</option>
		<option value="14" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "14" then asp_Write("selected") end if %>>14</option>
		<option value="15" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "15" then asp_Write("selected") end if %>>15</option>
		<% end if %>
		<option value="33" <% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "33" then asp_Write("selected") end if %><% if tcWebApi_get("WLan_Entry","HT_MCS","h") = "N/A" then asp_Write("selected") end if %>>AUTO</option>
       </select>
	</td>
  </tr>
 
 <% If tcWebApi_get("WLan_Common","rt_device","h") = "7615" Then %> 
 <% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>		
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<font color="#000000"><%tcWebApi_get("String_Entry","WirelessTxBeamFormingText","s")%></font></td>
<td align=left class="tabdata">
			<SELECT NAME="WLanTxBeamForming">
				<option value="3"><%tcWebApi_get("String_Entry","WirelessTxBeamForming0Text","s")%></option>
				<option value="2"><%tcWebApi_get("String_Entry","WirelessTxBeamForming1Text","s")%></option>
				<option value="1"><%tcWebApi_get("String_Entry","WirelessTxBeamForming2Text","s")%></option>
				<option value="0"><%tcWebApi_get("String_Entry","WirelessTxBeamForming3Text","s")%></option>
			</SELECT>
		</td>
	</tr>	 
	<% end if %>
	<% end if %>
	
  <% If tcWebApi_get("Info_WLan","is11nSpecComply","h") = "Yes" Then %>	
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessAMPDUText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="wlan_AMPDU" VALUE="1" <% if tcWebApi_get("WLan_Common","HT_AutoBA","h") <> "0" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessAMPDU0Text","s")%>         
			<INPUT TYPE="RADIO" NAME="wlan_AMPDU" VALUE="0" <% if tcWebApi_get("WLan_Common","HT_AutoBA","h") = "0" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessAMPDU1Text","s")%> 
		</td>
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessAMSDUText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="wlan_AMSDU" VALUE="1" <% if tcWebApi_get("WLan_Common","HT_AMSDU","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessAMSDU0Text","s")%>         
			<INPUT TYPE="RADIO" NAME="wlan_AMSDU" VALUE="0" <% if tcWebApi_get("WLan_Common","HT_AMSDU","h") <> "1" then asp_Write("checked") end if %>> <%tcWebApi_get("String_Entry","WirelessAMSDU1Text","s")%> 
		</td>
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessGreenfiledText","s")%> </td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="wlan_Greenfiled" VALUE="1" <% if tcWebApi_get("WLan_Common","HT_OpMode","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessGreenfiled0Text","s")%>         
			<INPUT TYPE="RADIO" NAME="wlan_Greenfiled" VALUE="0" <% if tcWebApi_get("WLan_Common","HT_OpMode","h") = "0" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessGreenfiled1Text","s")%> 
		</td>
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessSTBCText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="wlan_STBC" VALUE="1" <% if tcWebApi_get("WLan_Common","HT_STBC","h") <> "0" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessSTBC0Text","s")%>         
			<INPUT TYPE="RADIO" NAME="wlan_STBC" VALUE="0" <% if tcWebApi_get("WLan_Common","HT_STBC","h") = "0" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessSTBC1Text","s")%> 
		</td>
	</tr>	

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessDisallowTKIPText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="wlan_DisallowTKIP" VALUE="1" <% if tcWebApi_get("WLan_Common","HT_DisallowTKIP","h") <> "0" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessDisallowTKIP0Text","s")%>         
			<INPUT TYPE="RADIO" NAME="wlan_DisallowTKIP" VALUE="0" <% if tcWebApi_get("WLan_Common","HT_DisallowTKIP","h") = "0" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessDisallowTKIP1Text","s")%> 
		</td>
	</tr>	
	<%End If%>
  </table>
</div><!--id="block1" 12/08-->
  </div>

<div id="block1"><!--id="block1" 12/08-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSSIDSettingsText","s")%> </td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<%if tcWebApi_get("WLan_Common","BssidNum","h") = "1" then%>
<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSSIDindexText","s")%></td>
<td align=left class="tabdata">
		<select NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
		<OPTION value="0" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then asp_write("selected") end if%>>1
		</select>
		</td>
	</tr>

<%elseif tcWebApi_get("WLan_Common","BssidNum","h") = "2" then%>
<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSSIDindexText","s")%></td>
<td align=left class="tabdata">
		<select NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
		<OPTION value="0" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then asp_write("selected") end if%>>1
	<% if tcWebApi_get("GUI_Entry0","ssidOneOnly","h") <> "support" then %>
		<% if tcWebApi_get("WebCustom_Entry","isFonSupport","h") <> "Yes" then %>
		<OPTION value="1" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "1" then asp_write("selected") end if%>>2
		<%end if%>
	<%end if%>
		</select>
      </td>
	</tr>

<% elseif tcWebApi_get("WLan_Common","BssidNum","h") = "3" then%>
<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSSIDindexText","s")%></td>
<td align=left class="tabdata">
		<select NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
		<OPTION value="0" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then asp_write("selected") end if%>>1
	<% if tcWebApi_get("GUI_Entry0","ssidOneOnly","h") <> "support" then %>
		<% if tcWebApi_get("WebCustom_Entry","isFonSupport","h") <> "Yes" then %>
		<OPTION value="1" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "1" then asp_write("selected") end if%>>2
		<%end if%>
		<OPTION value="2" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "2" then asp_write("selected") end if%>>3
	<%end if%>
		</select>
		</td>
	</tr>

<%elseif tcWebApi_get("WLan_Common","BssidNum","h") = "4" then%>
<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSSIDindexText","s")%></td>
<td align=left class="tabdata">
		<select NAME="SSID_INDEX" SIZE="1" onChange="doSSIDChange()">
		<OPTION value="0" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then asp_write("selected") end if%>>1
	<% if tcWebApi_get("GUI_Entry0","ssidOneOnly","h") <> "support" then %>
		<% if tcWebApi_get("WebCustom_Entry","isFonSupport","h") <> "Yes" then %>
		<OPTION value="1" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "1" then asp_write("selected") end if%>>2
		<%end if%>
		<OPTION value="2" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "2" then asp_write("selected") end if%>>3
		<OPTION value="3" <%if TCWebApi_get("WebCurSet_Entry","wlan_id","h") = "3" then asp_write("selected") end if%>>4
	<%end if%>
		</select>
		</td>
</tr>
<%end if%>

<% if tcWebApi_get("WebCustom_Entry","isPerSSIDSupport","h") = "Yes"  then %>
<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessPerSSIDText","s")%></td>
<td align=left class="tabdata">
	<INPUT TYPE="RADIO" NAME="ESSID_Enable_Selection" VALUE="1" <%If tcWebApi_get("WLan_Entry","EnableSSID","h") = "1" then asp_Write("checked") end if%> >
         <%tcWebApi_get("String_Entry","WirelessAccessPoint0Text","s")%> &nbsp;&nbsp;&nbsp;
        <INPUT TYPE="RADIO" NAME="ESSID_Enable_Selection" VALUE="0" <%If tcWebApi_get("WLan_Entry","EnableSSID","h") = "0" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_Entry","EnableSSID","h") = "N/A" then asp_Write("checked") end if%> >
         <%tcWebApi_get("String_Entry","WirelessAccessPoint1Text","s")%> 
</td>
	</tr>
<%end if%>

<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSSIDText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" NAME="ESSID" SIZE="35" MAXLENGTH="32" VALUE="<%If tcWebApi_get("WLan_Entry","SSID","h") <> "N/A" then tcWebApi_get("WLan_Entry","SSID","s") end if%>">
		</td>
	</tr>

<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessBroadcastSSIDText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="ESSID_HIDE_Selection" VALUE="0" <%If tcWebApi_get("WLan_Entry","HideSSID","h") = "0" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessBroadcastSSID0Text","s")%> &nbsp;&nbsp;&nbsp;	
			<INPUT TYPE="RADIO" NAME="ESSID_HIDE_Selection" VALUE="1" onClick="doBroadcastSSIDChange();" <%If tcWebApi_get("WLan_Entry","HideSSID","h") = "1" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_Entry","HideSSID","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessBroadcastSSID1Text","s")%> 
		</td>
	</tr>
	</table>

	<div id="11nMode_0_div">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px" >
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
    <%tcWebApi_get("String_Entry","WirelessWMMText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="RADIO" NAME="WMM_Selection" VALUE="1" <%If tcWebApi_get("WLan_Entry","WMM","h") = "1" then asp_Write("checked") end if%> >		 <%tcWebApi_get("String_Entry","WirelessWMM0Text","s")%> 		
			<INPUT TYPE="RADIO" NAME="WMM_Selection" VALUE="0" <%If tcWebApi_get("WLan_Entry","WMM","h") = "0" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_Entry","WMM","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessWMM1Text","s")%> 
		</td>
	</tr>
	</table>
</div><!--id="11nMode_0_div"-->
</div><!--id="block1" 12/08-->

<div id="block1">	<!--id="block1" 12/09-->
  
  <% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
	<tr>
		<td width="150" class="light-orange">&nbsp;</td>
		<td width="10" class="light-orange"></td>
		<td width="150" class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessAuthTypeText","s")%> </div></td>
		<td width="10" class="tabdata"><div align=center>:</div></td>
		<td width="440" class="tabdata">
			<div id="WEP_Selection_div">
			<SELECT NAME="WEP_Selection" SIZE="1" onChange="doWEPChange()">
			<% if tcWebApi_get("Info_WLan","isbharti","h") = "Yes" then %>
				<OPTION value="OPEN" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("WLan_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %>> 
			<% elseif tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>
			<%else%>
				<OPTION value="OPEN" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("WLan_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus0Text","s")%>
			<%end if%>
			<!-- Foxconn alan remove start
				<OPTION value="WEP-64Bits" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WEP-64Bits" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus1Text","s")%>
				<OPTION value="WEP-128Bits" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WEP-128Bits" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus2Text","s")%>
			Foxconn alan remove end -->	
				<OPTION value="WPAPSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus3Text","s")%>
				<OPTION value="WPA2PSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus4Text","s")%> 
				<OPTION value="WPAPSKWPA2PSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus5Text","s")%> 				
				<OPTION value="Radius-WEP64" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "Radius-WEP64" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus6Text","s")%>
				<OPTION value="Radius-WEP128" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "Radius-WEP128" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus7Text","s")%>
				<OPTION value="WPA" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPA" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus8Text","s")%>
				<OPTION value="WPA2" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPA2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus9Text","s")%> 
				<OPTION value="WPA1WPA2" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPA1WPA2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus10Text","s")%>	
			</SELECT>
			</div>
			<INPUT TYPE="HIDDEN" NAME="wlanWEPFlag" VALUE="0">
			
			<div id="WEP_Selection_show_div"> 
          <select name="WEP_Selection_show" size="1">
            <option <% if tcWebApi_get("Info_WLan","isAuthenTypeSupported","h") = "Yes" then asp_Write("selected") elseif tcWebApi_get("Info_WLan","isAuthenTypeSupported","h") = "N/A" then asp_Write("selected") end if %>>
            <%tcWebApi_get("String_Entry","WirelessWEPStatus9Text","s")%>
          </select>
        </div>
		</td>
	</tr>
	</table>
	
	<%else%>
	
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
<td align=left class="title-main" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessSecurityTypeText","s")%> </td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessAuthTypeText","s")%> </td>
<td align=left class="tabdata">
			<SELECT NAME="WEP_Selection" SIZE="1" onChange="doWEPChange()">
			<% if tcWebApi_get("Info_WLan","isbharti","h") <> "Yes" then %>
			<%if tcWebApi_get("WebCustom_Entry","isWlanEncrypt","h") = "Yes"  then %>	
			<%else%>
				<OPTION <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "OPEN" then asp_Write("selected") elseif tcWebApi_get("WLan_Entry","AuthMode","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus0Text","s")%>
			<%end if%>	
			<%end if%>
<!-- Foxconn alan remove start
				<OPTION value="WEP-64Bits" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WEP-64Bits" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus1Text","s")%>
				<OPTION value="WEP-128Bits" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WEP-128Bits" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus2Text","s")%>
Foxconn alan remove end -->
				<OPTION value="WPAPSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPAPSK" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus3Text","s")%>
				<OPTION value="WPA2PSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPA2PSK" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus4Text","s")%> 
				<OPTION value="WPAPSKWPA2PSK" <% if tcWebApi_get("WLan_Entry","AuthMode","h") = "WPAPSKWPA2PSK" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPStatus5Text","s")%>	
			</SELECT>
			<INPUT TYPE="HIDDEN" NAME="wlanWEPFlag" VALUE="0">
		</td>
	</tr>
</table>
<%end if%>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
	<% if tcWebApi_get("Info_WLan","isDot1XSupported","h") = "Yes" then %>
	</table>

	<div id="Radius-WEP64_div">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="title-main" style="width:250px;padding-left:20px;padding-top:10px;">
<%tcWebApi_get("String_Entry","WirelessRADIUSText","s")%> </td>
      </tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessRADIUSServerIPText","s")%></td> 
<td align=left class="tabdata">
<input name="radiusSVR_IP1" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
 <%tcWebApi_get("String_Entry","WirelessRADIUSServerPortText","s")%></td>
<td align=left class="tabdata">
<input name="radiusSVR_Port1" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessRADIUSSharesecretText","s")%></td>
<td align=left class="tabdata">
<input name="radiusSVR_Key1" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Key","s") end if%>" size="48" maxlength="64" onBlur="RadiusKeyCheck(this)"> <%tcWebApi_get("String_Entry","WirelessWDSKeyCommText","s")%>
</td>
      </tr> 

	  <% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then %>
	<tr> 
        <td height="24"  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_IP1" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Port1" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessBackupSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Key1" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","s") end if%>" size="48" maxlength="64"></td>
      </tr>
 	  <%end if%>

      <tr>
     	<td class="light-orange">&nbsp;</td>
   		<td class="light-orange"></td>
    	<td class="tabdata"><div align="right">
    	<%tcWebApi_get("String_Entry","WirelessIntervalText","s")%>
		</div></td>
		<td class="tabdata"><div align="center">:</div></td>
    	<td class="tabdata"><input type="text" name="radiusSVR_ReAuthInter1" value="<%if tcWebApi_get("WLan_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan_Common","session_timeout_interval","s") end if%>" size="48" maxlength="63">
        <%tcWebApi_get("String_Entry","WirelessIntervalSecText","s")%> 
		</td>
	  </tr>
  
	  <!--
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> Network Re-auth Interval </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input type="text" name="radiusSVR_ReAuthInter" size="48" maxlength="63">
          seconds </td>
      </tr>
	  -->
	  <tr> 
        <td width="150"> </td>
	 <td width="10" > </td>        
	 <td width="150" height="30" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessRadiusWEP64Text","s")%> </td>
        <td width="10" >&nbsp;</td>
        <td width="440"> </td>
	</tr>
	<tr>
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPStatus1Text","s")%> </div></td>
		<td class="tabdata">&nbsp;</td>
        <td class="tabdata"> <%tcWebApi_get("String_Entry","WirelessWEPStatus1CommText","s")%> </td>
	</tr>
	<tr>
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPStatus2Text","s")%> </div></td>
		<td class="tabdata">&nbsp;</td>
        <td class="tabdata"> <%tcWebApi_get("String_Entry","WirelessWEPStatus2CommText","s")%> </td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right>
            <INPUT TYPE="RADIO" NAME="DefWEPKey1" VALUE="1" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") end if%> <% If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #1</div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key11" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if%>" onBlur="doKEYcheck(this);" > 
		</td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> 
            <INPUT TYPE="RADIO" NAME="DefWEPKey1" VALUE="2" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #2</div></td>
		<td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key21" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key2Str","s") end if%>"  onBlur="doKEYcheck(this);" > 
		</td>
	</tr>
	<tr>                                                                                      
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right>                                                                                                                                                                                     
            <INPUT TYPE="RADIO" NAME="DefWEPKey1" VALUE="3" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "3" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #3</div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key31" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key3Str","s") end if%>"  onBlur="doKEYcheck(this);" > 
		</td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> 
            <INPUT TYPE="RADIO" NAME="DefWEPKey1" VALUE="4" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #4</div></td>
		<td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key41" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key4Str","s") end if%>"  onBlur="doKEYcheck(this);" > 
        </td>
      </tr>
	</table>
	</div>

	
	<div id="Radius-WEP128_div">
	<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr> 
        <td width="150"> </td>
        <td width="10"> </td>        
        <td height="30" width="150" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessRADIUSText","s")%> </td>
        <td width="10">&nbsp;</td>
        <td width="440"> </td>
      </tr>
      <tr> 
        <td  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessRADIUSServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_IP2" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
		</td>
	</tr>
	<tr>                                                                                      
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessRADIUSServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_Port2" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Port","s") else asp_Write("0") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessRADIUSSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_Key2" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Key","s") end if%>" size="48" maxlength="64" onBlur="RadiusKeyCheck(this)"> <%tcWebApi_get("String_Entry","WirelessWDSKeyCommText","s")%>  
        </td>
      </tr>
	  <% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then %>
	  <tr> 
        <td height="24"  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_IP2" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Port2" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessBackupSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Key2" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","s") end if%>" size="48" maxlength="64"></td>
      </tr>
	  <%end if%>
	  <tr>
     	<td class="light-orange">&nbsp;</td>
   		<td class="light-orange"></td>
    	<td class="tabdata"><div align="right">
    	<%tcWebApi_get("String_Entry","WirelessIntervalText","s")%>
		</div></td>
		<td class="tabdata"><div align="center">:</div></td>
    	<td class="tabdata"><input type="text" name="radiusSVR_ReAuthInter2" value="<%if tcWebApi_get("WLan_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan_Common","session_timeout_interval","s") end if%>" size="48" maxlength="63">
        <%tcWebApi_get("String_Entry","WirelessIntervalSecText","s")%> 
		</td>
	  </tr>
	  <!--
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> Network Re-auth Interval </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input type="text" name="radiusSVR_ReAuthInter" size="48" maxlength="63">
          seconds </td>
      </tr>
	  -->
	  <tr> 
        <td width="150"> </td>
        <td width="10" > </td>        
        <td width="150" height="30" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessWEPStatus7Text","s")%> </td>
        <td width="10">&nbsp;</td>
        <td width="440"> </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPStatus1Text","s")%> </div></td>
        <td class="tabdata">&nbsp;</td>
        <td class="tabdata"> <%tcWebApi_get("String_Entry","WirelessWEPStatus1CommText","s")%> </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPStatus2Text","s")%> </div></td>
        <td class="tabdata">&nbsp;</td>
        <td class="tabdata"> <%tcWebApi_get("String_Entry","WirelessWEPStatus2CommText","s")%> </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
    <td class="tabdata"><div align=right>                                                                                                                                                                                     
            <INPUT TYPE="RADIO" NAME="DefWEPKey2" VALUE="1" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") end if%> <% If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #1</div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key12" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if%>" onBlur="doKEYcheck(this);" > 
		</td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> 
            <INPUT TYPE="RADIO" NAME="DefWEPKey2" VALUE="2" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #2</div></td>
		<td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key22" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key2Str","s") end if%>"  onBlur="doKEYcheck(this);" > 
		</td>
	</tr>
	<tr>                                                                                      
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
		<td class="tabdata"><div align=right>                                                                                                                                                                                     
            <INPUT TYPE="RADIO" NAME="DefWEPKey2" VALUE="3" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "3" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #3</div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key32" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key3Str","s") end if%>"  onBlur="doKEYcheck(this);" > 
		</td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> 
            <INPUT TYPE="RADIO" NAME="DefWEPKey2" VALUE="4" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #4</div></td>
		<td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key42" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key4Str","s") end if%>"  onBlur="doKEYcheck(this);" > 
		</td>
	</tr>
	</table>
	</div>
	
	<div id="WPA_div">
	<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" >
	<tr>		
        <td width="150"> </td>
        <td width="10"> </td>        
        <td height="30" width="150" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessRADIUSText","s")%> </td>
        <td width="10">&nbsp;</td>
        <td width="440"> </td>
      </tr>
      <tr> 
        <td  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessRADIUSServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_IP3" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessRADIUSServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_Port3" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessRADIUSSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_Key3" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Key","s") end if%>" size="48" maxlength="64" onBlur="RadiusKeyCheck(this)"> <%tcWebApi_get("String_Entry","WirelessWDSKeyCommText","s")%>  
        </td>
      </tr>
	  <% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then %>
	  <tr> 
        <td height="24"  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_IP3" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Port3" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessBackupSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Key3" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","s") end if%>" size="48" maxlength="64"></td>
      </tr>
	  <%end if%>
	  <tr>
     	<td class="light-orange">&nbsp;</td>
   		<td class="light-orange"></td>
    	<td class="tabdata"><div align="right">
    	<%tcWebApi_get("String_Entry","WirelessIntervalText","s")%>
		</div></td>
		<td class="tabdata"><div align="center">:</div></td>
    	<td class="tabdata"><input type="text" name="radiusSVR_ReAuthInter3" value="<%if tcWebApi_get("WLan_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan_Common","session_timeout_interval","s") end if%>" size="48" maxlength="63">
        <%tcWebApi_get("String_Entry","WirelessIntervalSecText","s")%> 
		</td>
	  </tr>
	  <!--
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> Network Re-auth Interval </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input type="text" name="radiusSVR_ReAuthInter" size="48" maxlength="63">
          seconds </td>
      </tr>
	  -->
	  <tr> 
        <td> </td>
        <td> </td>        
        <td height="30" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessWEPStatus8Text","s")%> </td>
        <td>&nbsp;</td>
        <td> </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessEncryptionText","s")%> </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <SELECT NAME="TKIP_Selection1" onChange="doEncryptionChange(this)"SIZE="1">
			<OPTION value="AES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption0Text","s")%> 
            <OPTION value="TKIP" <%If tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> ><%tcWebApi_get("String_Entry","WirelessEncryption1Text","s")%> 
            <OPTION value="TKIPAES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption2Text","s")%> 
          </SELECT> </td>
      </tr>
	  <tr>
     	<td class="light-orange">&nbsp;</td>
   		<td class="light-orange"></td>
    	<td class="tabdata"><div align="right">
			<%tcWebApi_get("String_Entry","WirelessRekeyIntervalText","s")%>
			</div></td>
		<td class="tabdata"><div align="center">:</div></td>
    	<td class="tabdata">
	<input type="text" id="WPARekeyInter3" name="WPARekeyInter3" size="7" maxlength="7"  onBlur="checkRekeyinteral(this.value, 1)">
         <%tcWebApi_get("String_Entry","WirelessIntervalSecText","s")%> 
	<script language="JavaScript" type="text/JavaScript">
			var rekeystr = "<% tcWebApi_get("WLan_Entry","RekeyInterval","s") %>";
			if("N/A" == rekeystr || "" == rekeystr){
				document.getElementById('WPARekeyInter3').value = "3600";
			}
			else{
				document.getElementById('WPARekeyInter3').value = rekeystr;
			}
	</script>
	</td>
	</tr>
	</table>
	</div>
	
	<div id="WPA2_div">
	<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr> 
        <td width="150"> </td>
        <td width="10"> </td>        
        <td height="30" width="150" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessRADIUSText","s")%> </td>
        <td width="10">&nbsp;</td>
        <td width="440"> </td>
      </tr>
      <tr> 
        <td  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessRADIUSServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_IP4" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessRADIUSServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_Port4" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessRADIUSSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_Key4" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Key","s") end if%>" size="48" maxlength="64" onBlur="RadiusKeyCheck(this)"> <%tcWebApi_get("String_Entry","WirelessWDSKeyCommText","s")%>  
        </td>
      </tr>
	  <% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then %>
	  <tr> 
        <td height="24"  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_IP4" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Port4" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessBackupSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Key4" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","s") end if%>" size="48" maxlength="64"></td>
      </tr>
	  <%end if%>
	  <% if tcWebApi_get("Info_WLan","isWPA2PreAuthSupported","h") = "Yes" then %>
	  <tr>
		<td class="light-orange"></td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessPreAuthText","s")%> </div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<INPUT TYPE="RADIO" NAME="wlan_PreAuth" VALUE="1" <% if tcWebApi_get("WLan_Entry","PreAuth","h") = "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessPreAuth0Text","s")%>         
			<INPUT TYPE="RADIO" NAME="wlan_PreAuth" VALUE="0" <% if tcWebApi_get("WLan_Entry","PreAuth","h") <> "1" then asp_Write("checked") end if %> > <%tcWebApi_get("String_Entry","WirelessPreAuth1Text","s")%> 
		</td>
	</tr>
	<%end if%>
	  <tr>
     	<td class="light-orange">&nbsp;</td>
   		<td class="light-orange"></td>
    	<td class="tabdata"><div align="right">
    	<%tcWebApi_get("String_Entry","WirelessIntervalText","s")%>
		</div></td>
		<td class="tabdata"><div align="center">:</div></td>
    	<td class="tabdata"><input type="text" name="radiusSVR_ReAuthInter4" value="<%if tcWebApi_get("WLan_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan_Common","session_timeout_interval","s") end if%>" size="48" maxlength="63">
        <%tcWebApi_get("String_Entry","WirelessIntervalSecText","s")%> 
		</td>
	  </tr>
	  <!--
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> Network Re-auth Interval </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input type="text" name="radiusSVR_ReAuthInter" size="48" maxlength="63">
          seconds </td>
      </tr>
	  -->
	 <tr> 
        <td></td>
        <td> </td>       
        <td height="30" class="title-sub"> WPA2 </td>
        <td> </td>
        <td> </td>        
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessEncryptionText","s")%> </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <SELECT NAME="TKIP_Selection2"  onChange="doEncryptionChange(this)"SIZE="1">
			<OPTION value="AES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption0Text","s")%>
            <OPTION value="TKIP" <%If tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> ><%tcWebApi_get("String_Entry","WirelessEncryption1Text","s")%> 
            <OPTION value="TKIPAES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption2Text","s")%> 
          </SELECT> </td>
      </tr>
	  <tr>
     	<td class="light-orange">&nbsp;</td>
   		<td class="light-orange"></td>
    	<td class="tabdata"><div align="right">
			<%tcWebApi_get("String_Entry","WirelessRekeyIntervalText","s")%>
			</div></td>
		<td class="tabdata"><div align="center">:</div></td>
    	<td class="tabdata">
	<input type="text" id="WPARekeyInter4" name="WPARekeyInter4" size="7" maxlength="7" onBlur="checkRekeyinteral(this.value, 1)">
         <%tcWebApi_get("String_Entry","WirelessIntervalSecText","s")%> 
	<script language="JavaScript" type="text/JavaScript">
				var rekeystr = "<% tcWebApi_get("WLan_Entry","RekeyInterval","s") %>";
				if("N/A" == rekeystr || "" == rekeystr){
					document.getElementById('WPARekeyInter4').value = "3600";
				}
				else{
					document.getElementById('WPARekeyInter4').value = rekeystr;
				}
			</script>
	</td>
	</tr>
	</table>
	</div>
	
	<div id="WPA1WPA2_div">
	<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr> 
        <td width="150"> </td>
        <td width="10"> </td>        
        <td height="30" width="150" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessRADIUSText","s")%> </td>
        <td width="10">&nbsp;</td>
        <td width="440"> </td>
      </tr>
      <tr> 
        <td  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessRADIUSServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_IP5" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessRADIUSServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_Port5" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessRADIUSSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="radiusSVR_Key5" type="text" value="<%if tcWebApi_get("WLan_Entry","RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","RADIUS_Key","s") end if%>" size="48" maxlength="64" onBlur="RadiusKeyCheck(this)"> <%tcWebApi_get("String_Entry","WirelessWDSKeyCommText","s")%>  
        </td>
      </tr>
	  <% if tcWebApi_get("Info_WLan","isDot1XEnhanceSupported","h") = "Yes" then %>
	  <tr> 
        <td height="24"  class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerIPText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_IP5" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Server","s") end if%>" size="20" maxlength="15"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> <%tcWebApi_get("String_Entry","WirelessBackupServerPortText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Port5" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Port","s") end if%>" size="8" maxlength="5"> 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"><%tcWebApi_get("String_Entry","WirelessBackupSharesecretText","s")%> </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input name="bakradiusSVR_Key5" type="text" value="<%if tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","h") <> "N/A" then tcWebApi_get("WLan_Entry","BAK_RADIUS_Key","s") end if%>" size="48" maxlength="64"></td>
      </tr>
	  <%end if%>
	  <tr>
     	<td class="light-orange">&nbsp;</td>
   		<td class="light-orange"></td>
    	<td class="tabdata"><div align="right">
    	<%tcWebApi_get("String_Entry","WirelessIntervalText","s")%>
		</div></td>
		<td class="tabdata"><div align="center">:</div></td>
    	<td class="tabdata"><input type="text" name="radiusSVR_ReAuthInter5" value="<%if tcWebApi_get("WLan_Common","session_timeout_interval","h") <> "N/A" then tcWebApi_get("WLan_Common","session_timeout_interval","s") end if%>" size="48" maxlength="63">
        <%tcWebApi_get("String_Entry","WirelessIntervalSecText","s")%> 
		</td>
	  </tr>
	  <!--
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align="right"> Network Re-auth Interval </div></td>
        <td class="tabdata"><div align="center">:</div></td>
        <td class="tabdata"> <input type="text" name="radiusSVR_ReAuthInter" size="48" maxlength="63">
          seconds </td>
      </tr>
	  -->
	  
	  <tr> 
        <td> </td>
        <td> </td>        
        <td height="30" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessWEPStatus10Text","s")%> </td>
        <td>&nbsp;</td>
        <td> </td>

      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessEncryptionText","s")%> </div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <SELECT NAME="TKIP_Selection3"  onChange="doEncryptionChange(this)" SIZE="1">
			<OPTION value="AES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption0Text","s")%>
            <OPTION value="TKIP" <%If tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> ><%tcWebApi_get("String_Entry","WirelessEncryption1Text","s")%> 
            <OPTION value="TKIPAES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption2Text","s")%> 
          </SELECT> </td>
      </tr>
	  <tr>
     	<td class="light-orange">&nbsp;</td>
   		<td class="light-orange"></td>
    	<td class="tabdata"><div align="right">
			<%tcWebApi_get("String_Entry","WirelessRekeyIntervalText","s")%>
			</div></td>
		<td class="tabdata"><div align="center">:</div></td>
    	<td class="tabdata">
	<input type="text" id="WPARekeyInter5" name="WPARekeyInter5" size="7" maxlength="7" onBlur="checkRekeyinteral(this.value, 1)">
         <%tcWebApi_get("String_Entry","WirelessIntervalSecText","s")%> 
	<script language="JavaScript" type="text/JavaScript">
				var rekeystr = "<% tcWebApi_get("WLan_Entry","RekeyInterval","s") %>";
				if("N/A" == rekeystr || "" == rekeystr){
					document.getElementById('WPARekeyInter5').value = "3600";
				}
				else{
					document.getElementById('WPARekeyInter5').value = rekeystr;
				}
			</script>
	</td>
	</tr>
	</table>
	</div>
	  <%end if%>
	</table>
	
	<div id="WEP-64Bits_div">
	<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">       
      <tr> 
        <td width="150"> </td>
        <td width="10" > </td>	
        <td width="150" height="30" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessWEPText","s")%> </td>
        <td width="10">&nbsp;</td>
        <td width="440"> </td>
      </tr>
      <tr> 
		<td class="light-orange">&nbsp;</td><td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPAuthTypeText","s")%> </div></td>
		<td class="tabdata">&nbsp;</td>
		<td class="tabdata">
		<SELECT NAME="WEP_TypeSelection1" SIZE="1" onChange="doWEPTypeChange()">
				<OPTION value="OpenSystem" <% if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "OpenSystem" then asp_Write("selected") elseif tcWebApi_get("WLan_Entry","WEPAuthType","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPAuthType0Text","s")%>
				<OPTION value="SharedKey" <% if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "SharedKey" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPAuthType1Text","s")%>
				<OPTION value="WEPAuto" <% if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "WEPAuto" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPAuthType2Text","s")%>			
		</SELECT>
		</td>
	</tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPStatus1Text","s")%> </div></td>
        <td class="tabdata">&nbsp;</td>
        <td class="tabdata"> <%tcWebApi_get("String_Entry","WirelessWEPStatus1CommText","s")%> </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPStatus2Text","s")%> </div></td>
        <td class="tabdata">&nbsp;</td>
        <td class="tabdata"> <%tcWebApi_get("String_Entry","WirelessWEPStatus2CommText","s")%> </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> 
            <INPUT TYPE="RADIO" NAME="DefWEPKey3" VALUE="1" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") elseif tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #1</div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key13" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if%>" onBlur="doKEYcheck(this)" > 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> 
            <INPUT TYPE="RADIO" NAME="DefWEPKey3" VALUE="2" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #2</div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key23" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key2Str","s") end if%>"  onBlur="doKEYcheck(this)" > 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> 
            <INPUT TYPE="RADIO" NAME="DefWEPKey3" VALUE="3" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "3" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #3</div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key33" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key3Str","s") end if%>"  onBlur="doKEYcheck(this)" > 
        </td>
      </tr>
      <tr> 
        <td class="light-orange">&nbsp;</td>
        <td class="light-orange"></td>
        <td class="tabdata"><div align=right> 
            <INPUT TYPE="RADIO" NAME="DefWEPKey3" VALUE="4" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if%> >
             <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #4</div></td>
        <td class="tabdata"><div align=center>:</div></td>
        <td class="tabdata"> <INPUT TYPE="TEXT" NAME="WEP_Key43" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key4Str","s") end if%>"  onBlur="doKEYcheck(this)" > 
        </td>
      </tr>

	</table>
	</div>
	
	<div id="WEP-128Bits_div">
	<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
	<tr>
		<td width="150"> </td>
		<td width="10" > </td>        
		<td width="150" height="30" class="title-sub"> <%tcWebApi_get("String_Entry","WirelessWEPText","s")%> </td>
		<td width="10">&nbsp;</td>
		<td width="440"> </td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td><td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPAuthTypeText","s")%> </div></td>
		<td class="tabdata">&nbsp;</td>
		<td class="tabdata">
		<SELECT NAME="WEP_TypeSelection2" SIZE="1" onChange="doWEPTypeChange()">
				<OPTION value="OpenSystem" <% if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "OpenSystem" then asp_Write("selected") elseif tcWebApi_get("WLan_Entry","WEPAuthType","h") = "N/A" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPAuthType0Text","s")%>
				<OPTION value="SharedKey" <% if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "SharedKey" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPAuthType1Text","s")%>
				<OPTION value="WEPAuto" <% if tcWebApi_get("WLan_Entry","WEPAuthType","h") = "WEPAuto" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessWEPAuthType2Text","s")%>			
		</SELECT>
		</td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPStatus1Text","s")%> </div></td>
		<td class="tabdata">&nbsp;</td>
		<td class="tabdata"> <%tcWebApi_get("String_Entry","WirelessWEPStatus1CommText","s")%> </td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td>
		<td class="tabdata"><div align=right> <%tcWebApi_get("String_Entry","WirelessWEPStatus2Text","s")%> </div></td>
		<td class="tabdata">&nbsp;</td>
		<td class="tabdata"> <%tcWebApi_get("String_Entry","WirelessWEPStatus2CommText","s")%> </td>
	</tr>
	<tr>
		<td class="light-orange">&nbsp;</td><td class="light-orange"></td>
		<td class="tabdata"><div align=right>
			<INPUT TYPE="RADIO" NAME="DefWEPKey4" VALUE="1" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "1" then asp_Write("checked") end if%> <% If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #1</div></td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">   
			<INPUT TYPE="TEXT" NAME="WEP_Key14" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key1Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key1Str","s") end if%>" onBlur="doKEYcheck(this);" >
		</td>
	</tr>
	<tr>                                                                                      
		<td class="light-orange">&nbsp;</td><td class="light-orange"></td>
		<td class="tabdata"><div align=right>                                                                                                                                                                                     
			<INPUT TYPE="RADIO" NAME="DefWEPKey4" VALUE="2" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "2" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #2</div>
		</td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<INPUT TYPE="TEXT" NAME="WEP_Key24" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key2Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key2Str","s") end if%>"  onBlur="doKEYcheck(this);" >
		</td>
	</tr>
	<tr>                                                                                      
		<td class="light-orange">&nbsp;</td>
		<td class="light-orange"></td><td class="tabdata"><div align=right>                                                                                                                                                                                     
			<INPUT TYPE="RADIO" NAME="DefWEPKey4" VALUE="3" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "3" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #3</div>
		</td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">           
			<INPUT TYPE="TEXT" NAME="WEP_Key34" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key3Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key3Str","s") end if%>"  onBlur="doKEYcheck(this);" >
		</td>
	</tr>
	<tr>                                                                                      
    <td class="light-orange">&nbsp;</td>
    <td class="light-orange"></td>
    <td class="tabdata"><div align=right>                                                                                                                                                                                     
			<INPUT TYPE="RADIO" NAME="DefWEPKey4" VALUE="4" <%If tcWebApi_get("WLan_Entry","DefaultKeyID","h") = "4" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessDefaultKeyText","s")%> #4</div>
		</td>
		<td class="tabdata"><div align=center>:</div></td>
		<td class="tabdata">
			<INPUT TYPE="TEXT" NAME="WEP_Key44" SIZE="30" MAXLENGTH="28" VALUE="<%If tcWebApi_get("WLan_Entry","Key4Str","h") <> "N/A" then tcWebApi_get("WLan_Entry","Key4Str","s") end if%>"  onBlur="doKEYcheck(this);" >
		</td>
	</tr>

	</table>
	</div>

	
<div id="WPA2PSK_div"><!--wpa2psk-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessEncryptionSecurityText","s")%> </td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessEncryptionText","s")%></td>
<td align=left class="tabdata">
			<SELECT NAME="TKIP_Selection4" onChange="doEncryptionChange(this)" SIZE="1">
				<OPTION value="AES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption0Text","s")%> 
				<OPTION value="TKIP" <%If tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> ><%tcWebApi_get("String_Entry","WirelessEncryption1Text","s")%>
				<OPTION value="TKIPAES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption2Text","s")%>
			</SELECT>
		</td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSharedSecurityKeyText","s")%> </td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessSharedKeyText","s")%></td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" NAME="PreSharedKey1" SIZE="45" MAXLENGTH="64" VALUE="<%If tcWebApi_get("WLan_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPAPSK","s") end if%>" onBlur="wpapskCheck(this)"> 
		</td>
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:270px;">&nbsp;</td>
<td align=left class="tabdata">
<%tcWebApi_get("String_Entry","WirelessSharedKeyCommText","s")%> </td>
</tr>

<tr height="30px" style="display:none;">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessRenewalIntervalText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" id="keyRenewalInterval1" NAME="keyRenewalInterval1" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)">
          	  <%tcWebApi_get("String_Entry","WirelessSecondsTipText","s")%> 
		  	<script language="JavaScript" type="text/JavaScript">
				var rekeystr = "<% tcWebApi_get("WLan_Entry","RekeyInterval","s") %>";
				if("N/A" == rekeystr || "" == rekeystr){
					document.getElementById('keyRenewalInterval1').value = "3600";
				}
				else{
					document.getElementById('keyRenewalInterval1').value = rekeystr;
				}
			</script>
		  </td>
	</tr>
	</table>
</div><!--id="WPA2PSK_div"-->
	
<div id="WPAPSK_div"><!--wpapsk-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessEncryptionSecurityText","s")%> </td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessEncryptionText","s")%></td>
<td align=left class="tabdata">
			<SELECT NAME="TKIP_Selection5" onChange="doEncryptionChange(this)" SIZE="1">
				<OPTION value="AES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","WirelessEncryption0Text","s")%> 
				<OPTION value="TKIP" <%If tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","WirelessEncryption1Text","s")%>
				<OPTION value="TKIPAES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption2Text","s")%>
		</SELECT>
		</td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSharedSecurityKeyText","s")%> </td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessSharedKeyText","s")%></td>
<td align=left class="tabdata">
<INPUT TYPE="TEXT" NAME="PreSharedKey2" SIZE="45" MAXLENGTH="64" VALUE="<%If tcWebApi_get("WLan_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPAPSK","s") end if%>" onBlur="wpapskCheck(this)">
		</td>
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:270px;">&nbsp;</td>
<td align=left class="tabdata">
<%tcWebApi_get("String_Entry","WirelessSharedKeyCommText","s")%> </td>
</tr>

<tr height="30px" style="display:none;">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessRenewalIntervalText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" id="keyRenewalInterval2" NAME="keyRenewalInterval2" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)">
          	  <%tcWebApi_get("String_Entry","WirelessSecondsTipText","s")%> 
		  	<script language="JavaScript" type="text/JavaScript">
				var rekeystr = "<% tcWebApi_get("WLan_Entry","RekeyInterval","s") %>";
				if("N/A" == rekeystr || "" == rekeystr){
					document.getElementById('keyRenewalInterval2').value = "3600";
				}
				else{
					document.getElementById('keyRenewalInterval2').value = rekeystr;
				}
			</script>
		  </td>
	</tr>
	</table>
</div><!--id="WPAPSK_div"-->

<div id="WPAPSKWPA2PSK_div"><!--wpapskwpa2psk-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessEncryptionSecurityText","s")%> </td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessEncryptionText","s")%></td>
<td align=left class="tabdata">
			<SELECT NAME="TKIP_Selection6" onChange="doEncryptionChange(this)"s SIZE="1">
				<OPTION value="AES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "AES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption0Text","s")%> 
				<OPTION value="TKIP" <%If tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIP" then asp_Write("selected") end if%> ><%tcWebApi_get("String_Entry","WirelessEncryption1Text","s")%>
				<OPTION value="TKIPAES" <% if tcWebApi_get("WLan_Entry","EncrypType","h") = "TKIPAES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption2Text","s")%> 
			</SELECT>
		</td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSharedSecurityKeyText","s")%> </td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessSharedKeyText","s")%></td>
<td align=left class="tabdata">
	<INPUT TYPE="TEXT" NAME="PreSharedKey3" SIZE="45" MAXLENGTH="64" VALUE="<%If tcWebApi_get("WLan_Entry","WPAPSK","h") <> "N/A" then tcWebApi_get("WLan_Entry","WPAPSK","s") end if%>" onBlur="wpapskCheck(this)">  
		</td>
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:270px;">&nbsp;</td>
<td align=left class="tabdata">
<%tcWebApi_get("String_Entry","WirelessSharedKeyCommText","s")%> </td>
</tr>

<tr height="30px" style="display:none;">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessRenewalIntervalText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" id="keyRenewalInterval3" NAME="keyRenewalInterval3" SIZE="7" MAXLENGTH="7" onBlur="checkRekeyinteral(this.value, 0)">
          	  <%tcWebApi_get("String_Entry","WirelessSecondsTipText","s")%> 
		  	<script language="JavaScript" type="text/JavaScript">
				var rekeystr = "<% tcWebApi_get("WLan_Entry","RekeyInterval","s") %>";
				if("N/A" == rekeystr || "" == rekeystr){
					document.getElementById('keyRenewalInterval3').value = "3600";
				}
				else{
					document.getElementById('keyRenewalInterval3').value = rekeystr;
				}
			</script>
		  </td>
	</tr>
	</table>
</div><!--id="WPAPSKWPA2PSK_div"-->
 <% if  tcWebApi_get("WebCurSet_Entry","wlan_id","h") = "0"  then %>
						<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" class="tabdata" >
		<tr>
			<td  align=left class="tabdata" style="padding-left:20px;">
				<div style="color:#F36F22;">
					<%tcWebApi_get("String_Entry","WirelessBandsteering2Text","s")%>
	                	</div>
			</td>
		</tr>
		<tr>
								<td  align=left class="tabdata" style="padding-left:20px;">
									<div style="color:#F36F22;">
										<%tcWebApi_get("String_Entry","WirelessBandsteering3Text","s")%>
									</div>
								</td>
							</tr>		
						</table>
						<% end if %>
						<!--wang add end 20180125-->

</div><!--id="block1"-->

<% if tcWebApi_get("WebCustom_Entry","isWPSSupported","h") = "Yes"  then %>
<% if tcWebApi_get("WebCurSet_Entry","wlan_id","h") = "0" then %>
<div id="block1"><!--id="block1" 12/08 WPS-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"> <%tcWebApi_get("String_Entry","WirelessWPSSettingsText","s")%> </td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessUseWPSText","s")%></td>
<td align=left class="tabdata">
    <input name="UseWPS_Selection" VALUE="1" <%If tcWebApi_get("WLan_Entry","WPSConfMode","h") <> "0" then asp_Write("checked") end if%> onClick="doWPSUseChange();" type="radio"> <%tcWebApi_get("String_Entry","WirelessBroadcastSSID0Text","s")%> &nbsp;&nbsp;&nbsp;
    <input name="UseWPS_Selection" VALUE="0" <%If tcWebApi_get("WLan_Entry","WPSConfMode","h") = "0" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_Entry","WPSConfMode","h") = "N/A" then asp_Write("checked") end if%> onClick="doWPSUseChange();" type="radio">
	<%tcWebApi_get("String_Entry","WirelessBroadcastSSID1Text","s")%> 
</td>
</tr>
</table>
	
<div id="WPSConfMode_1_div">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWPSstateText","s")%></td>
<td align=left class="tabdata">
	  <%If tcWebApi_get("WLan_Entry", "WPSConfStatus", "h") = "1" then tcWebApi_get("String_Entry","WPSConfStatus0Text","s") 
	  elseif tcWebApi_get("WLan_Entry", "WPSConfStatus", "h") = "2" then tcWebApi_get("String_Entry","WPSConfStatus1Text","s") 
	  elseif tcWebApi_get("WLan_Entry", "WPSConfStatus", "h") = "N/A" then tcWebApi_get("String_Entry","WPSConfStatus0Text","s") 
	  end if%>
</td>
</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
    <%tcWebApi_get("String_Entry","WirelessWPSprogressText","s")%></td>
    <td align=left class="tabdata">
	<%if tcWebApi_get("Info_WLan", "wlanWPSStatus", "h") = "Idle" then tcWebApi_get("String_Entry","WlanWPSStatus0Text","s") 
	elseif tcWebApi_get("Info_WLan", "wlanWPSStatus", "h") = "In progress" then tcWebApi_get("String_Entry","WlanWPSStatus1Text","s")
	elseif tcWebApi_get("Info_WLan", "wlanWPSStatus", "h") = "Configured" then tcWebApi_get("String_Entry","WPSConfStatus1Text","s")
	elseif tcWebApi_get("Info_WLan", "wlanWPSStatus", "h") = "WPS process Fail" then tcWebApi_get("String_Entry","WlanWPSStatus2Text","s")
	else tcWebApi_get("Info_WLan", "wlanWPSStatus", "s")	
	end if%>
	</td>
  </tr>
  
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
    <%tcWebApi_get("String_Entry","WirelessWPSmodeText","s")%></td>
<td align=left class="tabdata">
<!--cindy delete  12/08
    <input name="WPSMode_Selection" value="0" onClick="doWPSModeChange();" <%If tcWebApi_get("WLan_Entry","WPSMode","h") = "0" then asp_Write("checked") end if%> type="radio"><%tcWebApi_get("String_Entry","WirelessWPSmode0Text","s")%>
    <input name="WPSMode_Selection" value="1" onClick="doWPSModeChange();" <%If tcWebApi_get("WLan_Entry","WPSMode","h") = "1" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_Entry","WPSMode","h") = "N/A" then asp_Write("checked") end if%>  type="radio">
    <%tcWebApi_get("String_Entry","WirelessWPSmode1Text","s")%>
-->

<!--cindy add from radio to select 12/08-->
	<select name="WPSMode_Selection" size="1" onchange="doWPSModeChange();">
	<option value="0" <%if TCWebApi_get("WLan_Entry","WPSMode","h") = "0" then asp_write("selected") end if%>><%tcWebApi_get("String_Entry","WirelessWPSmode0Text","s")%></option>
	<option value="1" <%if TCWebApi_get("WLan_Entry","WPSMode","h") = "1" then asp_write("selected") elseif tcWebApi_get("WLan_Entry","WPSMode","h") = "N/A" then asp_Write("selected") end if%>><%tcWebApi_get("String_Entry","WirelessWPSmode1Text","s")%></option>
    	</select>
<!--cindy add from radio to select 12/08-->
</td>
</tr>

    <!--foxconn steve modify start -->
<tr id = "WPSMode_SelectionDiv" height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
    <%tcWebApi_get("String_Entry","WirelessWPSPINmodeText","s")%></td>
<td align=left class="tabdata">
<!--cindy delete  12/08
    <input name="WPSPinMode_Selection" value="0" onClick="doWPSPinModeChange();" 
    <%If tcWebApi_get("WLan_Entry","WPSPinMode","h") = "0" then asp_Write("checked") end if%> 
    type="radio"><%tcWebApi_get("String_Entry","WirelessAPPINcodeText","s")%>
    <input name="WPSPinMode_Selection" value="1" onClick="doWPSPinModeChange();" 
	<%If tcWebApi_get("WLan_Entry","WPSPinMode","h") = "1" then asp_Write("checked") end if%>
    type="radio"><%tcWebApi_get("String_Entry","WirelessenrolleePINcodeText","s")%>
-->

<!--
	<select name="WPSPinMode_Selection" size="1" onchange="doWPSPinModeChange();">
	<option value="0" <%if TCWebApi_get("WLan_Entry","WPSPinMode","h") = "0" then asp_write("selected") end if%>><%tcWebApi_get("String_Entry","WirelessAPPINcodeText","s")%>
	<option value="1" <%if TCWebApi_get("WLan_Entry","WPSPinMode","h") = "1" then asp_write("selected") end if%>><%tcWebApi_get("String_Entry","WirelessenrolleePINcodeText","s")%>
    	</select>
-->

<div style="display:none;">
    <input name="WPSPinMode_Selection" value="1" onClick="doWPSPinModeChange();" 
	<%If tcWebApi_get("WLan_Entry","WPSPinMode","h") = "1" then asp_Write("checked") end if%>
    type="radio">
</div>
<%tcWebApi_get("String_Entry","WirelessenrolleePINcodeText","s")%>

</td>
</tr>


 <tr id = "WPSMode_SelectionDiv1" height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
	    <% tcWebApi_get("String_Entry", "WirelessPINcodestatusText", "s") %></td>
<td align=left class="tabdata" style="white-space:nowrap;">
<div id = "WPSAPPinMode">
	    <% tcWebApi_get("Info_WLan", "wlanSelfPinCode", "s") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" class="button1" name="pin_generate" value="<%tcWebApi_get("String_Entry","ButtonGenerateText","s")%>" onClick="doGenerate()">
</div>

<div id = "WPSSTAPinMode">
    	<input name="WPSEnrolleePINCode" size="9" maxlength="9" value="<%If tcWebApi_get("WLan_Entry","enrolleePinCode","h") = "N/A" then asp_Write("") else TCWebApi_get("WLan_Entry","enrolleePinCode","s") end if %>" onblur="doPINCodeCheck(this)" type="text">
	</div>
</td>
</tr>
</table>
<!--foxconn steve modify end -->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px">		
		<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;"><%tcWebApi_get("String_Entry","WirelessWPSbuttonstartText","s")%></td>
</tr>
</table>
  
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
 <tr height="40px"  id="buttoncolor">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
    <input name="StartWPS" class="button1" value="<%IF tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "0" then tcWebApi_get("String_Entry","WlanWPStimerRunning0Text","s") 
    elseif tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "N/A" then tcWebApi_get("String_Entry","WlanWPStimerRunning0Text","s") 
    elseif tcWebApi_get("Info_WLan","wlanWPStimerRunning","h") = "1" then tcWebApi_get("String_Entry","WlanWPStimerRunning1Text","s")  end if%> "
    onclick="doStartWPS();" type="button">
 </td>
  </tr>
  
 <tr height="30px" style="display:none;">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
   <input name="ResetOOB" value="<%tcWebApi_get("String_Entry","ButtonResetOOBText","s")%>" onclick="doResetOOB();" type="button" >
  </td>
  </tr>
</table>
</div>
</div><!--id="block1" 12/08-->
<% end if %>
<% end if %> 

<div id="block1" style="display:none"><!--wang delete WDS start-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
	<% if tcWebApi_get("Info_WLan","isWDSSupported","h") = "Yes" then %>
<td align=left class="title-main" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWDSSettingsText","s")%> </td>
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWDSModeText","s")%></td>
<td align=left class="tabdata">
		   <input type="RADIO" name="WLAN_WDS_Active" value="1" onClick="autoWLAN_WDS_Active()" <%If tcWebApi_get("WLan_WDS","WdsEnable","h") <> "0" then asp_Write("checked") end if%> >
           <%tcWebApi_get("String_Entry","WirelessAccessPoint0Text","s")%>  
          <input type="RADIO" name="WLAN_WDS_Active" value="0" onClick="autoWLAN_WDS_Deactive()" <%If tcWebApi_get("WLan_WDS","WdsEnable","h") = "0" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_WDS","WdsEnable","h") = "N/A" then asp_Write("checked") end if%> >
		   <%tcWebApi_get("String_Entry","WirelessAccessPoint1Text","s")%> 
		</td>
	</tr>
	</table>

	<div id="else_div">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWDSEncrypTypeText","s")%></td>
<td align=left class="tabdata">
			<SELECT NAME="WDS_EncrypType_Selection" SIZE="1" onChange="doWDSEncrypTypeChange()">
				<OPTION value="TKIP" <%If tcWebApi_get("WLan_WDS","WdsEncrypType","h") = "TKIP" then asp_Write("selected") end if%> ><%tcWebApi_get("String_Entry","WirelessEncryption1Text","s")%>
				<OPTION value="AES" <% if tcWebApi_get("WLan_WDS","WdsEncrypType","h") = "AES" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessEncryption0Text","s")%> 
			</SELECT>
		</td>
	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWDSKeyText","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" NAME="WDS_Key" SIZE="48" MAXLENGTH="64" VALUE="<%If tcWebApi_get("WLan_WDS","WdsKey","h") <> "N/A" then tcWebApi_get("WLan_WDS","WdsKey","s") end if%>" onBlur="WDSKeyCheck(this)"> <%tcWebApi_get("String_Entry","WirelessWDSKeyCommText","s")%> 
		</td>
    </tr>
	</table>
	</div>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWDSFilter0Text","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" NAME="WLANWDS_PEER_MAC1" SIZE="20" MAXLENGTH="20" VALUE="<%if tcWebApi_get("WLan_WDS","Wds_MAC0","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC0","s") end if%>" onBlur="doMACcheck(this)">
		</td>
  	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWDSFilter1Text","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" NAME="WLANWDS_PEER_MAC2" SIZE="20" MAXLENGTH="20" VALUE="<%if tcWebApi_get("WLan_WDS","Wds_MAC1","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC1","s") end if%>" onBlur="doMACcheck(this)">
		</td>
  	</tr>

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWDSFilter2Text","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" NAME="WLANWDS_PEER_MAC3" SIZE="20" MAXLENGTH="20" VALUE="<%if tcWebApi_get("WLan_WDS","Wds_MAC2","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC2","s") end if%>" onBlur="doMACcheck(this)">
		</td>
  	</tr>
 

<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessWDSFilter3Text","s")%></td>
<td align=left class="tabdata">
			<INPUT TYPE="TEXT" NAME="WLANWDS_PEER_MAC4" SIZE="20" MAXLENGTH="20" VALUE="<%if tcWebApi_get("WLan_WDS","Wds_MAC3","h") <> "N/A" then tcWebApi_get("WLan_WDS","Wds_MAC3","s") end if%>" onBlur="doMACcheck(this)">
		</td>
  	</tr>
</table>
	<%End If%>
</div><!--delete WDS end--><!--id="block1" 12/09-->

<div id="block1"><!--id="block1" 12/09-->
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessWDSMACFilterText","s")%> </td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessActiveText","s")%></td>
<td align=left class="tabdata">
	<INPUT TYPE="RADIO" NAME="WLAN_FltActive" VALUE="1" onClick="disablemacfilter();" <%If tcWebApi_get("WLan_Entry","AccessPolicy","h") <> "0" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessAccessPoint0Text","s")%>&nbsp;&nbsp;&nbsp;&nbsp; 
	<INPUT TYPE="RADIO" NAME="WLAN_FltActive" VALUE="0" onClick="disablemacfilter();"<%If tcWebApi_get("WLan_Entry","AccessPolicy","h") = "0" then asp_Write("checked") end if%> <%If tcWebApi_get("WLan_Entry","AccessPolicy","h") = "N/A" then asp_Write("checked") end if%> > <%tcWebApi_get("String_Entry","WirelessAccessPoint1Text","s")%> 
		</td>
	</tr>
</table>

<% if tcWebApi_get("WLan_Entry","AccessPolicy","h") = "0" then %>
<div id="div_macfilter" style="display:none;">
<% else %>
<div id="div_macfilter">
<% end if %>
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessActionselectText","s")%> </td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","WirelessActionText","s")%></td>
<td align=left class="tabdata">
			<SELECT NAME="WLAN_FltAction" SIZE="1">
				<OPTION value="1" <% if tcWebApi_get("WLan_Entry","AccessPolicy","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessAction0Text","s")%>
				<OPTION value="2" <% if tcWebApi_get("WLan_Entry","AccessPolicy","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessAction1Text","s")%>
			</SELECT>
			 <%tcWebApi_get("String_Entry","WirelessActionCommText","s")%> 
		</td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessSetMACAddress","s")%> </td>
</tr>
</table>


<!--wang add start 201802-->

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<INPUT TYPE="HIDDEN" NAME="Mac_filter_flag" value="0">
<INPUT TYPE="HIDDEN" NAME="Mac_filter_id" value="0">
<INPUT TYPE="HIDDEN" NAME="delnum">
	<INPUT TYPE="HIDDEN" NAME="unsetmacaddr" value="">

 <tr height="30px">
  <td align=left class="tabdata" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","Wirelessmacfilter0Text","s")%> </td>
  <td align=left class="tabdata">
    <SELECT NAME="LAN_Device_mac_select" SIZE="1" onchange="doMACaddressChange()">
        <OPTION value="0" selected ><%tcWebApi_get("String_Entry","Wirelessmacfilter1Text","s")%>
        <% if tcwebApi_get("WiFiInfo_Entry0", "MAC","h") <> "N/A" then %>
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry0", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry0", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry0", "MAC","s")%> 
        <% end if %>

        <% if tcwebApi_get("WiFiInfo_Entry1", "MAC","h") <> "N/A" then %>
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry1", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry1", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry1", "MAC","s")%> 
        <% end if %>

        <% if tcwebApi_get("WiFiInfo_Entry2", "MAC","h") <> "N/A" then %>
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry2", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry2", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry2", "MAC","s")%> 
        <% end if %>

        <% if tcwebApi_get("WiFiInfo_Entry3", "MAC","h") <> "N/A" then %>
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry3", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry3", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry3", "MAC","s")%>
        <% end if %>

        <% if tcwebApi_get("WiFiInfo_Entry4", "MAC","h") <> "N/A" then %>
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry4", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry4", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry4", "MAC","s")%>
        <% end if %>

        <% if tcwebApi_get("WiFiInfo_Entry5", "MAC","h") <> "N/A" then %> 
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry5", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry5", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry5", "MAC","s")%> 
        <% end if %>

        <% if tcwebApi_get("WiFiInfo_Entry6", "MAC","h") <> "N/A" then %> 
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry6", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry6", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry6", "MAC","s")%>
        <% end if %>

        <% if tcwebApi_get("WiFiInfo_Entry7", "MAC","h") <> "N/A" then %> 
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry7", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry7", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry7", "MAC","s")%> 
        <% end if %>   

        <% if tcwebApi_get("WiFiInfo_Entry8", "MAC","h") <> "N/A" then %> 
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry8", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry8", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry8", "MAC","s")%> 
        <% end if %>

        <% if tcwebApi_get("WiFiInfo_Entry9", "MAC","h") <> "N/A" then %> 
        <OPTION value="<%tcWebApi_staticGet("WiFiInfo_Entry9", "MAC","s")%>"><%tcWebApi_staticGet("WiFiInfo_Entry9", "IP","s")%>&nbsp;-&nbsp;<%tcWebApi_staticGet("WiFiInfo_Entry9", "MAC","s")%>
        <% end if %>     
	</SELECT>
  </td>
 </tr>

<tr id="ManuallyMacAddr" height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","Wirelessmacfilter2Text","s")%> </td>
<td align=left class="tabdata">
			<INPUT NAME="LAN_Manual_Mac" SIZE="18"  MAXLENGTH="24" VALUE="" PLACEHOLDER="11:22:33:44:55:66" onBlur="doMACcheck(this)"> 
		</td>		
	</tr>
</table>

<table width="640" border="0"  cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
<tr height="25px" style="width:100%;background:#e6e6e6;">		
<td class="title-main" align=left style="padding-left:20px;"><%tcWebApi_get("String_Entry","Wirelessmacfilter3Text","s")%></td> 
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" style="table-layout: fixed;">
<tr >
<td align=center class="tabdata">
	<div class="configstyle">
		<div id=MAC_Access_control></div>
	</div>
		</td>
</tr>
</table>

<script language=JavaScript>
var tableHeader = [
	["5%","<%tcWebApi_get("String_Entry","Wirelessmacfilter4Text","s")%>"],
	["40%","<%tcWebApi_get("String_Entry","Wirelessmacfilter5Text","s")%>"],
	["20%","<%tcWebApi_get("String_Entry","Wirelessmacfilter6Text","s")%>"],
	["35%","<%tcWebApi_get("String_Entry","Wirelessmacfilter7Text","s")%>"]
];

var tableData = [
  	["1", "<%tcWebApi_get("WLan_Entry", "WLan_MAC0","s")%>","0"], 
    ["2", "<%tcWebApi_get("WLan_Entry", "WLan_MAC1","s")%>","1"], 
  	["3", "<%tcWebApi_get("WLan_Entry", "WLan_MAC2","s")%>","2"], 
  	["4", "<%tcWebApi_get("WLan_Entry", "WLan_MAC3","s")%>","3"], 
  	["5", "<%tcWebApi_get("WLan_Entry", "WLan_MAC4","s")%>","4"], 
  	["6", "<%tcWebApi_get("WLan_Entry", "WLan_MAC5","s")%>","5"], 
  	["7", "<%tcWebApi_get("WLan_Entry", "WLan_MAC6","s")%>","6"], 
  	["8", "<%tcWebApi_get("WLan_Entry", "WLan_MAC7","s")%>","7"] 
];


showTable('MAC_Access_control',tableHeader,tableData,1);
</script>

<!--wang add end-->

</div><!--id="div_macfilter"-->
</div><!--id="block1" 12/14-->

<div id="block1" style="display:none;"><!--id="block1" 12/14-->
	<% if tcWebApi_get("WLan_Common","rt_device","h") = "7615" then %>
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed;margin:5px 0;">
	<tr height="25px" style="width:100%;background:#e6e6e6;">		
		<td align=left class="title-main" style="width:250px;padding-left:20px;"><%tcWebApi_get("String_Entry","WirelessStreamText","s")%></td>
	</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><font color="#000000"><%tcWebApi_get("String_Entry","WirelessTxStreamText","s")%></font></td>
<td align=left class="tabdata">
			<SELECT NAME="TxStream_Action" SIZE="1">			
				<OPTION value="1" <% if tcWebApi_get("WLan_Common","HT_TxStream","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessStream1Text","s")%>
				<OPTION value="2" <% if tcWebApi_get("WLan_Common","HT_TxStream","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessStream2Text","s")%>
				<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>					
				<OPTION value="3" <% if tcWebApi_get("WLan_Common","HT_TxStream","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessStream3Text","s")%>
				<OPTION value="4" <% if tcWebApi_get("WLan_Common","HT_TxStream","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessStream4Text","s")%>	
				<% end if %>					
			</SELECT>
		</td>
	</tr>

<tr height="30px">
		<td align=left class="tabdata" style="width:250px;padding-left:20px;"><font color="#000000"><%tcWebApi_get("String_Entry","WirelessRxStreamText","s")%></font></td>
<td align=left class="tabdata">
			<SELECT NAME="RxStream_Action" SIZE="1">
				<OPTION value="1" <% if tcWebApi_get("WLan_Common","HT_RxStream","h") = "1" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessStream1Text","s")%>
				<OPTION value="2" <% if tcWebApi_get("WLan_Common","HT_RxStream","h") = "2" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessStream2Text","s")%>
				<% if tcWebApi_get("Info_WLan","isMT7615DSupported","h") <> "Yes" then %>							
				<OPTION value="3" <% if tcWebApi_get("WLan_Common","HT_RxStream","h") = "3" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessStream3Text","s")%>
				<OPTION value="4" <% if tcWebApi_get("WLan_Common","HT_RxStream","h") = "4" then asp_Write("selected") end if %>><%tcWebApi_get("String_Entry","WirelessStream4Text","s")%>	
				<% end if %>										
			</SELECT>
		</td>
	</tr>	
</table>
<%End If%>
</div><!--id="block1" 12/09-->

<div style="display:none;">
<!--cindy add RSSI information 11/17-->
<INPUT type="HIDDEN" name="LeaseNum" value="<%TcWebApi_get("WiFiInfo_Common","WiFiNum","s")%>">

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="title-main" style="width:250px;padding-left:20px;">
<%tcWebApi_get("String_Entry","Wireless11nRSSIText","s")%></td>
</tr>

<tr>
<td colspan="3" align=center>
 	<div id="RSSI2"></div>
<script language=JavaScript>
		//setInterval(loadDoc, 3000);
		setTimeout(loadDoc,500);
		function loadDoc() {
  			var xmlhttp;
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
 			 xmlhttp=new XMLHttpRequest();
 			 }
		else{// code for IE6, IE5
 			 xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  			}
			
  			xmlhttp.onreadystatechange = function() {
   	 		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
      				document.getElementById("RSSI2").innerHTML =xmlhttp.responseText;
    			}
  		};
  		xmlhttp.open("GET", "/cgi-bin/show_2.4g_clients.asp", true);
		xmlhttp.setRequestHeader('If-Modified-Since', '0');
  		xmlhttp.send();
		}
	</script>
</td></tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="table-layout: fixed">
<tr height="30px">
<td align=left class="tabdata" style="width:250px;padding-left:20px;">
<INPUT TYPE="button" NAME="refresh" VALUE="<%tcWebApi_get("String_Entry","ButtonRefresh0Text","s")%>" onClick="loadDoc()">        
</td>
<td width="440" class="orange" style="padding-right:40px;" align="right">
<INPUT TYPE="button" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick='download_RSSI_information()'>
</td>
</tr>
</table>
<!--cindy add RSSI information 11/17-->
</div>
</div><!--id="hiddenwififunction" 12/14-->

<div id="button0">
<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF" style="margin:5px 0;">
<tr height="25px">		
<td align=left class="title-main" style="padding-left:20px;white-space:nowrap;">
<%tcWebApi_get("String_Entry","ClickButtonSaveText","s")%></td>
</tr>
</table>

<table width="640" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
<tr height="40px">
<td width="250px" align=left class="tabdata" style="padding-left:20px;">
			<INPUT TYPE="BUTTON" class="button1" NAME="BUTTON" VALUE="<%tcWebApi_get("String_Entry","ButtonSaveText","s")%>" onClick="return doSave();">
			
			<INPUT TYPE="HIDDEN" NAME="CountryChange" VALUE="0">
			<!-- Foxconn alan add for FPT test wifi country code issue (20171101) -->
			<INPUT TYPE="HIDDEN" NAME="ChangeCountry" VALUE="0">
			<INPUT TYPE="HIDDEN" NAME="AutoChannel" VALUE="0">
			<!-- Foxconn alan add end (20171101) -->
		</td>
<td id="firstDiv" style="float:left;"></td><!--cindy add for  show cache image in webgui when click the "save" button 2019/02/15-->

	</tr>
</table>
</div><!--id="button0" 12/09-->
</div><!--id=contenttype-->
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
<%End If%>
</body>
</html>
