--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

include("shared.lua");

-- Called when the target ID HUD should be painted.
function ENT:HUDPaintTargetID(x, y, alpha)
	local colorTargetID = Clockwork.option:GetColor("target_id")
	local colorWhite = Clockwork.option:GetColor("white")
	
	y = Clockwork.kernel:DrawInfo("Coinslot", x, y, colorTargetID, alpha)
	y = Clockwork.kernel:DrawInfo("An ancient machine with a multitude of cranks and gears. It has a prominent coinslot.", x, y, colorWhite, alpha);
end;

local function CreateMenu(state)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
		
	menu:SetMinimumWidth(150);
	
	if 1 == 1 then
		menu:AddOption("Collect Ration", function() Clockwork.Client:ConCommand("cw_CoinslotRation") end);
		
		if 1 == 1 then
			if !Clockwork.Client:GetNetVar("collectedGear") then
				menu:AddOption("Collect Kit", function() Clockwork.Client:ConCommand("cw_CoinslotGear") end);
			end
		end
		menu:AddOption("Heal", function() Clockwork.Client:ConCommand("cw_CoinslotHeal") end);
		
		menu:AddOption("Donate", function() 
			Derma_StringRequest("Coinslot", "How much coin would you offer to the Coinslot?", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotDonate", text);
			end)
		end);
	end
	if state == "Hierarchy" then
	elseif Clockwork.Client:IsAdmin() then
		local subMenu = menu:AddSubMenu("(ADMIN) Treasury");
		
		subMenu:AddOption("Check", function() Clockwork.Client:ConCommand("cw_CoinslotTreasury") end);
		subMenu:AddOption("Collect", function() 
			Derma_StringRequest("Coinslot", "How much coin would you collect from the Coinslot?", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotCollect", text);
			end) 
		end);
		subMenu:AddOption("Modify", function() 
			Derma_StringRequest("Coinslot", "How much coin would you modify the treasury by?", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotDonate", text, "true");
			end) 
		end);
		subMenu:AddOption("Set Tax Rate", function() 
			Derma_StringRequest("Coinslot", "What tax rate would you like to set for the Tower? (1-99)", nil, function(text)
				Clockwork.kernel:RunCommand("CoinslotTax", text);
			end) 
		end);
	end
	
	menu:Open();
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

netstream.Hook("OpenCoinslotMenu", function(state)
	CreateMenu(state);
end);