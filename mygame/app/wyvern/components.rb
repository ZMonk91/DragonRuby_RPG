# frozen_string_literal: true

class Components

  def self.box(size, color)
    box = []
    size = Size.box(size)
    color = Colors.get_rgb(color)

    box << size
    box << $rounded_box
    box << [0,255]
    box << color
    box = box.flatten
  end

  def self.circle(size, color)
    box = []
    size = Size.box(size)
    color = Colors.get_rgb(color)

    box << size
    box << $circle
    box << [0, 255]
    box << color
    box = box.flatten
  end

  def self.triangle(size, color)
    box = []
    size = Size.box(size)
    color = Colors.get_rgb(color)

    box << size
    box << $triangle
    box << [0, 255]
    box << color
    box = box.flatten
  end


end
