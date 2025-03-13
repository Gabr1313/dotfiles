vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<BS>", "<Nop>")
vim.keymap.set({ "t" }, "<Esc><Esc>", "<c-\\><c-n>", { desc = "[Esc] terminal" })
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>", { desc = "Highlight toggle" })

-- vim.keymap.set("n", "<C-/>", function()
--     if vim.api.nvim_get_option_value('hlsearch', {}) == true then
--         vim.api.nvim_set_option_value('hlsearch', false, {})
--     else
--         vim.api.nvim_set_option_value('hlsearch', true, {})
--     end
-- end, { desc = "Highlight toggle" })

vim.keymap.set("n", "<C-/>", "/\\c", { desc = "Change directory" })
vim.keymap.set("n", "<C-S-/>", "?\\", { desc = "Change directory" })

vim.keymap.set("n", "<leader>cd", "<cmd>cd %:h<CR>", { desc = "Change directory" })
vim.keymap.set("n", "<leader>t", [[<cmd>%s/\s\+$//e<CR>]], { desc = "Remove trailing spaces" })

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Lua execute file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Lua execute line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Lua execute highlighted" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "[J]oin line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "1/2 page [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "1/2 page [U]p" })
vim.keymap.set("n", "n", "nzzzv", { desc = "n" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "N" })

vim.keymap.set("x", "<leader>d", [["_d]], { desc = "[D]elete no yank" }) -- in normal mode I use 'd' to debug
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]ut no yank" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[Y]ank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank to clipboard" })

vim.keymap.set("n", "<C-c>", function()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("copen")
	-- vim.cmd("wincmd p")
end, { desc = "Quickfix list toggle" })
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz", { desc = "Quickfix list [P]revious" })
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz", { desc = "Quickfix list [N]ext" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })

vim.keymap.set("n", "<C-Up>", "4<C-w>+", { desc = "Resize window vertically" })
vim.keymap.set("n", "<C-Down>", "4<C-w>-", { desc = "Change window smaller vertically" })
vim.keymap.set("n", "<C-Right>", "4<C-w>>", { desc = "Change window bigger horizontally" })
vim.keymap.set("n", "<C-Left>", "4<C-w><", { desc = "Change window smaller horizontally" })
vim.keymap.set("n", "<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubsitute [E]nd" })
vim.keymap.set("n", "<leader>sb", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "[S]ubsitute [B]eginning" })

vim.keymap.set("n", "<leader>zm", "<cmd>set foldmethod=marker<CR>", { desc = "[Z]fold [M]arker" })

local function wrap_on()
	vim.opt.wrap = true
	vim.keymap.set({"n", "v"}, "j", "gj", { noremap = true, desc = "[j]  wrapping on" })
	vim.keymap.set({"n", "v"}, "k", "gk", { noremap = true, desc = "[k]  wrapping on" })
	vim.keymap.set({"n", "v"}, "$", "g$", { noremap = true, desc = "[$]  wrapping on" })
	vim.keymap.set({"n", "v"}, "0", "g0", { noremap = true, desc = "[0]  wrapping on" })
	vim.keymap.set({"n", "v"}, "^", "g^", { noremap = true, desc = "[^]  wrapping on" })
	vim.keymap.set({"n", "v"}, "_", "g_", { noremap = true, desc = "[_]  wrapping on" })
	vim.keymap.set({"n", "v"}, "gj", "j", { noremap = true, desc = "[gj] wrapping on" })
	vim.keymap.set({"n", "v"}, "gk", "k", { noremap = true, desc = "[gk] wrapping on" })
	vim.keymap.set({"n", "v"}, "g$", "$", { noremap = true, desc = "[g$] wrapping on" })
	vim.keymap.set({"n", "v"}, "g0", "0", { noremap = true, desc = "[g0] wrapping on" })
	vim.keymap.set({"n", "v"}, "g^", "^", { noremap = true, desc = "[g^] wrapping on" })
	vim.keymap.set({"n", "v"}, "g_", "_", { noremap = true, desc = "[g_] wrapping on" })
end

local function wrap_off()
	vim.opt.wrap = false
	vim.keymap.del({"n", "v"}, "j")
	vim.keymap.del({"n", "v"}, "k")
	vim.keymap.del({"n", "v"}, "$")
	vim.keymap.del({"n", "v"}, "0")
	vim.keymap.del({"n", "v"}, "^")
	vim.keymap.del({"n", "v"}, "_")
	vim.keymap.del({"n", "v"}, "gj")
	vim.keymap.del({"n", "v"}, "gk")
	vim.keymap.del({"n", "v"}, "g$")
	vim.keymap.del({"n", "v"}, "g0")
	vim.keymap.del({"n", "v"}, "g^")
	vim.keymap.del({"n", "v"}, "g_")
end

local function wrap_toggle()
	if vim.api.nvim_win_get_option_value(vim.api.nvim_get_current_win(), 'wrap') then
		wrap_off()
	else
		wrap_on()
	end
end

wrap_on()
vim.keymap.set("n", "<leader>w", wrap_toggle, { desc = "[W]rap toggle" })

vim.keymap.set("i", "<C-f>{", "{}<Left>", { desc = "Autopair {}" })
vim.keymap.set("i", "<C-f>}", "{\n}<ESC><S-O>", { desc = "Autopair {\\n}" })
vim.keymap.set("i", "<C-f>[", "[]<Left>", { desc = "Autopair []" })
vim.keymap.set("i", "<C-f>]", "[\n]<ESC><S-O>", { desc = "Autopair [\\n]" })
vim.keymap.set("i", "<C-f>(", "()<Left>", { desc = "Autopair ()" })
vim.keymap.set("i", "<C-f>)", "(\n)<ESC><S-O>", { desc = "Autopair (\\n)" })
vim.keymap.set("i", "<C-f><", "<><Left>", { desc = "Autopair <>" })
vim.keymap.set("i", "<C-f>>", "<\n><ESC><S-O>", { desc = "Autopair <\\n>" })
vim.keymap.set("i", "<C-f>\"", "\"\"<Left>", { desc = "Autopair \"\"" })
vim.keymap.set("i", "<C-f>'", "''<Left>", { desc = "Autopair ''" })
vim.keymap.set("i", "<C-f>`", "``<Left>", { desc = "Autopair ``" })
