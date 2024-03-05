local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save file and quit
keymap.set('n', '<Leader>w', ':update<Return>', opts)
keymap.set('n', '<Leader>q', ':quit<Return>', opts)
keymap.set('n', '<Leader>Q', ':qa<Return>', opts)

-- File explorer with NvimTree
keymap.set('n', '<Leader>f', ':NvimTreeFindFile<Return>', opts)
keymap.set('n', '<Leader>t', ':NvimTreeToggle<Return>', opts)

-- Tabs
keymap.set('n', 'te', ':tabedit')
keymap.set('n', '<tab>', ':tabnext<Return>', opts)
keymap.set('n', '<s-tab>', ':tabprev<Return>', opts)
keymap.set('n', 'tw', ':tabclose<Return>', opts)

-- Split window
keymap.set('n', 'ss', ':split<Return>', opts)
keymap.set('n', 'sv', ':vsplit<Return>', opts)

-- Move window
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-S-h>', '<C-w><')
keymap.set('n', '<C-S-l>', '<C-w>>')
keymap.set('n', '<C-S-k>', '<C-w>+')
keymap.set('n', '<C-S-j>', '<C-w>-')

-- Diagnostics
keymap.set('n', '<C-j>', function()
    vim.diagnostic.goto_next()
end, opts)

-- Open compiler
vim.api.nvim_set_keymap('n', '<F6>', '<cmd>CompilerOpen<cr>', { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap(
    'n',
    '<S-F6>',
    '<cmd>CompilerStop<cr>' -- (Optional, to dispose all tasks before redo)
        .. '<cmd>CompilerRedo<cr>',
    { noremap = true, silent = true }
)

-- Toggle compiler results
vim.api.nvim_set_keymap('n', '<S-F7>', '<cmd>CompilerToggleResults<cr>', { noremap = true, silent = true })
