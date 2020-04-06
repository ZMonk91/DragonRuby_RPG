
# Creates a 16 x 16 grid
class Grid
  @grid_x = [0, 80, 160, 240, 320, 400, 480, 560, 640, 720, 800, 880, 960, 1040, 1120, 1200, 1280]
  @alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  $grid = {}
  @grid_y = [0, 45, 90, 135, 180, 225, 270, 315, 360, 405, 450, 495, 540, 585, 630, 675, 720]

  def self.create
    @grid_x.each_with_index do |x_coord, idx|
      @grid_y.each_with_index do |y_coord, idx2|
        var = "#{@alphabet[idx]}#{idx2}".to_sym
        $grid[var] = [x_coord, y_coord]
      end
    end
  end
end
# grid = Grid.create
