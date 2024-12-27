-- pastefix/init.lua

local M = {}

-- Function to clean the clipboard content
M.clean_clipboard = function()
  -- Get the clipboard content
  local clip = vim.fn.getreg '+'

  -- If clipboard content exists, remove carriage return characters
  if clip then
    -- Replace carriage return characters with empty strings
    local cleaned_clip = clip:gsub('\r', '')

    -- Set the cleaned clipboard back into the register
    vim.fn.setreg('+', cleaned_clip)
  end
end

-- Set up an autocommand for paste events
M.setup_autocmd = function()
  vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
      -- Check if the operation is a paste and clean clipboard if necessary
      if vim.v.event.operator == 'y' then
        M.clean_clipboard()
      end
    end,
  })
end

-- Initialize the plugin
M.setup = function()
  M.setup_autocmd()
end

return M
