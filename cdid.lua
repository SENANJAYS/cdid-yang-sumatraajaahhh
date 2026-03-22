-- CDID Sumatra V12: Speed Grind + Race Tools
-- Made by Senna

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TabButtons = Instance.new("Frame")
local GrindTabBtn = Instance.new("TextButton")
local RaceTabBtn = Instance.new("TextButton")
local ContentFrame = Instance.new("Frame")
local Watermark = Instance.new("TextLabel")

ScreenGui.Parent = game:GetService("CoreGui")
MainFrame.Name = "Sumatra_Ultimate_V12_Senna"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.05, 0, 0.4, 0)
MainFrame.Size = UDim2.new(0, 240, 0, 255)
MainFrame.Active = true
MainFrame.Draggable = true 

Watermark.Parent = MainFrame
Watermark.Size = UDim2.new(1, 0, 0, 20)
Watermark.Position = UDim2.new(0, 0, 1, -22)
Watermark.BackgroundTransparency = 1
Watermark.Text = "made by senna"
Watermark.TextColor3 = Color3.fromRGB(120, 120, 120)
Watermark.TextSize = 14
Watermark.Font = Enum.Font.Code

TabButtons.Parent = MainFrame
TabButtons.Size = UDim2.new(1, 0, 0, 30)
TabButtons.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

GrindTabBtn.Parent = TabButtons
GrindTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
GrindTabBtn.Text = "GRIND"
GrindTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
GrindTabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

RaceTabBtn.Parent = TabButtons
RaceTabBtn.Position = UDim2.new(0.5, 0, 0, 0)
RaceTabBtn.Size = UDim2.new(0.5, 0, 1, 0)
RaceTabBtn.Text = "RACE"
RaceTabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
RaceTabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)

ContentFrame.Parent = MainFrame
ContentFrame.Position = UDim2.new(0, 0, 0, 30)
ContentFrame.Size = UDim2.new(1, 0, 1, -55)
ContentFrame.BackgroundTransparency = 1

local GrindPage = Instance.new("Frame", ContentFrame)
GrindPage.Size = UDim2.new(1, 0, 1, 0)
GrindPage.BackgroundTransparency = 1

local TPButton = Instance.new("TextButton", GrindPage)
TPButton.Position = UDim2.new(0.1, 0, 0.05, 0)
TPButton.Size = UDim2.new(0.8, 0, 0, 30)
TPButton.Text = "START SPEED GRIND"
TPButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
TPButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local DelayLabel = Instance.new("TextLabel", GrindPage)
DelayLabel.Position = UDim2.new(0.1, 0, 0.22, 0)
DelayLabel.Size = UDim2.new(0.4, 0, 0, 25)
DelayLabel.Text = "DELAY (sec):"
DelayLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DelayLabel.BackgroundTransparency = 1
DelayLabel.TextXAlignment = Enum.TextXAlignment.Left

local DelayInput = Instance.new("TextBox", GrindPage)
DelayInput.Position = UDim2.new(0.5, 0, 0.22, 0)
DelayInput.Size = UDim2.new(0.4, 0, 0, 25)
DelayInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
DelayInput.Text = "3.47"
DelayInput.TextColor3 = Color3.fromRGB(0, 255, 0)
DelayInput.Font = Enum.Font.Code

local SafetyTip = Instance.new("TextLabel", GrindPage)
SafetyTip.Position = UDim2.new(0, 0, 0.35, 0)
SafetyTip.Size = UDim2.new(1, 0, 0, 20)
SafetyTip.Text = "2.1 - 5.0 is safest"
SafetyTip.TextColor3 = Color3.fromRGB(200, 150, 50)
SafetyTip.TextSize = 12
SafetyTip.BackgroundTransparency = 1

local CancelButton = Instance.new("TextButton", GrindPage)
CancelButton.Position = UDim2.new(0.1, 0, 0.48, 0)
CancelButton.Size = UDim2.new(0.8, 0, 0, 30)
CancelButton.Text = "STOP GRIND"
CancelButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CancelButton.TextColor3 = Color3.fromRGB(255, 255, 255)

local Status = Instance.new("TextLabel", GrindPage)
Status.Position = UDim2.new(0, 0, 0.7, 0)
Status.Size = UDim2.new(1, 0, 0, 25)
Status.Text = "Status: Ready"
Status.TextColor3 = Color3.fromRGB(200, 200, 200)
Status.BackgroundTransparency = 1

local RacePage = Instance.new("Frame", ContentFrame)
RacePage.Size = UDim2.new(1, 0, 1, 0)
RacePage.BackgroundTransparency = 1
RacePage.Visible = false

local StartRaceBtn = Instance.new("TextButton", RacePage)
StartRaceBtn.Position = UDim2.new(0.1, 0, 0.3, 0)
StartRaceBtn.Size = UDim2.new(0.8, 0, 0, 45)
StartRaceBtn.Text = "START RACE"
StartRaceBtn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
StartRaceBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartRaceBtn.Font = Enum.Font.GothamBold

local running = false
local waypoints = {
    Vector3.new(131.22, 4.03, -415.93), Vector3.new(127.72, 4.03, -1274.61), 
    Vector3.new(-176.58, 4.03, -2039.89), Vector3.new(-1009.99, 4.03, -2168.14), 
    Vector3.new(-1864.63, -5.22, -2231.58), Vector3.new(-2659.19, -20.38, -2561.87), 
    Vector3.new(-3327.05, -30.31, -3064.71), Vector3.new(-2961.95, -31.37, -3809.20), 
    Vector3.new(-2541.82, -30.05, -4562.69), Vector3.new(-2124.15, -36.79, -5320.65), 
    Vector3.new(-1701.81, -33.25, -6052.75), Vector3.new(-1250.37, -67.35, -6791.38), 
    Vector3.new(-939.74, -52.37, -7579.69), Vector3.new(-1485.14, -52.66, -8173.90), 
    Vector3.new(-2229.18, -52.46, -8588.31), Vector3.new(-2955.04, -44.60, -9044.29), 
    Vector3.new(-3531.20, -39.59, -9687.46), Vector3.new(-3933.90, -23.32, -10428.97), 
    Vector3.new(-3816.19, -23.47, -11209.20), Vector3.new(-3269.38, -83.76, -11868.84), 
    Vector3.new(-2763.44, -63.37, -12565.39), Vector3.new(-2529.95, -37.92, -13342.75), 
    Vector3.new(-2808.24, -37.32, -14156.62), Vector3.new(-3090.65, -33.65, -14968.77), 
    Vector3.new(-3363.94, -46.26, -15783.94), Vector3.new(-3502.27, -32.78, -16627.77), 
    Vector3.new(-3553.16, -74.16, -17474.26), Vector3.new(-3575.44, -87.14, -18337.00), 
    Vector3.new(-3561.74, -61.57, -19197.18), Vector3.new(-3540.21, -73.47, -20051.68), 
    Vector3.new(-3434.44, -92.36, -20900.60), Vector3.new(-3293.57, -48.39, -21741.08), 
    Vector3.new(-3140.38, -74.86, -22589.92), Vector3.new(-3129.11, -77.99, -23440.52), 
    Vector3.new(-3129.52, -77.58, -24298.29), Vector3.new(-3131.39, -73.22, -25161.12), 
    Vector3.new(-3130.59, -54.99, -26027.93), Vector3.new(-3128.57, -77.69, -26876.56), 
    Vector3.new(-3125.51, -77.97, -27741.58)
}

local function getCar()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local seat = char.Humanoid.SeatPart
        if seat and seat:IsA("VehicleSeat") then return seat.Parent end
    end
    return nil
end

GrindTabBtn.MouseButton1Click:Connect(function()
    GrindPage.Visible, RacePage.Visible = true, false
    GrindTabBtn.BackgroundColor3, RaceTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50), Color3.fromRGB(35, 35, 35)
end)

RaceTabBtn.MouseButton1Click:Connect(function()
    GrindPage.Visible, RacePage.Visible = false, true
    RaceTabBtn.BackgroundColor3, GrindTabBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50), Color3.fromRGB(35, 35, 35)
end)

StartRaceBtn.MouseButton1Click:Connect(function()
    local racePoint = Vector3.new(-1.25, 4.03, 445.90)
    local car = getCar()
    if car then car:PivotTo(CFrame.new(racePoint + Vector3.new(0, 2, 0)))
    elseif game.Players.LocalPlayer.Character then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(racePoint) end
end)

TPButton.MouseButton1Click:Connect(function()
    if running then return end
    running = true
    Status.Text = "Status: Grinding..."
    for i, pos in ipairs(waypoints) do
        if not running then break end
        local car = getCar()
        local currentDelay = tonumber(DelayInput.Text) or 3.47
        Status.Text = "Pt: " .. i .. "/39 | Senna"
        if car then car:PivotTo(CFrame.new(pos + Vector3.new(0, 3, 0)))
        elseif game.Players.LocalPlayer.Character then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos) end
        task.wait(currentDelay)
    end
    running = false
    Status.Text = "Status: Finished"
end)

CancelButton.MouseButton1Click:Connect(function() running = false Status.Text = "Status: Stopped" end)
