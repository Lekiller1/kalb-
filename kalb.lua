-- =====================================================================
-- Angel Blox X2 Multiplicator v1.1 - Controles Independientes
-- Creado por Angel_Blox
-- =====================================================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Evitar duplicados si ya está abierto
if CoreGui:FindFirstChild("AngelBloxX2Gui") then
    CoreGui.AngelBloxX2Gui:Destroy()
end

-- =====================================================================
-- Interfaz Gráfica (UI)
-- =====================================================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AngelBloxX2Gui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn and syn.protect_gui then
    syn.protect_gui(ScreenGui)
    ScreenGui.Parent = CoreGui
elseif gethui then
    ScreenGui.Parent = gethui()
else
    ScreenGui.Parent = CoreGui
end

-- Ventana Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 165)
MainFrame.Position = UDim2.new(0.5, -110, 0.4, -82)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 18, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(30, 90, 200)
UIStroke.Thickness = 1.5
UIStroke.Parent = MainFrame

-- Barra superior para deslizar
local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 25)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrame

-- Título con versión v1.1 y efecto azul
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Position = UDim2.new(0, 0, 0, 12)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "Angel Blox X2 v1.1"
TitleLabel.TextColor3 = Color3.fromRGB(50, 150, 255)
TitleLabel.TextSize = 14
TitleLabel.Parent = MainFrame

-- Creador (Texto transparente)
local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Size = UDim2.new(1, 0, 0, 15)
CreatorLabel.Position = UDim2.new(0, 0, 0, 42)
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.Font = Enum.Font.GothamMedium
CreatorLabel.Text = "creado por Angel_Blox"
CreatorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CreatorLabel.TextTransparency = 0.55
CreatorLabel.TextSize = 10
CreatorLabel.Parent = MainFrame

-- =====================================================================
-- Opción 1: X2 Multiplicator (Spammer)
-- =====================================================================
local Option1Label = Instance.new("TextLabel")
Option1Label.Size = UDim2.new(0, 130, 0, 25)
Option1Label.Position = UDim2.new(0, 15, 0, 70)
Option1Label.BackgroundTransparency = 1
Option1Label.Font = Enum.Font.GothamSemibold
Option1Label.Text = "X2 Multiplicator"
Option1Label.TextColor3 = Color3.fromRGB(210, 225, 255)
Option1Label.TextSize = 12
Option1Label.TextXAlignment = Enum.TextXAlignment.Left
Option1Label.Parent = MainFrame

local Toggle1 = Instance.new("TextButton")
Toggle1.Name = "ToggleX2"
Toggle1.Size = UDim2.new(0, 44, 0, 22)
Toggle1.Position = UDim2.new(1, -55, 0, 71)
Toggle1.BackgroundColor3 = Color3.fromRGB(28, 38, 65)
Toggle1.AutoButtonColor = false
Toggle1.Text = ""
Toggle1.Parent = MainFrame

local T1Corner = Instance.new("UICorner")
T1Corner.CornerRadius = UDim.new(1, 0)
T1Corner.Parent = Toggle1

local T1Stroke = Instance.new("UIStroke")
T1Stroke.Color = Color3.fromRGB(50, 100, 180)
T1Stroke.Thickness = 1
T1Stroke.Parent = Toggle1

local Circle1 = Instance.new("Frame")
Circle1.Size = UDim2.new(0, 16, 0, 16)
Circle1.Position = UDim2.new(0, 3, 0.5, -8)
Circle1.BackgroundColor3 = Color3.fromRGB(150, 180, 220)
Circle1.BorderSizePixel = 0
Circle1.Parent = Toggle1

local C1Corner = Instance.new("UICorner")
C1Corner.CornerRadius = UDim.new(1, 0)
C1Corner.Parent = Circle1

-- =====================================================================
-- Opción 2: Auto Click (Limpio, sin la palabra bonus)
-- =====================================================================
local Option2Label = Instance.new("TextLabel")
Option2Label.Size = UDim2.new(0, 130, 0, 25)
Option2Label.Position = UDim2.new(0, 15, 0, 110)
Option2Label.BackgroundTransparency = 1
Option2Label.Font = Enum.Font.GothamSemibold
Option2Label.Text = "Auto Click"
Option2Label.TextColor3 = Color3.fromRGB(210, 225, 255)
Option2Label.TextSize = 12
Option2Label.TextXAlignment = Enum.TextXAlignment.Left
Option2Label.Parent = MainFrame

local Toggle2 = Instance.new("TextButton")
Toggle2.Name = "ToggleAutoClick"
Toggle2.Size = UDim2.new(0, 44, 0, 22)
Toggle2.Position = UDim2.new(1, -55, 0, 111)
Toggle2.BackgroundColor3 = Color3.fromRGB(28, 38, 65)
Toggle2.AutoButtonColor = false
Toggle2.Text = ""
Toggle2.Parent = MainFrame

local T2Corner = Instance.new("UICorner")
T2Corner.CornerRadius = UDim.new(1, 0)
T2Corner.Parent = Toggle2

local T2Stroke = Instance.new("UIStroke")
T2Stroke.Color = Color3.fromRGB(50, 100, 180)
T2Stroke.Thickness = 1
T2Stroke.Parent = Toggle2

local Circle2 = Instance.new("Frame")
Circle2.Size = UDim2.new(0, 16, 0, 16)
Circle2.Position = UDim2.new(0, 3, 0.5, -8)
Circle2.BackgroundColor3 = Color3.fromRGB(150, 180, 220)
Circle2.BorderSizePixel = 0
Circle2.Parent = Toggle2

local C2Corner = Instance.new("UICorner")
C2Corner.CornerRadius = UDim.new(1, 0)
C2Corner.Parent = Circle2

-- =====================================================================
-- Animaciones y Funcionalidad de Arrastre
-- =====================================================================

task.spawn(function()
    while ScreenGui.Parent do
        local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
        local t1 = TweenService:Create(TitleLabel, tweenInfo, {TextColor3 = Color3.fromRGB(100, 190, 255)})
        t1:Play()
        t1.Completed:Wait()
        local t2 = TweenService:Create(TitleLabel, tweenInfo, {TextColor3 = Color3.fromRGB(40, 120, 230)})
        t2:Play()
        t2.Completed:Wait()
    end
end)

local dragging, dragInput, dragStart, startPos

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- =====================================================================
-- Lógica del Toggle 1: X2 Multiplicator (Spammer)
-- =====================================================================
local toggled1 = false

Toggle1.MouseButton1Click:Connect(function()
    toggled1 = not toggled1
    
    local targetPos = toggled1 and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    local targetColor = toggled1 and Color3.fromRGB(0, 180, 255) or Color3.fromRGB(28, 38, 65)
    local circleColor = toggled1 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 180, 220)
    
    TweenService:Create(Circle1, TweenInfo.new(0.2), {Position = targetPos, BackgroundColor3 = circleColor}):Play()
    TweenService:Create(Toggle1, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
    
    if toggled1 then
        task.spawn(function()
            local success, remoteEvent = pcall(function()
                return ReplicatedStorage.Shared.Packages.Network.rev_TaviMishkal
            end)
            
            if success and remoteEvent then
                while toggled1 do
                    for i = 1, 10 do
                        task.spawn(function()
                            pcall(function()
                                remoteEvent:FireServer()
                            end)
                        end)
                    end
                    task.wait()
                end
            end
        end)
    end
end)

-- =====================================================================
-- Lógica del Toggle 2: Auto Click (Busca el objeto "Bonus")
-- =====================================================================
local toggled2 = false

Toggle2.MouseButton1Click:Connect(function()
    toggled2 = not toggled2
    
    local targetPos = toggled2 and UDim2.new(1, -19, 0.5, -8) or UDim2.new(0, 3, 0.5, -8)
    local targetColor = toggled2 and Color3.fromRGB(0, 180, 255) or Color3.fromRGB(28, 38, 65)
    local circleColor = toggled2 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 180, 220)
    
    TweenService:Create(Circle2, TweenInfo.new(0.2), {Position = targetPos, BackgroundColor3 = circleColor}):Play()
    TweenService:Create(Toggle2, TweenInfo.new(0.2), {BackgroundColor3 = targetColor}):Play()
    
    if toggled2 then
        task.spawn(function()
            while toggled2 do
                pcall(function()
                    local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
                    for _, gui in ipairs(playerGui:GetDescendants()) do
                        if (gui:IsA("GuiButton") or gui:IsA("TextButton") or gui:IsA("ImageButton")) and gui.Visible then
                            if string.find(string.lower(gui.Name), "bonus") then
                                for _, connection in pairs(getconnections(gui.MouseButton1Click)) do
                                    connection:Fire()
                                end
                                for _, connection in pairs(getconnections(gui.Activated)) do
                                    connection:Fire()
                                end
                            end
                        end
                    end
                end)
                task.wait(0.05)
            end
        end)
    end
end)

print("¡Angel Blox X2 Multiplicator v1.1 cargado con éxito!")