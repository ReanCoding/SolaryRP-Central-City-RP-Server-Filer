function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

Citizen.CreateThread(function()
  AddTextEntry('0x4992196C', 'KOMMER')
  -- POLICE2
	AddTextEntry('0x9F05F101', 'Police2')
	-- POLICE3
	AddTextEntry('0x71FA16EA', 'Police3')
	-- POLICE4
	AddTextEntry('0x8A63C7B9', 'Police4')
	-- POLICE5
	AddTextEntry('0x9C32EB57', 'Police5') 		
	-- POLICE6
	AddTextEntry('0xB2FF98F0', 'Police6') 	
	-- POLICE7
	AddTextEntry('0xC4B53C5B', 'Police7')
	-- POLICE8
	AddTextEntry('0xD0AF544F', 'Police8')
	  
	AddTextEntry('0x0A8F2C48', 'GT-R BenSopra')
	
	AddTextEntry('0x0CB85AD2', 'RoofHood')
	
	AddTextEntry('0x1FA53912', 'Carbon & Carbon Lip')
	
	AddTextEntry('0x2EAF5722', 'Original GTS Spoiler')
	
	AddTextEntry('0x3B2EF025', 'GT-R LB Works')
	
	AddTextEntry('0x3C7DF2BF', 'Lifted Spoiler')
	
	AddTextEntry('0x11E39D8F', 'GTS & Carbon Lip')
	
	AddTextEntry('0x11FE655E', 'Window Spoiler')
	
	AddTextEntry('0x30F0DBA9', 'GT-R')
	
	AddTextEntry('0x37B789DE', 'M4 GTS Liberty Walk')
	
	AddTextEntry('0x202D01BB', 'Spikes')
	
	AddTextEntry('0x4949A7F8', 'BMW')
	
	AddTextEntry('0xA85DF262', 'GTS Hood')
	
	AddTextEntry('0xB6A337F7', 'GTS Interior SidePanelRight')
	
	AddTextEntry('0xB1015BC8', 'Carbon Lip')
	
	AddTextEntry('0xBB0F40CF', 'GTS Interior SidePanelLeft')
	
	AddTextEntry('0xCA450E4F', 'Carbon')
	
	AddTextEntry('0xD7B6A932', 'LB Works')
	
	AddTextEntry('0xFE72BE47', 'All Combined')
end)