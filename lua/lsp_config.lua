local nvim_lsp = require('lspconfig')

local configs = require('lspconfig/configs')
local util = require('lspconfig/util')

local path = util.path

vim.g.coq_settings = { 
  auto_start = 'shut-up',
  completion = {
    always = true
  }
}

local coq = require("coq")
-- local completion = require('completion')

local status = require('lib.lsp_status')

require("trouble").setup {}

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
end

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  local match = vim.fn.glob(path.join(workspace, 'pyproject.toml'))

  print(workspace)
  print(match)

  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('poetry env info -p'))
    local new_path = path.join(venv, 'bin', 'python')

    print(venv)
    print(new_path)

    return new_path
  end

  -- Fallback to system Python.
  return exepath('python3') or exepath('python') or 'python'
end

-- Turn on status.
status.activate()

local custom_attach = function(client)
  -- completion.on_attach(client)
  status.on_attach(client)
end

-- Python
nvim_lsp.pyright.setup({
  on_init = function(client)
    local root_dir = client.config.root_dir
    client.config.settings.python.pythonPath = get_python_path(root_dir)
  end,
  on_attach = custom_attach
})

-- Golang
nvim_lsp.gopls.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
}))

-- VimScript
nvim_lsp.vimls.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
}))

-- Lua
local sumneko_root_path
local system_name

if vim.fn.has("mac") == 1 then
  sumneko_root_path = "/Users/lorenzodelrossi/tmp/lua-language-server"
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  sumneko_root_path = "/home/lorenzodelrossi/tmp/lua-language-server"
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  sumneko_root_path = "S:/Dev/misc/lua-language-server"
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

nvim_lsp.lua_lsp.setup(coq.lsp_ensure_capabilities({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    },
  },
  on_attach = custom_attach,
}))

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

-- Typescript
nvim_lsp.tsserver.setup(coq.lsp_ensure_capabilities({
  on_attach = function(client)
    -- completion.on_attach(client)
    -- status.on_attach(client)

    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end

    client.server_capabilities.documentFormattingProvider = false
  end
}))

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end

-- nvim_lsp.efm.setup {
--   on_attach = function(client)
--     client.resolved_capabilities.document_formatting = true
--     client.resolved_capabilities.goto_definition = false
--     completion.on_attach(client)
--     status.on_attach(client)
--   end,
--   root_dir = function()
--     if not eslint_config_exists() then
--       return nil
--     end
--     return vim.fn.getcwd()
--   end,
--   settings = {
--     languages = {
--       javascript = {eslint},
--       javascriptreact = {eslint},
--       ["javascript.jsx"] = {eslint},
--       typescript = {eslint},
--       ["typescript.tsx"] = {eslint},
--       typescriptreact = {eslint}
--     }
--   },
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescript.tsx",
--     "typescriptreact"
--   },
-- }

-- Javascript static checker
nvim_lsp.flow.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
}))

-- HTML
nvim_lsp.html.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
}))

-- Rust
nvim_lsp.rust_analyzer.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importPrefix = "by_self",
      },
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      lens = {
        references = true,
        methodReferences = true,
      },
    }
  }
}))

-- Clang
nvim_lsp.clangd.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
}))

-- Json
nvim_lsp.jsonls.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
}))

-- PHP
nvim_lsp.intelephense.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
}))

-- LaTeX
nvim_lsp.texlab.setup(coq.lsp_ensure_capabilities({
  on_attach = custom_attach,
}))

-- Java
-- nvim_lsp.jdtls.setup({
--   on_attach = custom_attach,
-- })

-- Elixir
nvim_lsp.elixirls.setup(coq.lsp_ensure_capabilities({
  cmd = {"/usr/local/bin/elixir-ls/language_server.sh"},
  on_attach = custom_attach,
}))

-- LazyGit custom terminal
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "tab" })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})