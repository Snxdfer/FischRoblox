-- Key System

if game.PlaceId == 13772394625 then 

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Snxdfer/CustomOrionLib/refs/heads/main/Library.lua')))()
local Player = game.Players.LocalPlayer
local Window = OrionLib:MakeWindow({Name = "Key System", HidePremium = false, SaveConfig = false, IntroEnabled = false, IntroText = "Key System"})

local keyUrl = "https://pastebin.com/raw/EEV0hsSF"
local _G_Key = ""
local function fetchKey()
    local success, result = pcall(function() return game:HttpGetAsync(keyUrl) end)
    if success then
        _G_Key = result
    else
        _G_Key = ""
        OrionLib:MakeNotification({
            Name = "Key System",
            Content = "Failed to fetch key. Please try again later.",
            Image = "rbxassetid://10723416652",
            Time = 5
        })
    end
end

fetchKey()

_G.KeyInput = "string"

function MakeScriptHub()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Snxdfer/Solara-Inject-Image/refs/heads/main/InjectImage.lua'))()
end

function CorrectKey()
    OrionLib:MakeNotification({
        Name = "Key System",
        Content = "Correct Key!",
        Image = "rbxassetid://10723416652",
        Time = 5
    })
    wait(1)
    OrionLib:Destroy()
end

function IncorrectKey()
    OrionLib:MakeNotification({
        Name = "Key System",
        Content = "Incorrect Key!",
        Image = "rbxassetid://10723416652",
        Time = 5
    })
end

local Tab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://10723416652",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        _G.KeyInput = Value
    end    
})

Tab:AddButton({
    Name = "Check Key",
    Callback = function()
        if _G.KeyInput == _G_Key then
            MakeScriptHub()
            CorrectKey()
        else
            IncorrectKey()
        end
    end    
})

Tab:AddButton({
    Name = "Get Key",
    Callback = function()
        setclipboard("https://link-hub.net/1115049/nss-hub")
        OrionLib:MakeNotification({
            Name = "Key System",
            Content = "Link Copied",
            Image = "rbxassetid://10723416652",
            Time = 5
        })
    end    
})

OrionLib:Init()
