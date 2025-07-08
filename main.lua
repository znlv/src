
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/Rain-Design/PPHUD/main/Library.lua'))()
local Flags = Library.Flags

local Window = Library:Window({
   Text = "Baseplate"
})

local Tab = Window:Tab({
   Text = "Aiming"
})

local Tab2 = Window:Tab({
   Text = "Visual"
})

local Section = Tab:Section({
   Text = "Aiming"
})

local Section2 = Tab:Section({
   Text = "Anti-Aim"
})

local Section3 = Tab:Section({
   Text = "Ragebot",
   Side = "Right"
})

Section:Check({
   Text = "Aimbot",
   Flag = "Aimbot"
})

Section:Check({
   Text = "Silent-Aim",
   Callback = function(bool)
       .G_AimbotEnabled = bool
   end
})

Section:Dropdown({
   Text = "Body Part",
   List = {"Head", "Torso", "Random"},
   Callback = function(opt)
       warn(opt)
   end
})

Section:Slider({
   Text = "Hit Chance",
   Minimum = 0,
   Default = 60,
   Maximum = 100,
   Postfix = "%",
   Callback = function(n)
       warn(n)
   end
})

Section:Button({
   Text = "Spawn",
   Callback = function()
       warn("Settings Reseted.")
   end
})

Section2:Check({
   Text = "Spin"
})

Section2:Slider({
   Text = "Pitch Offset",
   Minimum = 100,
   Default = 150,
   Maximum = 500,
   Callback = function(n)
       warn(n)
   end
})

Section2:Slider({
   Text = "Yaw Offset",
   Minimum = 100,
   Default = 150,
   Maximum = 500,
   Callback = function(n)
       warn(n)
   end
})

Section2:Button({
   Text = "Resolve Positions"
})

Section3:Check({
   Text = "Auto-Wall",
   Callback = function(bool)
       warn(bool)
   end
})

Section3:Check({
   Text = "Trigger Bot"
})

Section3:Check({
   Text = "Insta-Kill"
})

Section3:Dropdown({
   Text = "Hitscan Directions",
   List = {"Left", "Right", "Up", "Down", "All"},
   Callback = function(opt)
       warn(opt)
   end
})

Section3:Label({
   Text = "Status: Undetected",
   Color = Color3.fromRGB(100, 190, 31)
})

Tab:Select()

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

