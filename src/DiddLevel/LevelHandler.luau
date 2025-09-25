export type Level = {
	LevelRank: number;
	RequiredXP: number;
}

export type PlayerLevelObject = {
	Linked: Player;
	Current: Level;
	CurrentXP: number;
	NextLevel: Level?;
}

local level_handler = {
	["all_levels"] = {};
	["plrs"] = {};
}

function level_handler.OnPlayerAdded(plr, data: PlayerLevelObject)
	data = data or {
		Linked = plr;
		Current = level_handler.all_levels[1];
		CurrentXP = 0;
		NextLevel = level_handler.all_levels[2];
	}
	if level_handler.plrs[data.Linked.Name] then
		warn(`Player ({data.Linked.Name}) already exists in the level handler`)
		return
	end
	level_handler.plrs[data.Linked.Name] = data
	
	print(level_handler.plrs)
end

function level_handler.CreateLevel(data: {LevelRank: number, RequiredXP: number})
	for i, v: Level in level_handler.all_levels do
		if v.LevelRank == data.LevelRank then
			return
		elseif v.RequiredXP == data.RequiredXP then
			return
		end
	end
	
	level_handler.all_levels[data.LevelRank] = data
	print(level_handler.all_levels)
end;

function level_handler.LevelUp(plr)
	local plr_data = level_handler.plrs[plr.Name]
	
	local new_level: Level = plr_data.NextLevel
	local next_level: Level = new_level.LevelRank+1

	if not level_handler.all_levels[new_level.LevelRank] then
		warn(`Level {new_level} does not exist`)
		return
	elseif level_handler.all_levels[next_level] then
		warn(`Level {next_level} does not exist`)
		return
	end
	
	plr_data.Current = new_level
	plr_data.NextLevel = level_handler.all_levels[next_level]
	
	print(plr_data)
end

function level_handler.AwardXP(plr: Player, XP: number)
	local plr_data = level_handler.plrs[plr.Name]
	if not plr_data.NextLevel then
		warn(`Next level doesnt exist; XP not awarded`)
		return
	end
	
	plr_data.CurrentXP = plr_data.CurrentXP + XP
	
	local current_xp = plr_data.CurrentXP
	print(current_xp)
	
	if current_xp >= plr_data.NextLevel.RequiredXP then
		level_handler.LevelUp(plr)
	end
end

return level_handler
