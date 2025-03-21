local nvim_tree = require('nvim-tree')
local Snacks = require('snacks')

local icons = require('lib.icons')

local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return {
            desc = 'nvim-tree: ' .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set('n', 'Y', api.fs.copy.filename, opts('Copy Name'))
    vim.keymap.set('n', 'y', api.fs.copy.relative_path, opts('Copy Relative Path'))
    vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'o', api.node.open.horizontal, opts('Open: Horizontal Split'))
end

local prev = { new_name = '', old_name = '' } -- Prevents duplicate events
vim.api.nvim_create_autocmd('User', {
    pattern = 'NvimTreeSetup',
    callback = function()
        local events = require('nvim-tree.api').events
        events.subscribe(events.Event.NodeRenamed, function(data)
            if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
                data = data
                Snacks.rename.on_rename_file(data.old_name, data.new_name)
            end
        end)
    end,
})

nvim_tree.setup({
    on_attach = on_attach,
    hijack_directories = { enable = true },
    update_cwd = true,
    filters = {
        dotfiles = true,
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = 'none',
        root_folder_modifier = ':p',
        width = 30,
        indent_markers = {
            enable = false,
            icons = { corner = icons.ui.Corner, edge = icons.ui.Edge, none = icons.ui.Edge },
        },
        icons = {
            webdev_colors = true,
            git_placement = 'before',
            padding = ' ',
            symlink_arrow = icons.ui.Arrow,
            show = { file = true, folder = true, folder_arrow = true, git = true },
            glyphs = {
                default = icons.documents.File,
                symlink = icons.documents.SymLink,
                folder = {
                    arrow_open = icons.ui.ArrowOpen,
                    arrow_closed = icons.ui.ArrowClosed,
                    default = icons.documents.Folder,
                    open = icons.documents.OpenFolder,
                    empty = icons.documents.FolderEmpty,
                    empty_open = icons.documents.OpenFolderEmpty,
                    symlink = icons.documents.SymlinkFolder,
                    symlink_open = icons.documents.SymlinkFolder,
                },
                git = {
                    unstaged = icons.git.Mod,
                    staged = icons.git.Add,
                    unmerged = icons.git.Diff,
                    renamed = icons.git.Rename,
                    untracked = icons.git.Untrack,
                    deleted = icons.git.Remove,
                    ignored = icons.git.Ignore,
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        icons = {
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
            warning = icons.diagnostics.Warning,
            error = icons.diagnostics.Error,
        },
    },
    update_focused_file = { enable = true, update_cwd = true, ignore_list = {} },
    git = { enable = true, ignore = true, timeout = 500 },
    view = {
        width = 50,
        side = 'left',
        adaptive_size = true,
        number = true,
        relativenumber = true,
    },
})
