local present1, tree = pcall(require, "nvim-tree")
local present2, tree_c = pcall(require, "nvim-tree.config")
if not (present1 or present2) then
	return
end

local tree_cb = tree_c.nvim_tree_callback

local tree_mappings = {
	{ key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
	{ key = {"<2-RightMouse>", "<C-]>"}, cb = tree_cb("cd") },
	{ key = "<C-v>", cb = tree_cb("vsplit") },
	{ key = "<C-x>", cb = tree_cb("split") },
	{ key = "<C-t>", cb = tree_cb("tabnew") },
	{ key = "<", cb = tree_cb("prev_sibling") },
	{ key = ">", cb = tree_cb("next_sibling") },
	{ key = "P", cb = tree_cb("parent_node") },
	{ key = "<BS>", cb = tree_cb("close_node") },
	{ key = "<S-CR>", cb = tree_cb("close_node") },
	{ key = "<Tab>", cb = tree_cb("preview") },
	{ key = "K", cb = tree_cb("first_sibling") },
	{ key = "J", cb = tree_cb("last_sibling") },
	{ key = "I", cb = tree_cb("toggle_ignored") },
	{ key = "H", cb = tree_cb("toggle_dotfiles") },
	{ key = "R", cb = tree_cb("refresh") },
	{ key = "a", cb = tree_cb("create") },
	{ key = "d", cb = tree_cb("remove") },
	{ key = "r", cb = tree_cb("rename") },
	{ key = "<C->", cb = tree_cb("full_rename") },
	{ key = "x", cb = tree_cb("cut") },
	{ key = "c", cb = tree_cb("copy") },
	{ key = "p", cb = tree_cb("paste") },
	{ key = "y", cb = tree_cb("copy_name") },
	{ key = "Y", cb = tree_cb("copy_path") },
	{ key = "gy", cb = tree_cb("copy_absolute_path") },
	{ key = "[c", cb = tree_cb("prev_git_item") },
	{ key = "}c", cb = tree_cb("next_git_item") },
	{ key = "-", cb = tree_cb("dir_up") },
	{ key = "q", cb = tree_cb("close") },
	{ key = "g?", cb = tree_cb("toggle_help") }
}

tree.setup {
	quit_on_open       = true,
	disable_netrw      = true,
	hijack_netrw       = true,
	open_on_setup      = true,
	open_on_tab        = false,
	auto_open          = true,
	auto_close         = false,
	hijack_cursor      = true,
	hijack_unnamed_buffer_when_opening = false,
	highlight_opened_file = false,
	root_folder_modifier = table.concat {
		":t:gs?$/..",
		string.rep(" ", 1000),
		"?:gs?^??"
	},
	ignore_ft_on_setup = { "dashboard" },
	indent_markers     = true,
	add_trailing       = false,
	update_cwd         = true,
	update_to_bif_dir = {
		enable     = true,
		auto_open  = true,
	},
	filters = {
		dotfiles   = false,
		custom     = { ".git", ".cache" }
	},
	view = {
		width       = 25,
		side        = "left",
		auto_resize = false,
		mappings = {
			custom_only = false,
			list = tree_mappings,
		}
	},
	git = {
		ignore = true,
	},
	icons = {
		default = " ",
		symlink = "",
		git = {
			unstaged = "✗",
			staged = "✓",
			unmerged = "",
			renamed = "➜",
			untracked = "★",
			deleted = "",
			ignored = "◌",
		},
		folder = {
			default = "",
			open = "ﱮ",
			empty = "",
			empty_open = "",
			symlink = "",
			symlink_open = "",
		}
	},
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
	},
}

--vim.cmd("au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == 'NvimTree' | set laststatus=0 | else | set laststatus=2 | endif")
--vim.cmd("au VimEnter * NvimTreeOpen")
