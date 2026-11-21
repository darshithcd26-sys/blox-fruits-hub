local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "VoidHubUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 200, 0, 250)
MainFrame.Position = UDim2.new(0.5, -100, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.Text = "VOID HUB | Blox Fruits"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.Parent = MainFrame
local AutoFarmBtn = Instance.new("TextButton")
AutoFarmBtn.Size = UDim2.new(0.9, 0, 0, 30)
AutoFarmBtn.Position = UDim2.new(0.05, 0, 0, 50)
AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoFarmBtn.Text = "Auto Farm: OFF"
AutoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoFarmBtn.Font = Enum.Font.Gotham
AutoFarmBtn.TextSize = 12
AutoFarmBtn.Parent = MainFrame
local isFarming = false
AutoFarmBtn.MouseButton1Click:Connect(function()
    isFarming = not isFarming
    if isFarming then
        AutoFarmBtn.Text = "Auto Farm: ON"
        AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        print("[VOID HUB] AutoFarm ON")
    else
        AutoFarmBtn.Text = "Auto Farm: OFF"
        AutoFarmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        print("[VOID HUB] AutoFarm OFF")
    end
end)
local FruitBtn = Instance.new("TextButton")
FruitBtn.Size = UDim2.new(0.9, 0, 0, 30)
FruitBtn.Position = UDim2.new(0.05, 0, 0, 90)
FruitBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FruitBtn.Text = "Fruit Sniper: OFF"
FruitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FruitBtn.Font = Enum.Font.Gotham
FruitBtn.TextSize = 12
FruitBtn.Parent = MainFrame
local isSniping = false
FruitBtn.MouseButton1Click:Connect(function()
    isSniping = not isSniping
    if isSniping then
        FruitBtn.Text = "Fruit Sniper: ON"
        FruitBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        print("[VOID HUB] FruitSniper ON")
    else
        FruitBtn.Text = "Fruit Sniper: OFF"
        FruitBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        print("[VOID HUB] FruitSniper OFF")
    end
end)
