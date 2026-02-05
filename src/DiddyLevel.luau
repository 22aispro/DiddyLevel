local replicated_storage = game:GetService("ReplicatedStorage")

local level_methods = require("@self/LevelMethods")
local level_handler = require("@self/LevelHandler")

local diddy_level = {}

function diddy_level.InitializeLevels(level_list: {level_handler.Level})
	for _, level in level_list do
		local level_data = {
			LevelRank = level;
			RequiredXP = level*100;
		}
		
		level_handler.CreateLevel(level_data)
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
