local present, pets = pcall(require, "pets")
if not present then
    return
end

pets.setup({})
