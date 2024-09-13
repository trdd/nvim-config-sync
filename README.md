# Nvim config sync  Plugin

A simple Neovim Lua plugin to commit and push changes from your `.config/nvim` folder to a Git repository.

## Installation

Using [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
    'trdd/nvim-config-sync',
    config = function()
        require('git_plugin').setup({
            commit_message = "My custom commit message"  -- You can customize this message
        })
    end
}

