-- Add fixture directory to runtimepath (absolute path)
local init_file = debug.getinfo(1, "S").source:sub(2)
local fixture_dir = vim.fn.fnamemodify(init_file, ":p:h")
vim.opt.rtp:prepend(fixture_dir)

-- Repo root (fixtures/<name> -> fixtures -> repo root)
local repo_root = vim.fn.fnamemodify(fixture_dir, ":h:h")
vim.g.claudecode_dev_repo_root = repo_root

-- Ensure local plugin modules are resolvable even if lazy dev path detection fails
vim.opt.rtp:prepend(repo_root)

require("config.lazy")
