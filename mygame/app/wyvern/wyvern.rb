# frozen_string_literal: true

# Fluid Interfaces
## Below are the necessary functions to create a Fluid Interface for for Wyvern

# Helper functions
def none
  false
end

def get_sprite_rect(sprite)
  x,y,width,height = sprite
  [x, y, ((width += x) - 1), ((height += y) - 1)]
end

def hover_listener(rect)
  true if mouse.x.between?(rect[0], rect[2]) &&
          mouse.y.between?(rect[1], rect[3])
end

def click_listener(rect)
  return unless mouse.click
  if mouse.x.between?(rect[0], rect[2]) &&
  mouse.y.between?(rect[1], rect[3])
    true
  end
end

# Creates a Sprite
class Sprite
  attr_sprite


    @on_click_enabled = false
    @@class_colors = [122, 0, 0]
    @@class_position = [200, 200]


  def hovered?(sprite)
    hover_listener(get_sprite_rect(sprite))
  end

  def clicked?(sprite)
    click_listener(get_sprite_rect(sprite))
  end

  def on_click(&block)
    @on_click_enabled = true
    block.call if clicked?(@obj_info)
    self
  end

  def on_hover(&block)
    block.call if hovered?(@obj_info)
    self
  end

  def rectangle
    created_obj = New_Component.new(:rectangle)
    created_obj.position(@@class_position)
    created_obj.color(@@class_colors)
    @obj_info = created_obj.update
    self
  end

  def position(*args)
    @@class_position = args
    self
  end

  def color(*args)
    @@class_colors = args
    self
  end

  def serialize
    {}
  end

  def inspect
    serialize.to_s
  end

  def serialize.to_s; end
end


class New_Component

  def initialize(type)
    @obj = []
    ### Default Values
    @object_sprite = Shapes.get_shape(type)
    @tilt = 0
    @alpha = 255
    @colors = [0, 255, 0]
    @position = [400, 400]
    @size = [50, 50]
  end

  def color(*args)
    @colors = args
    update
  end

  def position(*args)
    @position = args
    update
  end

  def update
    @obj = [
      @position.flatten,
      @size[0], @size[1],
      @object_sprite,
      @tilt,
      @alpha,
      @colors.flatten
    ]
    sprites << @obj
    @obj
  end
end

class UI
include Enumerable
  attr_sprite
  # include Enumerable

  def initialize
    @obj = []
    ### Default Values
    @object_sprite = nil
    @tilt = 0
    @alpha = 255
    @colors = [0, 0, 0]
    @position = [0, 0]
    @size = [1, 1]
    @shadows_enabled = false
    @valid = false
    @hover = nil
    ### Default Shadow Options
    @@shadow_x_offset = @position[0] -= 5
    @@shadow_y_offset = @position[1] -= 5
    @@shadow_spread = [
      @size[0] + 5,
      @size[1] + 8
    ]
    @@shadow_tilt = 0
    @@shadow_color = [255,255,255]
    @@shadow_alpha = 33

  end


  def shadow(*args)
    unless args[0] == false
      @shadows_enabled = true if args.empty?
    end
    self
  end

  def shadow_color(color)
    color = Colors.get_color(color) if color.is_a? Symbol
    @@shadow_color = color
    self
  end

  def shadow_alpha(alpha)
    @@shadow_alpha = alpha
    self
  end

  def shadow_offset(offset)
   @@shadow_x_offset = offset[0]
   @@shadow_y_offset = offset[1]
    self
  end

  def shadow_tilt(tilt)
    @@shadow_tilt = tilt
    self
  end

  def alpha(alpha)
    @alpha = alpha
    self
  end

  def shadow_spread(spread)
    @@shadow_spread = [spread[0], spread[1]]
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

  def hover(effects = {})
    @hover = true
    @hover_effects = effects
    self
  end

  def render
    check_if_valid

    Hover.get_effects(@obj, @hover_effects) unless @hover.nil?

    Shadows.render(@obj) if @shadows_enabled
    $gtk.args.outputs.sprites << @obj
    self
  end

def on_click(_args)

  if inputs.mouse.click.point.inside_rect?(self)
    p 'Clicked!?'
  end
  self
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

  ### Shapes
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

  def serialize; end

  def inspect
    serialize.to_s
  end

  def to_s
    serialize.to_s
  end
end



# UI.new(options).box2().with_shadow().primitives
