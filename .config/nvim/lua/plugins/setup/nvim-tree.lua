local global_options = {
   nvim_tree_side = 'left',
   nvim_tree_indent_markers = 1,
   nvim_tree_width_allow_resize = 1,
   nvim_tree_git_hl = 1,
   nvim_tree_width = 20,
   filters = {
     dotfiles = 1,
     ignore = { '__pycache__', '.git', 'node_modules', '.cache' }
   },

   nvim_tree_icons = {
      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "x",
        renamed = "➜",
        untracked = "★"
      },
   },

   nvim_tree_show_icons = {
      git = 1,
      folders = 1,
      files = 1,
   },
}

return require 'utils'.apply_g(global_options)
