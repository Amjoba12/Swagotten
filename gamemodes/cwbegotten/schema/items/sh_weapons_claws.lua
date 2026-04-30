local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Savage Claws";
	ITEM.model = "models/demonssouls/weapons/claws.mdl";
	ITEM.weight = 0.4;
	ITEM.uniqueID = "begotten_claws_savageclaws";
	ITEM.category = "Melee";
	ITEM.description = "Iron blades shaped in the image of a bear's claws. The distinctive Goreic ritual weapon of the now extinct Clan Ursa.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/savage_claws.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(285.41, 319.23, 265.52);
	ITEM.attachmentOffsetVector = Vector(0, 4.24, 0);
	ITEM.components = {breakdownType = "meltdown", items = {"iron_chunks"}, {"iron_chunks"}}; -- use "breakdown" for other type

	ITEM.kinisgerOverride = true;
	ITEM.onerequiredbelief = {"man_become_beast", "witch_druid"};
ITEM:Register();

local ITEM = Clockwork.item:New("weapon_base");
	ITEM.name = "Steel Claws";
	ITEM.model = "models/props/begotten/melee/claws.mdl";
	ITEM.weight = 0.6;
	ITEM.uniqueID = "begotten_claws_steelclaws";
	ITEM.category = "Melee";
	ITEM.description = "Claws terrifyingly forged for the purpose of shredding men at the hands of the bloodthirsty ravenous Berserkers of Clan Gore.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/steel_claws.png"
	ITEM.meleeWeapon = true;
	ITEM.isAttachment = true;
	ITEM.attachmentBone = "ValveBiped.Bip01_R_Thigh";
	ITEM.attachmentOffsetAngles = Angle(319.23, 168.07, 265.52);
	ITEM.attachmentOffsetVector = Vector(0.71, 2.83, -4.95);
	ITEM.components = {breakdownType = "meltdown", items = {"steel_chunks"}, {"steel_chunks"}}; -- use "breakdown" for other type
	
	ITEM.kinisgerOverride = true;
	ITEM.onerequiredbelief = {"man_become_beast", "witch_druid"};
ITEM:Register();


local ITEM = Clockwork.item:New("weapon_base")
	ITEM.name = "Voltist Saws"
	ITEM.uniqueID = "begotten_claws_voltsaws"
	ITEM.model = "models/quake4/w_q4_gauntlet.mdl"
	ITEM.weight = 0.6
	ITEM.category = "Melee"
	ITEM.description = "Electric saws welded to their limbs by some psychopath."
	ITEM.iconoverride = "icons/melee/sawglove.png"
	ITEM.meleeWeapon = true
	ITEM.isAttachment = false
	ITEM.components = {breakdownType = "meltdown", items = {"fine_steel_chunks"}, {"steel_chunks"}} -- use "breakdown" for other type
	ITEM.attributes = {"not_unequippable", "conditionless"}
	ITEM.onerequiredbelief = {"the_paradox_riddle_equation"}
    ITEM.conditionScale = 0.0001

function ITEM:OnPlayerUnequipped(player, extraData)
	if player:GetSubfaith() == "Voltism" then
		Schema:EasyText(player, "peru", "This weapon cannot be removed, as it has become part of your flesh!")
		return false
	end

	if self:HasPlayerEquipped(player) then
		local useSound = self.useSound
		
		if !player:IsNoClipping() and (!player.GetCharmEquipped or !player:GetCharmEquipped("urn_silence")) then
			if (useSound) then
				if (type(useSound) == "table") then
					player:EmitSound(useSound[math.random(1, #useSound)])
				else
					player:EmitSound(useSound)
				end
			elseif (useSound != false) then
				player:EmitSound("begotten/items/first_aid.wav")
			end
		end
		
		if self.concealsFace == true then
			player:SetNetVar("faceConcealed", false)
		end
	end
end

-- Called when a player has unequipped the item.
function ITEM:OnTakeFromPlayer(player)
	if (player:GetWeaponEquipped() == self) then
		if player:Alive() and player:GetSubfaith() == "Voltism" then
			Schema:EasyText(player, "peru", "This weapon cannot be removed, as it has become part of your flesh!")
			return false
		end

		if self.concealsFace == true then
			player:SetNetVar("faceConcealed", false)
		end
	end
end

-- Called when a player drops the item.
function ITEM:OnDrop(player, position)
	if (player:GetWeaponEquipped() == self) then
		if player:Alive() and player:GetSubfaith() == "Voltism" then
			Schema:EasyText(player, "peru", "This weapon cannot be removed, as it has become part of your flesh!")
			return false
		end
	
		Schema:EasyText(player, "firebrick", "You cannot drop an item that you are wearing.")
		return false
	end
end

ITEM:Register()
