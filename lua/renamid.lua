local M = {}

M.SETTINGS = {
    title = { "Rename", "Boolean" },
    width = 30,
    border = "rounded_corners_border"
}

function M.setup(opts)
    if opts.title then
        local title = opts.title
        M.SETTINGS.title = (type(title) == "table" and type(title[1]) == "string" and title) or M.SETTINGS.title
    end

    if opts.width then
        local width = opts.width
        M.SETTINGS.width = (type(width) == "number" and width) or M.SETTINGS.width
    end

    if opts.border then
        local borders = require 'popcorn.borders'
        local border = opts.border
        M.SETTINGS.border = (type(border) == "string" and borders[border] and borders[border]) or M.SETTINGS.border
    end
end

return M
