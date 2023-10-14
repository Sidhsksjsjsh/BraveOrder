local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local workspace = game:GetService("Workspace")
local Player = game.Players.LocalPlayer
local number = 9e99
local RunService = game:GetService("RunService")
local dev = "Rivanda_Cheater"

local FireUID = nil
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'FireServer' and self.Name == 'HitRE' then
        FireUID = Args[1][1]["FireUID"]
end
	return namecall(self, ...) 
end)

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Pet and Gun",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T4 = Window:MakeTab({
Name = "Upgrade",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Misc",
Icon = "rbxassetid://",
PremiumOnly = false
})

local S2 = T5:AddSection({
Name = "Misc"
})

local S1 = T5:AddSection({
Name = "Config"
})

local T6 = Window:MakeTab({
Name = "Attribute",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T7 = Window:MakeTab({
Name = "Dungeon",
Icon = "rbxassetid://",
PremiumOnly = false
})

local Info = T6:AddParagraph("Your attributes","Loading Client..")

local tbl_w = {}
OrionLib:AddTable(workspace.Art,tbl_w)
--[[
T1:AddDropdown({
Name = "World",
Default = Player:GetAttribute("World"),
Options = tbl_w,
Callback = function(Value)
_G._W2 = Value
_G._MissionWorld = Value
end    
})
]]
function Filter(ow)
  return ow:gsub("_",""):gsub("0","")
end

--game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = FireUID,["FPName"] = "FirePos",["RepeatIndex"] = 1,["HitCount"] = 1,["UID"] = }})
local TypicalNumber = 1

--[[if Player.Name == "Rivanda_Cheater" then --on tested
T1:AddTextbox({
  Name = "Select Hit Amount",
  Default = "10",
  TextDisappear = false,
  Callback = function(Value)
     TypicalNumber = Value
  end  
})
else
TypicalNumber = 1
end
]]

T1:AddToggle({
Name = "Instant Kill V1 (Recommended)",
Default = false,
Callback = function(Value)
_G._kill = Value
      while wait() do
        if _G._kill == false then break end
        for _,v in pairs(workspace.NPC:GetChildren()) do
	if v.Name ~= "Athena_01" then
          game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = FireUID,["FPName"] = "FirePos",["RepeatIndex"] = 1,["HitCount"] = tonumber(TypicalNumber),["UID"] = v:GetAttribute("UID")}})
	end
        end
      end
end    
})

T1:AddToggle({
Name = "Instant Kill V2 (Lagging)",
Default = false,
Callback = function(Value)
_G._kill1 = Value
      while wait() do
        if _G._kill1 == false then break end
        for _,v in pairs(workspace.NPC:GetChildren()) do
	if v.Name ~= "Athena_01" then
          game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = 1,["HitCount"] = tonumber(TypicalNumber),["UID"] = v:GetAttribute("UID")}})
	end
        end
      end
end    
})

T1:AddToggle({
Name = "Immortal",
Default = false,
Callback = function(Value)
_G._immortal = Value
      while wait() do
        if _G._immortal == false then break end
        Player:SetAttribute("HP",Player:GetAttribute("MaxHP"))
	--Player:SetAttribute("MaxHP",number)
      end
end    
})

T1:AddToggle({
Name = "Auto Open Chest",
Default = false,
Callback = function(Value)
_G._Chest = Value
      while wait() do
        if _G._Chest == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["ChestDrawRE"]:FireServer({["ChestId"] = "CHEST_" .. tostring(Player:GetAttribute("World"))})
      end
end    
})

T1:AddToggle({
Name = "Auto Claim Mission",
Default = false,
Callback = function(Value)
_G._Mission1 = Value
      while wait() do
        if _G._Mission1 == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer(Player:GetAttribute("CurMainMissionId"))
      end
end    
})

T1:AddToggle({
Name = "Auto Open Mission",
Default = false,
Callback = function(Value)
_G._Mission2 = Value
      while wait() do
        if _G._Mission2 == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer(Player:GetAttribute("CurMainMissionId"))
      end
end    
})

T2:AddToggle({
Name = "Equip Best Pet",
Default = false,
Callback = function(Value)
_G._BestPet = Value
      while wait() do
         if _G._BestPet == false then break end
            game:GetService("ReplicatedStorage")["Remotes"]["EquipBestPetRE"]:FireServer()
      end
end    
})

T2:AddToggle({
Name = "Equip Best Gun",
Default = false,
Callback = function(Value)
_G._BestGun = Value
      while wait() do
         if _G._BestGun == false then break end
            game:GetService("ReplicatedStorage")["Remotes"]["EquipBestRE"]:FireServer()
      end
end    
})

--game:GetService("ReplicatedStorage")["Remotes"]["AddPointRE"]:FireServer("AP",1)

T4:AddDropdown({
Name = "Upgrade Name",
Default = "1",
Options = {"AP","HP","CoinValueAdd","DropRateAdd"},
Callback = function(Value)
_G._PointName = Value
end    
})

T4:AddToggle({
Name = "Auto Upgrade SkillPoint",
Default = false,
Callback = function(Value)
_G._BestGun = Value
      while wait() do
         if _G._BestGun == false then break end
            game:GetService("ReplicatedStorage")["Remotes"]["AddPointRE"]:FireServer(_G._PointName,1)
      end
end    
})

T3:AddDropdown({
Name = "Egg Type",
Default = "NORMAL",
Options = {"Normal","Advance"},
Callback = function(Value)
_G._TypeShit = Value
end    
})
--[[
T3:AddDropdown({
Name = "World",
Default = "W1",
Options = {"W1","W2","W3","W4","W5","W6"},
Callback = function(Value)
_G._W = Value
end    
})
]]
T3:AddDropdown({
Name = "Total Hatch",
Default = "1",
Options = {"1","3","10"},
Callback = function(Value)
_G._O = Value
end    
})

T3:AddToggle({
Name = "Auto Hatch Egg",
Default = false,
Callback = function(Value)
_G._Egg = Value
      while wait() do
         if _G._Egg == false then break end
            game:GetService("ReplicatedStorage")["DrawPool"]["RD_" .. tostring(Filter(Player:GetAttribute("World"))) .. "_PET" .. tostring(string.upper(_G._TypeShit))]["DrawRE"]:FireServer(tonumber(_G._O),false)
      end
end    
})

S1:AddToggle({
Name = "Infinity Damage",
Default = false,
Callback = function(Value)
_G._infdmg = Value
      while wait() do
        if _G._infdmg == false then break end
        Player:SetAttribute("DMG",number)
	Player:SetAttribute("TotalPower",number)
      end
end    
})

S1:AddToggle({
Name = "Infinity Hit",
Default = false,
Callback = function(Value)
_G._infhit = Value
      while wait() do
        if _G._infhit == false then break end
        Player:SetAttribute("BHitR",number)
	Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddToggle({
Name = "Infinity Level",
Default = false,
Callback = function(Value)
_G._inflvl = Value
      while wait() do
        if _G._inflvl == false then break end
        Player:SetAttribute("CurLevel",number)
	--Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddToggle({
Name = "Infinity/No Cooldown",
Default = false,
Callback = function(Value)
_G._infcd = Value
      while wait() do
        if _G._infcd == false then break end
        Player:SetAttribute("MFireCD",-number)
	Player:SetAttribute("PFireCD",-number)
      end
end    
})

S1:AddToggle({
Name = "Infinity Length",
Default = false,
Callback = function(Value)
_G._inflength = Value
      while wait() do
        if _G._inflength == false then break end
        Player:SetAttribute("BLength",number)
	--Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddToggle({
Name = "Infinity Friends Boost",
Default = false,
Callback = function(Value)
_G._infboost = Value
      while wait() do
        if _G._infboost == false then break end
        Player:SetAttribute("Friends",number)
	--Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddToggle({
Name = "Zone Cleared",
Default = false,
Callback = function(Value)
_G._zone = Value
      while wait() do
        if _G._zone == false then break end
        Player:SetAttribute("ZoneCleared",Value)
	--Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddSlider({
   Name = "Speed",
   Min = 0,
   Max = Player:GetAttribute("BSpeed"),
   Default = Player:GetAttribute("BSpeed"),
   Color = Color3.fromRGB(255,255,255),
   Increment = 1,
   ValueName = "%",
   Callback = function(Value)
     Player:SetAttribute("BSpeed",Value)
   end    
})

T4:AddToggle({
Name = "Auto Upgrade Mount",
Default = false,
Callback = function(Value)
_G._um = Value
      while wait() do
        if _G._um == false then break end
        game:GetService("ReplicatedStorage")["Remotes"]["MountUpgradeRE"]:FireServer(Player:GetAttribute("EquippedMount"))
      end
end    
})

T4:AddButton({
Name = "Fusion Equipped Gun",
Callback = function()
      game:GetService("ReplicatedStorage")["Remotes"]["CombinePetRE"]:FireServer({{Player:GetAttribute("Weapon"),Player:GetAttribute("Weapon"),Player:GetAttribute("Weapon")}})		
  end    
})

T1:AddToggle({
Name = "Auto Claim Achievement",
Default = false,
Callback = function(Value)
_G._achievement = Value
      while wait() do
        if _G._achievement == false then break end
        game:GetService("ReplicatedStorage")["Remotes"]["AchievementCompleteAllRE"]:FireServer()
      end
end    
})

T7:AddToggle({
Name = "Auto Dungeon",
Default = false,
Callback = function(Value)
_G._tp_d = Value
      while wait() do
        if _G._tp_d == false then break end
	for _,v in pairs(workspace.NPC:GetChildren()) do
          if not v.Name:find("Athena_01") or Player:DistanceFromCharacter(v["Athena_01"].ModelObj.Position) < 300 then
            OrionLib:Teleport(workspace.Art[Player:GetAttribute("World")].Scene.DungeonArea)
	end
	end
      end
end    
})

if Player.Name == dev then
local T8 = Window:MakeTab({
Name = "Shop Function",
Icon = "rbxassetid://",
PremiumOnly = false
})

T8:AddDropdown({
  Name = "Select Coin",
  Default = "RS_Coin1",
  Options = {"RS_Coin1","RS_Coin2","RS_Coin3","RS_Coin4","RS_Coin5","RS_Coin6"},
  Callback = function(Value)
     _G._CoinTool = Value
  end    
})

T8:AddTextbox({
  Name = "Insert Amount",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
     _G._ToolCrack = Value
  end  
})

T8:AddButton({
Name = "Add Silver",
Callback = function()
      game:GetService("ReplicatedStorage")["Remotes"]["StoreBuyRF"]:InvokeServer("ResourceStore",_G._CoinTool,tonumber(_G._ToolCrack))
  end    
})
end

-- ("Your attributes","Loading Client..")
-- Player:GetAttribute("EquippedMount")
--[[
]]

RunService.RenderStepped:Connect(function()
	Info:Set("Damage: " .. tostring(Player:GetAttribute("DMG")) .. "\nHP: " .. tostring(Player:GetAttribute("HP")) .. "/" .. tostring(Player:GetAttribute("MaxHP")) .. "\nTotal Power: " .. tostring(Player:GetAttribute("TotalPower")) .. "\nMount ID: " .. tostring(Player:GetAttribute("EquippedMount")) .. "\nWave: " .. tostring(Player:GetAttribute("Wave")) .. "\nHighest Wave:" .. tostring(Player:GetAttribute("DungeonRecord")) .. "\nWeapon: " .. tostring(Player:GetAttribute("Weapon")) .. "\nWeapon type: " .. tostring(Player:GetAttribute("WeaponType")) .. "\nWorld: " .. tostring(Player:GetAttribute("World")) .. "\nBHitR: " .. tostring(Player:GetAttribute("BHitR")) .. "\nBLength: " .. tostring(Player:GetAttribute("BLength")) .. "\nBSpeed: " .. tostring(Player:GetAttribute("BSpeed")) .. "\nCurrent Level: " .. tostring(Player:GetAttribute("CurLevel")) .. "\nMission ID: " .. tostring(Player:GetAttribute("CurMainMissionId")) .. "\nFire UID: " .. tostring(Player:GetAttribute("Fire")) .. "\nFriend Boost: " .. tostring(Player:GetAttribute("Friends")) .. "\nHitR: " .. tostring(Player:GetAttribute("HitR")) .. "\nMFireCD: " .. tostring(Player:GetAttribute("MFireCD")) .. "\nPFireCD: " .. tostring(Player:GetAttribute("PFireCD")) .. "\nis zone cleared: " .. tostring(Player:GetAttribute("ZoneCleared")),"Your attributes")
end)
