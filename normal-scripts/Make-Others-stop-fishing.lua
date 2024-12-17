--fisch pls dont patch this, its fun :(

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local cons = {}

for i,v in Players:GetPlayers() do
    print(v)
    if v == LocalPlayer then continue end
    if v.Character then
        cons[v.Name] = v.Character.ChildAdded:Connect(function(Child)
            if string.match(Child.Name, 'Rod') then
                while Child.Parent == v.Character do
                    Child.events.reset:FireServer()
                    task.wait()
                end
            end
        end)
    end
end

Players.PlayerAdded:Connect(function(Player)
    if Player == LocalPlayer then return end
    Player.CharacterAdded:Connect(function(Character)
        Character.ModelStreamingMode = Enum.ModelStreamingMode.Persistent
        cons[Player.Name] = Character.ChildAdded:Connect(function(Child)
            if string.match(Child.Name, 'Rod') then
                while Child.Parent == Character do
                    Child.events.reset:FireServer()
                    task.wait()
                end
            end
        end)
    end)
end)

Players.PlayerRemoving:Connect(function(Player)
    if cons[Player.Name] then
        cons[Player.Name]:Disconnect()
        cons[Player.Name] = nil
    end
end)
