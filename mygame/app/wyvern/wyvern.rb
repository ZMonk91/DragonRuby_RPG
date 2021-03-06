# frozen_string_literal: true

# Fluid Interfaces
## Below are the necessary functions to create a Fluid Interface for for Wyvern

######################
#     SPRITE CLASS   #
#  Creates a Sprite  #
######################
class Sprite
  attr_sprite

  def initialize(type)
    @object = {
      type: type,
      position: [455, 450],
      size: [120, 120],
      sprite: '',
      tilt: 0,
      alpha: 255,
      color: [123, 123, 123],
      shadows: false,
      shadow_offset: [20, 20],
      shadow_spread: 10,
      shadow_color: [255, 255, 255],
      shadow_alpha: 0,
      shadow_tilt: 0,
      selectable: false
    }
    build_obj(type)
  end

  def build_obj(type)
    type = type.to_sym
    component = New_Component.new(type)
    component.position(@object[:position])
    component.size(@object[:size])
    component.tilt(@object[:tilt])
    component.alpha(@object[:alpha])
    component.color(@object[:color])
    @obj_info = component.update
    @get_render = component.render
    self
  end

  def render
    arr = @get_render.flatten
    arr
  end

  def position(*args)
    @object[:position] = args
    build_obj(@object[:type])
    self
  end

  def size(size)
    @object[:size] = size
    build_obj(@object[:type])
    self
  end

  def sprite(*args)
    @object[:sprite] = args
    build_obj(@object[:type])
    self
  end

  def tilt(tilt)
    @object[:tilt] = tilt
    build_obj(@object[:type])
    self
  end

  def alpha(alpha)
    @object[:alpha] = alpha
    build_obj(@object[:type])
    self
  end

  def color(color)
    color = Colors.get_color(color) if color.is_a? Symbol
    @object[:color] = color
    build_obj(@object[:type])
    self
  end

  ### Event Handling
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



  ### Error Handling
  def serialize
    {}
  end

  def inspect
    serialize.to_s
  end

  def serialize.to_s; end
end

####################
# Helper functions #
####################
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





class New_Component

  def initialize(type)
    @obj = []
    ### Default Values
    @position = [400, 400]
    @size = [50, 50]
    @object_sprite = Shapes.get_shape(type)
    @tilt = 0
    @alpha = 255
    @colors = [0, 255, 0]
    @obj_sto = {
      color: [122, 122, 122]
    }
  end

  def position(*args)
    @position = args
    update
  end

  def size(size)
    @size = size
    update
  end

  def tilt(tilt)
    @tilt = tilt
    update
  end

  def alpha(alpha)
    @alpha = alpha
    update
  end

  def color(*args)
    args = Colors.get_color(args) if args.is_a? Symbol
    @colors = args
    update
  end


  def render
    result = Array.new
    result.push(@position.flatten,
      @size[0], @size[1],
      @object_sprite,
      @tilt,
      @alpha,
      @colors.flatten)
    result
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
    @obj.flatten
  end
end



################
## PROTOTYPES ##
################


###### DROP SHADOW GRADIENT RENDERING
# def render_game
#     if args.state.tick_count == 0
#     # args.render_target(:block).solids << [0, 0, 1280, 100]

#     # The gradient is actually just a collection of black solids with increasing
#     # opacities.
#         # $gtk.args.render_target(:gradient).solids << 90.map_with_index do |x|
#     #   50.map_with_index do |y|
#     #     [x * 15, y * 15, 15, 15, 0, 0, 0, (x * 3).fdiv(255) * 255]
#     #   end
#     # end
    
#     d_r = 255
#     d_g = 0
#     d_b = 0

#     default_alpha = 95
#     d_x = 200
#     d_y = 200
#     d_w = 100
#     d_h = 100
#     spread = 10
#     blur = 0.5
#     s_alpha = (default_alpha * blur)
#     alpha_decrease_by = ((default_alpha - s_alpha) / spread).to_i # 11

#     args.render_target(:gradient).sprites << spread.map_with_index do |x|
#       y = x # <== Increases from 0 to spread
#       x = spread - x  # <==Decreases from Spread to 0

# #         X      Y        W              H
#       [d_x - y, d_y - y, d_w + (y * 2), d_h + (y * 2),
# #      path                      tilt   ALPHA                R    G   B 
#       Shapes.get_shape(:square), 0, (alpha_decrease_by * y), 0,  0,  0]

# #         X      Y       W  H  R    G  B   ALPHA
#         # [x * 25, y * 25, 15, 15, 255, 0, 0, (x * 2).fdiv(25) * 25]

#     end
#   end

#   args.outputs.sprites << [0, 0, 1280, 720, :gradient]
#   args.outputs.sprites << { x: 200,
#                             y: 200,
#                             w: 100,
#                             h: 100,
#                             path: Shapes.get_shape(:square),
#                             source_x: 0,
#                             source_y: 0,
#                             source_w: 1280,
#                             source_h: 100,
#                             r: 250,
#                             g: 0,
#                             b: 0 }
# end








##################
### DEPRECATED ###
##################

# class UI
# include Enumerable
#   attr_sprite
#   # include Enumerable

#   def initialize
#     @obj = []
#     ### Default Values
#     @object_sprite = nil
#     @tilt = 0
#     @alpha = 255
#     @colors = [0, 0, 0]
#     @position = [0, 0]
#     @size = [1, 1]
#     @shadows_enabled = false
#     @valid = false
#     @hover = nil
#     ### Default Shadow Options
#     @@shadow_x_offset = @position[0] -= 5
#     @@shadow_y_offset = @position[1] -= 5
#     @@shadow_spread = [
#       @size[0] + 5,
#       @size[1] + 8
#     ]
#     @@shadow_tilt = 0
#     @@shadow_color = [255,255,255]
#     @@shadow_alpha = 33

#   end


#   def shadow(*args)
#     unless args[0] == false
#       @shadows_enabled = true if args.empty?
#     end
#     self
#   end

#   def shadow_color(color)
#     color = Colors.get_color(color) if color.is_a? Symbol
#     @@shadow_color = color
#     self
#   end

#   def shadow_alpha(alpha)
#     @@shadow_alpha = alpha
#     self
#   end

#   def shadow_offset(offset)
#    @@shadow_x_offset = offset[0]
#    @@shadow_y_offset = offset[1]
#     self
#   end

#   def shadow_tilt(tilt)
#     @@shadow_tilt = tilt
#     self
#   end

#   def alpha(alpha)
#     @alpha = alpha
#     self
#   end

#   def shadow_spread(spread)
#     @@shadow_spread = [spread[0], spread[1]]
#     self
#   end

#   def position(position)
#     position = $grid[position] if position.is_a? Symbol
#     @position = position
#     @@position = position
#     self
#   end

#   def size(size)
#     size = Size.get_size(size)
#     @size = size
#     self
#   end

#   def color(color)
#     color = Colors.get_color(color) if color.is_a? Symbol
#     @colors = color
#     self
#   end

#   def tilt(tilt)
#     @tilt = tilt
#     self
#   end

#   def hover(effects = {})
#     @hover = true
#     @hover_effects = effects
#     self
#   end

#   def render
#     check_if_valid

#     Hover.get_effects(@obj, @hover_effects) unless @hover.nil?

#     Shadows.render(@obj) if @shadows_enabled
#     $gtk.args.outputs.sprites << @obj
#     self
#   end

# def on_click(_args)

#   if inputs.mouse.click.point.inside_rect?(self)
#     p 'Clicked!?'
#   end
#   self
# end

#   def check_if_valid
#     if @object_sprite.nil?
#       p "Uh oh. You're missing your object. What shape is this?"
#       p 'Available methods include: .circle, .hexagon, .pentagon'
#       p '.pill, .rectangle_rounded, .rectangle, .square_rounded,'
#       p '.square, .star, .triangle_rounded, .triangle'
#       return
#     else
#       compile
#     end
#     self
#   end

#   def compile
#     @obj = [
#       @position.flatten,
#       @size.flatten,
#       @object_sprite,
#       @tilt,
#       @alpha,
#       @colors.flatten
#     ].flatten
#     @obj
#   end

#   ### Shapes
#    def circle
#     @@object_sprite = Shapes.get_shape(:circle)
#     @object_sprite = @@object_sprite
#     self
#   end

#   def hexagon
#     @@object_sprite = Shapes.get_shape(:hexagon)
#     @object_sprite = @@object_sprite
#     self
#   end

#   def pentagon
#     @@object_sprite = Shapes.get_shape(:pentagon)
#     @object_sprite = @@object_sprite
#     self
#   end

#   def pill
#     @@object_sprite = Shapes.get_shape(:pill)
#     @object_sprite = @@object_sprite
#     self
#   end

#   def rectangle_rounded
#     @@object_sprite = Shapes.get_shape(:rectangle_rounded)
#     @object_sprite = @@object_sprite
#     self
#   end

#   def rectangle
#     @@object_sprite = Shapes.get_shape(:rectangle)
#     @object_sprite = @@object_sprite
#     self
#   end

#   def square_rounded
#     @@object_sprite = Shapes.get_shape(:square_rounded)
#     @object_sprite = @@object_sprite
#     self
#   end


#   def square
#     @@object_sprite = Shapes.get_shape(:square)
#     @object_sprite  = @@object_sprite
#     self
#   end

#   def star
#     @@object_sprite = Shapes.get_shape(:star)
#     @object_sprite = @@object_sprite
#     self
#   end

#   def triangle_rounded
#     @@object_sprite = Shapes.get_shape(:triangle_rounded)
#     @object_sprite = @@object_sprite
#     self
#   end


#   def triangle
#     @@object_sprite = Shapes.get_shape(:triangle)
#     @object_sprite = @@object_sprite
#     self
#   end

#   def serialize; end

#   def inspect
#     serialize.to_s
#   end

#   def to_s
#     serialize.to_s
#   end
# end



# UI.new(options).box2().with_shadow().primitives
