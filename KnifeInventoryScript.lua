-- Knife Inventory Script for Murder Mystery 2 Halloween Update

local Players = game:GetService("Players")

-- Function to gather knives from player inventory
local function gatherKnives(player)
    local knives = {}
    for _, item in ipairs(player.Backpack:GetChildren()) do
        if item:IsA("Tool") and item.Name:find("Knife") then
            table.insert(knives, item)
        end
    end
    return knives
end

-- Main function to gather knives from all players
local function gatherAllKnives()
    local allKnives = {}
    for _, player in ipairs(Players:GetPlayers()) do
        local knives = gatherKnives(player)
        for _, knife in ipairs(knives) do
            table.insert(allKnives, knife)
        end
    end
    return allKnives
end

-- Example usage of functions
local allKnives = gatherAllKnives()
for _, knife in ipairs(allKnives) do
    print("Knife found: " .. knife.Name .. " in " .. knife.Parent.Name)
end