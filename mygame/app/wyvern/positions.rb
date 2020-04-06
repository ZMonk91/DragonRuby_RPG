
# Position Class
class Position
  @positions = {
    # top: [720, 500],
    top_left: [0, 500],
    top_right: [1080, 500],
    top_center: [640, 500],
    center: [640, 250],
    center_left: [0, 250],
    center_right: [1080, 250],
    bottom_left: [0, 0],
    bottom_center: [640, 0],
    bottom_right: [1080, 0]
  }

  def self.grid(position)
    position = @positions.fetch(position.to_sym)
    position
  end
end
