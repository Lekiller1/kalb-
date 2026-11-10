
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local SafeParent = PlayerGui
pcall(function()
    SafeParent = gethui()
end)

-- Nettoyage de l'ancienne interface
local oldGui = SafeParent:FindFirstChild("lekiller_train")
if oldGui then
    oldGui:Destroy()
end

-- Interface
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "lekiller_train"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = SafeParent

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 260, 0, 135)
Main.Position = UDim2.new(0.5, -130, 0.5, -67)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "LEKILLER - AUTO TRAIN"
Title.TextColor3 = Color3.fromRGB(0, 150, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.Parent = Main

local TrainButton = Instance.new("TextButton")
TrainButton.Size = UDim2.new(0, 220, 0, 40)
TrainButton.Position = UDim2.new(0, 20, 0, 65)
TrainButton.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TrainButton.Text = "AUTO TRAIN : OFF"
TrainButton.TextColor3 = Color3.new(1, 1, 1)
TrainButton.Font = Enum.Font.GothamBold
TrainButton.TextSize = 13
TrainButton.Parent = Main

Instance.new("UICorner", TrainButton).CornerRadius = UDim.new(0, 7)

-- Auto Train
local autoTrain = false
local trainTick = 0

TrainButton.MouseButton1Click:Connect(function()
    autoTrain = not autoTrain
    trainTick = trainTick + 1

    local currentTick = trainTick

    TrainButton.Text = autoTrain and "AUTO TRAIN : ON" or "AUTO TRAIN : OFF"
    TrainButton.BackgroundColor3 = autoTrain
        and Color3.fromRGB(0, 120, 255)
        or Color3.fromRGB(35, 35, 45)

    if autoTrain then
        task.spawn(function()
            while autoTrain and currentTick == trainTick do

                -- Équipement et entraînement
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
                            local targets = {
                                slot1,
                                slot1:FindFirstChild("ToolImage")
                            }

                            for _, target in pairs(targets) do
                                if target then
                                    pcall(function()
                                        for _, c in pairs(getconnections(target.MouseButton1Down)) do
                                            c:Fire()
                                        end
                                    end)

                                    pcall(function()
                                        for _, c in pairs(getconnections(target.MouseButton1Click)) do
                                            c:Fire()
                                        end
                                    end)

                                    pcall(function()
                                        for _, c in pairs(getconnections(target.Activated)) do
                                            c:Fire()
                                        end
                                    end)

                                    pcall(function()
                                        for _, c in pairs(getconnections(target.InputBegan)) do
                                            c:Fire({
                                                UserInputType = Enum.UserInputType.MouseButton1,
                                                UserInputState = Enum.UserInputState.Begin
                                            })
                                        end
                                    end)

                                    pcall(function()
                                        for _, c in pairs(getconnections(target.InputBegan)) do
                                            c:Fire({
                                                UserInputType = Enum.UserInputType.Touch,
                                                UserInputState = Enum.UserInputState.Begin
                                            })
                                        end
                                    end)
                                end
                            end
                        end

                        task.wait(0.1)

                        if char and not char:FindFirstChildOfClass("Tool")
                            and backpack and hum then

                            for _, tool in pairs(backpack:GetChildren()) do
                                if tool:IsA("Tool") then
                                    local isBrainrot =
                                        tool:GetAttribute("Rarity")
                                        or tool:FindFirstChild("Rarity")

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

                -- Bonus x2
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

                                            if imgLabel then
                                                table.insert(targets, imgLabel)
                                            end

                                            if getconnections then
                                                for _, target in pairs(targets) do
                                                    pcall(function()
                                                        for _, conn in pairs(getconnections(target.InputBegan)) do
                                                            conn:Fire({
                                                                UserInputType = Enum.UserInputType.MouseButton1,
                                                                UserInputState = Enum.UserInputState.Begin
                                                            })

                                                            conn:Fire({
                                                                UserInputType = Enum.UserInputType.Touch,
                                                                UserInputState = Enum.UserInputState.Begin
                                                            })
                                                        end
                                                    end)

                                                    pcall(function()
                                                        for _, conn in pairs(getconnections(target.MouseButton1Down)) do
                                                            conn:Fire()
                                                        end
                                                    end)

                                                    pcall(function()
                                                        for _, conn in pairs(getconnections(target.MouseButton1Up)) do
                                                            conn:Fire()
                                                        end
                                                    end)

                                                    pcall(function()
                                                        for _, conn in pairs(getconnections(target.MouseButton1Click)) do
                                                            conn:Fire()
                                                        end
                                                    end)

                                                    pcall(function()
                                                        for _, conn in pairs(getconnections(target.Activated)) do
                                                            conn:Fire()
                                                        end
                                                    end)
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
