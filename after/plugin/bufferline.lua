local status, bufferline = pcall(require, "bufferline")

if not status then
  print("bufferline is not found")
  return
end

bufferline.setup{
  options = {
    mode = "buffers",
    style_preset = bufferline.style_preset.default, -- or bufferline.style_preset.minimal,
    themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
    close_command = false, -- can be a string | function, | false see "Mouse actions"
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      style = 'icon',
    },
    show_close_icon = false,
    separator_style = "slope",
    show_buffer_close_icons = false
  }
}
