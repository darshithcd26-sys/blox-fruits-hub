-- language: Lua, target: Blox Fruits (Roblox)
if game.CoreGui:FindFirstChild("VoidHubUI") then game.CoreGui.VoidHubUI:Destroy() end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- ═══════════════════════════════════════════════════════════════
-- UI CONSTRUCTION
-- ═══════════════════════════════════════════════════════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VoidHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 220, 0, 250)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BackgroundTransparency = 0.4
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 6)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "VOID HUB | Blox Fruits"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame

local ExitBtn = Instance.new("TextButton")
ExitBtn.Size = UDim2.new(0, 30, 0, 30)
ExitBtn.Position = UDim2.new(1, -35, 0, 5)
ExitBtn.BackgroundTransparency = 1
ExitBtn.Text = "X"
ExitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.TextSize = 14
ExitBtn.Parent = MainFrame
ExitBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

local AutoFarmBtn = Instance.new("TextButton")
AutoFarmBtn.Size = UDim2.new(0.9, 0, 0, 35)
AutoFarmBtn.Position = UDim2.new(0.05, 0, 0, 50)
AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmBtn.BackgroundTransparency = 0.8
AutoFarmBtn.Text = "Auto Farm: OFF"
AutoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmBtn.Font = Enum.Font.Gotham
AutoFarmBtn.TextSize = 12
AutoFarmBtn.Parent = MainFrame

local AutoFarmCorner = Instance.new("UICorner")
AutoFarmCorner.CornerRadius = UDim.new(0, 4)
AutoFarmCorner.Parent = AutoFarmBtn

local FruitBtn = Instance.new("TextButton")
FruitBtn.Size = UDim2.new(0.9, 0, 0, 35)
FruitBtn.Position = UDim2.new(0.05, 0, 0, 95)
FruitBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FruitBtn.BackgroundTransparency = 0.8
FruitBtn.Text = "Fruit Sniper: OFF"
FruitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FruitBtn.Font = Enum.Font.Gotham
FruitBtn.TextSize = 12
FruitBtn.Parent = MainFrame

local FruitCorner = Instance.new("UICorner")
FruitCorner.CornerRadius = UDim.new(0, 4)
FruitCorner.Parent = FruitBtn

-- ═══════════════════════════════════════════════════════════════
-- HARDENED AUTO FARM
-- ═══════════════════════════════════════════════════════════════
local isFarming = false
local farmThread = nil

local function getNearestEnemy()
    local nearest = nil
    local shortestDist = math.huge
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end
    local myPos = character.HumanoidRootPart.Position

    local enemies = workspace:FindFirstChild("Enemies")
    if not enemies then return nil end

    for _, v in pairs(enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            local dist = (v.HumanoidRootPart.Position - myPos).Magnitude
            if dist < shortestDist then
                shortestDist = dist
                nearest = v
            end
        end
    end
    return nearest
end

local function attackEnemy(enemy)
    local character = LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then return end
    local hrp = character.HumanoidRootPart
    local enemyHRP = enemy:FindFirstChild("HumanoidRootPart")
    if not enemyHRP then return end

    -- Direct CFrame teleport (bypasses TweenService restrictions)
    hrp.CFrame = CFrame.new(enemyHRP.Position + Vector3.new(0, 3, 0))
    task.wait(0.05)

    -- Attack via equipped tool
    local tool = character:FindFirstChildOfClass("Tool")
    if tool then
        tool:Activate()
    end

    -- Fallback: Force a physical click in case of fighting style
    local VirtualUser = game:GetService("VirtualUser")
    VirtualUser:Button1Down(Vector2.new(0, 0))
    VirtualUser:Button1Up(Vector2.new(0, 0))

    task.wait(0.1) -- Attack cooldown
end

local function farmLoop()
    while isFarming do
        local enemy = getNearestEnemy()
        if enemy then
            pcall(attackEnemy, enemy) -- pcall prevents crashing if the mob dies mid-tween
        else
            task.wait(0.5)
        end
        task.wait(0.1)
    end
end

-- ═══════════════════════════════════════════════════════════════
-- TOGGLE BINDINGS
-- ═══════════════════════════════════════════════════════════════
AutoFarmBtn.MouseButton1Click:Connect(function()
    isFarming = not isFarming
    if isFarming then
        AutoFarmBtn.Text = "Auto Farm: ON"
        AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        AutoFarmBtn.BackgroundTransparency = 0.4
        if not farmThread or coroutine.status(farmThread) == "dead" then
            farmThread = coroutine.create(farmLoop)
            coroutine.resume(farmThread)
        end
    else
        AutoFarmBtn.Text = "Auto Farm: OFF"
        AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        AutoFarmBtn.BackgroundTransparency = 0.8
    end
end)

FruitBtn.MouseButton1Click:Connect(function()
    -- Placeholder
    FruitBtn.Text = "Fruit Sniper: SOON"
    task.wait(1)
    FruitBtn.Text = "Fruit Sniper: OFF"
end)
