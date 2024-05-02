local popcorn = require 'popcorn'
local borders = require 'popcorn.borders'
local SETTINGS = require 'renamid'.SETTINGS
local M = {}

local function rename_in_buffer(bufnr, new_name)
    vim.api.nvim_buf_call(bufnr, function()
        vim.lsp.buf.rename(new_name, { bufnr = bufnr })
    end)
end

local function is_any_lsp_client()
    local lsp_clients = vim.lsp.buf_get_clients(0)

    if lsp_clients == nil or #lsp_clients < 1 then
        return false
    end
    return true
end

function M.rename()
    if is_any_lsp_client() then
        local bufnr = vim.api.nvim_get_current_buf()
        local word = vim.fn.expand('<cword>')

        local word_width = #word + 5
        local width = word_width > SETTINGS.width and word_width or SETTINGS.width

        local opts2 = {
            width = width,
            height = 3,
            border = borders[SETTINGS.border],
            title = SETTINGS.title,
            content = { { word } },
            callback = function()
                rename_in_buffer(bufnr, vim.fn.getline(1))
                vim.cmd [[stopinsert]]
                return function()
                    vim.cmd[[quit]]
                end
            end,
            do_after = function()
                vim.api.nvim_buf_set_keymap(0, 'i', '<CR>', '<cmd>lua require("popcorn").execute_callback()<cr>',
                    { noremap = true, silent = true })
                vim.cmd [[startinsert]]
                vim.api.nvim_win_set_cursor(0, { 1, (#word + 1) })
            end
        }

        popcorn:new(opts2):pop()
    end
end

return M
