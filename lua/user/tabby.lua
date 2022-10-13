vim.api.nvim_set_keymap("n", "<A-t>", ":tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-S-t>", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Tab>", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })

local tabline = require 'tabby.tabline'
local api = require 'tabby.module.api'

local theme = {
	fill = { fg = '#f7fff7', bg = '#181818' },
    head = { fg = '#ff6b6b', bg = '#292f36' },
    current_tab = { fg = '#ffffff', bg = '#bac2de' },
    tab = { fg = '#a6e3a1', bg = '#292f36' },
}

local tab_name = function(tab)
	local cur_win = api.get_tab_current_win(tab.id)
	if api.is_float_win(cur_win) then
		return '[Floating]'
	end
	local current_bufnr = vim.fn.getwininfo(cur_win)[1].bufnr
	local current_bufinfo = vim.fn.getbufinfo(current_bufnr)[1]
	local current_buf_name = vim.fn.fnamemodify(current_bufinfo.name, ':t')
	if current_buf_name == '' then
		return '[Empty]'
	else
		return current_buf_name
	end
end

local change_mark = function(tab)
	local already_marked = false
	return tab.wins().foreach(function(win)
		local bufnr = vim.fn.getwininfo(win.id)[1].bufnr
		local bufinfo = vim.fn.getbufinfo(bufnr)[1]
		if not already_marked and bufinfo.changed == 1 then
			already_marked = true
			return ''
		else
			return ''
		end
	end)
end

local window_count = function(tab)
	local win_count = #api.get_tab_wins(tab.id)
	if win_count == 1 then
		return ''
	else
		return '[' .. win_count .. ']'
	end
end

tabline.set(function(line)
	return {
		{
			{ '', hl = theme.head },
			line.sep('', theme.head, theme.fill),
		},
		line.tabs().foreach(function(tab)
			local hl = tab.is_current() and theme.current_tab or theme.tab
			return {
				line.sep('', hl, theme.fill),
				tab_name(tab),
				change_mark(tab),
				window_count(tab),
				line.sep('', hl, theme.fill),
				hl = hl,
				margin = ' ',
			}
		end),
		hl = theme.fill,
	}
end, {
	buf_name = {
		mode = 'unique',
	},
})
