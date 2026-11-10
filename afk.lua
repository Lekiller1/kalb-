local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")

local player = Players.LocalPlayer

player.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new(0, 0))
end)

while true do
    task.wait(120)
    if player then
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new(0, 0))
    end
end