local function exe()
    vim.cmd("w")
    if vim.bo.filetype == "cpp" then
        vim.cmd("!cpp-io %")
    elseif vim.bo.filetype == "rust" then
        vim.cmd("!rust-io %")
    end
end

local function warning()
    vim.cmd("w")
    if vim.bo.filetype == "cpp" then
        vim.cmd("!cpp-io -w %")
    end
end

local function output()
    vim.cmd("w")
    if vim.bo.filetype == "cpp" then
        vim.cmd("!cpp-io -o %")
    elseif vim.bo.filetype == "rust" then
        vim.cmd("!rust-io -o %")
    end
end

local function release()
    vim.cmd("w")
    if vim.bo.filetype == "cpp" then
        vim.cmd("!cpp-io -r %")
    elseif vim.bo.filetype == "rust" then
        vim.cmd("!rust-io -r %")
    end
end

local function output_release()
    vim.cmd("w")
    if vim.bo.filetype == "cpp" then
        vim.cmd("!cpp-io -ro %")
    elseif vim.bo.filetype == "rust" then
        vim.cmd("!rust-io -ro %")
    end
end

local function parallel()
    vim.cmd("w")
    if vim.bo.filetype == "cpp" then
        vim.cmd("!cpp-io -rp %")
    elseif vim.bo.filetype == "rust" then
        vim.cmd("!rust-io -rp %")
    end
end

local function output_parallel()
    vim.cmd("w")
    if vim.bo.filetype == "cpp" then
        vim.cmd("!cpp-io -rop %")
    elseif vim.bo.filetype == "rust" then
        vim.cmd("!rust-io -rop %")
    end
end

local function at_fly()
    vim.cmd("w")
    if vim.bo.filetype == "c" then
        vim.cmd("!gcc -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %")
        vim.cmd("!./a.out")
    elseif vim.bo.filetype == "cpp" then
        vim.cmd("!g++ -O0 -Wall -Wextra -fmax-errors=2 -fsanitize=address,undefined -g %")
        vim.cmd("!./a.out")
    end
end

local function at_fly_release()
    vim.cmd("w")
    if vim.bo.filetype == "c" then
        vim.cmd("!gcc -Ofast %")
        vim.cmd("!./a.out")
    elseif vim.bo.filetype == "cpp" then
        vim.cmd("!g++ -Ofast %")
        vim.cmd("!./a.out")
    end
end

vim.keymap.set("n", "<leader>re", exe, { desc = '[R]un [E]xe' })
vim.keymap.set("n", "<leader>rw", warning, { desc = '[R]un [W]arning' })
vim.keymap.set("n", "<leader>ro", output, { desc = '[R]un [O]ouput' })
vim.keymap.set("n", "<leader>RE", release, { desc = '[R]un [E]xe Release' })
vim.keymap.set("n", "<leader>RO", output_release, { desc = '[R]un [O]ouput release' })
vim.keymap.set("n", "<leader>rp", parallel, { desc = '[R]un [P]arallel' })
vim.keymap.set("n", "<leader>RP", output_parallel, { desc = '[R]un [P]arallel output' })

vim.keymap.set("n", "<leader>ra", at_fly, { desc = '[R]un [A]t fly' })
vim.keymap.set("n", "<leader>RA", at_fly_release, { desc = '[R]un [A]t fly release' })

vim.keymap.set("n", "<leader>cr", "<cmd>w<CR><cmd>!cargo run<CR>", { desc = '[C]argo [R]un' })
vim.keymap.set("n", "<leader>cR", "<cmd>w<CR>:!RUST_BACKTRACE=1 cargo run<CR>", { desc = '[C]argo Run Backtrace' })
vim.keymap.set("n", "<leader>CR", "<cmd>w<CR><cmd>!cargo run --release<CR>", { desc = 'Release [C]argo [R]un' })
vim.keymap.set("n", "<leader>cb", "<cmd>w<CR><cmd>!cargo build<CR>", { desc = '[C]argo [B]uild' })
vim.keymap.set("n", "<leader>CB", "<cmd>w<CR><cmd>!cargo build --release<CR>", { desc = 'Release [C]argo [B]uild' })

-- vim.keymap.set("n", "<leader>cc", "<cmd>w<CR><cmd>!cargo check<CR>", { desc = '[C]argo [C]heck' })
-- vim.keymap.set("n", "<leader>ct", "<cmd>w<CR><cmd>!cargo test<CR>", { desc = '[C]argo [T]est' })
-- vim.keymap.set("n", "<leader>cf", "<cmd>w<CR><cmd>!cargo fix --allow-dirty<CR><CR>", { desc = '[C]argo [F]ix' })
-- vim.keymap.set("n", "<leader>cd", "<cmd>w<CR><cmd>!cargo doc --open<CR>", { desc = '[C]argo [D]ocumentation' })
