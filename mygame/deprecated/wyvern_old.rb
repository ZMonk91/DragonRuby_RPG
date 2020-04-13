
# require '/app/wyvern/colors.rb'
# # require '/app/wyvern/components.rb'
# require '/app/wyvern/sizes.rb'
# require '/app/wyvern/positions.rb'
# require '/app/wyvern/shadows.rb'
# require '/app/wyvern/grid.rb'
# require '/app/wyvern/borders.rb'
# require '/app/wyvern/hover.rb'


# # $grey_box = '/sprites/ui/shapes/rounded_box.png'
# $rounded_box = 'mygame/sprites/ui/shapes/rounded_box.png'
# $circle = 'mygame/sprites/ui/shapes/white_circle.png'
# $triangle = 'mygame/sprites/ui/shapes/white_triangle.png'

# def rgba(red = 0, green = 0, blue = 0, *alpha)
#   new_value = Array.new(2) { [] }
#   new_value[0] << red
#   new_value[0] << green
#   new_value[0] << blue
#   new_value[1] << alpha
#   new_value[1].flatten!
#   new_value
# end

# #Wyvern 1.1

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



# # UI.new(options).box2().with_shadow().primitives











# ## Wyvern 1.0

# # # class UI
# #   attr_accessor :outputs, :inputs, :sprites

# #   def initialize(type)
# #     box(type)
# #   end

# #   def self.box(*args)
# #     p args
# #     args       = args[0]
# #     position   = args.fetch(:position, 'Missing Position')
# #     size       = args.fetch(:size, 'Missing size')
# #     color      = args.fetch(:color, 'Missing color')
# #     tilt       = args.fetch(:tilt, 0)
# #     alpha      = args.fetch(:alpha, 255)
# #     box_shadow = args.fetch(:box_shadow, nil)
# #     border     = args.fetch(:border, nil)
# #     hover      = args.fetch(:hover, nil)

# #     new_shape = Components.box2(position, size, color, tilt, alpha)

# #     # Hover Actions
# #     Hover.get_effects(new_shape, hover) unless hover.nil?

# #     # Render
# #     if box_shadow.nil? && border.nil?
# #       $gtk.args.outputs.sprites << new_shape
# #       Hover.get_effects(new_shape, hover) if hover.key?(:border)
# #     elsif border.nil?
# #       $gtk.args.outputs.sprites << new_shape.let do |shape|
# #         [Shadows.box_shadow(shape, box_shadow), shape]
# #       end
# #       Hover.get_effects(new_shape, hover) if hover.key?(:border)
# #     elsif box_shadow.nil?
# #       $gtk.args.outputs.sprites << new_shape.let do |shape|
# #         [shape]
# #       end
# #       $gtk.args.outputs.borders << Borders.get_border(new_shape, border)
# #       Hover.get_effects(new_shape, hover) if hover.key?(:border)

# #     else
# #       $gtk.args.outputs.sprites << new_shape.let do |shape|
# #         [Shadows.box_shadow(shape, box_shadow), shape]
# #       end
# #       $gtk.args.outputs.borders << Borders.get_border(new_shape, border)
# #       Hover.get_effects(new_shape, hover) if hover.key?(:border)
# #     end
# #   end

# #   def self.circle(position, size, color)
# #     result = []
# #     new_shape = Components.circle(size, color)
# #     result << Position.grid(position)
# #     result << new_shape
# #     result.flatten
# #   end

# #   def self.triangle(position, size, color)
# #     result = []
# #     new_shape = Components.triangle(size, color)
# #     result << Position.grid(position)
# #     result << new_shape
# #     result.flatten
# # end

#   def self.shadow(obj, size = 0, desired_pos = 'center', alpha = 255, color = 'black')
#     result = []
#     # shadow = obj.clone
#     new_shape = Shadows.create_shadow(obj.clone, size, desired_pos, alpha, color)
#     $gtk.args.outputs.sprites << new_shape
#   end
# end
