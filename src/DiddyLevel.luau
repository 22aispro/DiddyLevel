local replicated_storage = game:GetService("ReplicatedStorage")

local level_methods = require("@self/LevelMethods")
local level_handler = require("@self/LevelHandler")

local diddy_level = {}

function diddy_level.InitializeLevels(max_level: number)
	for level = 1, max_level do
		level_handler.CreateLevel({LevelRank = level, RequiredXP = math.floor(120 + 45 * level + 18 * (level ^ 1.45))})
	end
end

diddy_level.InitializePlayer = level_handler.OnPlayerAdded
diddy_level.AwardXP = level_handler.AwardXP

function diddy_level.CreateLevelMethod(method_data: level_methods.LevelingMethod)
	level_methods:connect(method_data)
end

function diddy_level.ForceMethod(key, plr, char, extra_args)
	level_methods:ForceMethod(key, plr, char, extra_args)
end

return diddy_level
