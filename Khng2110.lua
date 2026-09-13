local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

local State = {
    AutoFarm = false,
    GomNPC = false,
    AutoQuest = false,
    AutoFindIsland = false,
    FarmLevel = false
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "khng2110_script_ui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 250, 0, 320)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Text = "khng2110 script"
Title.TextColor3 = Color3.fromRGB(0, 255, 127)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 14
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Parent = Title

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 6)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

local function CreateToggle(name, yPosition, stateKey)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 210, 0, 35)
    Btn.Position = UDim2.new(0, 20, 0, yPosition)
    Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Btn.Text = name .. ": OFF"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.TextSize = 14
    Btn.Font = Enum.Font.Gotham
    Btn.Parent = MainFrame
    
    local BtnCorner = Instance.new("UICorner")
    BtnCorner.CornerRadius = UDim.new(0, 6)
    BtnCorner.Parent = Btn

    Btn.MouseButton1Click:Connect(function()
        State[stateKey] = not State[stateKey]
        if State[stateKey] then
            Btn.Text = name .. ": ON"
            Btn.BackgroundColor3 = Color3.fromRGB(0, 150, 80)
        else
            Btn.Text = name .. ": OFF"
            Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
    end)
    return Btn
end

CreateToggle("Auto Farm Level", 50, "AutoFarm")
CreateToggle("Gom NPC", 95, "GomNPC")
CreateToggle("Auto Quest", 140, "AutoQuest")
CreateToggle("Tự tìm đảo theo Level", 185, "AutoFindIsland")
CreateToggle("Bật/Tắt Tất Cả", 230, "FarmLevel")

local function GetPlayerLevel()
    return 1 -- [TODO] Thay bằng code lấy level thực tế của Delta X
end

local function FindNearestNPC()
    local nearestNPC = nil
    local shortestDistance = math.huge
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
    
    for _, v in pairs(Workspace:GetChildren()) do
        if v:IsA("Model") and v.Name:find("NPC") then -- [TODO] Thay tên NPC thực tế
            local hrp = v:FindFirstChild("HumanoidRootPart")
            if hrp then
                local distance = (char.HumanoidRootPart.Position - hrp.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    nearestNPC = v
                end
            end
        end
    end
    return nearestNPC
end

spawn(function()
    while wait(1) do
        if State.AutoFarm then
            -- [TODO] Code Auto Farm Level
        end
    end
end)

spawn(function()
    while wait(2) do
        if State.GomNPC then
            local npc = FindNearestNPC()
            if npc then
                -- [TODO] Code Gom NPC
            end
        end
    end
end)

spawn(function()
    while wait(5) do
        if State.AutoQuest then
            -- [TODO] Code Auto Quest
        end
    end
end)

spawn(function()
    while wait(10) do
        if State.AutoFindIsland then
            local level = GetPlayerLevel()
            -- [TODO] Code Tự tìm đảo theo Level
        end
    end
end)
