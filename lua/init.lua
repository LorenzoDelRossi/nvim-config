local is_mac = vim.fn.has "macunix" == 1
local home_dir = "/home/lorenzodelrossi"
if is_mac then
    home_dir = "/Users/lorenzodelrossi"
end
-- pin nvim to a specific node version, regardless of the project
-- prereq - need to install: nvm i 16.17.1
local node_bin = "/.asdf/installs/nodejs/16.19.0/bin"
vim.g.node_host_prog = home_dir .. node_bin .. "/node"

-- for mason.nvim
-- prereq - install lsp server in that node/bin npm i -g typescript-language-server
-- (handled by :Mason currently)
vim.cmd("let $PATH = '" .. home_dir .. node_bin .. ":' . $PATH")

local init = function(settings)
    -- Require all lua packages
    for _, v in pairs(settings.packages) do
        require(v)
    end
end

return init({
    packages = {
        'lsp_config',
        'go',
        'finder',
        'terminal',
        'tree',
        -- 'tabnine-nvim',
    }
})
