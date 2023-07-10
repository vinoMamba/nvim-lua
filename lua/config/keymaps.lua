vim.g.mapleader = " "
local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }

local nmappings = {
	-- normal
	{ from = "S",             to = ":w<CR>" }, --save
	{ from = "Q",             to = ":q<CR>" }, --quit
	{ from = ";",             to = ":",                                                   mode = mode_nv },
	{ from = "Y",             to = "\"+y",                                                mode = mode_v },
	{ from = "`",             to = "~",                                                   mode = mode_nv },
	{ from = "jk",            to = "<Esc>",                                               mode = mode_i }, -- quit insert mode
	-- move
	{ from = "K",             to = "5k",                                                  mode = mode_nv },
	{ from = "J",             to = "5j",                                                  mode = mode_nv },
	{ from = "L",             to = "$",                                                   mode = mode_nv },
	{ from = "H",             to = "^",                                                   mode = mode_nv },

	-- split window
	{ from = "<leader>w",     to = "<C-w>w", },
	{ from = "<leader>k",     to = "<C-w>k", },
	{ from = "<leader>j",     to = "<C-w>j", },
	{ from = "<leader>h",     to = "<C-w>h", },
	{ from = "<leader>l",     to = "<C-w>l", },
	{ from = "<leader>o",     to = "<C-w>o", },
	{ from = "s",             to = "<nop>", },
	{ from = "sj",            to = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", },
	{ from = "sk",            to = ":set splitbelow<CR>:split<CR>", },
	{ from = "sl",            to = ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", },
	{ from = "sh",            to = ":set splitright<CR>:vsplit<CR>", },
	{ from = "<up>",          to = ":res +5<CR>", },
	{ from = "<down>",        to = ":res -5<CR>", },
	{ from = "<left>",        to = ":vertical resize-5<CR>", },
	{ from = "<right>",       to = ":vertical resize+5<CR>", },
	{ from = "srh",           to = "<C-w>b<C-w>K", },
	{ from = "srv",           to = "<C-w>b<C-w>H", },
	-- others
	{ from = "<leader><CR>",  to = ":nohlsearch<CR>" },
	{ from = "<leader>jo",    to = ":Joshuto<CR>" },

	--tabline
	{ from = "<leader><Tab>", to = ":tabe<CR>", },
	{ from = "ts",            to = ":tab split<CR>", },
	{ from = "-",             to = ":-tabnext<CR>", },
	{ from = "=",             to = ":+tabnext<CR>", },
	{ from = "tm-",           to = ":-tabmove<CR>", },
	{ from = "tm=",           to = ":+tabmove<CR>", },
}

for _, mapping in ipairs(nmappings) do
	vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end
