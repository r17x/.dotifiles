local global_options = {
  dashboard_disable_at_vimenter = 0,
  dashboard_disable_statusline = 1,
  dashboard_default_executive = "telescope",
  dashboard_custom_header = {
  -- functional
  ---- programming
  ----- forever
  "                ░░░▒▒▒▒▒▒▒▒▒▒▒▒▒▒░░░░                ",
  "            ░░▒▓█▓▒▒▒▒▒▒▓▓██▓▓▓▒▒▒▒▓▓▒░              ",
  "          ░▒▓█▓▒▒▓█▓▓▓▓░░░▒███████▓▓▒▒█▓▒            ",
  "        ░▓██▓▒▒█████████▒░░░█████████▓▒▒██▓          ",
  "      ░▓███▓▒████████████░░░▒██████████▓░▓██▓        ",
  "     ▒████▒▓█████████████▓░░░▓███████████░▓███▒      ",
  "    ▒████▓▒███████████████░░░░████████████░████▒     ",
  "   ▒█████░███████████████▓░░░░▒███████████▒▒████▒    ",
  "  ░█████▓▒███████████████▒▓▓░░░▒██████████▓░█████░   ",
  " ░██████▓▒██████████████▒▓███░░░▓██████████░██████░  ",
  " ░██████▓░█████████████░▓████▓░░░▓████████▓░██████░  ",
  " ▒███████░▓███████████░▓██████▒░░░████████▒▓██████▒  ",
  " ▒███████▒▒█████████▓░▒████████░░░░██████▓▒███████▓  ",
  " ▒███████▒▒▒███████▓░▒██████████░░░░████▓░████████▒  ",
  " ░███████▓░▒▓█████▓░░███████████▓░░░░██▒░█████████░  ",
  " ░▓██████▓▒░░▒▒▓█▓░░█████████████▒░░▒▒░▒▓█████████░  ",
  "  ░███████▒▒░░░░░▒▓███████████████▒░░░▒▒█████████░   ",
  "  ░▒██████▒▒░░░▒▒▒▒▒▒▒▒▒▓█▓▓▓▓▓▓▒▒▒░░░▓▒████████▒    ",
  "   ░▒██████████████████▓░░░░███████████████████▒     ",
  "     ░████████▓▓▓▓░░░░░░▒░░░░░░░░░░▓▓▓████████░      ",
  "      ░▒████████▓▓▒░░░░░█▒▓░░░░░░░▒▓▓███████▒        ",
  "        ░▒█████████▓▒▒░░▓▒▓░░░▒▓██████████▒          ",
  "           ░▓███████▒▓▒▒░░░░░▒▓████████▓▒            ",
  "              ░▒▓████▓▓▒▒▓░▓▒▒█████▓▒░               ",
  "                      ▒▒▒▓▓▓▒▒                       "
  },
  dashboard_custom_section = {
     a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
     b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
     c = { description = { "  Find Word                 SPC f w" }, command = "Telescope live_grep" },
     d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
     e = { description = { "  Bookmarks                 SPC b m" }, command = "Telescope marks" },
     f = { description = { "  Load Last Session         SPC l  " }, command = "SessionLoad" },
  },
  dashboard_custom_footer = {"   "}
}

return require 'utils'.apply_g(global_options)
