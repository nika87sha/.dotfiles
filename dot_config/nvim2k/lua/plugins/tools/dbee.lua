local status_ok, dbee = pcall(require, 'dbee')
if not status_ok then
    return
end

dbee.setup {
    sources = {
        require("dbee.sources").EnvSource:new("NVIM_DB"),
         require("dbee.sources").MemorySource:new({
             {
                 name = "HelloSQL",
                 type = "mysql",
                 url = "mysql://root:mypassworddeprueba@localhost:4000/hellomysql?sslmode=disable"
             },
        }),
         require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/config.json"),
    },
}

vim.api.nvim_create_user_command('DBToggle', function()
    require('dbee').toggle()
end, {})
