local present1, lspconfig = pcall(require, "lspconfig")
local present2, lspinstall = pcall(require, "nvim-lsp-installer")
local present3, lspsignature = pcall(require, "lsp_signature")
if not (present1 or present2 or present3) then
    return
end

local function on_attach(client, bufnr)
end

lspinstall.setup()

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
lspconfig.sumneko_lua.setup({
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
