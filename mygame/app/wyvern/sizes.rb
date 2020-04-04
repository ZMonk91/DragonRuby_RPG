# frozen_string_literal: true

class Size
  def self.box(size)
    box_size = [0, 0]
    size = size.downcase
    case size
    when 'xs', 'extra small'
      box_size = [213.33, 213.33]
    when 's', 'small'
      box_size = [426.66, 426.66]
    when 'm', 'medium'
      box_size = [640, 640]
    when 'l', 'large'
      box_size = [853.33, 853.33]
    when 'xl', 'extra large'
      box_size = [1066.66, 1066.66]
    when 'f', 'full'
      box_size = [1280, 720]
    end

    box_size
  end
end