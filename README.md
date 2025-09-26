# DiddyLevel
**Dynamic Leveling Module for Roblox**

DiddyLevel is a lightweight, easy-to-use module for handling player XP and leveling in Roblox games. Track progression, award XP, and manage levels with minimal setup.

## Setup
1. Place `DiddyLevel` in `ServerStorage`.
2. Include `LevelMethods` and `LevelHandler` inside the `DiddyLevel` module.

## Features
- Simple XP awarding
- Flexible leveling system
- Works out of the box

## Usage Examples

```luau
local ServerStorage = game:GetService("ServerStorage")
local DiddyLevel = require(ServerStorage:WaitForChild("DiddyLevel"))

-- Example 1: Initialize levels
local levels = {
    {Level = 1, XPRequired = 0},
    {Level = 2, XPRequired = 100},
    {Level = 3, XPRequired = 250},
}

DiddyLevel.InitializeLevels(levels)

-- Example 2: Initialize a player when they join
game.Players.PlayerAdded:Connect(function(player)
    local playerData = {Level = 1, XP = 0} -- PlayerLevelObject
    DiddyLevel.InitializePlayer(player, playerData)
end)

-- Example 3: Create a custom leveling method
local customMethod = {
    Name = "KillXP",
    Callback = function(player, amount)
        DiddyLevel.AwardXP(player, amount)
    end
}

DiddyLevel.CreateLevelMethod(customMethod)

-- Example 4: Apply methods to a player's character
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        DiddyLevel.ApplyMethods(player, character)
    end)
end)

-- Example 5: Award XP directly
local player = game.Players:GetPlayers()[1]
if player then
    DiddyLevel.AwardXP(player, 50)
end
```
