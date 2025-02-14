return {
  "folke/snacks.nvim",
  opts = {
    notifier = { enabled = true },
    picker = {
      sources = {
        explorer = {
          auto_close = true,
          hidden = true,

          ignored = true,
        },
      },
    },
  },
}
