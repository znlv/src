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
local Section3 = Tab:NewSection("LUA")

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
Section3:NewToggle("Visible LUA Exuctor", "Run your own lua code", function(state)
    cc.Enabled = value
end)



-- (VOID) : Gui to Lua
-- Version: 1.4

-- Instances:

local cc = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Exc = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Code = Instance.new("TextBox")
local UICorner_3 = Instance.new("UICorner")
local Exc_2 = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")

--Properties:

cc.Name = "cc"
cc.Parent = (game:GetService("CoreGui") or gethui())
cc.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
cc.Enabled = false

Frame.Parent = cc
Frame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.432525963, 0, 0.414572865, 0)
Frame.Size = UDim2.new(0, 521, 0, 252)

UICorner.Parent = Frame

Exc.Name = "Exc"
Exc.Parent = Frame
Exc.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Exc.BorderColor3 = Color3.fromRGB(0, 0, 0)
Exc.BorderSizePixel = 0
Exc.Position = UDim2.new(0.679462552, 0, 0.817460299, 0)
Exc.Size = UDim2.new(0, 154, 0, 35)
Exc.Font = Enum.Font.JosefinSans
Exc.Text = "Execute"
Exc.TextColor3 = Color3.fromRGB(255, 255, 255)
Exc.TextSize = 14.000

UICorner_2.Parent = Exc

Code.Name = "Code"
Code.Parent = Frame
Code.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
Code.BorderColor3 = Color3.fromRGB(0, 0, 0)
Code.BorderSizePixel = 0
Code.Position = UDim2.new(0.0767754316, 0, 0.142857149, 0)
Code.Size = UDim2.new(0, 440, 0, 158)
Code.Font = Enum.Font.SourceSans
Code.Text = ""
Code.TextColor3 = Color3.fromRGB(0, 0, 0)
Code.TextSize = 14.000
Code.TextXAlignment = Enum.TextXAlignment.Left
Code.TextYAlignment = Enum.TextYAlignment.Top

UICorner_3.Parent = Code

Exc_2.Name = "Exc"
Exc_2.Parent = Frame
Exc_2.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
Exc_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Exc_2.BorderSizePixel = 0
Exc_2.Position = UDim2.new(0.0441458747, 0, 0.817460299, 0)
Exc_2.Size = UDim2.new(0, 154, 0, 35)
Exc_2.Font = Enum.Font.JosefinSans
Exc_2.Text = "Clear"
Exc_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Exc_2.TextSize = 14.000

UICorner_4.Parent = Exc_2

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 162, 0, 36)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "RZ | Cheats"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

-- Scripts:

local function RBZJZLG_fake_script() -- Exc_2.LocalScript 
	local script = Instance.new('LocalScript', Exc_2)

	local button = script.Parent
	local codeField = script.Parent.Parent:WaitForChild("Code")
	
	button.MouseButton1Click:Connect(function()
		local code = codeField.Text
		local func, err = loadstring(code)
	
		if func then
			pcall(func)
		else
			warn("Code error: " .. err)
		end
	end)
	
end
coroutine.wrap(RBZJZLG_fake_script)()

