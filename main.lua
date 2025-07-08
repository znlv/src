-- 💠 Load UI Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RZ Cheats | Universal", "DarkTheme")

-- 💠 Tabs & Sections
local Tab1 = Window:NewTab("Configurations")
local Section1 = Tab1:NewSection("Keybindings")
Section1:NewKeybind("Toggle Hub", "Minimalize", Enum.KeyCode.Insert, function()
    Library:ToggleUI()
end)

function recurse(instance)
    if instance:IsA("Tool") or instance:IsA("HopperBin") then
        print(instance:GetFullName())
        if workspace.FilteringEnabled == false then
            c = instance:Clone()
            c.Parent = game.Players.LocalPlayer.Backpack
       else
            instance.Parent = game.Players.LocalPlayer.Backpack
       end
    end
    for _, child in ipairs(instance:GetChildren()) do
        recurse(child)
    end
end

local Section5 = Tab1:NewSection("Credits")

local Tab = Window:NewTab("Cheats")
local Section2 = Tab:NewSection("Universal")
local Section3 = Tab:NewSection("LUA")

-- 💠 Lua Executor UI
local cc = Instance.new("ScreenGui")
cc.Name = "cc"
cc.Parent = (game:GetService("CoreGui") or gethui())
cc.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
cc.Enabled = false

local Frame = Instance.new("Frame")
Frame.Parent = cc
Frame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Frame.Position = UDim2.new(0.4325, 0, 0.415, 0)
Frame.Size = UDim2.new(0, 521, 0, 252)
Instance.new("UICorner", Frame)

local ExecuteButton = Instance.new("TextButton")
ExecuteButton.Name = "ExecuteButton"
ExecuteButton.Parent = Frame
ExecuteButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ExecuteButton.Position = UDim2.new(0.68, 0, 0.82, 0)
ExecuteButton.Size = UDim2.new(0, 154, 0, 35)
ExecuteButton.Font = Enum.Font.JosefinSans
ExecuteButton.Text = "Execute"
ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteButton.TextSize = 14
Instance.new("UICorner", ExecuteButton)

local ClearButton = Instance.new("TextButton")
ClearButton.Name = "ClearButton"
ClearButton.Parent = Frame
ClearButton.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
ClearButton.Position = UDim2.new(0.044, 0, 0.82, 0)
ClearButton.Size = UDim2.new(0, 154, 0, 35)
ClearButton.Font = Enum.Font.JosefinSans
ClearButton.Text = "Clear"
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.TextSize = 14
Instance.new("UICorner", ClearButton)

local CodeBox = Instance.new("TextBox")
CodeBox.Name = "Code"
CodeBox.Parent = Frame
CodeBox.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
CodeBox.Position = UDim2.new(0.077, 0, 0.143, 0)
CodeBox.Size = UDim2.new(0, 440, 0, 158)
CodeBox.Font = Enum.Font.SourceSans
CodeBox.Text = ""
CodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CodeBox.TextSize = 14
CodeBox.TextXAlignment = Enum.TextXAlignment.Left
CodeBox.TextYAlignment = Enum.TextYAlignment.Top
Instance.new("UICorner", CodeBox)

local Title = Instance.new("TextLabel")
Title.Parent = Frame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(0, 162, 0, 36)
Title.Font = Enum.Font.Unknown
Title.Text = "RZ | Cheats"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14

-- 💠 Toggle to show/hide the executor
Section3:NewToggle("Visible LUA Executor", "Run your own Lua code", function(state)
    cc.Enabled = state
end)

-- 💠 Execute Button Script
ExecuteButton.MouseButton1Click:Connect(function()
    local code = CodeBox.Text
    local func, err = loadstring(code)
    if func then
        local success, runtimeErr = pcall(func)
        if not success then
            warn("Runtime error: " .. tostring(runtimeErr))
        end
    else
        warn("Syntax error: " .. tostring(err))
    end
end)

-- 💠 Clear Button Script
ClearButton.MouseButton1Click:Connect(function()
    CodeBox.Text = ""
end)

-- 💠 ESP
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

Section2:NewTextBox("Teleport To:", "TextboxInfo", function(targetUsername)
    players = game:GetService("Players")
    targetPlayer = players:FindFirstChild(targetUsername)
    players.LocalPlayer.Character:MoveTo(targetPlayer.Character.Head.Position)
end)

Section2:NewButton("Clone Global Tools", "Gives all tools", function()
    recurse(game)
end)

Section2:NewToggle("Wallhack Toggle", "Toggle ESP", function(state)
    if state then
        ActivateESP()
    else
        DeactivateESP()
    end
end)

-- 💠 Infinite Jump
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

-- 💠 Aimbot
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

_G.AimbotEnabled = false
_G.TeamCheck = false
_G.AimPart = "Torso"
_G.Sensitivity = 0.3
_G.MaxDistance = 50 -- max studs to lock onto

local Holding = false

local function GetClosestPlayer()
    local maxDist = math.huge
    local target = nil
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
            if not _G.TeamCheck or v.Team ~= Players.LocalPlayer.Team then
                local rootPart = v.Character.HumanoidRootPart
                local distance = (rootPart.Position - Camera.CFrame.Position).Magnitude

                if distance <= _G.MaxDistance then
                    local screenPoint = Camera:WorldToViewportPoint(rootPart.Position)
                    local mousePos = UserInputService:GetMouseLocation()
                    local dist = (Vector2.new(mousePos.X, mousePos.Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
                    if dist < maxDist then
                        maxDist = dist
                        target = v
                    end
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


Section2:NewToggle("Aimbot Toggle", "Hold Right Click to Lock On", function(state)
    _G.AimbotEnabled = state
end)

local invis_on = false
local savedpos = nil

function ToggleInvisibility()
    invis_on = not invis_on

    if invis_on then
        savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

        -- Move the player underground
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -200, 0)

        task.wait(0.15)

        -- Create invisible seat
        local Seat = Instance.new("Seat")
        Seat.Anchored = false
        Seat.CanCollide = false
        Seat.Name = "invischair"
        Seat.Transparency = 1
        Seat.Position = Vector3.new(0, -200, 0)
        Seat.Parent = workspace

        -- Weld seat to torso/upper torso
        local torso = game.Players.LocalPlayer.Character:FindFirstChild("Torso") or game.Players.LocalPlayer.Character:FindFirstChild("UpperTorso")
        if torso then
            local Weld = Instance.new("Weld")
            Weld.Part0 = Seat
            Weld.Part1 = torso
            Weld.Parent = Seat
        end

        -- Move back to original position
        Seat.CFrame = savedpos

        game.StarterGui:SetCore("SendNotification", {
            Title = "Invisibility On";
            Duration = 1;
            Text = "";
        })
    else
        -- Remove invisible seat if it exists
        local invisChair = workspace:FindFirstChild("invischair")
        if invisChair then
            invisChair:Destroy()
        end

        game.StarterGui:SetCore("SendNotification", {
            Title = "Invisibility Off";
            Duration = 1;
            Text = "";
        })
    end
end

Section2:NewToggle("Vanish Toggle", "Become invisible for everyone!", function(state)
    invis_on = state
end)
