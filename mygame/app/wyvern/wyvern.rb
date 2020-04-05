# frozen_string_literal: true

require '/app/wyvern/colors.rb'
require '/app/wyvern/components.rb'
require '/app/wyvern/sizes.rb'
require '/app/wyvern/components.rb'
require '/app/wyvern/positions.rb'
require '/app/wyvern/shadows.rb'
require '/app/wyvern/grid.rb'
require '/app/wyvern/borders.rb'

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

class UI
  attr_accessor :outputs, :inputs, :sprites, :box, :glow

  # def self.box(position, size, color)
  #   result = []
  #   new_shape = Components.box(size, color)
  #   result << Position.grid(position)
  #   result << new_shape
  #   result.flatten
  # end

  def self.box2(*args)
    args       = args[0]
    position   = args.fetch(:position, 'Missing Position')
    color      = args.fetch(:color, 'Missing color')
    size       = args.fetch(:size, 'Missing size')
    tilt       = args.fetch(:tilt, 0)
    alpha      = args.fetch(:alpha, 255)
    box_shadow = args.fetch(:box_shadow, nil)
    border     = args.fetch(:border, nil)

    new_shape = Components.box2(position, size, color, tilt, alpha)

    if box_shadow.nil? && border.nil?
      $gtk.args.outputs.sprites << new_shape
    elsif border.nil?
      $gtk.args.outputs.sprites << new_shape.let do |shape|
        [Shadows.box_shadow(shape, box_shadow), shape]
      end
    elsif box_shadow.nil?
      $gtk.args.outputs.sprites << new_shape.let do |shape|
        [shape]
      end
      $gtk.args.outputs.borders << Borders.get_border(new_shape, border)

    else
      $gtk.args.outputs.sprites << new_shape.let do |shape|
        [Shadows.box_shadow(shape, box_shadow), shape]
      end
      $gtk.args.outputs.borders << Borders.get_border(new_shape, border)
    end
  end

  def self.circle(position, size, color)
    result = []
    new_shape = Components.circle(size, color)
    result << Position.grid(position)
    result << new_shape
    result.flatten
  end

  def self.triangle(position, size, color)
    result = []
    new_shape = Components.triangle(size, color)
    result << Position.grid(position)
    result << new_shape
    result.flatten
end

  def self.shadow(obj, size = 0, desired_pos = 'center', alpha = 255, color = 'black')
    result = []
    # shadow = obj.clone
    new_shape = Shadows.create_shadow(obj.clone, size, desired_pos, alpha, color)
    $gtk.args.outputs.sprites << new_shape
  end

  def self.glow(color:); end
end

## Originally to create a box with a dropshadow, you would do this:
# square = UI.box("center","extra small","indigo")
# UI.shadow(square, 5, "center", 32, "white")
# sprites << square

# class UI
#   def self.box(position, size, color)
#     result = []
#     new_shape = Components.box(size, color)
#     result << Position.grid(position)
#     result << new_shape
#    result.flatten
#   end

#   def self.shadow(obj, size = 0, desired_pos = "center", alpha = 255, color = 'black')
#   result = []
#   # shadow = obj.clone
#   new_shape = Shadows.create_shadow(obj.clone, size, desired_pos, alpha, color)
#   $gtk.args.outputs.sprites << new_shape
# end

# end

# class
#   def self.box(size, color)
#   box = []
#   size = Size.box(size)
#   color = Colors.get_rgb(color)

#   box << size
#   box << $rounded_box
#   box << [0,255]
#   box << color
#   box = box.flatten
# end

##### Using the new method, this is what I would like to do
# MAIN.RB
#     test_box = {
#     position: :A0,
#     size: [3,100],
#     color: :blue,
#     alpha: 100,
#     box_shadow: [1,2,4, rgba(0,0,0, 0.5)]

#   }

#   p rgba(1,2,3,0.5)
# sprites << UI.box2(test_box)
# class UI
#   def self.box2(*args)
#     args = args[0]
#     position = args.fetch(:position, "Missing Position")
#     color = args.fetch(:color, "Missing color")
#     size = args.fetch(:size, "Missing size")
#     tilt = args.fetch(:tilt, 0)
#     alpha = args.fetch(:alpha, 255)
#     shadow_box = args.fetch(Shadows.box_shadow(:shadow_box), nil)
#     new_shape = Components.box2(position, size, color, tilt, alpha)
#     new_shape
#   end
# end
# class Shadows
#   def self.box_shadow(args go here)
#     # I want to get the dimensions of the object I am going to call this function on
#   end
# end
