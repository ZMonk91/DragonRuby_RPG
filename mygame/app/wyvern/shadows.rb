# frozen_string_literal: true

class Shadows
  def self.create_shadow(obj, size = 0, desired_pos = 'center', alpha = 33, color = 'black')
    @percentage = (size / 100)
    
    case desired_pos
    when 'center'
      @x_growth = (obj[2] * @percentage)
      @y_growth = (obj[3] * @percentage)
      obj[0] -= @x_growth / 2
      obj[1] -= @y_growth / 2
      obj[2] += @x_growth # => Width
      obj[3] += @y_growth # => Height
    when 'bottom'
      @y_growth = (obj[3] * @percentage)
      obj[1] -= @y_growth
      obj[3] += @y_growth # => Height
    when 'top'
      @y_growth = (obj[3] * @percentage)
      obj[1] += @y_growth
      obj[3] += @y_growth # => Height
    when 'top and bottom'
      @y_growth = (obj[3] * @percentage)
      obj[1] -= @y_growth / 2
      obj[3] += @y_growth # => Height
    when 'left'
      @x_growth = (obj[2] * @percentage)
      obj[0] -= @x_growth
      obj[2] += @x_growth # => Width
    when 'right'
      @x_growth = (obj[2] * @percentage)
      obj[0] += @x_growth
      obj[2] += @x_growth # => Width
    when 'left and right'
      @x_growth = (obj[2] * @percentage)
      obj[0] -= @x_growth / 2
      obj[2] += @x_growth # => Width
    when 'bottom left'
      @x_growth = (obj[2] * @percentage)
      @y_growth = (obj[3] * @percentage)
      obj[0] -= @x_growth
      obj[1] -= @y_growth
      obj[2] += @x_growth # => Width
      obj[3] += @y_growth # => Height
    when 'bottom right'
      @x_growth = (obj[2] * @percentage)
      @y_growth = (obj[3] * @percentage)
      obj[0] += @x_growth
      obj[1] -= @y_growth
      obj[2] += @x_growth # => Width
      obj[3] += @y_growth # => Height
    when 'top left'
      @x_growth = (obj[2] * @percentage)
      @y_growth = (obj[3] * @percentage)
      obj[0] -= @x_growth
      obj[1] += @y_growth
      obj[2] += @x_growth # => Width
      obj[3] += @y_growth # => Height
    when 'top right'
      @x_growth = (obj[2] * @percentage)
      @y_growth = (obj[3] * @percentage)
      obj[0] += @x_growth
      obj[1] += @y_growth
      obj[2] += @x_growth # => Width
      obj[3] += @y_growth # => Height
    end

    new_shape = []

    obj[6] = alpha # => Alpha
    color = Colors.get_rgb(color)
    obj[7] = color[0] # => R
    obj[8] = color[1] # => G
    obj[9] = color[2] # => B
    obj
  end
end
