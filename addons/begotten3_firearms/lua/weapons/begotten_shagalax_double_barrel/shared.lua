
SWEP.Gun = ("begotten_shagalax_double_barrel")

SWEP.Category = "Begotten"
SWEP.Author	= "Saw"
SWEP.Contact = ""
SWEP.Purpose = ""
SWEP.Instructions = ""
SWEP.MuzzleAttachment = "1"
SWEP.ShellEjectAttachment = "2"
SWEP.PrintName = "Shagalaxian Deux-Fold"
SWEP.Slot = 2
SWEP.SlotPos = 89
SWEP.DrawAmmo = true
SWEP.DrawWeaponInfoBox = false
SWEP.BounceWeaponIcon = false
SWEP.DrawCrosshair = true
SWEP.Weight	= 30
SWEP.AutoSwitchTo = true
SWEP.AutoSwitchFrom	= true
SWEP.HoldType = "smg"

SWEP.ViewModelFOV = 50
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/synbf3/c_ee3.mdl"
SWEP.WorldModel	= "models/begotten/weapons/double_barrel_shotgun.mdl"
SWEP.Base = "begotten_firearm_base"
SWEP.ShowWorldModel	= false
SWEP.UseHands = true
SWEP.Spawnable = true
SWEP.AdminSpawnable	= true

SWEP.Primary.Sound = Sound("weapons/double_barrel/double_barrel_fire" .. math.random(1, 3) .. ".wav")
SWEP.Primary.RPM = 60
SWEP.Primary.ClipSize = 2
SWEP.Primary.DefaultClip = 0
SWEP.Primary.KickUp	= 10
SWEP.Primary.KickDown = 0.8
SWEP.Primary.KickHorizontal	= 0.6
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"

SWEP.Secondary.IronFOV = 70

SWEP.data = {}
SWEP.data.ironsights = 1

SWEP.ShellTime = .35

SWEP.Primary.NumShots = 22
SWEP.Primary.Damage	= 6
SWEP.Primary.Spread	= .2
SWEP.Primary.IronAccuracy = .2

SWEP.SightsPos = Vector(-3.478, 0, 2.89)
SWEP.SightsAng = Vector(0, 0, 0)
SWEP.RunSightsPos = Vector(-0.5, 0, 0)
SWEP.RunSightsAng = Vector(-10.5, 29.5, -19.7)

SWEP.RaiseSpeed = 2

SWEP.AmmoTypes = {
	["Grapeshot"] = function(SWEP)
		SWEP.Primary.Sound = Sound("weapons/double_barrel/double_barrel_fire" .. math.random(1, 3) .. ".wav")
		SWEP.Primary.FarSound = Sound("musket/musket4_distant.mp3")
		SWEP.Primary.NumShots = 22
		SWEP.Primary.Damage = 6
		SWEP.Primary.Spread = .2
		SWEP.Primary.IronAccuracy = .2
		SWEP.Primary.Ammo = "buckshot"
		
		if (SWEP.Owner and SWEP.Owner:IsPlayer()) then
			if (SWEP.Owner:GetVelocity() == Vector(0, 0, 0)) then
				if (SWEP.Owner.HasBelief and SWEP.Owner:HasBelief("marksman")) then
					if (SWEP.Owner:Crouching()) then
						SWEP.Primary.Spread = .1
						SWEP.Primary.IronAccuracy = .1
					else
						SWEP.Primary.Spread = .125
						SWEP.Primary.IronAccuracy = .125
					end
				else
					if (SWEP.Owner:Crouching()) then
						SWEP.Primary.Spread = .15
						SWEP.Primary.IronAccuracy = .15
					else
						SWEP.Primary.Spread = .175
						SWEP.Primary.IronAccuracy = .175
					end
				end
			end
		end
		
		return true
	end,
}

function SWEP:PrimaryAttack()
	local curTime = CurTime()

	if (!IsValid(self) or !IsValid(self.Weapon) or !IsValid(self.Owner)) then 
		return
	end

	if (IsFirstTimePredicted()) then
		if (self.Owner:IsPlayer() and self:CanFireBegotten()) then
			if (!self.Owner:KeyDown(IN_SPEED) and !self.Owner:KeyDown(IN_RELOAD)) then
				if (!self:AdjustFireBegotten()) then
					return
				end
				
				self:ShootBulletInformation()
				self.Weapon:TakeAmmoBegotten(1)
				
				if (SERVER) then
					local close = {}
					local distant = {}

					if (zones) then
						close = zones:GetPlayersInSupraZone(zones:GetPlayerSupraZone(self.Owner))
					else
						close = _player.GetAll()
					end

					local position = self.Owner:GetPos()
					local filter = RecipientFilter()

					for i, v in ipairs(close) do
						if (v:GetPos():Distance(position) < 1600) then
							filter:AddPlayer(v)
						else
							table.insert(distant, v)
						end
					end
					
					self.Weapon:EmitSound(self.Primary.Sound, self.Primary.SoundLevel or 511, math.random(98, 102), 1, CHAN_WEAPON, 0, 0, filter)
					
					filter = RecipientFilter()

					for i, v in ipairs(distant) do
						filter:AddPlayer(v)
					end
					
					self.Weapon:EmitSound(self.Primary.FarSound, self.Primary.SoundLevel or 511, math.random(98, 102), 1, CHAN_WEAPON, 0, 0, filter)
				else
					self.Weapon:EmitSound(self.Primary.Sound, self.Primary.SoundLevel or 511, math.random(98, 102), 1, CHAN_WEAPON, 0, 0)
				end

				local effect = EffectData()
				local forward = self.Owner:GetForward()
				local right = self.Owner:GetRight()
				
				effect:SetOrigin(self.Owner:GetShootPos() + (forward * 65) + (right * 5))
				effect:SetNormal(self.Owner:GetAimVector())
				util.Effect("effect_awoi_smoke_pistol", effect)
				
				self.Owner:SetAnimation(PLAYER_ATTACK1)
				self.Owner:MuzzleFlash()
				self.Weapon:SetNextPrimaryFire(curTime + 1 / (self.Primary.RPM / 60))
				
				if (self.BoltAction) then 
					self:BoltBack() 
				end
				
				if (SERVER) then
					self.Owner.cloakCooldown = CurTime() + 30
				end
			end
		end
	elseif (self:CanPrimaryAttack() and self.Owner:IsNPC()) then
		self:ShootBulletInformation()
		self.Weapon:TakePrimaryAmmo(1)
		self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		self.Weapon:EmitSound(self.Primary.Sound)
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		self.Owner:MuzzleFlash()
		self.Weapon:SetNextPrimaryFire(curTime + 1 / (self.Primary.RPM / 60))
	end
end

SWEP.ViewModelBoneMods = {
	["v_ee3_reference001"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}

SWEP.VElements = {
	["v_shagalax_double_barrel"] = { 
		type = "Model", 
		model = "models/arxweapon/doubleshotgun.mdl", 
		bone = "v_ee3_reference001", 
		rel = "", 
		pos = Vector(1.4, -2.519, -1.2), 
		angle = Angle(1.169, -89, 0), 
		size = Vector(1, 1, 1), 
		color = Color(255, 255, 255, 255), 
		surpresslightning = false, 
		material = "", 
		skin = 0, 
		bodygroup = {} 
	}
}

SWEP.WElements = {
	["w_shagalax_double_barrel"] = { 
		type = "Model", 
		model = "models/arxweapon/doubleshotgun.mdl", 
		bone = "ValveBiped.Bip01_R_Hand", 
		rel = "", 
		pos = Vector(2.5, 1.5, -2.201), 
		angle = Angle(-171.818, -176.495, 0), 
		size = Vector(1.1, 1.1, 1.1), 
		color = Color(255, 255, 255, 255), 
		surpresslightning = false, 
		material = "", 
		skin = 0, 
		bodygroup = {} 
	}
}