# DiddyLevel
**Dynamic Leveling Module for Roblox**

- [https://create.roblox.com/store/asset/108116019548291/SRC](https://create.roblox.com/store/asset/132739858358239/SRC)

## Why us?
- We offer an easy to use leveling system so you don't have to make one from scratch.
- Handles XP and player progression automatically.
- Flexible enough to add your own custom leveling methods.

## Setup
- Place `DiddyLevel` in `ServerStorage`
- Include `LevelMethods` and `LevelHandler` inside `DiddyLevel`

## Features
- Track and award XP
- Flexible leveling system
- Works out of the box

## Usage Examples

### Initialize Levels
- Simply make a table of the levels you want and their required XP, and use DiddyLevel.InitializeLevels(Tbl) as shown below.
```luau
local levels = {
    {Level = 1, XPRequired = 0},
    {Level = 2, XPRequired = 100},
    {Level = 3, XPRequired = 250},
}

DiddyLevel.InitializeLevels(levels)
```
### Intialize Player
- To do this simply make a players.PlayerAdded connection
```luau
game.Players.PlayerAdded:Connect(function(player)
    local playerData = {Level = 1, XP = 0} -- PlayerLevelObject
    DiddyLevel.InitializePlayer(player, playerData)
end)
```
### Create custom leveling methods
- These are simply methods the player can use to gain XP
- You can do this by calling DiddyLevel.CreateLevelMethod(MethodInfo) MethodInfo is a table
```luau
local customMethod = {
   Key = "TestMethod";
    Callback = function(player, char, ...)
        DiddyLevel.AwardXP(player, amount (e.g. 5))
    end
}

DiddyLevel.CreateLevelMethod(customMethod)
```
### Apply all methods to a player
- This will allow the player to be able to execute level methods.
- This is the same player.PlayerAdded connection as in InitializePlayer
```lua
game.Players.PlayerAdded:Connect(function(player)
    -- player initializer code
    player.CharacterAdded:Connect(function(character)
        DiddyLevel.ForceMethod("TestMethod", player, character)
    end)
end)
```
### Award XP directly
- This can be done if you want to possible make a command to award XP
- The first argument will be the player that gets the XP, the second will be how much XP is awarded.
```lua
DiddyLevel.AwardXP(player, 5)
```



    
