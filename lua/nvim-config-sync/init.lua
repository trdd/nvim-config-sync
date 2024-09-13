-- File: lua/git_plugin/init.lua
local M = {}

-- Default configuration
local config = {
	commit_message = "Update nvim config",
}

-- Setup function to allow user customization
M.setup = function(opts)
	-- Merge user options with default configuration
	config = vim.tbl_extend("force", config, opts or {})
end

-- Function to commit and push changes
M.commit_and_push = function()
	local nvim_config_path = os.getenv("HOME") .. "/.config/nvim"
	local commit_message = config.commit_message -- Use the configured commit message

	-- Change directory to the nvim config folder
	vim.fn.chdir(nvim_config_path)

	-- Execute git commands: add, commit, and push
	local git_add = vim.fn.system("git add .")
	local git_commit = vim.fn.system("git commit -m '" .. commit_message .. "'")
	local git_push = vim.fn.system("git push origin")

	-- Display the output in Neovim
	vim.api.nvim_out_write(git_add .. "\n")
	vim.api.nvim_out_write(git_commit .. "\n")
	vim.api.nvim_out_write(git_push .. "\n")
end

-- Create a user command to run the commit and push function
vim.api.nvim_create_user_command("SyncConfig", M.commit_and_push, {})

return M
