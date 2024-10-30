--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local TABLE_TableIndirection = {};
TABLE_TableIndirection["OrionLib%0"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))();
TABLE_TableIndirection["Window%0"] = TABLE_TableIndirection["OrionLib%0"]:MakeWindow({Name="RAILhub universal",HidePremium=false,IntroText="RAILhub",SaveConfig=false,ConfigFolder="OrionTest"});
TABLE_TableIndirection["Tab%0"] = TABLE_TableIndirection["Window%0"]:MakeTab({Name="Info",Icon="rbxassetid://4483345998",PremiumOnly=false});
TABLE_TableIndirection["Section%0"] = TABLE_TableIndirection["Tab%0"]:AddSection({Name="Last Update : 1.11.2024!"});
TABLE_TableIndirection["Section%1"] = TABLE_TableIndirection["Tab%0"]:AddSection({Name="v 0.0.1.0!"});
TABLE_TableIndirection["textToCopy%0"] = "https://discord.gg/bvEQEUuCFQ";
TABLE_TableIndirection["Tab%0"]:AddButton({Name="Discord Link",Callback=function()
	setclipboard(TABLE_TableIndirection["textToCopy%0"]);
	print("Ссылка была скопирована: " .. TABLE_TableIndirection["textToCopy%0"]);
end});
TABLE_TableIndirection["textToCopy%1"] = "https://t.me/+FizXrGSg3B9jZTRi";
TABLE_TableIndirection["Tab%0"]:AddButton({Name="Telegram Link",Callback=function()
	setclipboard(TABLE_TableIndirection["textToCopy%1"]);
	print("Ссылка была скопирована: " .. TABLE_TableIndirection["textToCopy%1"]);
end});
TABLE_TableIndirection["Tab%1"] = TABLE_TableIndirection["Window%0"]:MakeTab({Name="Esp",Icon="rbxassetid://4483345998",PremiumOnly=false});
TABLE_TableIndirection["Section%2"] = TABLE_TableIndirection["Tab%1"]:AddSection({Name="Esp"});
TABLE_TableIndirection["players%0"] = game:GetService("Players");
TABLE_TableIndirection["localPlayer%0"] = TABLE_TableIndirection["players%0"].LocalPlayer;
TABLE_TableIndirection["camera%0"] = game:GetService("Workspace").CurrentCamera;
TABLE_TableIndirection["showESPBox%0"] = false;
TABLE_TableIndirection["showESPName%0"] = false;
TABLE_TableIndirection["showESPTeam%0"] = false;
TABLE_TableIndirection["showHealthBar%0"] = false;
TABLE_TableIndirection["showDistance%0"] = false;
TABLE_TableIndirection["updateInterval%0"] = 0.042;
local function createESP(player)
	TABLE_TableIndirection["espBoxOutline%0"] = Drawing.new("Square");
	TABLE_TableIndirection["espBoxOutline%0"].Color = Color3.new(0, 0, 0);
	TABLE_TableIndirection["espBoxOutline%0"].Thickness = 0.2;
	TABLE_TableIndirection["espBoxOutline%0"].Transparency = 1;
	TABLE_TableIndirection["espBoxOutline%0"].Filled = false;
	TABLE_TableIndirection["espBoxOutline%0"].Visible = false;
	TABLE_TableIndirection["espBox%0"] = Drawing.new("Square");
	TABLE_TableIndirection["espBox%0"].Color = Color3.new(1, 1, 1);
	TABLE_TableIndirection["espBox%0"].Thickness = 0.7;
	TABLE_TableIndirection["espBox%0"].Transparency = 1;
	TABLE_TableIndirection["espBox%0"].Filled = false;
	TABLE_TableIndirection["espBox%0"].Visible = false;
	TABLE_TableIndirection["espName%0"] = Drawing.new("Text");
	TABLE_TableIndirection["espName%0"].Color = Color3.new(1, 1, 1);
	TABLE_TableIndirection["espName%0"].Size = 15;
	TABLE_TableIndirection["espName%0"].Center = true;
	TABLE_TableIndirection["espName%0"].Outline = true;
	TABLE_TableIndirection["espName%0"].Text = player.Name;
	TABLE_TableIndirection["espName%0"].Visible = false;
	TABLE_TableIndirection["espTeam%0"] = Drawing.new("Text");
	TABLE_TableIndirection["espTeam%0"].Size = 14;
	TABLE_TableIndirection["espTeam%0"].Center = true;
	TABLE_TableIndirection["espTeam%0"].Outline = true;
	TABLE_TableIndirection["espTeam%0"].Visible = false;
	TABLE_TableIndirection["healthBarBackground%0"] = Drawing.new("Square");
	TABLE_TableIndirection["healthBarBackground%0"].Color = Color3.new(0, 0, 0);
	TABLE_TableIndirection["healthBarBackground%0"].Filled = true;
	TABLE_TableIndirection["healthBarBackground%0"].Transparency = 0.6;
	TABLE_TableIndirection["healthBarBackground%0"].Thickness = 1;
	TABLE_TableIndirection["healthBarBackground%0"].Visible = false;
	TABLE_TableIndirection["healthBar%0"] = Drawing.new("Square");
	TABLE_TableIndirection["healthBar%0"].Color = Color3.new(0, 1, 0);
	TABLE_TableIndirection["healthBar%0"].Filled = true;
	TABLE_TableIndirection["healthBar%0"].Transparency = 0.5;
	TABLE_TableIndirection["healthBar%0"].Thickness = 1;
	TABLE_TableIndirection["healthBar%0"].Visible = false;
	TABLE_TableIndirection["distanceLabel%0"] = Drawing.new("Text");
	TABLE_TableIndirection["distanceLabel%0"].Color = Color3.new(1, 1, 1);
	TABLE_TableIndirection["distanceLabel%0"].Size = 13;
	TABLE_TableIndirection["distanceLabel%0"].Center = true;
	TABLE_TableIndirection["distanceLabel%0"].Outline = true;
	TABLE_TableIndirection["distanceLabel%0"].Visible = false;
	TABLE_TableIndirection["lastUpdate%0"] = 0;
	local function updateESP()
		if ((tick() - TABLE_TableIndirection["lastUpdate%0"]) < TABLE_TableIndirection["updateInterval%0"]) then
			return;
		end
		TABLE_TableIndirection["lastUpdate%0"] = tick();
		if (not TABLE_TableIndirection["showESPBox%0"] and not TABLE_TableIndirection["showESPName%0"] and not TABLE_TableIndirection["showESPTeam%0"] and not TABLE_TableIndirection["showHealthBar%0"] and not TABLE_TableIndirection["showDistance%0"]) then
			TABLE_TableIndirection["espBoxOutline%0"].Visible = false;
			TABLE_TableIndirection["espBox%0"].Visible = false;
			TABLE_TableIndirection["espName%0"].Visible = false;
			TABLE_TableIndirection["espTeam%0"].Visible = false;
			TABLE_TableIndirection["healthBar%0"].Visible = false;
			TABLE_TableIndirection["healthBarBackground%0"].Visible = false;
			TABLE_TableIndirection["distanceLabel%0"].Visible = false;
			return;
		end
		TABLE_TableIndirection["character%0"] = player.Character;
		if (TABLE_TableIndirection["character%0"] and TABLE_TableIndirection["character%0"]:FindFirstChild("HumanoidRootPart") and TABLE_TableIndirection["character%0"]:FindFirstChild("Head")) then
			TABLE_TableIndirection["rootPart%0"] = TABLE_TableIndirection["character%0"]:FindFirstChild("HumanoidRootPart");
			TABLE_TableIndirection["head%0"] = TABLE_TableIndirection["character%0"]:FindFirstChild("Head");
			TABLE_TableIndirection["humanoid%0"] = TABLE_TableIndirection["character%0"]:FindFirstChild("Humanoid");
			local rootPos, onScreenRoot = TABLE_TableIndirection["camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["rootPart%0"].Position);
			local headPos, onScreenHead = TABLE_TableIndirection["camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["head%0"].Position);
			TABLE_TableIndirection["legPos%0"] = nil;
			if TABLE_TableIndirection["humanoid%0"] then
				if (TABLE_TableIndirection["humanoid%0"].RigType == Enum.HumanoidRigType.R15) then
					TABLE_TableIndirection["legPos%0"] = TABLE_TableIndirection["rootPart%0"].Position - Vector3.new(0, 5.5, 0);
				else
					TABLE_TableIndirection["legPos%0"] = TABLE_TableIndirection["rootPart%0"].Position - Vector3.new(1, -5.51, 1);
				end
				if (onScreenRoot and onScreenHead) then
					TABLE_TableIndirection["height%0"] = headPos.Y - TABLE_TableIndirection["camera%0"]:WorldToViewportPoint(TABLE_TableIndirection["legPos%0"]).Y;
					TABLE_TableIndirection["width%0"] = TABLE_TableIndirection["height%0"] / 2;
					if TABLE_TableIndirection["showESPBox%0"] then
						TABLE_TableIndirection["espBoxOutline%0"].Size = Vector2.new(TABLE_TableIndirection["width%0"] + 4, TABLE_TableIndirection["height%0"] + 4);
						TABLE_TableIndirection["espBoxOutline%0"].Position = Vector2.new((rootPos.X - (TABLE_TableIndirection["width%0"] / 2)) - 2, headPos.Y - 2);
						TABLE_TableIndirection["espBoxOutline%0"].Visible = true;
						TABLE_TableIndirection["espBox%0"].Size = Vector2.new(TABLE_TableIndirection["width%0"], TABLE_TableIndirection["height%0"]);
						TABLE_TableIndirection["espBox%0"].Position = Vector2.new(rootPos.X - (TABLE_TableIndirection["width%0"] / 2), headPos.Y);
						TABLE_TableIndirection["espBox%0"].Visible = true;
					else
						TABLE_TableIndirection["espBoxOutline%0"].Visible = false;
						TABLE_TableIndirection["espBox%0"].Visible = false;
					end
					if TABLE_TableIndirection["showESPName%0"] then
						TABLE_TableIndirection["espName%0"].Position = Vector2.new(rootPos.X, headPos.Y - 20);
						TABLE_TableIndirection["espName%0"].Visible = true;
					else
						TABLE_TableIndirection["espName%0"].Visible = false;
					end
					if TABLE_TableIndirection["showESPTeam%0"] then
						if player.Team then
							TABLE_TableIndirection["teamColor%0"] = player.Team.TeamColor.Color;
							TABLE_TableIndirection["espTeam%0"].Color = TABLE_TableIndirection["teamColor%0"];
							TABLE_TableIndirection["espTeam%0"].Text = player.Team.Name;
							TABLE_TableIndirection["espTeam%0"].Position = Vector2.new(rootPos.X, headPos.Y - 34);
							TABLE_TableIndirection["espTeam%0"].Visible = true;
						else
							TABLE_TableIndirection["espTeam%0"].Visible = false;
						end
					else
						TABLE_TableIndirection["espTeam%0"].Visible = false;
					end
					if (TABLE_TableIndirection["showHealthBar%0"] and TABLE_TableIndirection["humanoid%0"]) then
						TABLE_TableIndirection["health%0"] = TABLE_TableIndirection["humanoid%0"].Health;
						TABLE_TableIndirection["maxHealth%0"] = TABLE_TableIndirection["humanoid%0"].MaxHealth;
						TABLE_TableIndirection["healthBarBackground%0"].Size = Vector2.new(5, TABLE_TableIndirection["height%0"]);
						TABLE_TableIndirection["healthBarBackground%0"].Position = Vector2.new((rootPos.X - (TABLE_TableIndirection["width%0"] / 2)) - 10, headPos.Y);
						TABLE_TableIndirection["healthBarBackground%0"].Visible = true;
						TABLE_TableIndirection["healthBar%0"].Size = Vector2.new(5, (TABLE_TableIndirection["health%0"] / TABLE_TableIndirection["maxHealth%0"]) * TABLE_TableIndirection["height%0"]);
						TABLE_TableIndirection["healthBar%0"].Position = Vector2.new((rootPos.X - (TABLE_TableIndirection["width%0"] / 2)) - 10, (headPos.Y + TABLE_TableIndirection["height%0"]) - TABLE_TableIndirection["healthBar%0"].Size.Y);
						TABLE_TableIndirection["healthBar%0"].Visible = true;
					else
						TABLE_TableIndirection["healthBar%0"].Visible = false;
						TABLE_TableIndirection["healthBarBackground%0"].Visible = false;
					end
					TABLE_TableIndirection["distance%0"] = (TABLE_TableIndirection["rootPart%0"].Position - TABLE_TableIndirection["localPlayer%0"].Character.HumanoidRootPart.Position).magnitude;
					if (TABLE_TableIndirection["showDistance%0"] and (TABLE_TableIndirection["distance%0"] < 500)) then
						TABLE_TableIndirection["distanceLabel%0"].Text = string.format("%.2f m", TABLE_TableIndirection["distance%0"]);
						TABLE_TableIndirection["distanceLabel%0"].Position = Vector2.new(rootPos.X, headPos.Y - 48);
						TABLE_TableIndirection["distanceLabel%0"].Visible = true;
					else
						TABLE_TableIndirection["distanceLabel%0"].Visible = false;
					end
				else
					TABLE_TableIndirection["espBoxOutline%0"].Visible = false;
					TABLE_TableIndirection["espBox%0"].Visible = false;
					TABLE_TableIndirection["espName%0"].Visible = false;
					TABLE_TableIndirection["espTeam%0"].Visible = false;
					TABLE_TableIndirection["healthBar%0"].Visible = false;
					TABLE_TableIndirection["healthBarBackground%0"].Visible = false;
					TABLE_TableIndirection["distanceLabel%0"].Visible = false;
				end
			else
				TABLE_TableIndirection["espBoxOutline%0"].Visible = false;
				TABLE_TableIndirection["espBox%0"].Visible = false;
				TABLE_TableIndirection["espName%0"].Visible = false;
				TABLE_TableIndirection["espTeam%0"].Visible = false;
				TABLE_TableIndirection["healthBar%0"].Visible = false;
				TABLE_TableIndirection["healthBarBackground%0"].Visible = false;
				TABLE_TableIndirection["distanceLabel%0"].Visible = false;
			end
		else
			TABLE_TableIndirection["espBoxOutline%0"].Visible = false;
			TABLE_TableIndirection["espBox%0"].Visible = false;
			TABLE_TableIndirection["espName%0"].Visible = false;
			TABLE_TableIndirection["espTeam%0"].Visible = false;
			TABLE_TableIndirection["healthBar%0"].Visible = false;
			TABLE_TableIndirection["healthBarBackground%0"].Visible = false;
			TABLE_TableIndirection["distanceLabel%0"].Visible = false;
		end
	end
	TABLE_TableIndirection["connection%0"] = game:GetService("RunService").RenderStepped:Connect(updateESP);
	player.AncestryChanged:Connect(function()
		if not player:IsDescendantOf(game) then
			TABLE_TableIndirection["connection%0"]:Disconnect();
			TABLE_TableIndirection["espBoxOutline%0"]:Remove();
			TABLE_TableIndirection["espBox%0"]:Remove();
			TABLE_TableIndirection["espName%0"]:Remove();
			TABLE_TableIndirection["espTeam%0"]:Remove();
			TABLE_TableIndirection["healthBar%0"]:Remove();
			TABLE_TableIndirection["healthBarBackground%0"]:Remove();
			TABLE_TableIndirection["distanceLabel%0"]:Remove();
		end
	end);
end
for _, player in pairs(TABLE_TableIndirection["players%0"]:GetPlayers()) do
	if (player ~= TABLE_TableIndirection["localPlayer%0"]) then
		createESP(player);
	end
end
TABLE_TableIndirection["players%0"].PlayerAdded:Connect(function(player)
	if (player ~= TABLE_TableIndirection["localPlayer%0"]) then
		createESP(player);
	end
end);
TABLE_TableIndirection["Tab%1"]:AddToggle({Name="ESP Box",Default=false,Callback=function(Value)
	TABLE_TableIndirection["showESPBox%0"] = Value;
end});
TABLE_TableIndirection["Tab%1"]:AddToggle({Name="ESP Name",Default=false,Callback=function(Value)
	TABLE_TableIndirection["showESPName%0"] = Value;
end});
TABLE_TableIndirection["Tab%1"]:AddToggle({Name="ESP Team",Default=false,Callback=function(Value)
	TABLE_TableIndirection["showESPTeam%0"] = Value;
end});
TABLE_TableIndirection["Tab%1"]:AddToggle({Name="Health Bar",Default=false,Callback=function(Value)
	TABLE_TableIndirection["showHealthBar%0"] = Value;
end});
TABLE_TableIndirection["Tab%1"]:AddToggle({Name="ESP Distance",Default=false,Callback=function(Value)
	TABLE_TableIndirection["showDistance%0"] = Value;
end});
TABLE_TableIndirection["Tab%2"] = TABLE_TableIndirection["Window%0"]:MakeTab({Name="Aim",Icon="rbxassetid://4483345998",PremiumOnly=false});
TABLE_TableIndirection["Section%3"] = TABLE_TableIndirection["Tab%2"]:AddSection({Name="Aim Bot"});
TABLE_TableIndirection["Camera%0"] = workspace.CurrentCamera;
TABLE_TableIndirection["Players%0"] = game:GetService("Players");
TABLE_TableIndirection["RunService%0"] = game:GetService("RunService");
TABLE_TableIndirection["UserInputService%0"] = game:GetService("UserInputService");
TABLE_TableIndirection["TweenService%0"] = game:GetService("TweenService");
TABLE_TableIndirection["LocalPlayer%0"] = TABLE_TableIndirection["Players%0"].LocalPlayer;
TABLE_TableIndirection["Holding%0"] = false;
_G.AimbotEnabled = false;
_G.AimbotActive = false;
_G.SilentAimEnabled = false;
_G.TeamCheck = false;
_G.AimPart = "Head";
_G.Sensitivity = 0.1;
_G.PredictionEnabled = false;
_G.PredictionStrength = 0;
_G.CircleSides = 10;
_G.CircleColor = Color3.fromRGB(255, 255, 255);
_G.CircleTransparency = 1;
_G.CircleRadius = 0;
_G.CircleFilled = false;
_G.CircleVisible = true;
_G.CircleThickness = 1;
TABLE_TableIndirection["FOVCircle%0"] = Drawing.new("Circle");
TABLE_TableIndirection["FOVCircle%0"].Position = Vector2.new(TABLE_TableIndirection["Camera%0"].ViewportSize.X / 2, TABLE_TableIndirection["Camera%0"].ViewportSize.Y / 2);
TABLE_TableIndirection["FOVCircle%0"].Radius = _G.CircleRadius;
TABLE_TableIndirection["FOVCircle%0"].Filled = _G.CircleFilled;
TABLE_TableIndirection["FOVCircle%0"].Color = _G.CircleColor;
TABLE_TableIndirection["FOVCircle%0"].Visible = _G.CircleVisible;
TABLE_TableIndirection["FOVCircle%0"].Transparency = _G.CircleTransparency;
TABLE_TableIndirection["FOVCircle%0"].NumSides = _G.CircleSides;
TABLE_TableIndirection["FOVCircle%0"].Thickness = _G.CircleThickness;
TABLE_TableIndirection["currentTarget%0"] = nil;
local function GetClosestPlayer()
	TABLE_TableIndirection["closestDistance%0"] = _G.CircleRadius;
	TABLE_TableIndirection["target%0"] = nil;
	TABLE_TableIndirection["centerPoint%0"] = Vector2.new(TABLE_TableIndirection["Camera%0"].ViewportSize.X / 2, TABLE_TableIndirection["Camera%0"].ViewportSize.Y / 2);
	for _, player in pairs(TABLE_TableIndirection["Players%0"]:GetPlayers()) do
		if (player ~= TABLE_TableIndirection["LocalPlayer%0"]) then
			if (not _G.TeamCheck or (player.Team ~= TABLE_TableIndirection["LocalPlayer%0"].Team)) then
				TABLE_TableIndirection["character%0"] = player.Character;
				if (TABLE_TableIndirection["character%0"] and TABLE_TableIndirection["character%0"]:FindFirstChild("HumanoidRootPart")) then
					TABLE_TableIndirection["humanoid%0"] = TABLE_TableIndirection["character%0"]:FindFirstChild("Humanoid");
					if (TABLE_TableIndirection["humanoid%0"] and (TABLE_TableIndirection["humanoid%0"].Health > 0)) then
						TABLE_TableIndirection["screenPoint%0"] = TABLE_TableIndirection["Camera%0"]:WorldToScreenPoint(TABLE_TableIndirection["character%0"].HumanoidRootPart.Position);
						TABLE_TableIndirection["vectorDistance%0"] = (TABLE_TableIndirection["centerPoint%0"] - Vector2.new(TABLE_TableIndirection["screenPoint%0"].X, TABLE_TableIndirection["screenPoint%0"].Y)).Magnitude;
						if (TABLE_TableIndirection["vectorDistance%0"] < TABLE_TableIndirection["closestDistance%0"]) then
							TABLE_TableIndirection["target%0"] = player;
							TABLE_TableIndirection["closestDistance%0"] = TABLE_TableIndirection["vectorDistance%0"];
						end
					end
				end
			end
		end
	end
	return TABLE_TableIndirection["target%0"];
end
local function PredictTargetPosition(target)
	if (target and target.Character and target.Character:FindFirstChild("HumanoidRootPart")) then
		TABLE_TableIndirection["humanoidRootPart%0"] = target.Character.HumanoidRootPart;
		TABLE_TableIndirection["velocity%0"] = TABLE_TableIndirection["humanoidRootPart%0"].Velocity;
		TABLE_TableIndirection["predictedPosition%0"] = TABLE_TableIndirection["humanoidRootPart%0"].Position + (TABLE_TableIndirection["velocity%0"] * _G.PredictionStrength);
		return TABLE_TableIndirection["predictedPosition%0"];
	end
	return nil;
end
TABLE_TableIndirection["UserInputService%0"].InputBegan:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton2) then
		TABLE_TableIndirection["Holding%0"] = true;
		if _G.AimbotEnabled then
			TABLE_TableIndirection["currentTarget%0"] = GetClosestPlayer();
		end
	end
end);
TABLE_TableIndirection["UserInputService%0"].InputEnded:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton2) then
		TABLE_TableIndirection["Holding%0"] = false;
		TABLE_TableIndirection["currentTarget%0"] = nil;
	end
end);
TABLE_TableIndirection["RunService%0"].RenderStepped:Connect(function()
	TABLE_TableIndirection["FOVCircle%0"].Position = Vector2.new(TABLE_TableIndirection["UserInputService%0"]:GetMouseLocation().X, TABLE_TableIndirection["UserInputService%0"]:GetMouseLocation().Y);
	TABLE_TableIndirection["FOVCircle%0"].Radius = _G.CircleRadius;
	TABLE_TableIndirection["FOVCircle%0"].Filled = _G.CircleFilled;
	TABLE_TableIndirection["FOVCircle%0"].Color = _G.CircleColor;
	TABLE_TableIndirection["FOVCircle%0"].Visible = _G.CircleVisible;
	TABLE_TableIndirection["FOVCircle%0"].Transparency = _G.CircleTransparency;
	TABLE_TableIndirection["FOVCircle%0"].NumSides = _G.CircleSides;
	TABLE_TableIndirection["FOVCircle%0"].Thickness = _G.CircleThickness;
	if (TABLE_TableIndirection["Holding%0"] and _G.AimbotEnabled) then
		TABLE_TableIndirection["aimPosition%0"] = nil;
		if TABLE_TableIndirection["currentTarget%0"] then
			if _G.PredictionEnabled then
				TABLE_TableIndirection["aimPosition%0"] = PredictTargetPosition(TABLE_TableIndirection["currentTarget%0"]);
			else
				TABLE_TableIndirection["aimPosition%0"] = TABLE_TableIndirection["currentTarget%0"].Character[_G.AimPart].Position;
			end
			if _G.SilentAimEnabled then
			elseif _G.AimbotActive then
				if TABLE_TableIndirection["aimPosition%0"] then
					TABLE_TableIndirection["TweenService%0"]:Create(TABLE_TableIndirection["Camera%0"], TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine), {CFrame=CFrame.new(TABLE_TableIndirection["Camera%0"].CFrame.Position, TABLE_TableIndirection["aimPosition%0"])}):Play();
				end
			end
		end
	end
end);
TABLE_TableIndirection["Tab%2"]:AddToggle({Name="Enable aim",Default=_G.AimbotEnabled,Callback=function(aimbot)
	_G.AimbotEnabled = aimbot;
end});
TABLE_TableIndirection["Tab%2"]:AddToggle({Name="sticky aim",Default=_G.AimbotActive,Callback=function(active)
	_G.AimbotActive = active;
end});
TABLE_TableIndirection["Tab%2"]:AddDropdown({Name="Aim Part",Default="Head",Options={"Head","Torso"},Callback=function(aim)
	_G.AimPart = aim;
end});
TABLE_TableIndirection["Tab%2"]:AddSlider({Name="Sensitivity",Min=0,Max=1,Default=_G.Sensitivity,Color=Color3.fromRGB(255, 255, 255),Increment=0.001,ValueName=" ",Callback=function(Sens)
	_G.Sensitivity = Sens;
end});
TABLE_TableIndirection["Tab%2"]:AddSlider({Name="Aim FOV",Min=0,Max=1000,Default=_G.CircleRadius,Color=Color3.fromRGB(255, 255, 255),Increment=1,ValueName=" ",Callback=function(Value)
	_G.CircleRadius = Value;
end});
TABLE_TableIndirection["Tab%2"]:AddToggle({Name="Prediction",Default=_G.PredictionEnabled,Callback=function(value)
	_G.PredictionEnabled = value;
end});
TABLE_TableIndirection["Tab%2"]:AddSlider({Name="Prediction Strength",Min=0,Max=2,Default=_G.PredictionStrength,Color=Color3.fromRGB(255, 255, 255),Increment=0.01,ValueName=" ",Callback=function(value)
	_G.PredictionStrength = value;
end});
TABLE_TableIndirection["Tab%2"]:AddColorpicker({Name="FOV Color",Default=Color3.fromRGB(255, 255, 255),Callback=function(color)
	_G.CircleColor = color;
end});
TABLE_TableIndirection["Tab%2"]:AddToggle({Name="Team Check",Default=_G.TeamCheck,Callback=function(Value)
	_G.TeamCheck = Value;
end});
TABLE_TableIndirection["Tab%2"]:AddSlider({Name="FOV Transparency",Min=0,Max=1,Default=_G.CircleTransparency,Color=Color3.fromRGB(255, 255, 255),Increment=0.001,ValueName=" ",Callback=function(trans)
	_G.CircleTransparency = trans;
end});
TABLE_TableIndirection["Tab%3"] = TABLE_TableIndirection["Window%0"]:MakeTab({Name="Player",Icon="rbxassetid://4483345998",PremiumOnly=false});
TABLE_TableIndirection["savedFov%0"] = 70;
TABLE_TableIndirection["Tab%3"]:AddSlider({Name="Fov",Min=10,Max=120,Default=70,Color=Color3.fromRGB(255, 255, 255),Increment=1,ValueName="Fov",Callback=function(Value)
	TABLE_TableIndirection["player%0"] = game.Players.LocalPlayer;
	TABLE_TableIndirection["camera%1"] = workspace.CurrentCamera;
	TABLE_TableIndirection["camera%1"].FieldOfView = Value;
	TABLE_TableIndirection["savedFov%0"] = Value;
end});
local function onRightMouseButtonReleased()
	wait(1);
	TABLE_TableIndirection["player%0"] = game.Players.LocalPlayer;
	TABLE_TableIndirection["camera%1"] = workspace.CurrentCamera;
	if (TABLE_TableIndirection["camera%1"].FieldOfView ~= TABLE_TableIndirection["savedFov%0"]) then
		TABLE_TableIndirection["camera%1"].FieldOfView = TABLE_TableIndirection["savedFov%0"];
	end
end
TABLE_TableIndirection["userInputService%0"] = game:GetService("UserInputService");
TABLE_TableIndirection["userInputService%0"].InputEnded:Connect(function(input)
	if (input.UserInputType == Enum.UserInputType.MouseButton2) then
		onRightMouseButtonReleased();
	end
end);
TABLE_TableIndirection["Section%4"] = TABLE_TableIndirection["Tab%3"]:AddSection({Name="TpTool"});
TABLE_TableIndirection["Tab%3"]:AddButton({Name="TpTool",Callback=function()
	TABLE_TableIndirection["LocalPlayer%1"] = game.Players.LocalPlayer;
	TABLE_TableIndirection["rp%0"] = TABLE_TableIndirection["LocalPlayer%1"].Character.HumanoidRootPart;
	TABLE_TableIndirection["tool%0"] = Instance.new("Tool", TABLE_TableIndirection["LocalPlayer%1"].Backpack);
	TABLE_TableIndirection["mouse%0"] = TABLE_TableIndirection["LocalPlayer%1"]:GetMouse();
	TABLE_TableIndirection["tool%0"].Name = "click tp";
	TABLE_TableIndirection["tool%0"].RequiresHandle = false;
	TABLE_TableIndirection["tool%0"].Activated:Connect(function()
		TABLE_TableIndirection["rp%0"].CFrame = CFrame.new(TABLE_TableIndirection["mouse%0"].Hit.X, TABLE_TableIndirection["mouse%0"].Hit.Y + 4, TABLE_TableIndirection["mouse%0"].Hit.Z);
	end);
end});
TABLE_TableIndirection["Tab%4"] = TABLE_TableIndirection["Window%0"]:MakeTab({Name="Мaр",Icon="rbxassetid://4483345998",PremiumOnly=false});
TABLE_TableIndirection["Section%5"] = TABLE_TableIndirection["Tab%4"]:AddSection({Name="Map"});
TABLE_TableIndirection["Tab%4"]:AddButton({Name="Full bright",Callback=function()
	if not _G.FullBrightExecuted then
		_G.FullBrightEnabled = false;
		_G.NormalLightingSettings = {Brightness=game:GetService("Lighting").Brightness,ClockTime=game:GetService("Lighting").ClockTime,FogEnd=game:GetService("Lighting").FogEnd,GlobalShadows=game:GetService("Lighting").GlobalShadows,Ambient=game:GetService("Lighting").Ambient};
		game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
			if ((game:GetService("Lighting").Brightness ~= 1) and (game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness)) then
				_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness;
				if not _G.FullBrightEnabled then
					repeat
						wait();
					until _G.FullBrightEnabled 
				end
				game:GetService("Lighting").Brightness = 1;
			end
		end);
		game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
			if ((game:GetService("Lighting").ClockTime ~= 13) and (game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime)) then
				_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime;
				if not _G.FullBrightEnabled then
					repeat
						wait();
					until _G.FullBrightEnabled 
				end
				game:GetService("Lighting").ClockTime = 13;
			end
		end);
		game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
			if ((game:GetService("Lighting").FogEnd ~= 786543) and (game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd)) then
				_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd;
				if not _G.FullBrightEnabled then
					repeat
						wait();
					until _G.FullBrightEnabled 
				end
				game:GetService("Lighting").FogEnd = 786543;
			end
		end);
		game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
			if ((game:GetService("Lighting").GlobalShadows ~= false) and (game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows)) then
				_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows;
				if not _G.FullBrightEnabled then
					repeat
						wait();
					until _G.FullBrightEnabled 
				end
				game:GetService("Lighting").GlobalShadows = false;
			end
		end);
		game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
			if ((game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178)) and (game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient)) then
				_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient;
				if not _G.FullBrightEnabled then
					repeat
						wait();
					until _G.FullBrightEnabled 
				end
				game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178);
			end
		end);
		game:GetService("Lighting").Brightness = 1;
		game:GetService("Lighting").ClockTime = 13;
		game:GetService("Lighting").FogEnd = 786543;
		game:GetService("Lighting").GlobalShadows = false;
		game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178);
		TABLE_TableIndirection["LatestValue%0"] = true;
		spawn(function()
			repeat
				wait();
			until _G.FullBrightEnabled 
			while wait() do
				if (_G.FullBrightEnabled ~= TABLE_TableIndirection["LatestValue%0"]) then
					if not _G.FullBrightEnabled then
						game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness;
						game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime;
						game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd;
						game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows;
						game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient;
					else
						game:GetService("Lighting").Brightness = 1;
						game:GetService("Lighting").ClockTime = 12;
						game:GetService("Lighting").FogEnd = 786543;
						game:GetService("Lighting").GlobalShadows = false;
						game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178);
					end
					TABLE_TableIndirection["LatestValue%0"] = not TABLE_TableIndirection["LatestValue%0"];
				end
			end
		end);
	end
	_G.FullBrightExecuted = true;
	_G.FullBrightEnabled = not _G.FullBrightEnabled;
end});
TABLE_TableIndirection["Tab%4"]:AddButton({Name="Delete fog",Callback=function()
	TABLE_TableIndirection["lightingFolder%0"] = game:GetService("Lighting");
	for _, child in ipairs(TABLE_TableIndirection["lightingFolder%0"]:GetChildren()) do
		child:Destroy();
		print("Объект '" .. child.Name .. "' был удален из Lighting.");
	end
end});
