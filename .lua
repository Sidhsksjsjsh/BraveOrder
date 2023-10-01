local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})

local workspace = game:GetService("Workspace")

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
Name = "Point",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Misc",
Icon = "rbxassetid://",
PremiumOnly = false
})

local tbl_w = {}
OrionLib:AddTable(workspace.Art,tbl_w)

T1:AddDropdown({
Name = "World",
Default = "W_01",
Options = tbl_w,
Callback = function(Value)
_G._W2 = Value
_G._MissionWorld = Value
end    
})

function Filter(ow)
  return ow:gsub("_",""):gsub("0","")
end

T1:AddToggle({
Name = "Auto Open Chest",
Default = false,
Callback = function(Value)
_G._Chest = Value
      while wait() do
        if _G._Chest == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["ChestDrawRE"]:FireServer({["ChestId"] = "CHEST_" .. tostring(_G._W2)})
      end
end    
})

T1:AddToggle({
Name = "Auto Claim Mission (1-10)",
Default = false,
Callback = function(Value)
_G._Mission1 = Value
      while wait() do
        if _G._Mission1 == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_1")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_2")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_3")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_4")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_5")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_6")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_7")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_8")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_9")
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_10")
      end
end    
})

T1:AddToggle({
Name = "Auto Get Mission (1-10)",
Default = false,
Callback = function(Value)
_G._Mission2 = Value
      while wait() do
        if _G._Mission2 == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_1")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_2")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_3")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_4")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_5")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_6")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_7")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_8")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_9")
          game:GetService("ReplicatedStorage")["Remotes"]["OpenMissionRE"]:FireServer("MISSION_" .. tostring(Filter(_G._MissionWorld)) .. "_10")
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
Name = "Auto Up/Add Point",
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
Options = {"NORMAL","ADVANCE"},
Callback = function(Value)
_G._TypeShit = Value
end    
})

T3:AddDropdown({
Name = "World",
Default = "W1",
Options = {"W1","W2","W3","W4","W5","W6","W7","W8","W9","W10"},
Callback = function(Value)
_G._W = Value
end    
})

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
            game:GetService("ReplicatedStorage")["DrawPool"]["RD_" .. tostring(_G._W) .. "_PET" .. tostring(_G._TypeShit)]["DrawRE"]:FireServer(_G._O,false)
      end
end    
})
