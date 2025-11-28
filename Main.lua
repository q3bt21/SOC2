local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Theme = {
    TextColor = Color3.fromRGB(240, 240, 240),
    Background = Color3.fromRGB(0, 0, 0),
    Topbar = Color3.fromRGB(0, 0, 0),
    Shadow = Color3.fromRGB(0, 0, 0),
    NotificationBackground = Color3.fromRGB(0, 0, 0),
    NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
    TabBackground = Color3.fromRGB(25, 25, 25),
    TabStroke = Color3.fromRGB(255, 255, 255), 
    TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
    TabTextColor = Color3.fromRGB(240, 240, 240),
    SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
    ElementBackground = Color3.fromRGB(10, 10, 10),
    ElementBackgroundHover = Color3.fromRGB(20, 20, 20),
    SecondaryElementBackground = Color3.fromRGB(0, 0, 0),
    ElementStroke = Color3.fromRGB(50, 50, 50),
    SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
    SliderBackground = Color3.fromRGB(240, 240, 240),
    SliderProgress = Color3.fromRGB(240, 240, 240),
    SliderStroke = Color3.fromRGB(255, 255, 255),
    ToggleBackground = Color3.fromRGB(15, 15, 15),
    ToggleEnabled = Color3.fromRGB(255, 255, 255),
    ToggleDisabled = Color3.fromRGB(100, 100, 100),
    ToggleEnabledStroke = Color3.fromRGB(255, 255, 255),
    ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
    ToggleEnabledOuterStroke = Color3.fromRGB(150, 150, 150),
    ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
    DropdownSelected = Color3.fromRGB(20, 20, 20),
    DropdownUnselected = Color3.fromRGB(10, 10, 10),
    InputBackground = Color3.fromRGB(10, 10, 10),
    InputStroke = Color3.fromRGB(65, 65, 65),
    PlaceholderColor = Color3.fromRGB(178, 178, 178)
}



local Window = Rayfield:CreateWindow({
    Name = "SOC2 - Emergncy Hamburg",
    LoadingTitle = "Loading SOC2...",
    LoadingSubtitle = "SOC2 - Development",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SOC2",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
    },
    KeySystem = false,
    Theme = Theme,
    Icon = 95324496128336
})




local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local RbxAnalytics = game:GetService("RbxAnalyticsService")

local SCRIPT_NAME = "EmergncyHamburg"

local player = Players.LocalPlayer or Players.PlayerAdded:Wait()

local timeNow = os.date("%d.%m.%Y - %H:%M:%S")

-- Console Prints (bleiben wie im Original)
print("Welcome to SOC2 - Emergncy Hamburg")
print("---------------------------")
print("UserId: " .. player.UserId)
print("Script: " .. SCRIPT_NAME)
print("Executed at: " .. timeNow)
print("---------------------------")
print("SOC2 - Services")

local WEBHOOK_URL = "https://discord.com/api/webhooks/1441873408034869358/YqCFSU03VVrusW4HVrnmeH4buEBSQVMwDXvej2mBxz-vGk1XhTk_FTKnGFT6MKHrhirD"


local avatarUrl = ("https://tr.rbxcdn.com/%s/420/420/AvatarHeadshot/Png")
    :format(player.UserId)


local executor = identifyexecutor and identifyexecutor() or "Unknown"
local exploitVersion = (getexecutorversion and getexecutorversion()) or "N/A"

local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local gameName = gameInfo and gameInfo.Name or "Unknown Game"

local profileLink = "https://www.roblox.com/users/" .. player.UserId .. "/profile"


local embed = {
    title = "SOC2 Logging System",
    description = nil, 
    color = 0x2b2d31,

    author = {
        name = player.Name .. " | UserId: " .. player.UserId
    },

    thumbnail = {
        url = avatarUrl
    },

    fields = {
        { name = "Script Name", value = SCRIPT_NAME, inline = false },
        { name = "Executed At", value = timeNow, inline = false },

        { name = "Username", value = player.Name, inline = true },
        { name = "UserId", value = tostring(player.UserId), inline = true },

        { name = "Game", value = gameName, inline = true },
        { name = "PlaceId", value = tostring(game.PlaceId), inline = true },

        { name = "Server Id", value = game.JobId ~= "" and game.JobId or "N/A", inline = false },

        { name = "ClientId", value = RbxAnalytics:GetClientId(), inline = false },

        { name = "Executor", value = tostring(executor), inline = true },
        { name = "Executor Version", value = tostring(exploitVersion), inline = true },
    },

    footer = {
        text = "SOC2 Logging System – by Unloveable"
    }
}


local components = {{
    type = 1,
    components = {
        {
            type = 2,
            style = 5,
            label = "Open Roblox Profile",
            url = profileLink
        }
    }
}}


local data = {
    username = "SOC2 - Logger",
    avatar_url = "https://cdn.discordapp.com/attachments/1441873381254496266/1441875159932731542/Download.jpg?ex=69236262&is=692210e2&hm=c265e1f4905fc6058cb4cde1ea7373896b731896bd6611f6363fbc81c84b246e&",
    embeds = { embed },
    components = components
}

local body = HttpService:JSONEncode(data)

local send = request or http_request or (syn and syn.request) or (fluxus and fluxus.request)

if not send then
    warn("It Seems ur Executor dont Support Https Requests.")
    return
end

send({
    Url = WEBHOOK_URL,
    Method = "POST",
    Headers = { ["Content-Type"] = "application/json" },
    Body = body
})




---------------------------------------------------
-- TABS
---------------------------------------------------
local Information = Window:CreateTab("Information")
local Visuals = Window:CreateTab("Visuals")
local Movement = Window:CreateTab("Movement")
local GunMods = Window:CreateTab("Gun Mods")
local VehicleMods = Window:CreateTab("Vehicle Mods")
local Police = Window:CreateTab("Police")
local Misc = Window:CreateTab("Misc")
local Teleports = Window:CreateTab("Teleports")

---------------------------------------------------
-- Information TAB
---------------------------------------------------
Information:CreateSection("Update Log")
local Label = Information:CreateLabel("This Script Is Currently in Beta", nil, Color3.fromRGB(0, 0, 0), false) 
local Button = Information:CreateButton({
   Name = "Copy discord Invite",
   Callback = function()
        setclipboard("https://discord.gg/zCvf8U5Anf")
   end,
})

local Divider = Information:CreateDivider()

---------------------------------------------------
-- VISUALS 
---------------------------------------------------

Visuals:CreateSection("Visual - Effects")

local state = {
    ghost = false,
    ghostColor = Color3.fromRGB(255, 255, 255),
    originalColors = {},
    fullbright = false,
    xray = false
}

local player = game.Players.LocalPlayer
local lighting = game:GetService("Lighting")

local function saveOriginalColors(parent)
    for _, p in pairs(parent:GetDescendants()) do
        if p:IsA("BasePart") and not state.originalColors[p] then
            state.originalColors[p] = {
                Color = p.Color,
                Material = p.Material,
                Transparency = p.LocalTransparencyModifier
            }
        end
    end
end

local function restoreOriginalColors()
    for part, data in pairs(state.originalColors) do
        if part and part.Parent then
            part.Color = data.Color
            part.Material = data.Material
            part.LocalTransparencyModifier = data.Transparency
        end
    end
    state.originalColors = {}
end

local function applyGhostEffect(color)
    local char = player.Character
    if not char then return end
    for _, p in pairs(char:GetDescendants()) do
        if p:IsA("BasePart") then
            p.LocalTransparencyModifier = 0.9
            p.Material = Enum.Material.ForceField
            p.Color = color
        end
    end
end


Visuals:CreateToggle({
    Name = "Ghost Avatar",
    CurrentValue = false,
    Flag = "GhostAvatarToggle",
    Callback = function(Value)
        state.ghost = Value
        local char = player.Character
        if not char then return end
        if Value then
            saveOriginalColors(char)
            applyGhostEffect(state.ghostColor)
        else
            restoreOriginalColors()
        end
    end,
})


Visuals:CreateColorPicker({
    Name = "Avatar Ghost Color",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "AvatarGhostColor",
    Callback = function(Color)
        state.ghostColor = Color
    end,
})

task.spawn(function()
    while task.wait(0.1) do
        if state.ghost then
            applyGhostEffect(state.ghostColor)
        end
    end
end)

-----------------------------------------------------
-- VISUAL LIGHTING 
-----------------------------------------------------
Visuals:CreateSection("Visual - Lighting")


Visuals:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle",
    Callback = function(Value)
        state.fullbright = Value
        if Value then
            state.oldLighting = {
                Ambient = lighting.Ambient,
                Brightness = lighting.Brightness,
                OutdoorAmbient = lighting.OutdoorAmbient
            }
            lighting.Ambient = Color3.new(1, 1, 1)
            lighting.Brightness = 10
            lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        else
            if state.oldLighting then
                lighting.Ambient = state.oldLighting.Ambient
                lighting.Brightness = state.oldLighting.Brightness
                lighting.OutdoorAmbient = state.oldLighting.OutdoorAmbient
            end
        end
    end,
})


Visuals:CreateToggle({
    Name = "X-Ray",
    CurrentValue = false,
    Flag = "XRayToggle",
    Callback = function(Value)
        state.xray = Value
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then
                if Value then
                    obj.LocalTransparencyModifier = 0.8
                else
                    obj.LocalTransparencyModifier = 0
                end
            end
        end
    end,
})



-----------------------------------------------------
-- VISUAL ESP
-----------------------------------------------------
local ESPSettings = {
    Enabled = false,
    Box = false,
    Name = false,
    Distance = false,
    HP = false,
    Tool = false,
    BoxColor = Color3.fromRGB(255, 255, 255),
    Font = Drawing.Fonts.Plex
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local function createDrawing(type, properties)
    local obj = Drawing.new(type)
    for i, v in pairs(properties) do
        obj[i] = v
    end
    return obj
end

local function newESP(plr)
    if plr == LocalPlayer then return end

    local drawings = {
        boxOutline = createDrawing("Square", {Visible = false, Color = Color3.fromRGB(0,0,0), Thickness = 3, Filled = false}),
        box = createDrawing("Square", {Visible = false, Color = ESPSettings.BoxColor, Thickness = 1, Filled = false}),
        name = createDrawing("Text", {Visible = false, Color = Color3.fromRGB(255,255,255), Size = 14, Center = true, Outline = true, Font = ESPSettings.Font}),
        distance = createDrawing("Text", {Visible = false, Color = Color3.fromRGB(200,200,200), Size = 13, Center = true, Outline = true, Font = ESPSettings.Font}),
        hp = createDrawing("Text", {Visible = false, Color = Color3.fromRGB(0,255,0), Size = 14, Center = true, Outline = true, Font = ESPSettings.Font}),
        tool = createDrawing("Text", {Visible = false, Color = Color3.fromRGB(255,255,255), Size = 14, Center = true, Outline = true, Font = ESPSettings.Font})
    }

    RunService.RenderStepped:Connect(function()
        if not ESPSettings.Enabled or not plr.Character or not plr.Character:FindFirstChild("HumanoidRootPart") then
            for _, d in pairs(drawings) do d.Visible = false end
            return
        end

        local root = plr.Character.HumanoidRootPart
        local humanoid = plr.Character:FindFirstChildOfClass("Humanoid")
        local pos, vis = Camera:WorldToViewportPoint(root.Position)

        if not vis then
            for _, d in pairs(drawings) do d.Visible = false end
            return
        end

        local dist = (root.Position - Camera.CFrame.Position).Magnitude
        local scale = math.clamp(2000 / dist, 2, 300)
        local size = Vector2.new(4 * scale, 6 * scale)
        local topLeft = Vector2.new(pos.X - size.X / 2, pos.Y - size.Y / 2)

        -- BOX
        if ESPSettings.Box then
            drawings.boxOutline.Visible = true
            drawings.box.Visible = true
            drawings.boxOutline.Size = size
            drawings.boxOutline.Position = topLeft
            drawings.box.Size = size
            drawings.box.Position = topLeft
        else
            drawings.boxOutline.Visible = false
            drawings.box.Visible = false
        end

        -- NAME
        if ESPSettings.Name and humanoid then
            drawings.name.Visible = true
            drawings.name.Text = plr.DisplayName
            drawings.name.Position = Vector2.new(pos.X, topLeft.Y - 15)
        else
            drawings.name.Visible = false
        end

        -- DISTANCE
        if ESPSettings.Distance then
            drawings.distance.Visible = true
            drawings.distance.Text = tostring(math.floor(dist)) .. "m"
            drawings.distance.Position = Vector2.new(pos.X, topLeft.Y + size.Y + 5)
        else
            drawings.distance.Visible = false
        end

        -- HP
        if ESPSettings.HP and humanoid then
            drawings.hp.Visible = true
            drawings.hp.Text = "HP: " .. math.floor(humanoid.Health)
            drawings.hp.Position = Vector2.new(pos.X, topLeft.Y + size.Y + 20)
        else
            drawings.hp.Visible = false
        end

        -- TOOL
        if ESPSettings.Tool then
            drawings.tool.Visible = true

            local tool = plr.Character:FindFirstChildOfClass("Tool")
            drawings.tool.Text = tool and ("Tool: " .. tool.Name) or "Tool: None"

            drawings.tool.Position = Vector2.new(pos.X, topLeft.Y - 30)
        else
            drawings.tool.Visible = false
        end
    end)
end

for _, plr in pairs(Players:GetPlayers()) do
    newESP(plr)
end
Players.PlayerAdded:Connect(newESP)

-- UI
Visuals:CreateSection("Visual - ESP")

Visuals:CreateToggle({
    Name = "Enable ESP",
    CurrentValue = false,
    Callback = function(v) ESPSettings.Enabled = v end
})

Visuals:CreateToggle({
    Name = "Box ESP",
    CurrentValue = false,
    Callback = function(v) ESPSettings.Box = v end
})

Visuals:CreateToggle({
    Name = "Name ESP",
    CurrentValue = false,
    Callback = function(v) ESPSettings.Name = v end
})

Visuals:CreateToggle({
    Name = "Distance ESP",
    CurrentValue = false,
    Callback = function(v) ESPSettings.Distance = v end
})

Visuals:CreateToggle({
    Name = "HP ESP",
    CurrentValue = false,
    Callback = function(v) ESPSettings.HP = v end
})

Visuals:CreateToggle({
    Name = "Tool ESP",
    CurrentValue = false,
    Callback = function(v) ESPSettings.Tool = v end
})






---------------------------------------------------
-- MOVEMENT 
---------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

Movement:CreateSection("Movement Controls")

local player = game:GetService("Players").LocalPlayer

local flyingSpeed = 49
local isFlying = false

local attachment, alignPosition, alignOrientation

local function canFly()
	return player.Character:FindFirstChild("Humanoid").SeatPart == nil
end

local function enableFly()
	if not canFly() then return end

	local character = player.Character
	local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	local humanoid = character:FindFirstChild("Humanoid")

	attachment = Instance.new("Attachment", humanoidRootPart)

	alignPosition = Instance.new("AlignPosition")
	alignPosition.Attachment0 = attachment
	alignPosition.Mode = Enum.PositionAlignmentMode.OneAttachment
	alignPosition.MaxForce = 5000
	alignPosition.Responsiveness = 45
	alignPosition.Parent = humanoidRootPart

	alignOrientation = Instance.new("AlignOrientation")
	alignOrientation.Attachment0 = attachment
	alignOrientation.Mode = Enum.OrientationAlignmentMode.OneAttachment
	alignOrientation.MaxTorque = 5000
	alignOrientation.Responsiveness = 45
	alignOrientation.Parent = humanoidRootPart

	humanoid.PlatformStand = true
	isFlying = true

	local lastPosition = humanoidRootPart.Position
	alignPosition.Position = lastPosition

	local function flyLoop()
		while isFlying do
			local moveDirection = Vector3.new()
			local camCFrame = workspace.CurrentCamera.CFrame
			local UIS = game:GetService("UserInputService")

			if UIS:IsKeyDown(Enum.KeyCode.W) then
				moveDirection += camCFrame.LookVector
			end
			if UIS:IsKeyDown(Enum.KeyCode.S) then
				moveDirection -= camCFrame.LookVector
			end
			if UIS:IsKeyDown(Enum.KeyCode.A) then
				moveDirection -= camCFrame.RightVector
			end
			if UIS:IsKeyDown(Enum.KeyCode.D) then
				moveDirection += camCFrame.RightVector
			end

			if moveDirection.Magnitude > 0 then
				moveDirection = moveDirection.Unit
				local dt = game:GetService("RunService").Heartbeat:Wait()
				local newPosition = lastPosition + (moveDirection * flyingSpeed * dt)
				alignPosition.Position = newPosition
				lastPosition = newPosition
			end

			alignOrientation.CFrame = CFrame.new(Vector3.new(), camCFrame.LookVector)
			game:GetService("RunService").Heartbeat:Wait()
		end
	end

	task.spawn(flyLoop)
end

local function disableFly()
	isFlying = false

	local character = player.Character
	local humanoid = character:FindFirstChild("Humanoid")
	
	if humanoid then
		humanoid.PlatformStand = false
	end
	
	if attachment then attachment:Destroy() end
	if alignPosition then alignPosition:Destroy() end
	if alignOrientation then alignOrientation:Destroy() end
end


Movement:CreateToggle({
	Name = "Fly",
	CurrentValue = false,
	Flag = "FlyToggle",
	Callback = function(state)
		if state then
			enableFly()
		else
			disableFly()
		end
	end,
})






local Divider = Movement:CreateDivider()




local infiniteJump = false
UserInputService.JumpRequest:Connect(function()
    if infiniteJump then
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)

Movement:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(val)
        infiniteJump = val
    end
})




local noclip = false
Movement:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(v)
        noclip = v
    end
})
local noclipConn = RunService.Stepped:Connect(function()
    if noclip then
        local char = LocalPlayer.Character
        if char then
            for _,part in pairs(char:GetChildren()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)



--------------------------------------------
---- Gun Mods
--------------------------------------------

GunMods:CreateSection("Gun - Tools")

local player = game.Players.LocalPlayer


local plr = game:GetService("Players").LocalPlayer
local Status = false
local rapidTask = nil

local function startRapidFire()
    rapidTask = task.spawn(function()
        while Status do
            local char = plr.Character
            if char then
                local Tool = char:FindFirstChildOfClass("Tool")
                
                if Tool then
                    Tool:SetAttribute("ShootDelay", 0)
                    Tool:SetAttribute("Automatic", true)
                end
            end
            task.wait(0.1)
        end
    end)
end

local function stopRapidFire()
    Status = false
end

GunMods:CreateToggle({
    Name = "Rapid Fire",
    CurrentValue = false,
    Flag = "RapidFireToggle",
    Callback = function(state)
        Status = state
        
        if state then
            startRapidFire()
        else
            stopRapidFire()
        end
    end,
})


local plr = game:GetService("Players").LocalPlayer
local Status = false
local recoilTask = nil

local function startNoRecoil()
    recoilTask = task.spawn(function()
        while Status do
            local char = plr.Character
            if char then
                local Tool = char:FindFirstChildOfClass("Tool")

                if Tool then
                    Tool:SetAttribute("Recoil", 0)
                    Tool:SetAttribute("Instability", 0)
                end
            end
            task.wait(0.1)
        end
    end)
end

local function stopNoRecoil()
    Status = false
end

GunMods:CreateToggle({
    Name = "No Recoil",
    CurrentValue = false,
    Flag = "NoRecoilToggle",
    Callback = function(state)
        Status = state

        if state then
            startNoRecoil()
        else
            stopNoRecoil()
        end
    end,
})



local plr = game:GetService("Players").LocalPlayer
local Status = false
local crosshairTask = nil

local function startCrosshair()
    crosshairTask = task.spawn(function()
        while Status do
            local char = plr.Character
            if char then
                local Tool = char:FindFirstChildOfClass("Tool")

                if Tool then
                    Tool:SetAttribute("CrosshairSize", 1)
                end
            end
            task.wait(0.1)
        end
    end)
end

local function stopCrosshair()
    Status = false
end

GunMods:CreateToggle({
    Name = "Crosshair 2",
    CurrentValue = false,
    Flag = "CrosshairToggle",
    Callback = function(state)
        Status = state

        if state then
            startCrosshair()
        else
            stopCrosshair()
        end
    end,
})



--------------------------------------------
---- Gun Effect
--------------------------------------------



local toolState = {
    active = false,
    color = Color3.fromRGB(255, 255, 255),
    original = {}
}

local function saveToolColors(tool)
    for _, p in pairs(tool:GetDescendants()) do
        if p:IsA("BasePart") and not toolState.original[p] then
            toolState.original[p] = {
                Color = p.Color,
                Material = p.Material,
                Transparency = p.LocalTransparencyModifier
            }
        end
    end
end

local function restoreToolColors()
    for part, data in pairs(toolState.original) do
        if part and part.Parent then
            part.Color = data.Color
            part.Material = data.Material
            part.LocalTransparencyModifier = data.Transparency
        end
    end
    toolState.original = {}
end

local function applyToolGhost(tool, color)
    for _, p in pairs(tool:GetDescendants()) do
        if p:IsA("BasePart") then
            p.LocalTransparencyModifier = 0.7
            p.Material = Enum.Material.ForceField
            p.Color = color
        end
    end
end


GunMods:CreateToggle({
    Name = "Weapon Effect",
    CurrentValue = false,
    Flag = "ToolGhostToggle",
    Callback = function(Value)
        toolState.active = Value
        local backpack = player:FindFirstChildOfClass("Backpack")
        local char = player.Character

        local function process(tool)
            if Value then
                saveToolColors(tool)
                applyToolGhost(tool, toolState.color)
            else
                restoreToolColors()
            end
        end

        if backpack then
            for _, tool in pairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then process(tool) end
            end
        end
        if char then
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") then process(tool) end
            end
        end
    end,
})


GunMods:CreateColorPicker({
    Name = "Weapon Effect Color",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "ToolGhostColor",
    Callback = function(Color)
        toolState.color = Color
    end,
})


task.spawn(function()
    while task.wait(0.1) do
        if toolState.active then
            local backpack = player:FindFirstChildOfClass("Backpack")
            local char = player.Character

            if backpack then
                for _, tool in pairs(backpack:GetChildren()) do
                    if tool:IsA("Tool") then
                        applyToolGhost(tool, toolState.color)
                    end
                end
            end
            if char then
                for _, tool in pairs(char:GetChildren()) do
                    if tool:IsA("Tool") then
                        applyToolGhost(tool, toolState.color)
                    end
                end
            end
        end
    end
end)


player.CharacterAdded:Connect(function(char)
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") and toolState.active then
            saveToolColors(child)
            applyToolGhost(child, toolState.color)
        end
    end)
end)






--------------------------------------------
---- Vehicle Mods
--------------------------------------------

VehicleMods:CreateSection("Vehicle - Mods")


local flightEnabled = false
local LP = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")
local flightSpeed = 1

------------------------------------------------------
-- TOGGLE & KEYBIND
------------------------------------------------------



local Toggle = VehicleMods:CreateToggle({
    Name = "Car Fly",
    CurrentValue = false,
    Flag = "CarFlyToggle",
    Callback = function(value)
        flightEnabled = value
    end,
})

local Keybind = VehicleMods:CreateKeybind({
    Name = "Car Fly Keybind",
    CurrentKeybind = "X",
    Flag = "CarFlyKeybind",
    Callback = function()
        flightEnabled = not flightEnabled
        Toggle:Set(flightEnabled)
    end,
})

------------------------------------------------------
-- FLIGHT MOVEMENT LOGIC
------------------------------------------------------

game:GetService("RunService").RenderStepped:Connect(function()
    if flightEnabled then
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            if LP.Character.Humanoid.Sit then
                local SeatPart = LP.Character.Humanoid.SeatPart
                if SeatPart and SeatPart.Name == "DriveSeat" then
                    local Vehicle = SeatPart.Parent
                    if Vehicle then
                        if not Vehicle.PrimaryPart then
                            Vehicle.PrimaryPart = SeatPart
                        end

                        local camLook = workspace.CurrentCamera.CFrame.LookVector
                        local ppCFrame = Vehicle:GetPrimaryPartCFrame()

                        Vehicle:SetPrimaryPartCFrame(
                            CFrame.new(ppCFrame.Position, ppCFrame.Position + camLook) *
                            CFrame.new(
                                ((UIS:IsKeyDown(Enum.KeyCode.D) and flightSpeed or 0) -
                                (UIS:IsKeyDown(Enum.KeyCode.A) and flightSpeed or 0)) * flightSpeed,
                                
                                ((UIS:IsKeyDown(Enum.KeyCode.E) and flightSpeed/2 or 0) -
                                (UIS:IsKeyDown(Enum.KeyCode.Q) and flightSpeed/2 or 0)) * flightSpeed,
                                
                                ((UIS:IsKeyDown(Enum.KeyCode.S) and flightSpeed or 0) -
                                (UIS:IsKeyDown(Enum.KeyCode.W) and flightSpeed or 0)) * flightSpeed
                            )
                        )

                        SeatPart.AssemblyLinearVelocity = Vector3.zero
                        SeatPart.AssemblyAngularVelocity = Vector3.zero
                    end
                end
            end
        end
    end
end)


local Divider = VehicleMods:CreateDivider()


-----------
---- Car Godmode
-----------



local player = game:GetService("Players").LocalPlayer
local RunService = game:GetService("RunService")
local vehicleGodMode = false
local lastVehicle = nil

------------------------------------------------------
-- RAYFIELD TOGGLE
------------------------------------------------------

local Toggle = VehicleMods:CreateToggle({
    Name = "Car GodMode",
    CurrentValue = false,
    Flag = "CarGod",
    Callback = function(state)
        vehicleGodMode = state

        if not vehicleGodMode then
            lastVehicle = nil
        end
    end,
})

------------------------------------------------------
-- PERFORMANCE SCHLEIFE
------------------------------------------------------

local function updateVehicle()
    if not vehicleGodMode then return end

    if not lastVehicle or not lastVehicle.Parent then
        local vehiclesFolder = workspace:FindFirstChild("Vehicles")
        if vehiclesFolder then
            lastVehicle = vehiclesFolder:FindFirstChild(player.Name)
        end
    end

    if lastVehicle then
        lastVehicle:SetAttribute("IsOn", true)
        lastVehicle:SetAttribute("currentHealth", 500)
        lastVehicle:SetAttribute("currentFuel", math.huge)
    end
end

RunService.Heartbeat:Connect(updateVehicle)









--------------------------------------------
---- Gun Mods
--------------------------------------------

Police:CreateSection("Police Autofarm")



local ReplicatedStorage = game:GetService("ReplicatedStorage")
local radarRemoteEvent = ReplicatedStorage:WaitForChild("8WX"):WaitForChild("35b3ffbf-8881-4eba-aaa2-6d0ce8f8bf8b")
local autoRadarToggle = false

local Toggle = Police:CreateToggle({
    Name = "Autoradar",
    CurrentValue = false,
    Flag = "AutoradarToggle",
    Callback = function(state)
        autoRadarToggle = state
    end,
})

-------------------------------------------------------
-- AUTORADAR LOOP
-------------------------------------------------------
task.spawn(function()
    while task.wait(0.75) do
        if autoRadarToggle then
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then continue end

            local radarGun = char:FindFirstChild("Radar Gun")
            if not radarGun then continue end

            for _, vehicle in pairs(workspace.Vehicles:GetChildren()) do
                local driveSeat = vehicle:FindFirstChild("DriveSeat")
                if driveSeat then
                    radarRemoteEvent:FireServer(
                        radarGun,
                        driveSeat.Position,
                        (driveSeat.Position - char.HumanoidRootPart.Position).Unit
                    )
                end
            end
        end
    end
end)




local antiAFKEnabled = false

local function startAntiAFK()
    player.Idled:Connect(function()
        if antiAFKEnabled then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end
    end)
end

startAntiAFK()


local Toggle = Police:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = false,
    Flag = "AntiAFK",
    Callback = function(Value)
        antiAFKEnabled = Value
    end,
})





---------------------------------------------------
-- Misc Tab
---------------------------------------------------
Misc:CreateSection("Misc Tools")


local antiTaser = false
local antiConnection = nil

Misc:CreateToggle({
    Name = "Anti Taser",
    CurrentValue = false,
    Flag = "AntiTaserToggle",
    Callback = function(state)
        antiTaser = state

        if state == true then
            -- AN
            local char = game.Players.LocalPlayer.Character

            -- sofort Tased entfernen
            if char:GetAttribute("Tased") ~= false then
                char:SetAttribute("Tased", false)
            end

            -- Listener starten
            if antiConnection then
                antiConnection:Disconnect()
                antiConnection = nil
            end

            antiConnection = char:GetAttributeChangedSignal("Tased"):Connect(function()
                if antiTaser then
                    char:SetAttribute("Tased", false)
                end
            end)

        else
            -- AUS
            if antiConnection then
                antiConnection:Disconnect()
                antiConnection = nil
            end
        end
    end,
})







local antiFallActive = false
local nofall
local LocalPlayer = game.Players.LocalPlayer
local RunService = game:GetService("RunService")

local function monitorFallDamage()
    if not nofall then
        nofall = RunService.RenderStepped:Connect(function()
            local char = LocalPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") or not char:FindFirstChild("Humanoid") then return end

            if char.Humanoid.Sit == false then
                local pos = char.HumanoidRootPart.Position
                local ray = workspace:Raycast(pos, Vector3.new(0, -20, 0))

                if ray and char.HumanoidRootPart.Velocity.Y < -30 then
                    char.HumanoidRootPart.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end)
    end
end

local function deactivateAntiFall()
    if nofall then
        nofall:Disconnect()
        nofall = nil
    end
end

Misc:CreateToggle({
    Name = "Anti Fall Damage",
    CurrentValue = false,
    Flag = "AntiFallToggle",
    Callback = function(state)
        antiFallActive = state

        if state then
            monitorFallDamage()
        else
            deactivateAntiFall()
        end
    end,
})



Misc:CreateButton({
    Name = "Safe Leave - (Dont work Cuffed, Near Police)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")

        hrp.CFrame = CFrame.new(-2160.823, 54.834, 3269.599)
        task.wait(1.5)
        player:Kick("[SOC2] - Safe Leave executed.")
    end
})


Misc:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        local PlaceID = game.PlaceId
        local Servers = Api .. PlaceID .. "/servers/Public?sortOrder=Desc&limit=100"
        local success, response = pcall(function()
            return Http:JSONDecode(game:HttpGet(Servers))
        end)
        if success and response and response.data then
            for _, v in ipairs(response.data) do
                if v.playing < v.maxPlayers then
                    TPS:TeleportToPlaceInstance(PlaceID, v.id, game.Players.LocalPlayer)
                    break
                end
            end
        end
    end
})


Misc:CreateButton({
    Name = "Character Reset",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character then
            player.Character:BreakJoints()
        end
    end
})





local Divider = Misc:CreateDivider()



Misc:CreateToggle({
    Name = "Anti Moderator",
    CurrentValue = false,
    Flag = "AntiMod",
    Callback = function(state)
        local groupId = 12563021
        local modRoles = {
            ["Tester"] = true,
            ["Contributor"] = true,
            ["Staff"] = true,
            ["Dev"] = true,
            ["Manager"] = true,
            ["Owner Erwin"] = true,
            ["Owner Felix"] = true
        }

        local player = game.Players.LocalPlayer
        local antiModConnection

        local function safeLeave(reason)
            local char = player.Character or player.CharacterAdded:Wait()
            local hrp = char:WaitForChild("HumanoidRootPart")
            hrp.CFrame = CFrame.new(-5343.867, 89.219, 1228.221)
            task.wait(1.5)
            player:Kick("[SOC2] - Moderator Detected: " .. reason)
        end

        local function checkMods()
            for _, plr in pairs(game.Players:GetPlayers()) do
                local role
                pcall(function()
                    role = plr:GetRoleInGroup(groupId)
                end)

                if role and modRoles[role] then
                    safeLeave("Role in Group (" .. role .. ")")
                    return
                end
            end
        end

        if state then
            Rayfield:Notify({
                Title = "Anti Mod Enabled",
                Content = "You will be kicked automatically if Admin Joins.",
                Duration = 3
            })

            
            checkMods()

            
            antiModConnection = game.Players.PlayerAdded:Connect(function(plr)
                task.wait(1)
                local role
                pcall(function()
                    role = plr:GetRoleInGroup(groupId)
                end)

                if role and modRoles[role] then
                    safeLeave("Role in Group (" .. role .. ")")
                end
            end)
        else
            if antiModConnection then
                antiModConnection:Disconnect()
                antiModConnection = nil
            end

            Rayfield:Notify({
                Title = "Anti Moderator Disabled",
                Content = "Moderator detection turned off.",
                Duration = 3
            })
        end
    end,
})



------------------
-- Teleports
-----------------

Teleports:CreateSection("Teleports")

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local VehiclesFolder = workspace:WaitForChild("Vehicles")


local Locations = {
	["Bank"] = CFrame.new(-1174.68, 5.87, 3209.03),
	["Safe Zone"] = CFrame.new(-54.173, -54.867, 3280.436),
	["Vehicle Garage"] = CFrame.new(-1436.22, 5.06, 154.26),
	["Jewelry"] = CFrame.new(-422.342, 5.223, 3519.932),
	["Car Dealership"] = CFrame.new(-1454.02, 5.615, 940.83),
	["Hospital"] = CFrame.new(-293.16, 5.627, 1053.98),
	["Prison"] = CFrame.new(-514.34, 5.615, 2795.94),
	["Police Station"] = CFrame.new(-1658.55, 5.619, 2735.71),

	["Tool Shop"] = CFrame.new(-717.23, 5.654, 729.08),
	["Farm Shop"] = CFrame.new(-911.50, 5.371, -1169.20),
	["Clothing Store"] = CFrame.new(479.05, 3.158, -1452.59),

	["Ares Fuel"] = CFrame.new(-870.86, 5.622, 1505.16),
	["Gas n Go Fuel"] = CFrame.new(-1544.4, 5.619, 3802.16),
	["Ossu Fuel"] = CFrame.new(-27.55, 5.622, -754.6),

	["Night Club"] = CFrame.new(-1844.95, 5.872, 3211.08),
	["Fire Station"] = CFrame.new(-963.32, 5.865, 3895.37),
	["Bus Company"] = CFrame.new(-1695.80, 5.882, -1274.29),
	["Truck Company"] = CFrame.new(652.55, 5.638, 1510.85)
}

---------------------------------------------------------
-- TWEEN TELEPORT
---------------------------------------------------------

local function tweenTo(destination)
	local player = LocalPlayer
	local car = VehiclesFolder:FindFirstChild(player.Name)
	if not car then return Rayfield:Notify("Error", "Spawn your vehicle first!", 5) end

	car.PrimaryPart = car:FindFirstChild("DriveSeat", true)
	car.DriveSeat:Sit(player.Character.Humanoid)

	if typeof(destination) == "CFrame" then destination = destination.Position end

	local start = car.PrimaryPart.Position
	local highStart = start + Vector3.new(0, -5, 0)
	local highDest = destination + Vector3.new(0, -5, 0)

	local function moveTo(pos)
		local distance = (car.PrimaryPart.Position - pos).Magnitude
		local duration = distance / 175
		local TI = TweenInfo.new(duration, Enum.EasingStyle.Linear)

		local CVal = Instance.new("CFrameValue")
		CVal.Value = car:GetPivot()

		CVal.Changed:Connect(function(cf)
			car:PivotTo(cf)
			car.DriveSeat.AssemblyLinearVelocity = Vector3.new(0,0,0)
			car.DriveSeat.AssemblyAngularVelocity = Vector3.new(0,0,0)
		end)

		local tween = TweenService:Create(CVal, TI, {Value = CFrame.new(pos)})
		tween:Play()
		tween.Completed:Wait()
		CVal:Destroy()
	end

	moveTo(highStart)
	moveTo(highDest)
	moveTo(destination)
end

---------------------------------------------------------
-- TELEPORT TO NEAREST DEALER
---------------------------------------------------------

local function teleportToNearestDealer()
	local char = LocalPlayer.Character
	if not char or not char.PrimaryPart then return end

	local vehicle = VehiclesFolder:FindFirstChild(LocalPlayer.Name)
	if not vehicle then
		return Rayfield:Notify("Error", "Spawn your vehicle first!", 5)
	end

	local closest = nil
	local dist = math.huge

	for _, dealer in pairs(workspace.Dealers:GetChildren()) do
		if dealer:IsA("Model") and dealer.PrimaryPart then
			local d = (char.PrimaryPart.Position - dealer.PrimaryPart.Position).Magnitude
			if d < dist then
				dist = d
				closest = dealer
			end
		end
	end

	if closest then
		local pos = closest.PrimaryPart.Position
		local cf = closest.PrimaryPart.CFrame
		local newCFrame = CFrame.new(pos - cf.LookVector * -10, pos)
		tweenTo(newCFrame)
	end
end

---------------------------------------------------------
-- UI BUTTONS (ALLE OHNE SECTIONS)
---------------------------------------------------------

for name, cframe in pairs(Locations) do
	Teleports:CreateButton({
		Name = name,
		Callback = function()
			tweenTo(cframe)
		end
	})
end

Teleports:CreateButton({
	Name = "Nearest Dealer",
	Callback = function()
		teleportToNearestDealer()
	end
})
