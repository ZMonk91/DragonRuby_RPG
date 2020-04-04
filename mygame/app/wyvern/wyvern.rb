require '/app/wyvern/colors.rb'
require '/app/wyvern/components.rb'
require '/app/wyvern/sizes.rb'
require '/app/wyvern/components.rb'

class UI
  def self.box(size, color)
    new_box = Components.box(size, color)
    p new_box
  end
end