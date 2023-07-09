local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local limitStr = function(str)
	if #str > 25 then
		str = string.sub(str, 1, 22) .. "..."
	end
	return str
end

local M = {}

M.config = {
	"hrsh7th/nvim-cmp",
	-- after = "SirVer/ultisnips"
	dependencies = {
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		{
			"onsails/lspkind.nvim",
			lazy = false,
			config = function()
				require("lspkind").init()
			end
		},
		{
			"quangnguyen30192/cmp-nvim-ultisnips",
			config = function()
				require("cmp_nvim_ultisnips").setup {}
			end,
		}
	}
}

M.configfunc = function()
	local lspkind = require("lspkind")
	-- vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
	local cmp = require("cmp")
	local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

	-- setCompHL()
	cmp.setup({
		preselect = cmp.PreselectMode.None,
		snippet = {
			expand = function(args)
				vim.fn["UltiSnips#Anon"](args.body)
			end,
		},
		window = {
			completion = {
				col_offset = -3,
				side_padding = 0,
			},
			documentation = cmp.config.window.bordered(),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			maxwidth = 60,
			maxheight = 10,
			format = function(entry, vim_item)
				local kind = lspkind.cmp_format({
					mode = "symbol_text",
					symbol_map = { Codeium = "", },
				})(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. (strings[1] or "") .. " "
				kind.menu = limitStr(entry:get_completion_item().detail or "")

				return kind
			end,
		},
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
			{ name = "buffer" },
		}, {
			{ name = "path" },
			{ name = "nvim_lua" },
			{ name = "calc" },
		}),
		mapping = cmp.mapping.preset.insert({
			['<C-o>'] = cmp.mapping.complete(),
			["<c-e>"] = cmp.mapping(
				function()
					cmp_ultisnips_mappings.compose { "expand", "jump_forwards" } (function() end)
				end,
				{ "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
			),
			["<c-n>"] = cmp.mapping(
				function(fallback)
					cmp_ultisnips_mappings.jump_backwards(fallback)
				end,
				{ "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
			),
			['<c-f>'] = cmp.mapping({
				i = function(fallback)
					cmp.close()
					fallback()
				end
			}),
			['<c-y>'] = cmp.mapping({ i = function(fallback) fallback() end }),
			['<CR>'] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					else
						fallback()
					end
				end
			}),
			["<Tab>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end,
			}),
			["<S-Tab>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() then
						cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
					else
						fallback()
					end
				end,
			}),
		}),
	})
end


return M
