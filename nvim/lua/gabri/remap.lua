vim.g.mapleader = " "

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")
vim.keymap.set({ "n", "v" }, "<BS>", "<Nop>")
vim.keymap.set({ "t" }, "<Esc><Esc>", "<c-\\><c-n>", { desc = "[Esc] terminal" })
vim.keymap.set("n", "<esc>", "<cmd>noh<CR>", { desc = "No highlight" })

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

vim.keymap.set("n", "<C-q>", function()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("6copen")
	-- vim.cmd("wincmd p")
end, { desc = "Quickfix list toggle" })

local function cprev_cnext(cwhat, warm_msg)
    local ok = pcall(vim.cmd, cwhat)
    if ok ~= true then
        vim.notify(warm_msg, vim.log.levels.WARN)
        return
    end
    vim.cmd("norm! zz")
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
    if qf_winid ~= 0 then
        vim.fn.win_execute(qf_winid, "norm! zt")
    end 
end

vim.keymap.set("n", "<C-p>", function() cprev_cnext("cprev", "REACHED FIRST ITEM") end, { desc = "Quickfix list [P]revious" })
vim.keymap.set("n", "<C-n>", function() cprev_cnext("cnext", "REACHED LAST ITEM") end, { desc = "Quickfix list [N]ext" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to window right" })

vim.keymap.set("n", "<C-Up>", "2<C-w>+", { desc = "Resize window vertically" })
vim.keymap.set("n", "<C-Down>", "2<C-w>-", { desc = "Change window smaller vertically" })
vim.keymap.set("n", "<C-Right>", "2<C-w>>", { desc = "Change window bigger horizontally" })
vim.keymap.set("n", "<C-Left>", "2<C-w><", { desc = "Change window smaller horizontally" })
vim.keymap.set("n", "<leader>se", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]ubsitute [E]nd" })
vim.keymap.set("n", "<leader>sb", [[:%s/\<<C-r><C-w>\>//gI<Left><Left><Left>]], { desc = "[S]ubsitute [B]eginning" })

vim.keymap.set("n", "<leader>zm", "<cmd>set foldmethod=marker<CR>", { desc = "[Z]fold [M]arker" })

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
