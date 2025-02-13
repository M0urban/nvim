-- vim.o settings


--turn off highlights from previous searches
vim.o.hlsearch = false

-- line number stuff
vim.wo.number = true
vim.wo.relativenumber = true


-- highlights current line
vim.o.cursorline = true

-- always enable mouse
vim.o.mouse = 'a'

-- sync OS and Nvim clipboard
vim.o.clipboard = 'unnamedplus'

--line breaks have same indentation as previous line
vim.o.breakindent = true

-- saves undo history to file
vim.o.undofile = true

-- search case insensitive unless \C or capital letters used
vim.o.ignorecase = true
vim.o.smartcase = true

-- keep signcolumn on by default
vim.wo.signcolumn = 'yes'

vim.wo.cursorline = true
vim.wo.cursorcolumn = true

vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.bo.softtabstop = 4

-- how long till backup saved to disc
vim.o.updatetime = 250
vim.o.timeoutlen = 300

--show selection window even with only one selection and dont autoselect.
vim.o.completeopt = 'menuone,noselect'


vim.o.list = true
vim.o.listchars = 'eol:↵,trail:~,tab:>-,nbsp:␣'

--Remove trailing whitespaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

vim.o.termguicolors = true

--always keeps 8 lines at top or bottom of screen
vim.o.scrolloff = 8

vim.filetype.add({
  filename = {
    ['settings.json'] = 'jsonc',
    ['launch.json'] = 'jsonc',
  },
})

-- Check if we are in a WSL instance by cheking if 'WSL_DISTRO_NAME' variable exists
-- If so setup win32yank clipboard
if os.getenv('WSL_DISTRO_NAME') ~= nil then
 vim.g.clipboard = {
  name = "win32yank-wsl",
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf"
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf"
  },
  cache_enable = 0,
}
end
