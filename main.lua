-- language: Lua, target: Blox Fruits (Roblox), executor: any with HttpGet
-- host: https://raw.githubusercontent.com/darshithcd26-sys/blox-fruits-hub/refs/heads/main/main.lua

-- Rayfield GitHub mirror loader
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "VOID HUB | Blox Fruits",
    LoadingTitle = "VOID HUB",
    LoadingSubtitle = "by darshith",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "VOIDHUBConfig"
    },
    KeySystem = false
})

-- ═══════════════════════════════════════════════════════════════
-- MAIN TAB
-- ═══════════════════════════════════════════════════════════════
local MainTab = Window:CreateTab("Main", 4483362458)
local FarmSection = MainTab:CreateSection("Farming")

local AutoFarmToggle = MainTab:CreateToggle({
    Name = "Auto Farm Level",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(state)
        if state then
            print("[VOID HUB] AutoFarm ON")
        else
            print("[VOID HUB] AutoFarm OFF")
        end
    end,
})

-- ═══════════════════════════════════════════════════════════════
-- TELEPORT TAB
-- ═══════════════════════════════════════════════════════════════
local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local FruitSection = TeleportTab:CreateSection("Fruit")

local FruitSniperToggle = TeleportTab:CreateToggle({
    Name = "Fruit Sniper",
    CurrentValue = false,
    Flag = "FruitSniper",
    Callback = function(state)
        if state then
            print("[VOID HUB] FruitSniper ON")
        else
            print("[VOID HUB] FruitSniper OFF")
        end
    end,
})
