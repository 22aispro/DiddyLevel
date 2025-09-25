export type LevelingMethod = {
	key: string;
	xp: number;
	callback: () -> (any);
}

local level_methods = {}
level_methods.methods = {}

function level_methods:connect(data: LevelingMethod)
	level_methods.methods[data.key] = {
		key = data.key;
		xp = data.xp;
		callback = data.callback;
	}
end

function level_methods:ApplyMethods(player, char)
	while char do
		for _, method in level_methods.methods do
			if method.callback then
				method.callback(player, char)
			end
		end
		task.wait(1)
	end
end

function level_methods:disconnect(key: string)
	level_methods.methods[key] = nil
end

function level_methods:disconnect_all()
	level_methods.methods = {}
end

return level_methods
