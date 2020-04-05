# frozen_string_literal: true

class Components

  def self.box2(position, size, color, tilt, alpha)
    new_shape = []
    new_shape << $grid[position]
    new_shape << Size.get_size(size)
    new_shape << $rounded_box
    new_shape << tilt
    new_shape << alpha
    new_shape << Colors.get_color(color)
    new_shape.flatten
  end

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
