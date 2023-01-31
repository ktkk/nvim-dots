local function minimap_opt(key, value)
	vim.g["minimap_" .. key] = value
end

minimap_opt("width", 10);
minimap_opt("auto_start", 1);
minimap_opt("auto_start_win_enter", 1);
