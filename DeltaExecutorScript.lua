-- Delta Executor Script for Murder Mystery 2

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Configuration
local Config = require(script.Parent.Config)

-- Helper Functions
local HelperFunctions = require(script.Parent.HelperFunctions)

-- Event Handlers
local EventHandlers = require(script.Parent.EventHandlers)

-- UI Elements
local UIElements = require(script.Parent.UIElements)

-- Main Delta Executor Function
local function DeltaExecutor(player)
    -- Initialize UI for the player
    UIElements.InitializeUI(player)

    -- Set up event handlers for the player
    EventHandlers.SetupEventHandlers(player)

    -- Additional Delta executor logic
    HelperFunctions.LogMessage("Delta Executor initialized for " .. player.Name)
end

-- Player Added Event
Players.PlayerAdded:Connect(function(player)
    DeltaExecutor(player)
end)

-- Player Removing Event
Players.PlayerRemoving:Connect(function(player)
    -- Clean up UI and event handlers for the player
    UIElements.CleanupUI(player)
    EventHandlers.CleanupEventHandlers(player)
    HelperFunctions.LogMessage("Delta Executor cleaned up for " .. player.Name)
end)
