# frozen_string_literal: true

fps_setting = {
  name: 'Display FPS',
  description: 'Display the average Frames Per Second (60 is optimum)',
  value: false
}
sfx_setting = {
  name: 'Disable SFX',
  description: 'Disable all sound effects',
  value: false
}
music_setting = {
  name: 'Disable Music',
  description: 'Disable all music',
  value: false
}
background_setting = {
  name: 'Disable Background',
  description: 'Disable animation in the wallpaper',
  value: false
}

@system_settings = [fps_setting, sfx_setting, music_setting, background_setting]
