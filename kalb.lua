local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")
local SafeParent = (pcall(function() return gethui() end) and gethui()) or PlayerGui
if SafeParent:FindFirstChild("Venzz hub") then
    SafeParent.Venzz_hub:Destroy()
end
local Theme = {
    Background = Color3.fromRGB(5, 5, 8),
    Surface = Color3.fromRGB(15, 15, 20),
    SurfaceLight = Color3.fromRGB(25, 25, 35),
    Accent = Color3.fromRGB(0, 120, 255),
    Text = Color3.fromRGB(255, 255, 255),
    TextDim = Color3.fromRGB(150, 150, 150),
    Success = Color3.fromRGB(0, 120, 255)
}
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Venzz_hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = SafeParent
local toggleBtn = Instance.new("ImageButton", ScreenGui)
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0, 15, 0, 150)
toggleBtn.BackgroundColor3 = Theme.Surface
toggleBtn.Image = "rbxthumb://type=Asset&id=138219378827944&w=150&h=150"
toggleBtn.Draggable = true
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0.5, 0)
local btnStroke = Instance.new("UIStroke", toggleBtn)
btnStroke.Thickness = 2
btnStroke.Color = Theme.Accent
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 310, 0, 300)
Main.Position = UDim2.new(0.5, -155, 0.5, -210)
Main.BackgroundColor3 = Theme.Background
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 12)
local TopBar = Instance.new("Frame", Main)
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Theme.Surface
TopBar.BorderSizePixel = 0
local Logo = Instance.new("ImageLabel", TopBar)
Logo.Size = UDim2.new(0, 36, 0, 36)
Logo.Position = UDim2.new(0, 10, 0.5, -18)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxthumb://type=Asset&id=138219378827944&w=150&h=150"
Instance.new("UICorner", Logo).CornerRadius = UDim.new(0.2, 0)
local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0, 160, 0, 22)
Title.Position = UDim2.new(0, 52, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "                                         V1 beta "
Title.TextColor3 = Theme.Text
Title.TextSize = 10
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(0, 160, 0, 22)
Title.Position = UDim2.new(0, 52, 0, 5)
Title.BackgroundTransparency = 1
Title.Text = "Venzz HUB"
Title.TextColor3 = Theme.Text
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
local Subtitle = Instance.new("TextLabel", TopBar)
Subtitle.Size = UDim2.new(0, 160, 0, 16)
Subtitle.Position = UDim2.new(0, 52, 0, 26)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Kick a Lucky Block"
Subtitle.TextColor3 = Theme.Accent
Subtitle.TextSize = 10
Subtitle.Font = Enum.Font.GothamSemibold
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
local TabContainer = Instance.new("Frame", Main)
TabContainer.Size = UDim2.new(1, -16, 0, 36)
TabContainer.Position = UDim2.new(0, 8, 0, 56)
TabContainer.BackgroundColor3 = Theme.Surface
Instance.new("UICorner", TabContainer).CornerRadius = UDim.new(0, 8)
local TabLayout = Instance.new("UIListLayout", TabContainer)
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabLayout.Padding = UDim.new(0, 3)
local Content = Instance.new("Frame", Main)
Content.Size = UDim2.new(1, -16, 1, -110)
Content.Position = UDim2.new(0, 8, 0, 98)
Content.BackgroundColor3 = Theme.Surface
Content.ClipsDescendants = true
Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 10)
local Tabs = {}
local function CreateTab(name)
    local Btn = Instance.new("TextButton", TabContainer)
    Btn.Size = UDim2.new(0, 42, 0, 28)
    Btn.BackgroundColor3 = Theme.SurfaceLight
    Btn.Text = name
    Btn.TextColor3 = Theme.TextDim
    Btn.TextSize = 9
    Btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 6)
    local Page = Instance.new("ScrollingFrame", Content)
    Page.Name = name .. "Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.ScrollBarThickness = 2
    Page.ScrollBarImageColor3 = Theme.Accent
    Page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    Page.Visible = false
    local PL = Instance.new("UIListLayout", Page)
    PL.Padding = UDim.new(0, 10)
    PL.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Instance.new("UIPadding", Page).PaddingTop = UDim.new(0, 12)
    Instance.new("UIPadding", Page).PaddingBottom = UDim.new(0, 12)
    table.insert(Tabs, {Btn = Btn, Page = Page})
    Btn.MouseButton1Click:Connect(function()
        for _, t in pairs(Tabs) do
            t.Page.Visible = false
            TweenService:Create(t.Btn, TweenInfo.new(0.2), {BackgroundColor3 = Theme.SurfaceLight, TextColor3 = Theme.TextDim}):Play()
        end
        Page.Visible = true
        TweenService:Create(Btn, TweenInfo.new(0.2), {BackgroundColor3 = Theme.Accent, TextColor3 = Color3.new(0,0,0)}):Play()
    end)
    return Page
end
local MainTab = CreateTab("Main")
local CollectTab = CreateTab("Collect")
local UpGTab = CreateTab("UpG")
local BuyTab = CreateTab("Buy")
local SellTab = CreateTab("Sell")
local DetailsTab = CreateTab("Info")
local UpdateTab = CreateTab("Update")
local function CreateButton(parent, text, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 260, 0, 32)
    btn.BackgroundColor3 = Theme.SurfaceLight
    btn.Text = text
    btn.TextColor3 = Theme.Text
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
    btn.MouseButton1Click:Connect(callback)
end
local function CreateToggle(parent, text, callback)
    local frame = Instance.new("Frame", parent)
    frame.Size = UDim2.new(0, 260, 0, 32)
    frame.BackgroundColor3 = Theme.SurfaceLight
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 10, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Theme.Text
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    local tBtn = Instance.new("TextButton", frame)
    tBtn.Size = UDim2.new(0, 20, 0, 20)
    tBtn.Position = UDim2.new(1, -30, 0.5, -10)
    tBtn.BackgroundColor3 = Theme.Surface
    tBtn.Text = ""
    Instance.new("UICorner", tBtn).CornerRadius = UDim.new(0, 4)
    Instance.new("UIStroke", tBtn).Color = Theme.Accent
    local s = false
    tBtn.MouseButton1Click:Connect(function()
        s = not s
        tBtn.BackgroundColor3 = s and Theme.Accent or Theme.Surface
        callback(s)
    end)
end
local function CreateDropdown(parent, title, options, callback)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(0, 260, 0, 32)
    container.BackgroundColor3 = Theme.SurfaceLight
    container.ClipsDescendants = true
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)
    local selected = options[1]
    local mainBtn = Instance.new("TextButton", container)
    mainBtn.Size = UDim2.new(1, 0, 0, 32)
    mainBtn.BackgroundTransparency = 1
    mainBtn.Text = "  " .. title .. ": " .. selected .. "  ▼"
    mainBtn.TextColor3 = Theme.Accent
    mainBtn.Font = Enum.Font.GothamBold
    mainBtn.TextSize = 12
    mainBtn.TextXAlignment = Enum.TextXAlignment.Left
    local scroll = Instance.new("ScrollingFrame", container)
    scroll.Size = UDim2.new(1, 0, 1, -32)
    scroll.Position = UDim2.new(0, 0, 0, 32)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 2
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    local layout = Instance.new("UIListLayout", scroll)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    local isOpen = false
    local maxDropHeight = math.min(#options * 30, 150)
    mainBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if isOpen then
            TweenService:Create(container, TweenInfo.new(0.2), {Size = UDim2.new(0, 260, 0, 32 + maxDropHeight)}):Play()
            mainBtn.Text = "  " .. title .. ": " .. selected .. "  ▲"
        else
            TweenService:Create(container, TweenInfo.new(0.2), {Size = UDim2.new(0, 260, 0, 32)}):Play()
            mainBtn.Text = "  " .. title .. ": " .. selected .. "  ▼"
        end
    end)
    for i, option in ipairs(options) do
        local optBtn = Instance.new("TextButton", scroll)
        optBtn.Size = UDim2.new(1, -10, 0, 30)
        optBtn.BackgroundColor3 = Theme.Surface
        optBtn.Text = "    " .. option
        optBtn.TextColor3 = Theme.TextDim
        optBtn.Font = Enum.Font.GothamBold
        optBtn.TextSize = 11
        optBtn.TextXAlignment = Enum.TextXAlignment.Left
        optBtn.LayoutOrder = i
        optBtn.MouseButton1Click:Connect(function()
            selected = option
            isOpen = false
            TweenService:Create(container, TweenInfo.new(0.2), {Size = UDim2.new(0, 260, 0, 32)}):Play()
            mainBtn.Text = "  " .. title .. ": " .. selected .. "  ▼"
            callback(option)
        end)
    end
    callback(selected)
end
local function CreateMultiDropdown(parent, title, options, callback)
    local container = Instance.new("Frame", parent)
    container.Size = UDim2.new(0, 260, 0, 32)
    container.BackgroundColor3 = Theme.SurfaceLight
    container.ClipsDescendants = true
    Instance.new("UICorner", container).CornerRadius = UDim.new(0, 6)
    local selected = {}
    for _, opt in ipairs(options) do selected[opt] = false end
    local mainBtn = Instance.new("TextButton", container)
    mainBtn.Size = UDim2.new(1, 0, 0, 32)
    mainBtn.BackgroundTransparency = 1
    mainBtn.Text = "  " .. title .. ": Any  ▼"
    mainBtn.TextColor3 = Theme.Accent
    mainBtn.Font = Enum.Font.GothamBold
    mainBtn.TextSize = 12
    mainBtn.TextXAlignment = Enum.TextXAlignment.Left
    local scroll = Instance.new("ScrollingFrame", container)
    scroll.Size = UDim2.new(1, 0, 1, -32)
    scroll.Position = UDim2.new(0, 0, 0, 32)
    scroll.BackgroundTransparency = 1
    scroll.ScrollBarThickness = 2
    scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    local layout = Instance.new("UIListLayout", scroll)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    local isOpen = false
    local maxDropHeight = math.min(#options * 30, 150)
    local function updateText()
        local count = 0
        for k, v in pairs(selected) do if v then count = count + 1 end end
        if count == 0 then
            mainBtn.Text = "  " .. title .. ": Any  " .. (isOpen and "▲" or "▼")
        else
            mainBtn.Text = "  " .. title .. ": " .. count .. " Selected  " .. (isOpen and "▲" or "▼")
        end
        callback(selected)
    end
    mainBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if isOpen then
            TweenService:Create(container, TweenInfo.new(0.2), {Size = UDim2.new(0, 260, 0, 32 + maxDropHeight)}):Play()
        else
            TweenService:Create(container, TweenInfo.new(0.2), {Size = UDim2.new(0, 260, 0, 32)}):Play()
        end
        updateText()
    end)
    for i, option in ipairs(options) do
        local optBtn = Instance.new("TextButton", scroll)
        optBtn.Size = UDim2.new(1, -10, 0, 30)
        optBtn.BackgroundColor3 = Theme.Surface
        optBtn.Text = "    " .. option
        optBtn.TextColor3 = Theme.TextDim
        optBtn.Font = Enum.Font.GothamBold
        optBtn.TextSize = 11
        optBtn.TextXAlignment = Enum.TextXAlignment.Left
        optBtn.LayoutOrder = i
        optBtn.MouseButton1Click:Connect(function()
            selected[option] = not selected[option]
            optBtn.TextColor3 = selected[option] and Theme.Success or Theme.TextDim
            updateText()
        end)
    end
    callback(selected)
end
local Net = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Network")
local kickValues = {
    ["Perfect"] = 1,
    ["Excellent"] = 0.8670379929244518,
    ["Great"] = 0.6358855310827494,
    ["Mid"] = 0.2641407661139965,
    ["Bad"] = 0.06738599948585033
}
local currentKickMode = "Perfect"
CreateDropdown(MainTab, "Kick Power", {"Perfect", "Excellent", "Great", "Mid", "Bad"}, function(val) currentKickMode = val end)
local mutationList = {"Normal", "Gold", "Diamond", "Plasma", "Molten", "Radioactive", "Shadow", "Electrified", "Rainbow"}
local targetMutations = {}
CreateMultiDropdown(MainTab, "Mutation", mutationList, function(selected) targetMutations = selected end)
local autoKick = false
local kickTick = 0
CreateToggle(MainTab, " Auto Kick! (Sniper) 💫", function(v)
    autoKick = v
    kickTick = kickTick + 1
    local currentTick = kickTick
    if autoKick then
        task.spawn(function()
            while autoKick and currentTick == kickTick do
                pcall(function()
                    local char = player.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local hum = char and char:FindFirstChild("Humanoid")
                    if hrp and hum and hum.Health > 0 then
                        hrp.Velocity = Vector3.new(0,0,0)
                        hrp.CFrame = workspace.Areas.KickReady.CFrame + Vector3.new(0, 5, 0)
                        task.wait(0.3)
                        local guiBtn = PlayerGui.HUD.KickButton
                        if getconnections then
                            for _, c in pairs(getconnections(guiBtn.MouseButton1Click)) do c:Fire() end
                        end
                        if currentKickMode == "Perfect" then
                            pcall(function()
                                local vfx = game:GetService("ReplicatedStorage").Objects.VFX:FindFirstChild("PerfectKick")
                                if vfx then
                                    local vfxClone = vfx:Clone()
                                    vfxClone.Parent = hrp
                                    if vfxClone:IsA("ParticleEmitter") then vfxClone:Emit(30) end
                                    for _, d in pairs(vfxClone:GetDescendants()) do
                                        if d:IsA("ParticleEmitter") then d:Emit(30) end
                                    end
                                    game:GetService("Debris"):AddItem(vfxClone, 2)
                                end
                            end)
                        end
                        local startPos = hrp.Position
                        local kickMultiplier = kickValues[currentKickMode] or 1
                        Net.rev_KickEvent:FireServer(kickMultiplier)
                        Net.rev_Transformed:FireServer()
                        Net.rev_KickZman:FireServer()
                        local teleported = false
                        local waitTimeout = 0
                        while waitTimeout < 15 and hum.Health > 0 do
                            task.wait(0.1)
                            waitTimeout = waitTimeout + 0.2
                            if hrp and (hrp.Position - startPos).Magnitude > 50 then
                                teleported = true
                                break
                            end
                        end
                        if teleported then
                            task.wait(0.1)
                            local foundTarget = false
                            local selectedCount = 0
                            for k, isSelected in pairs(targetMutations) do
                                if isSelected then selectedCount = selectedCount + 1 end
                            end
                            if selectedCount == 0 then
                                foundTarget = true
                            else
                                for _, obj in pairs(workspace.Debris:GetChildren()) do
                                    if obj:IsA("Model") and obj.PrimaryPart then
                                        if (obj.PrimaryPart.Position - hrp.Position).Magnitude < 100 then
                                            for _, m in ipairs({"Gold", "Golden", "Diamond", "Plasma", "Molten", "Radioactive", "Shadow", "Electrified", "Rainbow"}) do
                                                if obj:FindFirstChild(m) or obj:FindFirstChild(m, true) then
                                                    if targetMutations[m] then foundTarget = true end
                                                    if (m == "Golden" or m == "Gold") and targetMutations["Gold"] then foundTarget = true end
                                                end
                                            end
                                            if targetMutations["Normal"] then
                                                foundTarget = true
                                            end
                                            break
                                        end
                                    end
                                end
                            end
                            if foundTarget then
                                local safeZone = workspace.Lobby:FindFirstChild("Safe")
                                if safeZone then
                                    hrp.Velocity = Vector3.new(0,0,0)
                                    hrp.CFrame = safeZone.CFrame + Vector3.new(0, 5, 0)
                                end
                                task.wait(0.1)
                            else
                                local deathTimeout = 0
                                local died = false
                                local deathConn
                                if hum then
                                    deathConn = hum.Died:Connect(function() died = true end)
                                end
                                while hum and hum.Health > 0 and not died and deathTimeout < 15 do
                                    task.wait(0.1)
                                    deathTimeout = deathTimeout + 0.1
                                    local waveFound = false
                                    local wavesFolder = workspace:FindFirstChild("Waves")
                                    if wavesFolder then
                                        for _, waveObj in pairs(wavesFolder:GetChildren()) do
                                            local targetPart = waveObj:IsA("Model") and (waveObj.PrimaryPart or waveObj:FindFirstChildWhichIsA("BasePart")) or (waveObj:IsA("BasePart") and waveObj)
                                            if targetPart and hrp then
                                                hrp.Velocity = Vector3.new(0,0,0)
                                                hrp.CFrame = targetPart.CFrame
                                                waveFound = true
                                                break
                                            end
                                        end
                                    end
                                    if not waveFound and hrp then
                                        hrp.Velocity = Vector3.new(0,0,0)
                                    end
                                end
                                if deathConn then deathConn:Disconnect() end
                                task.wait(1.5)
                            end
                        end
                    end
                end)
            end
        end)
    end
end)
local autoTrain = false
local trainTick = 0
CreateToggle(MainTab, "Auto Train & x2 ||—||", function(v)
    autoTrain = v
    trainTick = trainTick + 1
    local currentTick = trainTick
    if autoTrain then
        task.spawn(function()
            while autoTrain and currentTick == trainTick do
                pcall(function()
                    local char = player.Character
                    local hum = char and char:FindFirstChild("Humanoid")
                    local backpack = player:FindFirstChild("Backpack")
                    local currentTool = char and char:FindFirstChildOfClass("Tool")
                    if not currentTool then
                        local slot1 = PlayerGui:FindFirstChild("Backpack")
                            and PlayerGui.Backpack:FindFirstChild("Bar")
                            and PlayerGui.Backpack.Bar:FindFirstChild("Slot1")
                        if slot1 and getconnections then
                            local targets = {slot1, slot1:FindFirstChild("ToolImage")}
                            for _, t in pairs(targets) do
                                if t then
                                    pcall(function() for _, c in pairs(getconnections(t.MouseButton1Down)) do c:Fire() end end)
                                    pcall(function() for _, c in pairs(getconnections(t.MouseButton1Click)) do c:Fire() end end)
                                    pcall(function() for _, c in pairs(getconnections(t.Activated)) do c:Fire() end end)
                                    pcall(function() for _, c in pairs(getconnections(t.InputBegan)) do c:Fire({UserInputType = Enum.UserInputType.MouseButton1, UserInputState = Enum.UserInputState.Begin}) end end)
                                    pcall(function() for _, c in pairs(getconnections(t.InputBegan)) do c:Fire({UserInputType = Enum.UserInputType.Touch, UserInputState = Enum.UserInputState.Begin}) end end)
                                end
                            end
                        end
                        task.wait(0.1)
                        if not char:FindFirstChildOfClass("Tool") and backpack and hum then
                            for _, tool in pairs(backpack:GetChildren()) do
                                if tool:IsA("Tool") then
                                    local isBrainrot = tool:GetAttribute("Rarity") or tool:FindFirstChild("Rarity")
                                    if not isBrainrot then
                                        hum:EquipTool(tool)
                                        break
                                    end
                                end
                            end
                        end
                    else
                        currentTool:Activate()
                    end
                end)
                pcall(function()
                    local kickUpgrades = PlayerGui:FindFirstChild("KickUpgrades")
                    if kickUpgrades then
                        for _, bonus in pairs(kickUpgrades:GetChildren()) do
                            if bonus.Name == "Bonus" or bonus.Name == "PopBonus" then
                                if bonus.Visible then
                                    if not bonus:GetAttribute("AutoClicked") then
                                        bonus:SetAttribute("AutoClicked", true)
                                        task.spawn(function()
                                            task.wait(0.2)
                                            local imgLabel = bonus:FindFirstChild("ImageLabel")
                                            local targets = {bonus}
                                            if imgLabel then table.insert(targets, imgLabel) end
                                            if getconnections then
                                                for _, target in pairs(targets) do
                                                    pcall(function()
                                                        for _, conn in pairs(getconnections(target.InputBegan)) do
                                                            conn:Fire({UserInputType = Enum.UserInputType.MouseButton1, UserInputState = Enum.UserInputState.Begin})
                                                            conn:Fire({UserInputType = Enum.UserInputType.Touch, UserInputState = Enum.UserInputState.Begin})
                                                        end
                                                    end)
                                                    pcall(function() for _, conn in pairs(getconnections(target.MouseButton1Down)) do conn:Fire() end end)
                                                    pcall(function() for _, conn in pairs(getconnections(target.MouseButton1Up)) do conn:Fire() end end)
                                                    pcall(function() for _, conn in pairs(getconnections(target.MouseButton1Click)) do conn:Fire() end end)
                                                    pcall(function() for _, conn in pairs(getconnections(target.Activated)) do conn:Fire() end end)
                                                end
                                            end
                                        end)
                                    end
                                else
                                    bonus:SetAttribute("AutoClicked", nil)
                                end
                            end
                        end
                    end
                end)
                task.wait(0.1)
            end
        end)
    end
end)
CreateButton(MainTab, "TP KickRead ⚡", function()
    pcall(function() player.Character.HumanoidRootPart.CFrame = workspace.Areas.KickReady.CFrame + Vector3.new(0, 5, 0) end)
end)
local autoCollect = false
local collectTick = 0
CreateToggle(CollectTab, "Auto Collect Money 🤑", function(v)
    autoCollect = v
    collectTick = collectTick + 1
    local currentTick = collectTick
    if autoCollect then
        task.spawn(function()
            while autoCollect and currentTick == collectTick do
                for i = 1, 30 do pcall(function() Net.rev_B_Collect:FireServer(i) end) end
                task.wait(1)
            end
        end)
    end
end)
local instantInteract = false
local grabTick = 0
CreateToggle(CollectTab, "Instant Grab/Hatch (No Delay) ⚡", function(v)
    instantInteract = v
    grabTick = grabTick + 1
    local currentTick = grabTick
    if instantInteract then
        task.spawn(function()
            while instantInteract and currentTick == grabTick do
                pcall(function()
                    for _, obj in pairs(workspace:GetDescendants()) do
                        if obj:IsA("ProximityPrompt") then
                            obj.HoldDuration = 0
                        end
                    end
                end)
                task.wait(1)
            end
        end)
    end
end)
CreateButton(CollectTab, "Buy Speed x1 👟", function() Net.rev_SPEED_UPGRADE:FireServer(1) end)
CreateButton(CollectTab, "Rebirth ♻️", function() Net.rev_RebirthRequest:FireServer() end)
local upList = {}
for i = 1, 30 do table.insert(upList, tostring(i)) end
local targetUpgrade = "1"
CreateDropdown(UpGTab, "Select UpG", upList, function(val) targetUpgrade = val end)
local autoUpSel = false
local upSelTick = 0
CreateToggle(UpGTab, "Auto Upgrade Selected ⚡", function(v)
    autoUpSel = v
    upSelTick = upSelTick + 1
    local currentTick = upSelTick
    if autoUpSel then
        task.spawn(function()
            while autoUpSel and currentTick == upSelTick do
                pcall(function() Net.rev_B_Upgrade:FireServer(tonumber(targetUpgrade)) end)
                task.wait(0.05)
            end
        end)
    end
end)
local autoUpAll = false
local upAllTick = 0
CreateToggle(UpGTab, "Auto Upgrade All 🧠", function(v)
    autoUpAll = v
    upAllTick = upAllTick + 1
    local currentTick = upAllTick
    if autoUpAll then
        task.spawn(function()
            while autoUpAll and currentTick == upAllTick do
                for i = 1, 30 do pcall(function() Net.rev_B_Upgrade:FireServer(i) end) end
                task.wait(0.05)
            end
        end)
    end
end)
local weightList = {"Wooden Stick    Free", "Bone Barbel     $7.5K", "Stone Block    $75K", "Copper Plate    $500K", "Iron Plate    $7.2M", "Ice Barbell    $350M", "Donut Barbell    	$6.2B", "Golden Barbell    $85B", "Heaven Plate     $1.2T", "Mega Golden Barbell     $18T", "Neon Pulse    $500T", "Giant Gold Star Barbell     $20Q"}
local targetWeight = weightList[1]
CreateDropdown(BuyTab, "Select Weight", weightList, function(val) targetWeight = val end)
CreateButton(BuyTab, "Buy Weight 🛒", function()
    local cleanName = string.match(targetWeight, "^(.-)%s+%S+$") or targetWeight
    Net.rev_Shop_Buy:FireServer("WeightShop", cleanName)
end)
local autoBuyWeight = false
local buyTick = 0
CreateToggle(BuyTab, "Auto Buy Selected 🛒", function(v)
    autoBuyWeight = v
    buyTick = buyTick + 1
    local currentTick = buyTick
    if autoBuyWeight then
        task.spawn(function()
            while autoBuyWeight and currentTick == buyTick do
                pcall(function()
                    local cleanName = string.match(targetWeight, "^(.-)%s+%S+$") or targetWeight
                    Net.rev_Shop_Buy:FireServer("WeightShop", cleanName)
                end)
                task.wait(0.5)
            end
        end)
    end
end)
CreateButton(SellTab, "Sell All 💲 (Danger!)", function() Net.ref_B_SellAll:InvokeServer() end)
local function addLabel(txt, clr)
    local l = Instance.new("TextLabel", DetailsTab)
    l.Size = UDim2.new(1, 0, 0, 25); l.BackgroundTransparency = 1
    l.Text = txt; l.TextColor3 = clr; l.Font = Enum.Font.GothamBold; l.TextSize = 12
end
addLabel("🗿 Kick a Lucky Block", Theme.Success)
addLabel("🤬 by Venzz", Theme.Success)
addLabel("✌ Like and follow", Theme.Success)
addLabel("▶️ YouTube Venzz_mm2", Theme.Success)
addLabel("🟢 It works", Theme.Success)
addLabel("🟠 Waiting for update.", Theme.Success)
addLabel("❌ It's not working", Theme.Success)
local function addUpdateLabel(txt, clr)
    local l = Instance.new("TextLabel", UpdateTab)
    l.Size = UDim2.new(1, 0, 0, 25); l.BackgroundTransparency = 1
    l.Text = txt; l.TextColor3 = clr; l.Font = Enum.Font.GothamBold; l.TextSize = 12
    l.TextWrapped = true
end
addUpdateLabel("🌛 Version V1 beta", Theme.Success)
addUpdateLabel("💫 New kick a Lucky block script.", Theme.Success)
addUpdateLabel("💬 script by Venzz subscribe yt me.", Theme.Success)
addUpdateLabel("🌐 https://discord.gg/Vn2Zg7ZvV.", Theme.Success)
Tabs[1].Page.Visible = true
Tabs[1].Btn.BackgroundColor3 = Theme.Accent
Tabs[1].Btn.TextColor3 = Color3.new(0,0,0)
toggleBtn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)