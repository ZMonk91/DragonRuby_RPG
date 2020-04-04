require '/app/wyvern/colors.rb'
require '/app/wyvern/components.rb'
require '/app/wyvern/sizes.rb'
require '/app/wyvern/components.rb'
require '/app/wyvern/positions.rb'
require '/app/wyvern/shadows.rb'

# $grey_box = '/sprites/ui/shapes/rounded_box.png'
$rounded_box = 'mygame/sprites/ui/shapes/rounded_box.png'
$circle = 'mygame/sprites/ui/shapes/white_circle.png'
$triangle = 'mygame/sprites/ui/shapes/white_triangle.png'

class UI
  attr_accessor :outputs, :inputs, :sprites, :box, :glow
  def self.box(position, size, color)
    result = []
    new_shape = Components.box(size, color)
    result << Position.grid(position)
    result << new_shape
    result.flatten
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

  def self.shadow(obj, size = 0, desired_pos = "center", alpha = 255, color = 'black')
    result = []
    # shadow = obj.clone
    new_shape = Shadows.create_shadow(obj.clone, size, desired_pos, alpha, color)
    $gtk.args.outputs.sprites << new_shape
  end
end