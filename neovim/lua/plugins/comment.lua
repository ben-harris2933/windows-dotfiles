return {
  "numToStr/Comment.nvim",
  opts = {},
  config = function(_, opts)
    require("Comment").setup(vim.tbl_deep_extend("force", opts or {}, {
      pre_hook = function(ctx)
        local ft = vim.bo.filetype
        if ft == "ps1" or ft == "powershell" then
          local ctype = require("Comment.utils").ctype
          return ctx.ctype == ctype.blockwise and "<#%s#>" or "#%s"
        end
      end,
    }))
  end,
}
