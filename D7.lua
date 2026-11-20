-- RED SYSTEM SCRIPT (ULTIMATE & COMPLETE EDITION)
-- Developer: VIP_198769
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

local themeColor = Color3.fromRGB(230, 0, 50) -- Red Theme

-- Variables
local Character, Humanoid, RootPart
local isGodMode, isNoclipping, isESP, isInfJump = false, false, false, false
local isFloat, isFlying = false, false
local floatBodyPos = nil
local isInvisible = false
local flySpeed = 50

local function updateChar()
    Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    Humanoid = Character:WaitForChild("Humanoid")
    RootPart = Character:WaitForChild("HumanoidRootPart")
end
updateChar()
LocalPlayer.CharacterAdded:Connect(updateChar)

-- Anti-AFK Protection (ظ…ظ†ط¹ ط§ظ„ط·ط±ط¯ ط¹ظ†ط¯ طھط±ظƒ ط§ظ„ظ„ط¹ط¨ط©)
pcall(function()
    local vu = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)
end)

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RedSystemMenu"
ScreenGui.ResetOnSpawn = false 

local coreGui = game:GetService("CoreGui")
local playerGui = LocalPlayer:WaitForChild("PlayerGui")

pcall(function()
    if gethui then
        ScreenGui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(ScreenGui)
        ScreenGui.Parent = playerGui
    else
        ScreenGui.Parent = coreGui
    end
end)

if not ScreenGui.Parent then
    ScreenGui.Parent = playerGui
end

-- Sounds Setup
local OpenSound = Instance.new("Sound")
OpenSound.SoundId = "rbxassetid://9114223176"
OpenSound.Volume = 1
OpenSound.Parent = ScreenGui

local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://6895079853"
ClickSound.Volume = 1
ClickSound.Parent = ScreenGui

-- Loading Screen (ط´ط§ط´ط© ط§ظ„طھط­ظ…ظٹظ„ ط§ظ„ط´ظپط§ظپط©)
local LoadingFrame = Instance.new("Frame", ScreenGui)
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.Position = UDim2.new(0, 0, 0, 0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoadingFrame.BackgroundTransparency = 0.6
LoadingFrame.ZIndex = 100

local LoadingText = Instance.new("TextLabel", LoadingFrame)
LoadingText.Size = UDim2.new(1, 0, 1, 0)
LoadingText.BackgroundTransparency = 1
LoadingText.Text = "ط§ظ„ط³ظƒط±ط¨طھ ظ‚ظٹط¯ ط§ظ„طھط­ظ…ظٹظ„ ظٹط±ط¬ظ‰ ط§ظ„ط§ظ†طھط¸ط§ط±..."
LoadingText.TextColor3 = themeColor
LoadingText.Font = Enum.Font.SourceSansBold
LoadingText.TextSize = 26
LoadingText.ZIndex = 101

local LoadingStroke = Instance.new("UIStroke", LoadingText)
LoadingStroke.Thickness = 1.5
LoadingStroke.Color = Color3.fromRGB(255, 255, 255)

-- Floating Button (ط²ط± Ninja ط§ظ„ط¹ط§ط¦ظ…)
local CircleBtn = Instance.new("ImageButton", ScreenGui)
CircleBtn.Size = UDim2.new(0, 50, 0, 50)
CircleBtn.Position = UDim2.new(0.90, 0, 0.45, 0)
CircleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
CircleBtn.Image = "rbxthumb://type=Asset&id=605195007&w=420&h=420"
CircleBtn.BorderSizePixel = 0
CircleBtn.Active = true
CircleBtn.Draggable = true
Instance.new("UICorner", CircleBtn).CornerRadius = UDim.new(0, 10)

local BtnStroke = Instance.new("UIStroke", CircleBtn)
BtnStroke.Thickness = 2
BtnStroke.Color = themeColor

-- Main Frame (ط­ط¬ظ… ظƒط¨ظٹط± ظˆظ…ظ†ط³ظ‚)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 560, 0, 350)
MainFrame.Position = UDim2.new(0.5, -280, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 16)
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = false
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 8)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Thickness = 2
MainStroke.Color = themeColor

-- Pattern Overlay (ط®ظ„ظپظٹط© ط§ظ„ط®ط·ظˆط· ط§ظ„ظ…ط®ط·ط·ط©)
local PatternOverlay = Instance.new("ImageLabel", MainFrame)
PatternOverlay.Size = UDim2.new(1, 0, 1, 0)
PatternOverlay.Position = UDim2.new(0, 0, 0, 0)
PatternOverlay.BackgroundTransparency = 1
PatternOverlay.Image = "rbxassetid://17259634045"
PatternOverlay.ScaleType = Enum.ScaleType.Tile
PatternOverlay.TileSize = UDim2.new(0, 45, 0, 45)
PatternOverlay.ImageTransparency = 0.8
PatternOverlay.ZIndex = 1
Instance.new("UICorner", PatternOverlay).CornerRadius = UDim.new(0, 8)

-- Top Icon Head (طµظˆط±ط© The Ruler Face ط§ظ„ط¹ظ„ظˆظٹط©)
local TopFaceIcon = Instance.new("ImageLabel", MainFrame)
TopFaceIcon.Size = UDim2.new(0, 80, 0, 80)
TopFaceIcon.Position = UDim2.new(0, 6, 0, -45)
TopFaceIcon.BackgroundTransparency = 1
TopFaceIcon.Image = "rbxthumb://type=Asset&id=71393529972684&w=420&h=420"
TopFaceIcon.ZIndex = 10

-- Header Bar
local HeaderBar = Instance.new("Frame", MainFrame)
HeaderBar.Size = UDim2.new(1, 0, 0, 36)
HeaderBar.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
HeaderBar.BorderSizePixel = 0
HeaderBar.ZIndex = 2

local HeaderTitle = Instance.new("TextLabel", HeaderBar)
HeaderTitle.Size = UDim2.new(1, 0, 1, 0)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Text = "RED SYSTEM: The Mercy Script"
HeaderTitle.TextColor3 = themeColor
HeaderTitle.Font = Enum.Font.SourceSansBold
HeaderTitle.TextSize = 20
HeaderTitle.ZIndex = 3

-- Sidebar Tabs
local TabContainer = Instance.new("Frame", MainFrame)
TabContainer.Size = UDim2.new(0, 140, 1, -36)
TabContainer.Position = UDim2.new(0, 4, 0, 36)
TabContainer.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
TabContainer.BorderSizePixel = 0
TabContainer.ZIndex = 2

local TabList = Instance.new("UIListLayout", TabContainer)
TabList.SortOrder = Enum.SortOrder.LayoutOrder
TabList.Padding = UDim.new(0, 3)

-- Content Area
local ContentArea = Instance.new("Frame", MainFrame)
ContentArea.Size = UDim2.new(1, -150, 1, -36)
ContentArea.Position = UDim2.new(0, 146, 0, 36)
ContentArea.BackgroundTransparency = 1
ContentArea.ZIndex = 2

local Frames = {
    Home = Instance.new("ScrollingFrame", ContentArea),
    Hacks = Instance.new("ScrollingFrame", ContentArea),
    Scripts = Instance.new("ScrollingFrame", ContentArea),
    World = Instance.new("ScrollingFrame", ContentArea),
    Players = Instance.new("ScrollingFrame", ContentArea),
    Toys = Instance.new("ScrollingFrame", ContentArea),
    Anims = Instance.new("ScrollingFrame", ContentArea)
}

for _, f in pairs(Frames) do 
    f.Size = UDim2.new(1, 0, 1, 0)
    f.BackgroundTransparency = 1
    f.CanvasSize = UDim2.new(0, 0, 2.2, 0)
    f.Visible = false 
    f.ScrollBarThickness = 3
    f.ZIndex = 3
end
Frames.Home.Visible = true

local tabOrder = {"Home", "Hacks", "Scripts", "World", "Players", "Toys", "Anims"}
local tabNames = {
    Home = "Home | ط§ظ„ط±ط¦ظٹط³ظٹط©",
    Hacks = "Game | ط§ظ„طھط®ط±ظٹط¨",
    Scripts = "Character | ط§ظ„ظ„ط§ط¹ط¨",
    World = "World | ط§ظ„ط¹ط§ظ„ظ…",
    Players = "Target | ط§ط³طھظ‡ط¯ط§ظپ",
    Toys = "Toys | ط£ظ„ط¹ط§ط¨",
    Anims = "Anims | ط§ظ†ظ…ظٹط´ظ†ط§طھ"
}

for i, nameKey in ipairs(tabOrder) do
    local btn = Instance.new("TextButton", TabContainer)
    btn.Size = UDim2.new(1, -4, 0, 34)
    btn.Position = UDim2.new(0, 2, 0, 0)
    btn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    btn.Text = tabNames[nameKey]
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 12
    btn.LayoutOrder = i
    btn.BorderSizePixel = 0
    btn.ZIndex = 3

    btn.MouseButton1Click:Connect(function()
        pcall(function() ClickSound:Play() end)
        for _, f in pairs(Frames) do f.Visible = false end
        Frames[nameKey].Visible = true
    end)
end

local function createGridBtn(parent, text, gridPos, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.48, 0, 0, 34)
    btn.Position = gridPos
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = text
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 12
    btn.BorderSizePixel = 0
    btn.ZIndex = 4

    local btnStroke = Instance.new("UIStroke", btn)
    btnStroke.Thickness = 1
    btnStroke.Color = themeColor

    btn.MouseButton1Click:Connect(function() 
        pcall(function() ClickSound:Play() end)
        callback(btn) 
    end)
end

-- ==================== HOME TAB ====================
local profileBox = Instance.new("Frame", Frames.Home)
profileBox.Size = UDim2.new(0.96, 0, 0, 80)
profileBox.Position = UDim2.new(0.02, 0, 0.01, 0)
profileBox.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
profileBox.BorderSizePixel = 0
profileBox.ZIndex = 3
Instance.new("UICorner", profileBox).CornerRadius = UDim.new(0, 6)

local profStroke = Instance.new("UIStroke", profileBox)
profStroke.Thickness = 1
profStroke.Color = themeColor

local avatarImg = Instance.new("ImageLabel", profileBox)
avatarImg.Size = UDim2.new(0, 56, 0, 56)
avatarImg.Position = UDim2.new(0, 8, 0.5, -28)
avatarImg.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
avatarImg.BorderSizePixel = 0
avatarImg.ZIndex = 4
Instance.new("UICorner", avatarImg).CornerRadius = UDim.new(0, 6)

pcall(function()
    local content = Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
    avatarImg.Image = content
end)

local userLabel = Instance.new("TextLabel", profileBox)
userLabel.Size = UDim2.new(0, 220, 0, 20)
userLabel.Position = UDim2.new(0, 72, 0, 10)
userLabel.BackgroundTransparency = 1
userLabel.Text = "طµط¨ط§ط­ ط§ظ„ظ†ظˆط±طŒ @" .. LocalPlayer.Name
userLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
userLabel.Font = Enum.Font.SourceSansBold
userLabel.TextSize = 14
userLabel.TextXAlignment = Enum.TextXAlignment.Right
userLabel.ZIndex = 4

local subBadge = Instance.new("TextLabel", profileBox)
subBadge.Size = UDim2.new(0, 120, 0, 22)
subBadge.Position = UDim2.new(0.52, 0, 0.52, 0)
subBadge.BackgroundColor3 = Color3.fromRGB(45, 15, 20)
subBadge.Text = "ط§ظ„ط§ط´طھط±ط§ظƒ : V.I.P"
subBadge.TextColor3 = themeColor
subBadge.Font = Enum.Font.SourceSansBold
subBadge.TextSize = 12
subBadge.ZIndex = 4
Instance.new("UICorner", subBadge).CornerRadius = UDim.new(0, 4)

local statsFrame = Instance.new("Frame", Frames.Home)
statsFrame.Size = UDim2.new(0.96, 0, 0, 20)
statsFrame.Position = UDim2.new(0.02, 0, 0.22, 0)
statsFrame.BackgroundTransparency = 1
statsFrame.ZIndex = 3

local statsLabel = Instance.new("TextLabel", statsFrame)
statsLabel.Size = UDim2.new(1, 0, 1, 0)
statsLabel.BackgroundTransparency = 1
statsLabel.Text = "ط§ظ„ظ„ط§ط¹ط¨ظٹظ†: " .. #Players:GetPlayers() .. "      ط§ظ„ظ…ط³طھط®ط¯ظ…ظٹظ†: 904      ط§ظ„ظ…ط´طھط±ظƒظٹظ†: 68"
statsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statsLabel.Font = Enum.Font.SourceSansBold
statsLabel.TextSize = 11
statsLabel.ZIndex = 4

-- طµظˆط±ط© ط§ظ„ظ…ط·ظˆط± ط§ظ„ط¯ط§ط¦ط±ظٹط©
local ownerCircle = Instance.new("ImageLabel", Frames.Home)
ownerCircle.Size = UDim2.new(0, 60, 0, 60)
ownerCircle.Position = UDim2.new(0.5, -30, 0.28, 0)
ownerCircle.BackgroundColor3 = Color3.fromRGB(20, 20, 26)
ownerCircle.Image = "rbxassetid://14804485271"
ownerCircle.BorderSizePixel = 0
ownerCircle.ZIndex = 4
Instance.new("UICorner", ownerCircle).CornerRadius = UDim.new(1, 0)

local ownerCircleStroke = Instance.new("UIStroke", ownerCircle)
ownerCircleStroke.Thickness = 2
ownerCircleStroke.Color = themeColor

local ownerLabel = Instance.new("TextLabel", Frames.Home)
ownerLabel.Size = UDim2.new(1, 0, 0, 18)
ownerLabel.Position = UDim2.new(0, 0, 0.43, 0)
ownerLabel.BackgroundTransparency = 1
ownerLabel.Text = "طµط§ط­ط¨ ط§ظ„ط³ظƒط±ط¨طھ: " .. LocalPlayer.Name
ownerLabel.TextColor3 = themeColor
ownerLabel.Font = Enum.Font.SourceSansBold
ownerLabel.TextSize = 13
ownerLabel.ZIndex = 4

-- ظˆطµظپ ط§ظ„ط³ظƒط±ط¨طھ ط§ظ„ط´ط§ظ…ظ„
local descFrame = Instance.new("Frame", Frames.Home)
descFrame.Size = UDim2.new(0.96, 0, 0, 160)
descFrame.Position = UDim2.new(0.02, 0, 0.49, 0)
descFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
descFrame.BorderSizePixel = 0
descFrame.ZIndex = 3
Instance.new("UICorner", descFrame).CornerRadius = UDim.new(0, 6)

local descStroke = Instance.new("UIStroke", descFrame)
descStroke.Thickness = 1
descStroke.Color = themeColor

local descText = Instance.new("TextLabel", descFrame)
descText.Size = UDim2.new(0.96, 0, 0.94, 0)
descText.Position = UDim2.new(0.02, 0, 0.03, 0)
descText.BackgroundTransparency = 1
descText.TextYAlignment = Enum.TextYAlignment.Top
descText.TextXAlignment = Enum.TextXAlignment.Right
descText.TextWrapped = true
descText.TextColor3 = Color3.fromRGB(240, 240, 240)
descText.Font = Enum.Font.SourceSans
descText.TextSize = 12
descText.ZIndex = 4
descText.Text = [[ًں”´ dark system ًں”´
ًں”¥ ط£ظ‚ظˆظ‰ ظˆط£ط®ظپ ط³ظƒط±ط¨طھ ط¨ظ…ظ…ظٹط²ط§طھ ط®ط±ط§ظپظٹط© ظˆط§ط­طھط±ط§ظپظٹط© ط¨ط§ظ„ظƒط§ظ…ظ„!

âœ¨ ط§ظ„ظ…ظ…ظٹط²ط§طھ:
â€¢ ط·ظٹط±ط§ظ† ط¹ظ„ظ‰ ط§ظ„ظ‡ظˆط§ط، (Float) ظ…ط¹ ط¥ظ…ظƒط§ظ†ظٹط© ط§ظ„ظ‚ظپط².
â€¢ ط§ط®طھظپط§ط، ظƒط§ظ…ظ„ (Invisible) ط¹ظ† ط¨ط§ظ‚ظٹ ط§ظ„ظ„ط§ط¹ط¨ظٹظ†.
â€¢ ظپطھط­ ط§ظ„ظ‚ط§ط¦ظ…ط© ط¨ط¶ط؛ط·ط© ظˆط§ط­ط¯ط© ط³ط±ظٹط¹ط© ظ…ط¹ ظ…ط¤ط«ط±ط§طھ طµظˆطھظٹط©.
â€¢ ظƒط´ظپ ط§ظ„ظ„ط§ط¹ط¨ظٹظ† (ESP) ظˆظˆط¶ط¹ ط§ظ„ط®ظ„ظˆط¯ (God Mode) ظˆط§ط®طھط±ط§ظ‚ ط§ظ„ط¬ط¯ط±ط§ظ† (Noclip).
â€¢ ط§ظ„طھط­ظƒظ… ط¨ط§ظ„ط³ط±ط¹ط© ظˆط§ظ„ظ†ط· ظˆط§ظ†طھظ‚ط§ظ„ ظپظˆط±ظٹ (TP).]]

-- ==================== HACKS TAB ====================
createGridBtn(Frames.Hacks, "God Mode: OFF", UDim2.new(0.01, 0, 0.02, 0), function(b) 
    isGodMode = not isGodMode
    if isGodMode then
        b.Text = "God Mode: ON"
        if Humanoid then Humanoid.MaxHealth = math.huge; Humanoid.Health = math.huge end
    else
        b.Text = "God Mode: OFF"
        if Humanoid then Humanoid.MaxHealth = 100; Humanoid.Health = 100 end
    end
end)

createGridBtn(Frames.Hacks, "ط§ط®طھط±ط§ظ‚ ط¬ط¯ط±ط§ظ†", UDim2.new(0.51, 0, 0.02, 0), function(b) 
    isNoclipping = not isNoclipping
    b.Text = isNoclipping and "ط§ط®طھط±ط§ظ‚: ظ…ظپط¹ظ„" or "ط§ط®طھط±ط§ظ‚ ط¬ط¯ط±ط§ظ†"
end)

createGridBtn(Frames.Hacks, "ظƒط´ظپ ط§ظ„ظ„ط§ط¹ط¨ظٹظ† (ESP)", UDim2.new(0.01, 0, 0.16, 0), function(b) 
    isESP = not isESP; b.Text = isESP and "ESP: ظ…ظپط¹ظ„" or "ظƒط´ظپ ط§ظ„ظ„ط§ط¹ط¨ظٹظ† (ESP)"
    if not isESP then 
        for _, p in pairs(Players:GetPlayers()) do 
            if p.Character and p.Character:FindFirstChild("ESPHighlight") then p.Character.ESPHighlight:Destroy() end 
            if p.Character and p.Character:FindFirstChild("ESPNameTag") then p.Character.ESPNameTag:Destroy() end
        end 
    end
end)

createGridBtn(Frames.Hacks, "Invisible: OFF", UDim2.new(0.51, 0, 0.16, 0), function(b)
    isInvisible = not isInvisible
    b.Text = isInvisible and "Invisible: ON" or "Invisible: OFF"
    if Character then
        for _, p in pairs(Character:GetDescendants()) do
            if p:IsA("BasePart") or p:IsA("Decal") then
                if p.Name ~= "HumanoidRootPart" then
                    p.Transparency = isInvisible and 0.6 or 0
                end
            end
        end
    end
end)

-- ==================== SCRIPTS TAB ====================
createGridBtn(Frames.Scripts, "Homelander", UDim2.new(0.01, 0, 0.02, 0), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/giobolqv1/homelander-by-GioBolqv1-/refs/heads/main/homelander.lua"))()
end)

createGridBtn(Frames.Scripts, "Kick Fling", UDim2.new(0.51, 0, 0.02, 0), function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-kick-fling-177615"))()
end)

createGridBtn(Frames.Scripts, "ط·ظٹط±ط§ظ† (Fly)", UDim2.new(0.01, 0, 0.16, 0), function(b)
    isFlying = not isFlying
    b.Text = isFlying and "ط·ظٹط±ط§ظ†: ظ…ظپط¹ظ„" or "ط·ظٹط±ط§ظ† (Fly)"
    local bv, bg
    if isFlying and RootPart then
        bv = Instance.new("BodyVelocity", RootPart)
        bv.Name = "FlyVelocity"
        bv.MaxForce = Vector3.new(1e5, 1e5, 1e5)
        bg = Instance.new("BodyGyro", RootPart)
        bg.Name = "FlyGyro"
        bg.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
        
        task.spawn(function()
            while isFlying and RootPart do
                local camCF = workspace.CurrentCamera.CFrame
                bv.Velocity = camCF.LookVector * flySpeed
                bg.CFrame = camCF
                task.wait()
            end
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
        end)
    end
end)

-- ==================== WORLD TAB ====================
createGridBtn(Frames.World, "طھط؛ظٹظٹط± ط§ظ„ط¬ط§ط°ط¨ظٹط©", UDim2.new(0.01, 0, 0.02, 0), function() workspace.Gravity = (workspace.Gravity == 196) and 50 or 196 end)
createGridBtn(Frames.World, "طھط­ظˆظٹظ„ ظ„ظ„ظٹظ„", UDim2.new(0.51, 0, 0.02, 0), function() Lighting.ClockTime = 0 end)
createGridBtn(Frames.World, "ط¥ط¹ط§ط¯ط© ط¯ط®ظˆظ„ (Rejoin)", UDim2.new(0.01, 0, 0.16, 0), function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end)
createGridBtn(Frames.World, "ط³ظٹط±ظپط± ط¬ط¯ظٹط¯ (Server Hop)", UDim2.new(0.51, 0, 0.16, 0), function() TeleportService:Teleport(game.PlaceId, LocalPlayer) end)

-- ==================== PLAYERS TAB ====================
local function refreshPlayers()
    for _, child in pairs(Frames.Players:GetChildren()) do if child:IsA("TextButton") then child:Destroy() end end
    local count = 0
    for i, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            local posX = (count % 2 == 0) and 0.01 or 0.51
            local posY = math.floor(count / 2) * 0.16 + 0.02
            createGridBtn(Frames.Players, "TP: " .. p.Name, UDim2.new(posX, 0, posY, 0), function() if RootPart and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then RootPart.CFrame = p.Character.HumanoidRootPart.CFrame end end)
            count = count + 1
        end
    end
end
refreshPlayers(); Players.PlayerAdded:Connect(refreshPlayers); Players.PlayerRemoving:Connect(refreshPlayers)

-- ==================== TOYS TAB ====================
local speedBox = Instance.new("TextBox", Frames.Toys)
speedBox.Size = UDim2.new(0.48, 0, 0, 34)
speedBox.Position = UDim2.new(0.51, 0, 0.02, 0)
speedBox.PlaceholderText = "ط§ظ„ط³ط±ط¹ط© [1-999]"
speedBox.BackgroundColor3 = Color3.fromRGB(30,30,35)
speedBox.TextColor3 = Color3.new(1,1,1)
speedBox.BorderSizePixel = 0
speedBox.ZIndex = 4

createGridBtn(Frames.Toys, "طھظپط¹ظٹظ„ ط§ظ„ط³ط±ط¹ط©", UDim2.new(0.01, 0, 0.02, 0), function() 
    if Humanoid then Humanoid.WalkSpeed = tonumber(speedBox.Text) or 16 end 
end)

local jumpBox = Instance.new("TextBox", Frames.Toys)
jumpBox.Size = UDim2.new(0.48, 0, 0, 34)
jumpBox.Position = UDim2.new(0.51, 0, 0.16, 0)
jumpBox.PlaceholderText = "ط§ظ„ظ†ط· [1-999]"
jumpBox.BackgroundColor3 = Color3.fromRGB(30,30,35)
jumpBox.TextColor3 = Color3.new(1,1,1)
jumpBox.BorderSizePixel = 0
jumpBox.ZIndex = 4

createGridBtn(Frames.Toys, "طھظپط¹ظٹظ„ ط§ظ„ظ†ط·", UDim2.new(0.01, 0, 0.16, 0), function() 
    if Humanoid then 
        Humanoid.UseJumpPower = true
        Humanoid.JumpPower = tonumber(jumpBox.Text) or 50 
    end 
end)

createGridBtn(Frames.Toys, "Inf Jump: OFF", UDim2.new(0.01, 0, 0.30, 0), function(b) 
    isInfJump = not isInfJump
    b.Text = isInfJump and "Inf Jump: ON" or "Inf Jump: OFF" 
end)

createGridBtn(Frames.Toys, "Float: OFF", UDim2.new(0.51, 0, 0.30, 0), function(b)
    isFloat = not isFloat
    b.Text = isFloat and "Float: ON" or "Float: OFF"
    
    if isFloat then
        if RootPart then
            floatBodyPos = Instance.new("BodyPosition")
            floatBodyPos.Name = "FloatPosition"
            floatBodyPos.MaxForce = Vector3.new(0, 500000, 0)
            floatBodyPos.Position = RootPart.Position
            floatBodyPos.Parent = RootPart
        end
    else
        if floatBodyPos then floatBodyPos:Destroy(); floatBodyPos = nil end
    end
end)

-- ==================== EVENTS & INITIALIZATION ====================
task.spawn(function()
    pcall(function() OpenSound:Play() end)
    task.wait(2)
    LoadingFrame:Destroy()
    MainFrame.Visible = true
end)

CircleBtn.MouseButton1Click:Connect(function()
    pcall(function() OpenSound:Play() end)
    MainFrame.Visible = not MainFrame.Visible
end)

-- ط§ظ„ط§ط®طھطµط§ط± ط§ظ„ط³ط±ظٹط¹ ظ„ظ„ظƒظٹط¨ظˆط±ط¯ (ط²ط± K ظ„ط¥ط®ظپط§ط،/ط¥ط¸ظ‡ط§ط± ط§ظ„ظ‚ط§ط¦ظ…ط©)
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Enum.KeyCode.K then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

UserInputService.JumpRequest:Connect(function() 
    if isInfJump and Humanoid then 
        Humanoid:ChangeState("Jumping") 
    end
    if isFloat and floatBodyPos and Humanoid then
        local jumpHeight = Humanoid.JumpPower > 0 and (Humanoid.JumpPower / 3.5) or 15
        floatBodyPos.Position = floatBodyPos.Position + Vector3.new(0, jumpHeight, 0)
    end
end)

RunService.Stepped:Connect(function()
    if isGodMode and Humanoid then
        Humanoid.MaxHealth = math.huge
        Humanoid.Health = math.huge
    end
    if isNoclipping and Character then 
        for _, p in pairs(Character:GetChildren()) do 
            if p:IsA("BasePart") then p.CanCollide = false end 
        end 
    end
    if isESP then
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                if not p.Character:FindFirstChild("ESPHighlight") then
                    local h = Instance.new("Highlight", p.Character)
                    h.Name = "ESPHighlight"
                    h.FillColor = Color3.fromRGB(255, 0, 0)
                end
            end
        end
    end
end)
