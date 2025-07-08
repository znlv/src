local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/WetCheezit/Bracket-V2/main/src.lua"))()

-- Window
local Window, MainGUI = Library:CreateWindow("RZ Project | By @94kx")

-- Tabs
local Tab1 = Window:CreateTab("Tab 1")
local Tab2 = Window:CreateTab("Tab 2")

local Groupbox1 = Tab1:CreateGroupbox("Groupbox 1", "Left")
local Groupbox2 = Tab1:CreateGroupbox("Groupbox 2", "Right")

local Groupbox3 = Tab2:CreateGroupbox("Groupbox 1", "Left")
local Groupbox4 = Tab2:CreateGroupbox("Groupbox 2", "Right")

-- Groupbox 1
local ExampleToggle = Groupbox1:CreateToggle("Example toggle", function(state)
   print(state)
end)

local ExampleToggle2 = Groupbox1:CreateToggle("Example keybind", function(state)
   print(state)
end)

local ExampleButton = Groupbox1:CreateButton("Example Button", function()
    print("Pressed")
end)

ExampleToggle2:CreateKeyBind()

local ExampleSlider = Groupbox1:CreateSlider("Example slider", 0, 25, 0, function(value)
   print(value)
end)

local ExampleDropdown = Groupbox1:CreateDropdown("Example Dropdown", {"Option 1", "Option 2", "Option 3"}, function(state)
   print(state)
end)

local ExampleColorPicker = Groupbox1:CreateColorPicker("Color", Color3.fromRGB(0, 0, 0), function(state)
   print(state.R, state.G, state.B)
end)

-- Groupbox 2
local ExampleToggle2 = Groupbox2:CreateToggle("Example toggle", function(state)
   print(state)
end)

local ExampleToggle3 = Groupbox2:CreateToggle("Example keybind", function(state)
   print(state)
end)

local ExampleButton2 = Groupbox2:CreateButton("Example Button", function()
    print("Pressed")
end)

ExampleToggle3:CreateKeyBind()

local ExampleSlider2 = Groupbox2:CreateSlider("Example slider", 0, 25, 0, function(value)
   print(value)
end)

local ExampleDropdown2 = Groupbox2:CreateDropdown("Example Dropdown", {"Option 1", "Option 2", "Option 3"}, function(state)
   print(state)
end)

local ExampleColorPicker2 = Groupbox2:CreateColorPicker("Color", Color3.fromRGB(0, 0, 0), function(state)
   print(state.R, state.G, state.B)
end)

-- Groupbox 3
local ExampleToggle4 = Groupbox3:CreateToggle("Example toggle", function(state)
   print(state)
end)

local ExampleToggle5 = Groupbox3:CreateToggle("Example keybind", function(state)
   print(state)
end)

local ExampleButton3 = Groupbox3:CreateButton("Example Button", function()
    print("Pressed")
end)

ExampleToggle5:CreateKeyBind()

local ExampleSlider3 = Groupbox3:CreateSlider("Example slider", 0, 25, 0, function(value)
   print(value)
end)

local ExampleDropdown3 = Groupbox3:CreateDropdown("Example Dropdown", {"Option 1", "Option 2", "Option 3"}, function(state)
   print(state)
end)

local ExampleColorPicker3 = Groupbox3:CreateColorPicker("Color", Color3.fromRGB(0, 0, 0), function(state)
   print(state.R, state.G, state.B)
end)

-- Groupbox 4
local ExampleToggle5 = Groupbox4:CreateToggle("Example toggle", function(state)
   print(state)
end)

local ExampleToggle6 = Groupbox4:CreateToggle("Example keybind", function(state)
   print(state)
end)

local ExampleButton4 = Groupbox4:CreateButton("Example Button", function()
    print("Pressed")
end)

ExampleToggle6:CreateKeyBind()

local ExampleSlider4 = Groupbox4:CreateSlider("Example slider", 0, 25, 0, function(value)
   print(value)
end)

local ExampleDropdown4 = Groupbox4:CreateDropdown("Example Dropdown", {"Option 1", "Option 2", "Option 3"}, function(state)
   print(state)
end)

local ExampleColorPicker4 = Groupbox4:CreateColorPicker("Color", Color3.fromRGB(0, 0, 0), function(state)
   print(state.R, state.G, state.B)
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

