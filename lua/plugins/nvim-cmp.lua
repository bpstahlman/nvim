return {
  "hrsh7th/nvim-cmp",
  -- load cmp on BufEnter.
  -- Rationale: Default was InsertEnter, which forced me to enter insert, then reload the
  -- buffer before LSP client attached.
  event = "BufEnter",
  -- these dependencies will only be loaded when cmp loads
  -- dependencies are always lazy-loaded unless specified otherwise
  dependencies = {
    -- Note: lspconfig is loaded elsewhere...
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    -- BPS: The buffer source is just way too much happening as I type.
    -- BPS "hrsh7th/cmp-buffer",
    -- BPS: These 2 are kind of useful, but at least one of them messes up filename-modifiers (e.g., %:h).
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    -- Snips
    -- BPS TODO: Understand what this provides, exactly, and decide whether to keep.
    --"hrsh7th/cmp-vsnip",
    --"hrsh7th/vim-vsnip",
    -- For luasnip users.
    -- "L3MON4D3/LuaSnip",
    -- "saadparwaiz1/cmp_luasnip",
    --
    -- For mini.snippets users.
    -- "echasnovski/mini.snippets",
    -- "abeldekat/cmp-mini-snippets",
    --
    -- For ultisnips users.
    -- "SirVer/ultisnips",
    -- "quangnguyen30192/cmp-nvim-ultisnips",
    --
    -- For snippy users.
    -- "dcampos/nvim-snippy",
    -- "dcampos/cmp-snippy",
  },
  config = function()
    -- Set up nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)

          -- For `mini.snippets` users:
          -- local insert = MiniSnippets.config.expand.insert or MiniSnippets.default_insert
          -- insert({ body = args.body }) -- Insert at cursor
          -- cmp.resubscribe({ "TextChangedI", "TextChangedP" })
          -- require("cmp.config").set_onetime({ sources = {} })
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      } , {
        { name = 'buffer' },
      })
    })

    -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
    -- Set configuration for specific filetype.
    --[[
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' },
      }, {
        { name = 'buffer' },
      })
    })
    require("cmp_git").setup()
    ]]-- 

    --[[
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Issue: Path and/or cmdline sources break filename-modifiers (e.g., %:) and **.
    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      }),
      matching = { disallow_symbol_nonprefix_matching = false }
    })
    --]]
    -- Set up lspconfig.
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require'lspconfig'.clangd.setup {
      capabilities = capabilities
    }
    require'lspconfig'.lua_ls.setup {
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.loop.fs_stat(path..'/.luarc.json')
            or vim.loop.fs_stat(path..'/.luarc.jsonc') then
            return
          end
        end
        -- Workaround: Failure to remove your own config causes lua_ls to hang!!!
        -- See: https://github.com/neovim/nvim-lspconfig/issues/3189
        local runtime_files = vim.api.nvim_get_runtime_file("", true)
        --print(vim.inspect(runtime_files))
        for k, v in ipairs(runtime_files) do
          -- Strip the trailing slash, which won't appear in RUNTIMEPATH.
          if v == vim.fn.fnamemodify("~/.config/nvim/after", ":p:h")
            or v == vim.fn.fnamemodify("~/.config/nvim", ":p:h") then
            table.remove(runtime_files, k)
          end
        end
        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            --[[
            library = {
              vim.env.VIMRUNTIME
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            }
            --]]
            library = runtime_files,
            -- or pull in all of 'runtimepath'.
            -- NOTE: this is a lot slower and will cause issues when working on your own configuration
            -- (see https://github.com/neovim/nvim-lspconfig/issues/3189)
            -- library = vim.api.nvim_get_runtime_file("", true)
            -- lua language server is super confused when editing lua files in the config
            -- and raises a lot of [duplicate-doc-field] warnings

          }
        })
      end,
      settings = {
        Lua = {
          diagnostics = {
            -- Inhibit annoying warnings about undefined global 'vim' in init.lua.
            globals = { 'vim' }
          },
        }
      }
    }
  end,
}

-- vim:ts=2:sw=2:et:ai:si:tw=90
