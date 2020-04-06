
class Shadows
  def self.box_shadow(obj, box_shadow_hash)
    obj_clone = obj.clone
    # p box_shadow_hash
    h_offset = box_shadow_hash[0]
    v_offset = box_shadow_hash[1]
    spread = box_shadow_hash[2]
    colors = box_shadow_hash[3].flatten
    red = colors[0]
    green = colors[1]
    blue = colors[2]
    alpha = colors[3]
    obj_clone[0] = get_offset(obj_clone[0],h_offset)
    obj_clone[1] = get_offset(obj_clone[1],v_offset)
    obj_clone[2] += box_shadow_hash[2]
    obj_clone[3] += box_shadow_hash[2]
    obj_clone[6] = alpha
    obj_clone[7] = red
    obj_clone[8] = green
    obj_clone[9] = blue
   
    obj_clone
  end

  def self.get_offset(base, offset)
    return base += offset

  end



end
