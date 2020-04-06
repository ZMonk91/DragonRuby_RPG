# frozen_string_literal: true

# Fluid Interfaces

class UI
  include Enumerable

  def initialize
    @obj = []
    ### Default Values
    @object_sprite = nil
    @tilt = 0
    @alpha = 255
    @colors = [0, 0, 0]
    @position = [0, 0]
    @size = [1, 1]
    @valid = false
  end

  def circle
    @@object_sprite = Shapes.get_shape(:circle)
    @object_sprite = @@object_sprite
    self
  end

  def hexagon
    @@object_sprite = Shapes.get_shape(:hexagon)
    @object_sprite = @@object_sprite
    self
  end

  def pentagon
    @@object_sprite = Shapes.get_shape(:pentagon)
    @object_sprite = @@object_sprite
    self
  end

  def pill
    @@object_sprite = Shapes.get_shape(:pill)
    @object_sprite = @@object_sprite
    self
  end

  def rectangle_rounded
    @@object_sprite = Shapes.get_shape(:rectangle_rounded)
    @object_sprite = @@object_sprite
    self
  end

  def rectangle
    @@object_sprite = Shapes.get_shape(:rectangle)
    @object_sprite = @@object_sprite
    self
  end

  def square_rounded
    @@object_sprite = Shapes.get_shape(:square_rounded)
    @object_sprite = @@object_sprite
    self
  end


  def square
    @@object_sprite = Shapes.get_shape(:square)
    @object_sprite  = @@object_sprite
    self
  end

  def star
    @@object_sprite = Shapes.get_shape(:star)
    @object_sprite = @@object_sprite
    self
  end

  def triangle_rounded
    @@object_sprite = Shapes.get_shape(:triangle_rounded)
    @object_sprite = @@object_sprite
    self
  end


  def triangle
    @@object_sprite = Shapes.get_shape(:triangle)
    @object_sprite = @@object_sprite
    self
  end

  def position(position)
    position = $grid[position] if position.is_a? Symbol
    @position = position
    @@position = position
    self
  end

  def size(size)
    size = Size.get_size(size)
    @size = size
    # @@size = size
    self
  end

  def color(color)
    color = Colors.get_color(color) if color.is_a? Symbol
    @colors = color
    self
  end

  def tilt(tilt)
    @tilt = tilt
    self
  end

  def render
    check_if_valid
    # @obj
    $gtk.args.outputs.sprites << @obj
  end

  def check_if_valid
    if @object_sprite.nil?
      p "Uh oh. You're missing your object. What shape is this?"
      p 'Available methods include: .circle, .hexagon, .pentagon'
      p '.pill, .rectangle_rounded, .rectangle, .square_rounded,'
      p '.square, .star, .triangle_rounded, .triangle'
      return
    else
      compile
    end
    self
  end

  def compile
    @obj = [
      @position.flatten,
      @size.flatten,
      @object_sprite,
      @tilt,
      @alpha,
      @colors.flatten
    ].flatten
    @obj
  end

  def serialize; end

  def inspect
    serialize.to_s
  end

  def to_s
    serialize.to_s
  end
end

# # Not sure if I need this tbh
# class Components < UI
#   def initialize
#     p 'Initialized'
#   end

#   def render
#     p "Building! #{@@position}"
#     p "Current Sprite: #{@@object_sprite}"
#     self
#   end
# end

# test = UI.new.box

# test.position(:A5).size([0,5]).render
# p test

# test2 = UI.new
# test2.box.position([0,4]).size([2,9]).color(:blue).render
# p test2

# p test
# p test2

# UI.new(options).box2().with_shadow().primitives
