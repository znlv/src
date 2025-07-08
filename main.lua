local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("The RZ Project", "DarkTheme")

local Tab1 = Window:NewTab("KeyBinds")
local Section1 = Tab1:NewSection("Alle Keybinds die PXD HUB heeft!")

Section1:NewKeybind("Minimalizeer de Hub", "Minimalize", Enum.KeyCode.Insert, function()
    Library:ToggleUI()
end)



local function ActivateESP()
    for i, v in pairs(game.Players:GetChildren()) do
        local chr = v.Character
        if chr:FindFirstChild('q') then
            continue
        else
            local h = Instance.new('Highlight')
            h.Name = 'q'
            h.Parent = v.Character
            h.FillTransparency = 0.3
            h.OutlineColor = Color3.new(1, 0, 0)  -- Red outline color
            h.FillColor = Color3.new(1, 1, 1)  -- White fill color
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Name = "NameLabel"
            nameLabel.Parent = h
            nameLabel.BackgroundTransparency = 1
            nameLabel.Position = UDim2.new(0, 0, -0.2, 0)
            nameLabel.Size = UDim2.new(1, 0, 0.2, 0)
            nameLabel.Font = Enum.Font.SourceSans
            nameLabel.Text = v.Name
            nameLabel.TextColor3 = Color3.new(1, 1, 1)
            nameLabel.TextScaled = true
            nameLabel.TextSize = 14.0
            nameLabel.TextWrapped = true
        end
    end
end


local function DeactivateESP()
	for i, v in pairs(game.Players:GetChildren()) do
		local chr = v.Character
		local highlight = chr:FindFirstChild('q')
		if highlight then
			highlight:Destroy()
		end
	end
end


local Tab = Window:NewTab("Dutch RP Games")
local Section2 = Tab:NewSection("Sloks")
local Section3 = Tab:NewSection("FiveR - Remakes")

Section3:NewButton("Run Part Exploit", "Part Exploit Runner", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/PJ-0001/Scripts/main/Part%20Exploit%20Private'), true ))()
end)


Section3:NewButton("Verkanker Iedereen met een blokje van 10x10", "Part Exploit Runner", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/PJ-0001/Scripts/main/inker'), true ))()
end)



-- FiveR

Section3:NewButton("Revive Instant (FiveR)", "Revive", function()
    game:GetService("ReplicatedStorage").Lifepak.Antiexploit:FireServer()
end)

Section3:NewButton("Contant Miljard Inspawnen ofzo", "Call all Sounds from Workspace", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/PJ-0001/PxD-Hubs/main/Money%20Dupe%20i%20guess'), true))()
end)


Section3:NewButton("Spam Noodknop", "Dit is nog al iritant", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/PJ-0001/Scripts/main/Spam%20Noodknop'), true ))()
end)

Section3:NewButton("Earape", "Dit is nog al iritant", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/PJ-0001/Scripts/main/Earape%20Respect%20Filtering'), true ))()
end)

Section2:NewButton("GunPack", "Dit is nog al iritant", function()
    local args = { [1] = "Change", [2] = "Veiligheids touw", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
    local args = { [1] = "Change", [2] = "DSI SIG MCX", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
        local args = { [1] = "Change", [2] = "Shield", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
            local args = { [1] = "Change", [2] = "roodgl", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "roze akm", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "AKM", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "HK G28", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "M9", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "GOLDDesert", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "GOLDRem", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "TS Glock 17", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "SIG MCX VIRTUS", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "M93R", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                        local args = { [1] = "Change", [2] = "AK-47", [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))
                    
end)

Section2:NewButton("Rejoin game - SLOKS", "Dit is nog al iritant", function()
    game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)

Section2:NewTextBox("Wapen naam:", "TextboxInfo", function(txt)
    local args = { [1] = "Change", [2] = txt, [3] = "Inv" } game:GetService("ReplicatedStorage").Inventory:FireServer(unpack(args))

end)

Section2:NewTextBox("TP to Spelernaam:", "TextboxInfo", function(targetUsername)
    players = game:GetService("Players")
    targetPlayer = players:FindFirstChild(targetUsername)
    players.LocalPlayer.Character:MoveTo(targetPlayer.Character.HumanoidRootPart.Position)
    

end)


Section2:NewTextBox("TP to Spelernaam:", "TextboxInfo", function(targetUsername)
    
    targetPlayer = players:FindFirstChild(targetUsername)
	local cFrame = CFrame.new(0,0,0)
 
 
	local Size = {
	  X = 10,
	  Y = 10,
	  Z = 10
	}
	 
	game:GetService('ReplicatedStorage')['ACS_Engine'].Eventos.Breach:FireServer(3,{Fortified={},Destroyable=workspace},CFrame.new(),CFrame.new(),{CFrame=game.Players.targetPlayer.Character.HumanoidRootPart.CFrame*cFrame,Size=Size})
    

end)


Section2:NewButton("Inf Jump", "Dit is nog al iritant", function()


_G.infinjump = true
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
if _G.infinjump then
if k:byte() == 32 then
Humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
Humanoid:ChangeState("Jumping")
wait(0.1)
Humanoid:ChangeState("Seated")
end
end
end)
 
local Player = game:GetService("Players").LocalPlayer
local Mouse = Player:GetMouse()
Mouse.KeyDown:connect(function(k)
k = k:lower()
if k == "r" then
if _G.infinjump == true then
_G.infinjump = false
else
_G.infinjump = true
end
end
end)
end)

Section2:NewToggle("Wallhack Toggle", "ToggleInfo", function(state)
    if state then
		ActivateESP()

    else
		DeactivateESP()
    end
end)



-- Aimbot Lib
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimbotEnabled = false
_G.TeamCheck = false
_G.AimPart = "Head"
_G.Sensitivity = 0 

local function GetClosestPlayer()
	local MaximumDistance = math.huge
	local Target = nil
  
  	coroutine.wrap(function()
    		wait(20); MaximumDistance = math.huge 
  	end)()

	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
								
								if VectorDistance < MaximumDistance then
									Target = v
                  							MaximumDistance = VectorDistance
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
							
							if VectorDistance < MaximumDistance then
								Target = v
               							MaximumDistance = VectorDistance
							end
						end
					end
				end
			end
		end
	end

	return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
    end
end)


Section2:NewToggle("Aimbot Toggle", "ToggleInfo", function(state)
    if state then
		_G.AimbotEnabled = true

    else
		_G.AimbotEnabled = false
    end
end)


