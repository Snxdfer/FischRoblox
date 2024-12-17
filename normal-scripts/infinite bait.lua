local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function GetEquippedBait()
    local Bait = LocalPlayer.PlayerGui.hud.safezone.backpack.bait
    if Bait then
        Bait = Bait.Text
        return Bait:match("Current Bait : (.+)%[")
    end
end

LocalPlayer.PlayerGui.ChildAdded:Connect(function(Child)
    if Child.Name == 'reel' then
        local Bait = GetEquippedBait()
        if not Bait then return end
        LocalPlayer.PlayerGui.hud.safezone.equipment.bait.scroll.safezone.e:FireServer('None')
        repeat task.wait() until not LocalPlayer.PlayerGui:FindFirstChild('reel')
        LocalPlayer.PlayerGui.hud.safezone.equipment.bait.scroll.safezone.e:FireServer(Bait)
    end
end)
