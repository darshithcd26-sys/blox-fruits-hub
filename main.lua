-- language: Lua, target: Blox Fruits (Roblox), executor: any with HttpGet
-- host this at: https://raw.githubusercontent.com/YOURNAME/YOURREPO/main/main.lua

-- load UI library
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "VOID HUB | Blox Fruits",
    LoadingTitle = "YourHub",
    LoadingSubtitle = "by you",
    ConfigurationSaving = {
        Enabled = true,
        FileName = "YourHubConfig"
    },
    KeySystem = false
})

local MainTab = Window:CreateTab("Main", 4483362458)
local FarmSection = MainTab:CreateSection("Farming")

-- toggle stub — replace body with real farm logic
local AutoFarmToggle = MainTab:CreateToggle({
    Name = "Auto Farm Level",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(state)
        if state then
            -- real logic goes here
            print("[YourHub] AutoFarm ON")
        else
            print("[YourHub] AutoFarm OFF")
        end
    end,
})

local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local FruitSniperToggle = TeleportTab:CreateToggle({
    Name = "Fruit Sniper",
    CurrentValue = false,
    Flag = "FruitSniper",
    Callback = function(state)
        if state then
            print("[YourHub] FruitSniper ON")
        end
    end,
})
