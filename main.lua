local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RZ Cheats | Universal", "DarkTheme")

-- Tabs & Sections
local Tab1 = Window:NewTab("Configurations")
local Section1 = Tab1:NewSection("Keybindings")
Section1:NewKeybind("Toggle Hub", "Minimalize", Enum.KeyCode.Insert, function()
    Library:ToggleUI()
end)

local Section5 = Tab1:NewSection("Credits") -- Can fill if needed

local Tab = Window:NewTab("Cheats")
local Section2 = Tab:NewSection("Universal")

-- 🟨 ESP Functions
local function ActivateESP()
    for _, v in pairs(game.Players:GetPlayers()) do
        local chr = v.Character
        if chr and not chr:FindFirstChild('q') then
            local h = Instance.new('Highlight')
            h.Name = 'q'
            h.Parent = chr
            h.FillTransparency = 0.3
            h.OutlineColor = Color3.new(1, 0, 0)
            h.FillColor = Color3.new(1, 1, 1)
        end
    end
end

local function DeactivateESP()
    for _, v in pairs(game.Players:GetPlayers()) do
        local chr = v.Character
        if chr then
            local highlight = chr:FindFirstChild('q')
            if highlight then
                highlight:Destroy()
            end
        end
    end
end

-- ESP Toggle
Section2:NewToggle("Wallhack Toggle", "Toggle ESP", function(state)
    if state then
        ActivateESP()
    else
        DeactivateESP()
    end
end)

-- 🟨 Infinite Jump
_G.infinjump = true
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.Space and _G.infinjump then
        local Humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if Humanoid then
            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            wait(0.1)
            Humanoid:ChangeState(Enum.HumanoidStateType.Seated)
        end
    elseif input.KeyCode == Enum.KeyCode.R then
        _G.infinjump = not _G.infinjump
    end
end)

-- 🟨 Aimbot
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

_G.AimbotEnabled = false
_G.TeamCheck = false
_G.AimPart = "Head"
_G.Sensitivity = 0.1

local Holding = false

local function GetClosestPlayer()
    local maxDist = math.huge
    local target = nil
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            if not _G.TeamCheck or v.Team ~= Players.LocalPlayer.Team then
                local screenPoint = Camera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                local mousePos = UserInputService:GetMouseLocation()
                local dist = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                if dist < maxDist then
                    maxDist = dist
                    target = v
                end
            end
        end
    end
    return target
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    if Holding and _G.AimbotEnabled then
        local target = GetClosestPlayer()
        if target and target.Character and target.Character:FindFirstChild(_G.AimPart) then
            TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine), {
                CFrame = CFrame.new(Camera.CFrame.Position, target.Character[_G.AimPart].Position)
            }):Play()
        end
    end
end)

-- Aimbot Toggle
Section2:NewToggle("Aimbot Toggle", "Hold Right Click to Lock On", function(state)
    _G.AimbotEnabled = state
end)
