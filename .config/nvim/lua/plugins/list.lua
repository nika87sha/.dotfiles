local function load_config(package)
    return function()
        require('plugins.' .. package)
    end
end

local plugins = {
    -- UI
    {
        'navarasu/onedark.nvim',
        -- config = load_config('ui.onedark'),
        lazy = false,
        priority = 1000,
    },
    {
        'folke/tokyonight.nvim',
        config = load_config('ui.onedark'),
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        config = load_config('ui.snacks'),
    },
    {
        'nvim-lualine/lualine.nvim',
        config = load_config('ui.lualine'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'stevearc/dressing.nvim',
        config = load_config('ui.dressing'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Language
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
            'mfussenegger/nvim-dap-python',
            'jay-babu/mason-nvim-dap.nvim',
        },
        config = load_config('lang.dap'),
        ft = { 'python' },
        cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
    },

    {
        'puremourning/vimspector', -- Alternativa a nvim-dap para depuración en C/C++
        cmd = { 'VimspectorInstall', 'VimspectorUpdate' },
    },
    {
        'mfussenegger/nvim-jdtls',
        config = load_config('lang.jdtls'),
        ft = { 'java' },
    },

<<<<<<< HEAD
    {
        'turbio/bracey.vim',
        build = 'npm install --prefix server',
        cmd = 'Bracey',
    },

=======
>>>>>>> 95c8fec (update config neovim)
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'olimorris/neotest-rspec',
            'nvim-neotest/neotest-jest',
            'nvim-neotest/neotest-python',
        },
        config = load_config('lang.neotest'),
        cmd = 'Neotest',
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        config = load_config('lang.sniprun'),
        cmd = 'SnipRun',
    },

    {
        'akinsho/toggleterm.nvim',
        config = function()
            require('toggleterm').setup({})
        end,
    },
    {
        'ThePrimeagen/refactoring.nvim',
        config = load_config('lang.refactoring'),
    },
    {
        'windwp/nvim-autopairs',
        config = load_config('lang.autopairs'),
        event = 'InsertEnter',
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = load_config('lang.surround'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.ai',
        version = '*',
        config = load_config('lang.ai'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-endwise',
            'RRethy/nvim-treesitter-textsubjects',
            'windwp/nvim-ts-autotag',
        },
        config = load_config('lang.treesitter'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown', 'quarto' },
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'saghen/blink.cmp',
        },
        config = load_config('lang.lspconfig'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
    },
    {
        'nvimdev/lspsaga.nvim',
        config = load_config('lang.lspsaga'),
        event = 'LspAttach',
    },
    {
        'williamboman/mason.nvim',
        config = load_config('lang.mason'),
        cmd = 'Mason',
    },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'jay-babu/mason-null-ls.nvim' },
        config = load_config('lang.null-ls'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Completion
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets', 'giuxtaposition/blink-cmp-copilot' },
        version = '*',
        config = load_config('lang.blink'),
        opts_extend = { 'sources.default' },
        event = { 'InsertEnter' },
    },
    {
        'zbirenbaum/copilot.lua',
        dependencies = { 'giuxtaposition/blink-cmp-copilot' },
        config = load_config('lang.copilot'),
        event = 'InsertEnter',
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            { 'zbirenbaum/copilot.lua' },
            { 'nvim-lua/plenary.nvim' },
        },
        branch = 'main',
        build = 'make tiktoken', -- Only on MacOS or Linux
        cmd = {
            'CopilotChat',
            'CopilotChatToggle',
            'CopilotChatDocs',
            'CopilotChatExplain',
            'CopilotChatFix',
            'CopilotChatFixDiagnostic',
            'CopilotChatCommit',
            'CopilotChatCommitStaged',
            'CopilotChatLoad',
            'CopilotChatOptimize',
            'CopilotChatReview',
            'CopilotChatSave',
            'CopilotChatTests',
        },
        config = load_config('lang.copilot-chat'),
    },

    -- Tools
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = load_config('tools.nvim-tree'),
        cmd = 'NvimTreeToggle',
    },
    {
        'windwp/nvim-spectre',
        config = load_config('tools.spectre'),
        cmd = 'Spectre',
    },
    {
        'abecodes/tabout.nvim',
        config = load_config('tools.tabout'),
        event = 'InsertEnter',
    },
    {
        'folke/flash.nvim',
        config = load_config('tools.flash'),
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').jump()
                end,
                desc = 'Flash',
            },
            {
                'S',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').treesitter()
                end,
                desc = 'Flash Treesitter',
            },
        },
    },
    {
        'numToStr/Navigator.nvim',
        config = load_config('tools.navigator'),
        event = function()
            if vim.fn.exists('$TMUX') == 1 then
                return 'VeryLazy'
            end
        end,
    },
    {
        'm4xshen/hardtime.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('hardtime').setup({ enabled = true })
        end,
        cmd = 'Hardtime',
    },
    {
        'chrisgrieser/nvim-spider',
        config = load_config('tools.spider'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'folke/which-key.nvim',
        config = load_config('tools.which-key'),
        event = 'VeryLazy',
    },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = 'markdown',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
    },
    {
        'uga-rosa/ccc.nvim',
        config = load_config('tools.ccc'),
        cmd = { 'CccHighlighterToggle', 'CccConvert', 'CccPick' },
    },
    {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
        -- dir = '~/Projects/2KAbhishek/termim.nvim',
    },
    {
        '2kabhishek/tdo.nvim',
        dependencies = 'nvim-telescope/telescope.nvim',
        cmd = { 'Tdo', 'TdoEntry', 'TdoNote', 'TdoTodos', 'TdoToggle', 'TdoFind', 'TdoFiles' },
        keys = { '[t', ']t' },
        -- dir = '~/Projects/2KAbhishek/tdo.nvim',
    },
    {
        'kndndrj/nvim-dbee',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        build = function()
            --    "curl", "wget", "bitsadmin", "go"
            require('dbee').install('curl')
        end,
        config = load_config('tools.dbee'),
        cmd = 'DBToggle',
        enabled = false,
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            'debugloop/telescope-undo.nvim',
        },
        config = load_config('tools.telescope'),
        cmd = 'Telescope',
    },
    {
        -- 'chentoast/marks.nvim',
        '2kabhishek/markit.nvim',
        config = load_config('tools.marks'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        '2kabhishek/nerdy.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'Nerdy',
        -- dir = '~/Projects/2KAbhishek/nerdy.nvim',
    },

    -- Git
    {
        '2kabhishek/co-author.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'CoAuthor',
        -- dir = '~/Projects/2KAbhishek/co-author.nvim/',
    },
    {
        '2kabhishek/utils.nvim',
        cmd = 'UtilsClearCache',
        -- dir = '~/Projects/2KAbhishek/utils.nvim/',
    },
    {
        '2kabhishek/exercism.nvim',
        cmd = {
            'ExercismLanguages',
            'ExercismList',
            'ExercismSubmit',
            'ExercismTest',
        },
        keys = {
            '<leader>exa',
            '<leader>exl',
            '<leader>exs',
            '<leader>ext',
        },
        dependencies = {
            '2kabhishek/utils.nvim',
            'stevearc/dressing.nvim',
            '2kabhishek/termim.nvim',
        },
        config = load_config('tools.exercism'),
        -- opts = {},
        -- dir = '~/Projects/2KAbhishek/exercism.nvim/',
    },
    {
        '2kabhishek/octohub.nvim',
        cmd = {
            'OctoRepos',
            'OctoReposByCreated',
            'OctoReposByForks',
            'OctoReposByIssues',
            'OctoReposByLanguages',
            'OctoReposByNames',
            'OctoReposByPushed',
            'OctoReposBySize',
            'OctoReposByStars',
            'OctoReposByUpdated',
            'OctoReposTypeArchived',
            'OctoReposTypeForked',
            'OctoReposTypePrivate',
            'OctoReposTypeStarred',
            'OctoReposTypeTemplate',
            'OctoRepo',
            'OctoStats',
            'OctoActivityStats',
            'OctoContributionStats',
            'OctoRepoStats',
            'OctoProfile',
            'OctoRepoWeb',
        },
        keys = {
            '<leader>goa',
            '<leader>goA',
            '<leader>gob',
            '<leader>goc',
            '<leader>gof',
            '<leader>goF',
            '<leader>gog',
            '<leader>goi',
            '<leader>gol',
            '<leader>goo',
            '<leader>gop',
            '<leader>goP',
            '<leader>gor',
            '<leader>gos',
            '<leader>goS',
            '<leader>got',
            '<leader>goT',
            '<leader>gou',
            '<leader>goU',
            '<leader>gow',
        },
        dependencies = {
            '2kabhishek/utils.nvim',
            'nvim-telescope/telescope.nvim',
        },
        config = load_config('tools.octohub'),
        -- dir = '~/Projects/2KAbhishek/octohub.nvim/',
    },
    {
        'ruifm/gitlinker.nvim',
        config = load_config('tools.gitlinker'),
        keys = '<leader>yg',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = load_config('tools.gitsigns'),
        cmd = 'Gitsigns',
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git',
    },
}

local treesitter_parsers = {
    'bash',
    'css',
    'dart',
    'elixir',
    'gitcommit',
    'go',
    'html',
    'lemminx',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline', -- markdown code blocks
    'python',
    'ruby',
    'rust',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
    'C',
    'cpp',
}

local null_ls_sources = {
    'shellcheck', -- bash lint
    'cpplint', -- Linter para C y C++
    'black', -- Formateador
    'isort', -- ordenador de importaciones
    'shfmt',
}

local lsp_servers = {
    'bashls',
    'jsonls',
    'lua_ls',
    'typos_lsp', -- check typos
    'vimls',
    'clangd',
    'pyright', -- alternativa mas potente a pylsp
}

local util = require('lib.util')

if util.is_present('npm') then
    table.insert(lsp_servers, 'eslint')
    table.insert(lsp_servers, 'ts_ls')
end

if util.is_present('gem') then
    local ror_nvim = {
        'weizheheng/ror.nvim',
        branch = 'main',
        ft = 'ruby',
        config = load_config('lang.ror'),
        keys = {
            {
                '<leader>rc',
                mode = { 'n' },
                function()
                    vim.cmd('RorCommands')
                end,
                desc = 'Rails Commands',
            },
        },
    }
    local vim_rails = {
        'tpope/vim-rails',
        ft = 'ruby',
    }

    table.insert(lsp_servers, 'solargraph')
    -- table.insert(lsp_servers, 'ruby_lsp')
    table.insert(lsp_servers, 'rubocop')
    table.insert(plugins, ror_nvim)
    table.insert(plugins, vim_rails)
    table.insert(null_ls_sources, 'black') -- Formateador
    table.insert(null_ls_sources, 'isort') -- Ordenador de importaciones
    table.insert(treesitter_parsers, 'c')
    table.insert(treesitter_parsers, 'cpp')
    table.insert(null_ls_sources, 'cpplint') -- Linter para C y C++
    table.insert(lsp_servers, 'clangd') -- LSP para C y C++
    table.insert(null_ls_sources, 'shfmt') -- Formateador de Bash
end

if util.is_present('go') then
    table.insert(lsp_servers, 'gopls')
end

if util.is_present('dart') then
    table.insert(lsp_servers, 'dartls')
end

if util.is_present('java') then
    table.insert(lsp_servers, 'jdtls')
end

if util.is_present('pip') then
    table.insert(lsp_servers, 'ruff')
    table.insert(lsp_servers, 'pyright')
end

if util.is_present('mix') then
    table.insert(lsp_servers, 'elixirls')
end

if util.is_present('cargo') then
    table.insert(lsp_servers, 'rust_analyzer')
end

return {
    plugins = plugins,
    lsp_servers = lsp_servers,
    null_ls_sources = null_ls_sources,
    ts_parsers = treesitter_parsers,
}
