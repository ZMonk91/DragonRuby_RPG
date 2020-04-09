# frozen_string_literal: true

# class Shadows < UI
#   def class_info; end

#   def self.render(obj)
#     obj = obj.clone
#     x_offset = @@shadow_x_offset
#     y_offset = @@shadow_y_offset
#     spread   = @@shadow_spread
#     tilt     = @@shadow_tilt
#     color    = @@shadow_color
#     alpha    = @@shadow_alpha

#     shadow_clone = [
#       get_offset(obj[0], x_offset),
#       get_offset(obj[1], y_offset),
#       obj[2] += spread[0],
#       obj[3] += spread[1],
#       obj[4],
#       tilt,
#       alpha,
#       color[0],
#       color[1],
#       color[2]
#     ]

#     $gtk.args.outputs.sprites << shadow_clone


#   end

#   def self.get_offset(base, offset)
#     base += offset
#   end

# end

### DEPRECATED
# class Shadows
#   def self.box_shadow(obj, box_shadow_hash)
#     obj_clone = obj.clone
#     # p box_shadow_hash
#     h_offset = box_shadow_hash[0]
#     v_offset = box_shadow_hash[1]
#     spread = box_shadow_hash[2]
#     colors = box_shadow_hash[3].flatten
#     red = colors[0]
#     green = colors[1]
#     blue = colors[2]
#     alpha = colors[3]
#     obj_clone[0] = get_offset(obj_clone[0],h_offset)
#     obj_clone[1] = get_offset(obj_clone[1],v_offset)
#     obj_clone[2] += box_shadow_hash[2]
#     obj_clone[3] += box_shadow_hash[2]
#     obj_clone[6] = alpha
#     obj_clone[7] = red
#     obj_clone[8] = green
#     obj_clone[9] = blue

#     obj_clone
#   end

#   def self.get_offset(base, offset)
#     return base += offset

#   end

# end
