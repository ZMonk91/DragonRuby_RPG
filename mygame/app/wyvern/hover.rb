
#Hover?
class Hover
  def self.get_effects(shape, *args)
    args   = args[0]
    color  = args.fetch(:color, nil)
    size   = args.fetch(:size, nil)
    border   = args.fetch(:border, nil)

    if $gtk.args.inputs.mouse.point.inside_rect? shape
      
      #Change Color
      unless color.nil?
      color = Colors.get_color(color)
      shape[7] = color[0]
      shape[8] = color[1]
      shape[9] = color[2]
      end

      #Change Size
      unless size.nil?
        new_size = Size.get_size(size)
        if shape[2] < new_size[0]
          until shape[2] >= new_size[0]
            shape[2] += 0.25
          end
        end
        if shape[3] < new_size[1]
          until shape[3] >= new_size[1]
            shape[3] += 0.25
          end
        end
        if shape[2] > new_size[0]
          until shape[2] <= new_size[0]
            shape[2] -= 0.25
          end
        end
        if shape[3] > new_size[1]
          until shape[3] <= new_size[1]
            shape[3] -= 0.25
          end
        end
      end

      #Change Border
      unless border.nil?
        $gtk.args.outputs.borders << Borders.get_border(shape, border)
      end
      


      # [0, 0, 48, 1600, "mygame/sprites/ui/shapes/rounded_box.png", 0, 255, 33, 150, 243]
    end

  end
end