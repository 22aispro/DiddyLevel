local replicated_storage = game:GetService("ReplicatedStorage")

local level_methods = require(script:WaitForChild('LevelMethods'))
local level_handler = require(script:WaitForChild('LevelHandler'))

local diddy_level = {}

function diddy_level.InitializeLevels(level_list: {level_handler.Level})
	for _, level in level_list do
		level_handler.CreateLevel(level)
	end
end

function diddy_level.InitializePlayer(plr: Player, data: level_handler.PlayerLevelObject)
	return level_handler.OnPlayerAdded(plr, data)
end

function diddy_level.CreateLevelMethod(method_data: level_methods.LevelingMethod)
	level_methods:connect(method_data)
end

function diddy_level.AwardXP(plr, xp)
	level_handler.AwardXP(plr, xp)
end

function diddy_level.ForceMethod(plr, char, extra_args)
	level_methods:ForceMethod(plr, char, extra_args)
end

return diddy_level
