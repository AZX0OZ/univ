-- ds: https://discord.gg/bvEQEUuCFQ

-- tg: https://t.me/+FizXrGSg3B9jZTRi

 -- ###############            ###           ###   ###              ###          ###   ###        ###   ############                      
 -- ###          ###          #####          ###   ###              ###          ###   ###        ###   ###       ###                         
 -- ###          ###         ### ###               ###              ###          ###   ###        ###   ###       ###              
 -- ###        ###          ###   ###        ###   ###              ###          ###   ###        ###   ############                          
 -- ############           ###     ###       ###   ###              ################   ###        ###   ###        ###                                  
 -- ###       ###         #############      ###   ###              ################   ###        ###   ###         ###                   
 -- ###        ###       ###         ###     ###   ###              ###          ###   ###        ###   ###         ###                              
 -- ###         ###     ###           ###    ###   ##############   ###          ###    ############    ###         ###                         
 -- ###          ###   ###             ###   ###   ##############   ###          ###     ##########     ##############                                               
----------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------
 ---------------------------------------------------------------------------------------------------------------------
-- Ссылка на Библиотеку
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- Создать окно UI
local Window = OrionLib:MakeWindow({Name = "RAILhub universal", HidePremium = false, IntroText = "RAILhub", SaveConfig = false, ConfigFolder = "OrionTest"})

---------------------------------------------------------------------------------------------------
local Tab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Подсекция
local Section = Tab:AddSection({
	Name = "Last Update : 1.11.2024!"
})

-- Подсекция
local Section = Tab:AddSection({
	Name = "v 0.0.1.0!"
})

local textToCopy = "https://discord.gg/bvEQEUuCFQ" -- Замените этот текст на нужный вам.

Tab:AddButton({
    Name = "Discord Link",
    Callback = function()
        -- Копирование текста в буфер обмена
        setclipboard(textToCopy)
        print("Ссылка была скопирована: " .. textToCopy) -- Печатает сообщение в консоль для подтверждения
    end    
})

local textToCopy = "https://t.me/+FizXrGSg3B9jZTRi" -- Замените этот текст на нужный вам.

Tab:AddButton({
    Name = "Telegram Link",
    Callback = function()
        -- Копирование текста в буфер обмена
        setclipboard(textToCopy)
        print("Ссылка была скопирована: " .. textToCopy) -- Печатает сообщение в консоль для подтверждения
    end    
})
-----------------------------------------------------------------------------------------------------------

-- Секция-------------------------------------------------------------------------------------------------
local Tab = Window:MakeTab({
	Name = "Esp",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Подсекция
local Section = Tab:AddSection({
	Name = "Esp"
})

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer
local camera = game:GetService("Workspace").CurrentCamera

local showESPBox = false
local showESPName = false
local showESPTeam = false
local showHealthBar = false
local showDistance = false

local updateInterval = 0.042

local function createESP(player)
    local espBoxOutline = Drawing.new("Square")
    espBoxOutline.Color = Color3.new(0, 0, 0)
    espBoxOutline.Thickness = 0.2
    espBoxOutline.Transparency = 1
    espBoxOutline.Filled = false
    espBoxOutline.Visible = false

    local espBox = Drawing.new("Square")
    espBox.Color = Color3.new(1, 1, 1)
    espBox.Thickness = 0.7
    espBox.Transparency = 1
    espBox.Filled = false
    espBox.Visible = false

    local espName = Drawing.new("Text")
    espName.Color = Color3.new(1, 1, 1)
    espName.Size = 15
    espName.Center = true
    espName.Outline = true
    espName.Text = player.Name
    espName.Visible = false

    local espTeam = Drawing.new("Text")
    espTeam.Size = 14
    espTeam.Center = true
    espTeam.Outline = true
    espTeam.Visible = false

    local healthBarBackground = Drawing.new("Square")
    healthBarBackground.Color = Color3.new(0, 0, 0)
    healthBarBackground.Filled = true
    healthBarBackground.Transparency = 0.6
    healthBarBackground.Thickness = 1
    healthBarBackground.Visible = false

    local healthBar = Drawing.new("Square")
    healthBar.Color = Color3.new(0, 1, 0)
    healthBar.Filled = true
    healthBar.Transparency = 0.5
    healthBar.Thickness = 1
    healthBar.Visible = false

    local distanceLabel = Drawing.new("Text")
    distanceLabel.Color = Color3.new(1, 1, 1)
    distanceLabel.Size = 13
    distanceLabel.Center = true
    distanceLabel.Outline = true
    distanceLabel.Visible = false

    local lastUpdate = 0

    local function updateESP()
        if tick() - lastUpdate < updateInterval then return end
        lastUpdate = tick()

        if not showESPBox and not showESPName and not showESPTeam and not showHealthBar and not showDistance then
            espBoxOutline.Visible = false
            espBox.Visible = false
            espName.Visible = false
            espTeam.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            distanceLabel.Visible = false
            return
        end

        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") and character:FindFirstChild("Head") then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            local head = character:FindFirstChild("Head")
            local humanoid = character:FindFirstChild("Humanoid")

            local rootPos, onScreenRoot = camera:WorldToViewportPoint(rootPart.Position)
            local headPos, onScreenHead = camera:WorldToViewportPoint(head.Position)
            local legPos

            if humanoid then
                -- For R15, we can make an adjustment to the leg position
                if humanoid.RigType == Enum.HumanoidRigType.R15 then
                    legPos = rootPart.Position - Vector3.new(0, 5.5, 0)  -- Height set to the bottom of R15 model
                else
                    legPos = rootPart.Position - Vector3.new(1, -5.51, 1)  -- Height set to the bottom of R6 model
                end

                if onScreenRoot and onScreenHead then
                    local height = (headPos.Y - camera:WorldToViewportPoint(legPos).Y)
                    local width = height / 2

                    if showESPBox then
                        espBoxOutline.Size = Vector2.new(width + 4, height + 4)
                        espBoxOutline.Position = Vector2.new(rootPos.X - width / 2 - 2, headPos.Y - 2)
                        espBoxOutline.Visible = true

                        espBox.Size = Vector2.new(width, height)
                        espBox.Position = Vector2.new(rootPos.X - width / 2, headPos.Y)
                        espBox.Visible = true
                    else
                        espBoxOutline.Visible = false
                        espBox.Visible = false
                    end

                    if showESPName then
                        espName.Position = Vector2.new(rootPos.X, headPos.Y - 20)
                        espName.Visible = true
                    else
                        espName.Visible = false
                    end

                    if showESPTeam then
                        if player.Team then
                            local teamColor = player.Team.TeamColor.Color
                            espTeam.Color = teamColor
                            espTeam.Text = player.Team.Name
                            espTeam.Position = Vector2.new(rootPos.X, headPos.Y - 34)
                            espTeam.Visible = true
                        else
                            espTeam.Visible = false
                        end
                    else
                        espTeam.Visible = false
                    end

                    if showHealthBar and humanoid then
                        local health = humanoid.Health
                        local maxHealth = humanoid.MaxHealth
                        healthBarBackground.Size = Vector2.new(5, height)
                        healthBarBackground.Position = Vector2.new(rootPos.X - width / 2 - 10, headPos.Y)
                        healthBarBackground.Visible = true

                        healthBar.Size = Vector2.new(5, (health / maxHealth) * height)
                        healthBar.Position = Vector2.new(rootPos.X - width / 2 - 10, headPos.Y + height - healthBar.Size.Y)
                        healthBar.Visible = true
                    else
                        healthBar.Visible = false
                        healthBarBackground.Visible = false
                    end

                    local distance = (rootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude
                    if showDistance and distance < 500 then
                        distanceLabel.Text = string.format("%.2f m", distance)
                        distanceLabel.Position = Vector2.new(rootPos.X, headPos.Y - 48)
                        distanceLabel.Visible = true
                    else
                        distanceLabel.Visible = false
                    end
                else
                    espBoxOutline.Visible = false
                    espBox.Visible = false
                    espName.Visible = false
                    espTeam.Visible = false
                    healthBar.Visible = false
                    healthBarBackground.Visible = false
                    distanceLabel.Visible = false
                end
            else
                espBoxOutline.Visible = false
                espBox.Visible = false
                espName.Visible = false
                espTeam.Visible = false
                healthBar.Visible = false
                healthBarBackground.Visible = false
                distanceLabel.Visible = false
            end
        else
            espBoxOutline.Visible = false
            espBox.Visible = false
            espName.Visible = false
            espTeam.Visible = false
            healthBar.Visible = false
            healthBarBackground.Visible = false
            distanceLabel.Visible = false
        end
    end

    local connection = game:GetService("RunService").RenderStepped:Connect(updateESP)

    player.AncestryChanged:Connect(function()
        if not player:IsDescendantOf(game) then
            connection:Disconnect()
            espBoxOutline:Remove()
            espBox:Remove()
            espName:Remove()
            espTeam:Remove()
            healthBar:Remove()
            healthBarBackground:Remove()
            distanceLabel:Remove()
        end
    end)
end

for _, player in pairs(players:GetPlayers()) do
    if player ~= localPlayer then
        createESP(player)
    end
end

players.PlayerAdded:Connect(function(player)
    if player ~= localPlayer then
        createESP(player)
    end
end)

-- UI Toggles for ESP options
Tab:AddToggle({
    Name = "ESP Box",
    Default = false,
    Callback = function(Value)
        showESPBox = Value
    end
})

Tab:AddToggle({
    Name = "ESP Name",
    Default = false,
    Callback = function(Value)
        showESPName = Value
    end
})

Tab:AddToggle({
    Name = "ESP Team",
    Default = false,
    Callback = function(Value)
        showESPTeam = Value
    end
})

Tab:AddToggle({
    Name = "Health Bar",
    Default = false,
    Callback = function(Value)
        showHealthBar = Value
    end
})

Tab:AddToggle({
    Name = "ESP Distance",
    Default = false,
    Callback = function(Value)
        showDistance = Value
    end
})













-- Секция-------------------------------------------------------------------------------------------------
local Tab = Window:MakeTab({
	Name = "Aim",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Подсекция
local Section = Tab:AddSection({
	Name = "Aim Bot"
})










local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimbotEnabled = false
_G.AimbotActive = false -- For sticky aim
_G.SilentAimEnabled = false -- For silent aim
_G.TeamCheck = false
_G.AimPart = "Head"
_G.Sensitivity = 0.1
_G.PredictionEnabled = false
_G.PredictionStrength = 0 -- Default value for motion prediction

_G.CircleSides = 10
_G.CircleColor = Color3.fromRGB(255, 255, 255)
_G.CircleTransparency = 1
_G.CircleRadius = 0 -- Default Radius to find players
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 1

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local currentTarget = nil -- Variable to store the currently targeted player

local function GetClosestPlayer()
    local closestDistance = _G.CircleRadius
    local target = nil
    local centerPoint = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            if not _G.TeamCheck or (player.Team ~= LocalPlayer.Team) then
                local character = player.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local humanoid = character:FindFirstChild("Humanoid")
                    if humanoid and humanoid.Health > 0 then
                        local screenPoint = Camera:WorldToScreenPoint(character.HumanoidRootPart.Position)
                        local vectorDistance = (centerPoint - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude

                        -- Check if the player is within the FOV radius and closer to the center
                        if vectorDistance < closestDistance then
                            target = player
                            closestDistance = vectorDistance
                        end
                    end
                end
            end
        end
    end

    return target
end

local function PredictTargetPosition(target)
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = target.Character.HumanoidRootPart
        local velocity = humanoidRootPart.Velocity
        local predictedPosition = humanoidRootPart.Position + (velocity * _G.PredictionStrength)
        return predictedPosition
    end
    return nil
end

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true

        -- Lock onto the closest player when aiming is initiated
        if _G.AimbotEnabled then
            currentTarget = GetClosestPlayer()
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
        currentTarget = nil -- Release the target when aiming is stopped
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Filled = _G.CircleFilled
    FOVCircle.Color = _G.CircleColor
    FOVCircle.Visible = _G.CircleVisible
    FOVCircle.Transparency = _G.CircleTransparency
    FOVCircle.NumSides = _G.CircleSides
    FOVCircle.Thickness = _G.CircleThickness

    if Holding and _G.AimbotEnabled then
        local aimPosition

        if currentTarget then
            -- Predict the position if motion prediction is enabled
            if _G.PredictionEnabled then
                aimPosition = PredictTargetPosition(currentTarget)
            else
                aimPosition = currentTarget.Character[_G.AimPart].Position
            end

            -- Silent aim logic
            if _G.SilentAimEnabled then
                -- No need to move camera, just mark target for shooting accuracy
                -- You can add silent aim shooting logic here if required
            elseif _G.AimbotActive then
                -- Sticky aim logic: moves camera towards the target
                if aimPosition then
                    TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine), {CFrame = CFrame.new(Camera.CFrame.Position, aimPosition)}):Play()
                end
            end
        end
    end
end)

-- Toggle Implementation for Aimbot
Tab:AddToggle({
    Name = "Enable aim",
    Default = _G.AimbotEnabled,
    Callback = function(aimbot)
        _G.AimbotEnabled = aimbot
    end    
})

-- Aimbot Active Toggle
Tab:AddToggle({
    Name = "sticky aim",
    Default = _G.AimbotActive,
    Callback = function(active)
        _G.AimbotActive = active
    end    
})

Tab:AddDropdown({
    Name = "Aim Part",
    Default = "Head",
    Options = {"Head", "Torso"},
    Callback = function(aim)
        _G.AimPart = aim
    end    
})

-- Slider Implementation for Sensitivity
Tab:AddSlider({
    Name = "Sensitivity",
    Min = 0,
    Max = 1,
    Default = _G.Sensitivity,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.001,
    ValueName = " ",
    Callback = function(Sens)
        _G.Sensitivity = Sens
    end    
})

-- Slider Implementation for FOV
Tab:AddSlider({
    Name = "Aim FOV",
    Min = 0,
    Max = 1000,
    Default = _G.CircleRadius,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = " ",
    Callback = function(Value)
        _G.CircleRadius = Value
    end    
})

-- Toggle for Motion Prediction
Tab:AddToggle({
    Name = "Prediction",
    Default = _G.PredictionEnabled,
    Callback = function(value)
        _G.PredictionEnabled = value
    end    
})

-- Slider for Prediction Strength
Tab:AddSlider({
    Name = "Prediction Strength",
    Min = 0,
    Max = 2, -- Adjust max as needed for how much you want to predict movement
    Default = _G.PredictionStrength,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.01,
    ValueName = " ",
    Callback = function(value)
        _G.PredictionStrength = value
    end    
})

Tab:AddColorpicker({
    Name = "FOV Color",
    Default = Color3.fromRGB(255, 255, 255),
    Callback = function(color)
        _G.CircleColor = color
    end   
})

-- Toggle for Team Check
Tab:AddToggle({
    Name = "Team Check",
    Default = _G.TeamCheck,
    Callback = function(Value)
        _G.TeamCheck = Value
    end
})

-- Slider Implementation for Transparency
Tab:AddSlider({
    Name = "FOV Transparency",
    Min = 0,
    Max = 1,
    Default = _G.CircleTransparency,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.001,
    ValueName = " ",
    Callback = function(trans)
        _G.CircleTransparency = trans
    end    
})

-- Секция-------------------------------------------------------------------------------------------------
local Tab = Window:MakeTab({
	Name = "Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local savedFov = 70 -- Variable to hold the saved FOV value

Tab:AddSlider({
    Name = "Fov",
    Min = 10,
    Max = 120,
    Default = 70,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "Fov",
    Callback = function(Value)
        -- Change the camera's Field of View
        local player = game.Players.LocalPlayer
        local camera = workspace.CurrentCamera

        -- Set the Field of View to the value from the slider
        camera.FieldOfView = Value
        savedFov = Value -- Save the new value
    end    
})

-- Function to reset the FOV when the right mouse button is released
local function onRightMouseButtonReleased()
    wait(1) -- Wait for 0.5 seconds
    local player = game.Players.LocalPlayer
    local camera = workspace.CurrentCamera

    -- Check if the current FOV matches the saved FOV
    if camera.FieldOfView ~= savedFov then
        camera.FieldOfView = savedFov -- Reset to saved FOV
    end
end

-- Bind the right mouse button release event
local userInputService = game:GetService("UserInputService")
userInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then -- Right mouse button
        onRightMouseButtonReleased()
    end
end)

-- Подсекция
local Section = Tab:AddSection({
	Name = "TpTool"
})

-- Кнопка
Tab:AddButton({
    Name = "TpTool",
    Callback = function()
        local LocalPlayer = game.Players.LocalPlayer
        local rp = LocalPlayer.Character.HumanoidRootPart
        local tool = Instance.new("Tool", LocalPlayer.Backpack)
        local mouse = LocalPlayer:GetMouse()

        tool.Name = "click tp"
        tool.RequiresHandle = false
        
        tool.Activated:Connect(function()
            rp.CFrame = CFrame.new(mouse.Hit.X, mouse.Hit.Y + 4, mouse.Hit.Z)
        end)
    end
})

---------------------------------------------------------------------------------------------------
local Tab = Window:MakeTab({
	Name = "Мaр",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- Подсекция
local Section = Tab:AddSection({
	Name = "Map"
})

-- Кнопка
Tab:AddButton({
    Name = "Full bright",
    Callback = function()
if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 13 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 13
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 13
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

_G.FullBrightExecuted = true
_G.FullBrightEnabled = not _G.FullBrightEnabled
end
})

-- Кнопка
Tab:AddButton({
    Name = "Delete fog",
    Callback = function()
    -- Получаем папку Lighting
    local lightingFolder = game:GetService("Lighting") 

    -- Удаляем все объекты в Lighting
    for _, child in ipairs(lightingFolder:GetChildren()) do
        child:Destroy() -- Удаляем объект
        print("Объект '" .. child.Name .. "' был удален из Lighting.") -- Выводим сообщение о удалении
    end
end
})












