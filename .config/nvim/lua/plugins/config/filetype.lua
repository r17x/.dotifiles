require("filetype").setup({
    overrides = {
        extensions = {
            -- Set the filetype of *.pn files to potion
            re = "reason",
            rei = "reason"
        },
        shebang = {
            node = "javascript"
        }
      }
})
