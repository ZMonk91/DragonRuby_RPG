
require '/app/wyvern/colors.rb'
# require '/app/wyvern/components.rb'
require '/app/wyvern/sizes.rb'
require '/app/wyvern/positions.rb'
require '/app/wyvern/shadows.rb'
require '/app/wyvern/grid.rb'
require '/app/wyvern/borders.rb'
require '/app/wyvern/hover.rb'


# $grey_box = '/sprites/ui/shapes/rounded_box.png'
$rounded_box = 'mygame/sprites/ui/shapes/rounded_box.png'
$circle = 'mygame/sprites/ui/shapes/white_circle.png'
$triangle = 'mygame/sprites/ui/shapes/white_triangle.png'

def rgba(red = 0, green = 0, blue = 0, *alpha)
  new_value = Array.new(2) { [] }
  new_value[0] << red
  new_value[0] << green
  new_value[0] << blue
  new_value[1] << alpha
  new_value[1].flatten!
  new_value
end

# # class UI
#   attr_accessor :outputs, :inputs, :sprites

#   def initialize(type)
#     box(type)
#   end

#   def self.box(*args)
#     p args
#     args       = args[0]
#     position   = args.fetch(:position, 'Missing Position')
#     size       = args.fetch(:size, 'Missing size')
#     color      = args.fetch(:color, 'Missing color')
#     tilt       = args.fetch(:tilt, 0)
#     alpha      = args.fetch(:alpha, 255)
#     box_shadow = args.fetch(:box_shadow, nil)
#     border     = args.fetch(:border, nil)
#     hover      = args.fetch(:hover, nil)

#     new_shape = Components.box2(position, size, color, tilt, alpha)

#     # Hover Actions
#     Hover.get_effects(new_shape, hover) unless hover.nil?

#     # Render
#     if box_shadow.nil? && border.nil?
#       $gtk.args.outputs.sprites << new_shape
#       Hover.get_effects(new_shape, hover) if hover.key?(:border)
#     elsif border.nil?
#       $gtk.args.outputs.sprites << new_shape.let do |shape|
#         [Shadows.box_shadow(shape, box_shadow), shape]
#       end
#       Hover.get_effects(new_shape, hover) if hover.key?(:border)
#     elsif box_shadow.nil?
#       $gtk.args.outputs.sprites << new_shape.let do |shape|
#         [shape]
#       end
#       $gtk.args.outputs.borders << Borders.get_border(new_shape, border)
#       Hover.get_effects(new_shape, hover) if hover.key?(:border)

#     else
#       $gtk.args.outputs.sprites << new_shape.let do |shape|
#         [Shadows.box_shadow(shape, box_shadow), shape]
#       end
#       $gtk.args.outputs.borders << Borders.get_border(new_shape, border)
#       Hover.get_effects(new_shape, hover) if hover.key?(:border)
#     end
#   end

#   def self.circle(position, size, color)
#     result = []
#     new_shape = Components.circle(size, color)
#     result << Position.grid(position)
#     result << new_shape
#     result.flatten
#   end

#   def self.triangle(position, size, color)
#     result = []
#     new_shape = Components.triangle(size, color)
#     result << Position.grid(position)
#     result << new_shape
#     result.flatten
# end

  def self.shadow(obj, size = 0, desired_pos = 'center', alpha = 255, color = 'black')
    result = []
    # shadow = obj.clone
    new_shape = Shadows.create_shadow(obj.clone, size, desired_pos, alpha, color)
    $gtk.args.outputs.sprites << new_shape
  end
end
