class UI
  def initialize(sidebar_size)
    @sidebar_size = sidebar_size
  end

  def sidebar=(new_size)
    @sidebar_size = new_size
  end

  def render
    GameWindow.new(@sidebar_size)
    Sidebar.new(@sidebar_size)
    Bottombar.new(@sidebar_size)
    Topbar.new(@sidebar_size)
  end
end

# Sidebar class
class Sidebar
  def initialize(width)
    @width = width
    @buttons_list = [
    "shop",
    "bank",
    "skills",
    "inventory",
    "player",
    "mastery",
    "settings",
    "statistics"
    ]

    render_bg
    render_logo
    render_buttons
  end

  def render_bg
    bg = Sprite.new(:rectangle)
    bg.position([0, 0])
      .size([@width, 720])
      .color(:background)
    bg_border = Sprite.new(:rectangle)
    bg_border.position([@width, 0])
             .size([1, 720])
             .color(:primary)

      sprites << bg_border.render
      sprites << bg.render
  end

  def render_logo
    logo = Fonts.new

    if @width <= 150
      logo.font_style(:runes)
                      .position([@width/2, 705])
                      .color(:white)
                      .text("NORDS")
                      .size(-2)
                      .alignment(1)
                      .render
      logo.font_style(:runes)
                      .position([@width/2, 685])
                      .color(:white)
                      .text("MAN")
                      .size(-2)
                      .alignment(1)
                      .render
    else
      logo.font_style(:runes)
          .position([@width/2, 695])
          .color(:white)
          .text("NORDSMAN")
          .size(10)
          .render
    end
  end

  def render_buttons
    @buttons_list.each_with_index do |item, idx|
      btn = Sprite.new(:rectangle)
      btn.size([@width, 65])
         .position([0, 720 - (idx * 66 + 160) ])
         .color(:btn_bg)
         .on_hover { btn.color(:primary) }
         .on_click{ state.current_screen = item }
      if @width >= 100
        btn_text = Fonts.new
        btn_text.font_style(:runes)
                .position([@width/2, 720 - (idx * 66 + 120)])
                .color(:white)
                .text("#{item}")
                .size(-2)
                .alignment(1)
                .render
        sprites << btn.render
      else
        btn_icon = "/app/wyvern/sprites/icons/#{item}.png"
        sprites << btn.render
        sprites << [@width / 4, 720 - (idx * 66 + 145), 32, 32, btn_icon, 0 , 255 , 255, 255, 255]
      end
        
      
    end
  end
end

class Bottombar
  def initialize(width)
    @width = width
    render_bg
  end

  def render_bg
    bg = Sprite.new(:rectangle)
    bg.position([@width + 1, 0])
      .size([1280 - @width + 1, 72])
      .color(:background)
    bg_border = Sprite.new(:rectangle)
    bg_border.position([@width + 1, 72])
             .size([1280 - @width + 1, 1])
             .color(:primary)

    sprites << bg_border.render
    sprites << bg.render
  end
end

class Topbar

  def initialize(width)
    @width = width
    render_bg
    render_collapse_button
    render_username
    render_level
    render_gold
  end

  def render_username
    name = state.system_info[:player][:username]
    username = Fonts.new
                    .font_style(:headline)
                    .color(:white)
                    .size(2)
                    .text(name)
                    .position([1275, 710])
                    .alignment(2)
                    .render
  end

  def render_level
    lev = state.system_info[:player][:level]
    level = Fonts.new
                    .font_style(:headline)
                    .color(:white)
                    .size(-2)
                    .text("Level #{lev}")
                    .position([1275, 680])
                    .alignment(2)
                    .render
  end

  def render_gold
    icon = '/app/wyvern/sprites/game/gold.png'
    coin = [1130, 664, 16, 16, icon]
    amt = state.system_info[:player][:gold]
    level = Fonts.new
                    .font_style(:headline)
                    .color(:white)
                    .size(-2)
                    .text("#{amt}")
                    .position([coin[0] + 40 +( "#{amt}".length * 5), 680])
                    .alignment(2)
                    .render

    sprites << coin
  end


  def sidebar_collapse_function
    state.sidebar_collapsed_state = !state.sidebar_collapsed_state
    state.sidebar_size = 64 if state.sidebar_collapsed_state
    state.sidebar_size = 250 unless state.sidebar_collapsed_state
  end

  def render_collapse_button
    bg = Sprite.new(:rectangle)
    bg.position([@width + 1, 720 - 32])
      .size([32, 32])
      .color(:btn_bg)
      .on_hover { bg.color(:primary) }
      .on_click { sidebar_collapse_function }
    
    btn_swap = '/app/wyvern/sprites/icons/swap.png'
    sprites << bg.render
    sprites << [@width + 1, 720 - 32, 32, 32, btn_swap]
  end

  def render_bg
    bg = Sprite.new(:rectangle)
    bg.position([@width + 1, 720 - 72])
      .size([1280 - @width + 1, 72])
      .color(:background)
    bg_border = Sprite.new(:rectangle)
    bg_border.position([@width + 1, 720 - 73])
             .size([1280 - @width + 1, 1])
             .color(:primary)

    sprites << bg_border.render
    sprites << bg.render
  end
end

class GameWindow
  def initialize(width)
    @width = width
    render_bg
    render_skills if state.current_screen == "skills"
    render_shop if state.current_screen == "shop"
  end

  def render_bg
    bg = Sprite.new(:rectangle)
    bg.position([@width + 1, 73])
      .size([1280 - @width - 2, 720 - 146])
      .color(:dark)
    bg_border = Sprite.new(:rectangle)
    bg_border.position([1279, 72])
             .size([1, 720 - 145])
             .color(:primary)

    sprites << bg_border.render
    sprites << bg.render
  end

  def render_skills
    skill_count = state.system_info[:skills].keys.count
    btn_size = [135, 110]
    screen_grid = create_grid(@width,skill_count+1,12,61,[1280 - @width, 720 - 146],btn_size)
    reg_size = screen_grid[0].count
    leftovers = screen_grid[-1].count

    screen_grid.each_with_index do |arr, idx|
      arr.each_with_index do |comp, idx2|
        current_skill = state.system_info[:skills].keys[(arr.count * idx) + idx2 ]
        current_skill = state.system_info[:skills].keys[((arr.count + reg_size - leftovers) * idx) + idx2] if arr == screen_grid[-1] && reg_size != leftovers
        btn = Sprite.new(:rectangle_rounded)
        btn.position(comp)
           .size(btn_size)
           .color(:btn_bg)
           .on_hover { btn.color(:primary) }
        skill = Fonts.new
        skill.position([comp[0] + 5, comp[1] + btn_size[1]])
             .color(:white)
             .text(current_skill.upcase)
             .size(-1)
             .font_style(:body)
             .alignment(0)
             .render
        level = Fonts.new
        level.position([comp[0] + btn_size[0], comp[1] + 20])
             .color(:white)
             .text("#{state.system_info[:skills][current_skill][:level]} / 99")
             .size(-2)
             .font_style(:body)
             .alignment(2)
             .render

        sprites << btn.render

        test_sprite = Sprite.new(:triangle)
        test_sprite.color(:purple)
                   .position([@width, 500])
                   .size([20, 20])
                   .on_click { state.view += 1 }
        sprites << test_sprite.render
        test_sprite.color(:purple)
                   .position([@width, 450])
                   .size([20, 20])
                   .tilt(180)
                   .on_click { state.view -= 1 }
        sprites << test_sprite.render
        tester = Sprite.new(:triangle)
        tester.color(:purple)
              .position(scrollview([450, 10]))
              .size([200,200])
        sprites << tester.render
      end
    end
  end

  def render_shop
    shop = Shop.new(@width)
  end

end

def create_grid(width, component_qty, gutter_size, margin, window_size, component_size)
  gutter_size = gutter_size
  starting_w = width + margin

  height = window_size[1] - margin
  width = window_size[0] - (margin * 2)
  
  component_total_w = (component_size[0] + gutter_size)
  component_total_h = (component_size[1] + gutter_size)
  column_count = width / component_total_w
  row_count = component_qty.idiv(column_count)
  leftover_cells = (component_qty % (row_count * column_count)).round()
  # puts component_qty
  # puts row_count
  # puts leftover_cells
  grid = Array.new(row_count) { Array.new(column_count, component_total_w) }
  grid << (Array.new(leftover_cells, component_total_w))
  grid.each_with_index do |row,idx|
    row.each_with_index do |col,idx2|
      grid[idx][idx2] = [starting_w + (idx2 * component_total_w),height -(component_total_h * idx)]
    end
  end
  grid
end

def scrollview(component, *max_views)
  top, bottom = max_views

  [component[0], component[1] + $gtk.args.state.view] if max_views.nil?

end

class Item
  attr_accessor :name, :price, :description, :img
  def initialize
  end
end

class Shop
  @items = {
    bank_slot: {
      name: "Bank Slot",
      price: 3,
      img: '',
      description: "Adds an additional bank slot to your bank"
    },
    hatchet: {
      name: 'Wooden Hatchet',
      price: 3,
      img: '',
      description: "A poorly made wooden hatchet"
    },
    pickaxe: {
      name: 'Wooden Pickaxe',
      price: 3,
      img: '',
      description: "A poorly made wooden pickaxe"
    }
    
  }
  def initialize(width)
    @width = width
  end

end