-- Candy Collection Script for Murder Mystery 2 Halloween Update

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Configuration
local candyCollectionSpeed = 1 -- Adjust the speed of candy collection
local candyCollectionInterval = 5 -- Interval in seconds for candy collection

-- Variables
local candyCollected = 0
local startTime = os.time()

-- Function to collect candy
local function collectCandy(player)
    -- Logic to collect candy
    candyCollected = candyCollected + 1
    print(player.Name .. " collected a candy. Total candies collected: " .. candyCollected)
end

-- Function to calculate candies collected per hour
local function calculateCandiesPerHour()
    local currentTime = os.time()
    local elapsedTime = currentTime - startTime
    local candiesPerHour = (candyCollected / elapsedTime) * 3600
    return math.floor(candiesPerHour)
end

-- Function to adjust collection speed
local function adjustCollectionSpeed(newSpeed)
    candyCollectionSpeed = newSpeed
    print("Candy collection speed adjusted to: " .. candyCollectionSpeed)
end

-- Main loop for candy collection
while true do
    for _, player in ipairs(Players:GetPlayers()) do
        collectCandy(player)
    end
    wait(candyCollectionInterval)
end

-- Example usage of functions
adjustCollectionSpeed(2) -- Adjust the collection speed to 2
local candiesPerHour = calculateCandiesPerHour()
print("Candies collected per hour: " .. candiesPerHour)