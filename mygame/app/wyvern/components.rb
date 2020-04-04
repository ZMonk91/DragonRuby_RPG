# frozen_string_literal: true

class Components
  def self.box(size, color)
    box = []
    size = Size.box(size)
    color = Colors.get_rgb(color)

    box << size
    box << color
    box = box.flatten
  end
end

# left_ui_container = [w_per(0), h_per(-4), w_per(20), h_per(110), @sprite_graybox, 0, 250, 37, 47, 47]
