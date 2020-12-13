local cmd = vim.api.nvim_command
local eval = vim.api.nvim_eval

local function _cmd_wrap(command)
	return function() cmd(command) end
end

local function _to_char(val)
	return eval('"\\'..val..'"')
end

local _combos = {  }

local function _combo_link(new, existing)
	_combos[new] = _combos[existing]
end


local function _wincmd(key)
  _combos[key] = _cmd_wrap('wincmd ' .. key)
end

-- moving cursor
_wincmd('h')
_wincmd('j')
_wincmd('k')
_wincmd('l')

-- moving windows
_wincmd('H')
_wincmd('J')
_wincmd('K')
_wincmd('L')

-- spitting and quiting
_wincmd('s')
_wincmd('v')
_wincmd('q')

-- resizing
_wincmd('+')
_wincmd('-')
_wincmd('>')
_wincmd('<')
_wincmd('=')

-- misc
_wincmd('o')
_wincmd('t')
_wincmd('w')
_wincmd('b')
_wincmd('p')
_wincmd('r')
_wincmd('x')
_wincmd('^')

_combo_link('d', 'q')
_combo_link('c', 'q')
_combo_link(_to_char('<C-l>'), '<')
_combo_link(_to_char('<C-h>'), '>')
_combo_link(_to_char('<C-j>'), '+')
_combo_link(_to_char('<C-k>'), '-')

return function()
	require('libmodal').mode.enter('WINDOWS', _combos)
end
