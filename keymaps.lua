local function keymap(mode, lhs, rhs, additional_options)
	local options = {
		noremap = true,
		silent = true,
	}
	if additional_options then
		options = vim.tbl_extend("force", options, additional_options)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

keymap('n', "<C-t>", ":sp | term<CR>") -- Open term with C-t
keymap('t', "<Esc><Esc>", "<C-\\><C-n>")

keymap('n', "<M-j>", ":m .+1<CR>==") -- Visual Studio style line moving
keymap('n', "<M-k>", ":m .-2<CR>==")
keymap('v', "<M-j>", ":m '>+1<CR>gv=gv")
keymap('v', "<M-k>", ":m '>-2<CR>gv=gv")

keymap('n', "<C-b>", ":make<CR>") -- Invoke make with C-b

keymap('v', "<C-c>", "\"*y :let @+=@*<CR>") -- Invoke regular copy with C-c
