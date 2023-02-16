local present1, mason = pcall(require, "mason")
local present2, mason_lspconfig = pcall(require, "mason-lspconfig")
local present3, lspconfig = pcall(require, "lspconfig")
local present4, lspsignature = pcall(require, "lsp_signature")
if not (present1 or present2 or present3 or present4) then
    return
end

local function on_attach(client, bufnr)
end

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        "html",
        "clangd",
        "cmake",
        "cssls",
        "jedi_language_server",
        "lua_ls",
        "denols",
        "rust_analyzer",
    },
})

lspconfig.html.setup({
    on_attach = on_attach,
    single_file_support = true,
})
lspconfig.clangd.setup({
    on_attach = on_attach,
    single_file_support = true,
})
lspconfig.cmake.setup({
    on_attach = on_attach,
    single_file_support = true,
})
lspconfig.cssls.setup({
    on_attach = on_attach,
    single_file_support = true,
})
lspconfig.jedi_language_server.setup({
    on_attach = on_attach,
    single_file_support = true,
})
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    single_file_support = true,
})
lspconfig.tsserver.setup({
    on_attach = on_attach,
    -- root_dir = lspconfig.util.root_pattern("package.json"),
    single_file_support = true,
})
lspconfig.denols.setup({
    on_attach = on_attach,
    root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
})
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    single_file_support = true,
})

lspsignature.setup()
