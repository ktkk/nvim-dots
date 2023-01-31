local options = {
    mouse = "a",

    tabstop = 2,
    shiftwidth = 2,
    smartindent = true,
    splitright = true,
    autoindent = true,
    expandtab = true,

    number = true,
    relativenumber = true,
    numberwidth = 3,
    signcolumn = "yes:1",

    scrolloff = 8,
    wrap = true,
    ruler = true,

    hidden = true,

    updatetime = 500,
    showmode = false,
    termguicolors = true,

    list = true,
    listchars = {
        tab = "→ ",
        space = "·",
        trail = "+",
        nbsp = "␣",
        precedes = "⇥",
        extends = "⇤"
    },
}

for key, value in pairs(options) do
    vim.opt[key] = value
end