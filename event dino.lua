
--========================================
-- LEKILLER - 8 EGG NEST POSITIONS
--========================================

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local oldGui = nil
local parent = (gethui and gethui()) or player:WaitForChild("PlayerGui")

pcall(function()
    oldGui = parent:FindFirstChild("EggPositionSaver")
    if oldGui then oldGui:Destroy() end
end)

local gui = Instance.new("ScreenGui")
gui.Name = "EggPositionSaver"
gui.ResetOnSpawn = false
gui.Parent = parent

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 420)
frame.Position = UDim2.new(0.5, -150, 0.5, -210)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundColor3 = Color3.fromRGB(0, 110, 220)
title.Text = "LEKILLER - EGG POSITION SAVER"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.GothamBold
title.TextSize = 12
title.Parent = frame

Instance.new("UICorner", title).CornerRadius = UDim.new(0, 10)

local status = Instance.new("TextLabel")
status.Position = UDim2.new(0, 5, 0, 40)
status.Size = UDim2.new(1, -10, 0, 30)
status.BackgroundTransparency = 1
status.Text = "0/8 nids enregistrés"
status.TextColor3 = Color3.new(1,1,1)
status.Font = Enum.Font.Gotham
status.TextSize = 12
status.Parent = frame

local nestPositions = {}
local safePosition = nil

local function getPosition()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")
    return root and root.CFrame
end

local function updateStatus(message)
    local count = 0
    for i = 1, 8 do
        if nestPositions[i] then
            count = count + 1
        end
    end

    status.Text = message or (count .. "/8 nids enregistrés")
end

local function createButton(text, y, callback)
    local b = Instance.new("TextButton")
    b.Position = UDim2.new(0, 10, 0, y)
    b.Size = UDim2.new(1, -20, 0, 32)
    b.BackgroundColor3 = Color3.fromRGB(40, 90, 150)
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    b.Parent = frame

    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)

    b.MouseButton1Click:Connect(callback)
end

-- 8 boutons pour les nids
for i = 1, 8 do
    local index = i

    createButton("ENREGISTRER LE NID " .. index, 78 + ((i - 1) * 36), function()
        local cf = getPosition()

        if cf then
            nestPositions[index] = cf
            updateStatus("Nid " .. index .. " enregistré !")
            print("NID " .. index .. " :", cf.Position)
        else
            updateStatus("Personnage introuvable")
        end
    end)
end

createButton("ENREGISTRER ZONE SÉCURISÉE", 370, function()
    safePosition = getPosition()

    if safePosition then
        updateStatus("Zone sécurisée enregistrée !")
        print("ZONE SÉCURISÉE :", safePosition.Position)
    else
        updateStatus("Personnage introuvable")
    end
end)

createButton("COPIER LES POSITIONS", 407, function()
    local lines = {
        "-- Positions des nids",
        "local nestPositions = {"
    }

    for i = 1, 8 do
        local cf = nestPositions[i]

        if cf then
            local p = cf.Position
            table.insert(lines, string.format(
                "    [%d] = CFrame.new(%.4f, %.4f, %.4f),",
                i, p.X, p.Y, p.Z
            ))
        else
            table.insert(lines, "    -- [" .. i .. "] non enregistré")
        end
    end

    table.insert(lines, "}")
    table.insert(lines, "")

    if safePosition then
        local p = safePosition.Position
        table.insert(lines, string.format(
            "local safePosition = CFrame.new(%.4f, %.4f, %.4f)",
            p.X, p.Y, p.Z
        ))
    else
        table.insert(lines, "-- Zone sécurisée non enregistrée")
    end

    local code = table.concat(lines, "\n")
    print(code)

    if setclipboard then
        local success = pcall(setclipboard, code)
        updateStatus(success and "Positions copiées !" or "Voir la console")
    else
        updateStatus("Positions affichées dans la console")
    end
end)

print("[LEKILLER] 8 Nest Position Saver chargé !")
