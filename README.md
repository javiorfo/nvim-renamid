# nvim-renamid
*Neovim plugin for LSP rename function in a centered popup*

## Caveats
- This is available only using configured LSP languages
- This plugin has been developed on and for Linux following open source philosophy.

## Installation
`Packer`
```lua
use {
    'javiorfo/nvim-renamid',
    requires = { 'javiorfo/nvim-popcorn' }
}
```
`Lazy`
```lua
{ 
    'javiorfo/nvim-renamid',
    dependencies = { 'javiorfo/nvim-popcorn' }
    lazy = true,
    ft = { "c", "java", "rust" }, -- LSP languages
    opts = {
        -- This is optional. Only If you want to change default configurations
        
        -- Width of popup. Default value 30
        width = 30,
        
        -- Title of popup. Default value "Rename".
        -- The second value is a link to a highlight keyword. Default "Boolean" keyword hightlight link
        title = { "Rename", "Boolean" },
        
        -- Border of popup. Default value "rounded_corners_border".
        -- Other borders: "simple_border", "simple_thick_border", "double_border", "double_simple_border" 
        border = "rounded_corners_border"
    }
}
```

## Configuration
#### For Packer, Lazy.nvim is above
```lua
require'renamid'.setup { 
    -- This is optional. Only If you want to change default configurations
        
    -- Width of popup. Default value 30
    width = 30,
        
    -- Title of popup. Default value "Rename".
    -- The second value is a link to a highlight keyword. Default "Boolean" keyword hightlight link
    title = { "Rename", "Boolean" },
        
    -- Border of popup. Default value "rounded_corners_border".
    -- Other borders: "simple_border", "simple_thick_border", "double_border", "double_simple_border" 
    border = "rounded_corners_border"
}
```

## Usage
- Assuming LSP rename is configured like this:
```lua
-- Usual LSP rename mapping
{ '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>' }

-- Replace the line above with this:
{ '<leader>rn', '<cmd>:Renamid<CR>' },
```
- A centered popup will be opened with the word behind the cursor in *INSERT MODE*, so you can edit it an press `<CR>` to make the change take effect. Double `<ESC>` to close the popup without changes.

## Screenshots
### Simple use

<img src="https://github.com/javiorfo/img/blob/master/nvim-renamid/renamid.gif?raw=true" alt="renamid"/>

**NOTE:** The colorscheme **nox** from [nvim-nyctophilia](https://github.com/javiorfo/nvim-nyctophilia) is used in this image.

---

### Donate
- **Bitcoin** [(QR)](https://raw.githubusercontent.com/javiorfo/img/master/crypto/bitcoin.png)  `1GqdJ63RDPE4eJKujHi166FAyigvHu5R7v`
- [Paypal](https://www.paypal.com/donate/?hosted_button_id=FA7SGLSCT2H8G)
