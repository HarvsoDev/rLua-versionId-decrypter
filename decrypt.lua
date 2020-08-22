local versionid = "" -- Heres where your version id should go.

-- This script only works with Synapse X.

local HttpService = game:GetService("HttpService")
local link = "http://www.roblox.com/asset/?id=&assetversionid=" ..versionid
local t = {}
local content = syn.request(
    {
        Url = link,
        Method = "GET",
        Headers = {
            ["User-Agent"] = "Roblox/WinInet";
            ["Host"] = "www.roblox.com"
        },
    }
)
for i,v in pairs(content.Headers) do
    t[i] = v
end

if tonumber(t["roblox-assetid"]) then
    setclipboard(t["roblox-assetid"])
    print(t["roblox-assetid"])
    game.StarterGui:SetCore("SendNotification", {
    Title = "Successfully copied asset ID to clipboard";
    Text = "Decryption was successful";
    Icon = "rbxassetid://54653912";
    Duration = 5;
})
else
    game.StarterGui:SetCore("SendNotification", {
    Title = "Failed to grab asset ID";
    Text = "Decryption failed";
    Icon = "rbxassetid://16201263";
    Duration = 5;
})
end
