require('core.options')
require('core.functions')
require('core.keymaps')
require('core.autocmd')
require('plugins.lazy')
require('plugins.lang.neodev')
require('plugins.lang.lsp-zero')
require'lspconfig'.pyright.setup{}