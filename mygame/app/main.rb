require '/app/wyvern/index.rb'


@game_state = {
  # sidebar_collapsed: false,
  # sidebar_size: 250,
  main_menu: true,
  game: false,
  wc_screen: false,
  skill_screen: true,
  current_skill: "n/a",
  component_info: [],
  latest_activity: ["Welcome to Nordsman", "Current Level: #{0}", "Total XP: #{0}"],
}
$gtk.args.state.sidebar_collapsed_state = false
$gtk.args.state.sidebar_size = 250

def render_bg
  state.progress_timer = (state.progress_timer + 1)
  state.starting_num = (state.starting_num + 1)
  bg = Sprite.new(:rectangle)
  bg.position([0,0])
    .size([1280, 720])
    .color(:background)
  sprites << bg.render

end


def render_main_menu

  options_button = Sprite.new(:rectangle)
  options_button_border = Sprite.new(:rectangle)
  play_button = Sprite.new(:rectangle)
  play_button_border = Sprite.new(:rectangle)
  options_button_text_highlight = Fonts.new
  play_button_text_highlight = Fonts.new
  play_button_text = Fonts.new

  options_button.position([490,224])
                .size([250,65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {options_button.color(:teal)}

  options_button_border.position([488, 224])
                .size([252,65])
                .alpha(255)
                .color(:teal)


  play_button.position([490,324])
                .size([250,65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {play_button.color(:teal)}
                .on_click{play_game}


  play_button_border.position([488, 324])
                .size([252,65])
                .alpha(255)
                .color(:teal)


  play_button_text.font_style(:runes)
                  .position([620, 375])
                  .color(:white)
                  .text("PLAY")
                  .size(10)
                  .render

  play_button_text_highlight.font_style(:runes)
                  .position([620, 374])
                  .color(:dark)
                  .text("PLAY")
                  .size(12)


  options_button_text_highlight.font_style(:runes)
                  .position([620, 268])
                  .color(:teal)
                  .text("OPTIONS")
                  .size(7)


  options_button_text = Fonts.new
  options_button_text.font_style(:runes)
                  .position([620, 268])
                  .color(:white)
                  .text("OPTIONS")
                  .size(6)
                  .render

  sprites << play_button_border.render
  sprites <<  play_button.render
  sprites << options_button_border.render
  sprites <<  options_button.render

end

def populate_ui
  sidebar_w = sidebar_collapsed?

game_bg = Sprite.new(:square)
game_bg.position([0,0])
       .size([1279,675])
       .color(:background)
       .alpha(255)

game_border = Sprite.new(:square)
game_border.position([0,0])
           .size([1280,676])
           .color(:primary)


sidebar_container = Sprite.new(:square)
sidebar_container.position([0,0])
                 .size([sidebar_w + 60,1280])
                 .color(:background)
                 .alpha(255)

sidebar_border = Sprite.new(:square)
sidebar_border.position([0,0])
                 .size([sidebar_w + 61,1280])
                 .color(:primary)
                 .alpha(255)

bottom_bar_container = Sprite.new(:square)
bottom_bar_container.position([0,0])
                 .size([1280,92])
                 .color(:background)
                 .alpha(255)

bottom_bar_border = Sprite.new(:square)
bottom_bar_border.position([0,0])
                 .size([1280, 93])
                 .color(:primary)
                 .alpha(255)

sprites << game_border.render
sprites << game_bg.render
sprites << bottom_bar_border.render
sprites << bottom_bar_container.render
sprites << sidebar_border.render
sprites << sidebar_container.render




render_top_bar
populate_latest_activity
end
def render_top_bar
    coin = '/app/wyvern/sprites/game/gold.png'

coin_counter_bg = game_bg = Sprite.new(:pill)
coin_counter_bg.position([1000,678])
               .size([150,38])
               .color(:btn_bg)
               .alpha(255)

coin_counter = Fonts.new
coin_counter.font_style(:subtitle)
                  .position([1140, 705])
                  .color(:white)
                  .text("#{$gtk.args.state[:system_info][:player][:gold]}")
                  .size(-2)
                  .alignment(2)
                  .render

username = Fonts.new
username.font_style(:headline)
                  .position([sidebar_collapsed? + 350, 705])
                  .color(:white)
                  .text("#{$gtk.args.state[:system_info][:player][:username]}")
                  .size(2)
                  .alignment(2)
                  .render

level = Fonts.new
level.font_style(:headline)
                  .position([sidebar_collapsed? + 650, 705])
                  .color(:white)
                  .text(" Level #{$gtk.args.state[:system_info][:player][:level]}")
                  .size(2)
                  .alignment(2)
                  .render

  sprites << coin_counter_bg.render
  sprites << [1010,686,20,20,coin]
end

def populate_latest_activity
  oldest_activity = Fonts.new
  oldest_activity.font_style(:body)
                  .position([640, 80])
                  .color(:white)
                  .text(@game_state[:latest_activity][-3])
                  .size(-3)
                  .alignment(0)
                  .render
  older_activity = Fonts.new
  older_activity.font_style(:body)
                  .position([640, 50])
                  .color(:white)
                  .text(@game_state[:latest_activity][-2])
                  .size(-3)
                  .alignment(0)
                  .render
  old_activity = Fonts.new
  old_activity.font_style(:body)
                  .position([640, 20])
                  .color(:white)
                  .text(@game_state[:latest_activity][-1])
                  .size(-3)
                  .alignment(0)
                  .render
end

def play_game
  @game_state[:main_menu] = false
  @game_state[:game] = true

  populate_ui
  populate_side_bar

end

def sidebar_collapsed?
  return 19 if @game_state[:sidebar_collapsed]
  return 190
end

def populate_side_bar
  sidebar_w = sidebar_collapsed?

  ### Create
  btn_1_text = Fonts.new
  btn_3_text = Fonts.new
  btn_2_text = Fonts.new
  btn_4_text = Fonts.new
  btn_5_text = Fonts.new
  btn_6_text = Fonts.new
  btn_7_text = Fonts.new
  btn_8_text = Fonts.new

  btn_swap = '/app/wyvern/sprites/icons/swap.png'
  btn_1_sprite = '/app/wyvern/sprites/icons/shop.png'
  btn_2_sprite = '/app/wyvern/sprites/icons/bank.png'
  btn_3_sprite = '/app/wyvern/sprites/icons/skills.png'
  btn_4_sprite = '/app/wyvern/sprites/icons/inventory.png'
  btn_5_sprite = '/app/wyvern/sprites/icons/player.png'
  btn_6_sprite = '/app/wyvern/sprites/icons/mastery.png'
  btn_7_sprite = '/app/wyvern/sprites/icons/settings.png'
  btn_8_sprite = '/app/wyvern/sprites/icons/statistics.png'


  btn_collapse = [sidebar_w + 67, 684, 30, 30, btn_swap, 0, 255, 255, 255, 255]
  collapse_btn = Sprite.new(:square)
  collapse_btn.position([sidebar_w + 61, 676])
       .size([44, 44])
       .alpha(255)
       .color(:btn_bg)
       .on_hover do
         collapse_btn.color(:primary) &&
         btn_collapse = [sidebar_w + 67, 684, 30, 30, btn_swap, 0, 255, 0, 0, 0]
       end
       .on_click { @game_state[:sidebar_collapsed] = !@game_state[:sidebar_collapsed] }

 sprites << collapse_btn.render
 sprites << btn_collapse

 ###Style
  btn_1_text.font_style(:headline)
            .position([12, 620])
            .color(:white)
            .text("SHOP")
            .size(2)
            .alignment(0)

  btn_2_text.font_style(:headline)
            .position([12, 550])
            .color(:white)
            .text("BANK")
            .size(2)
            .alignment(0)

  btn_3_text.font_style(:headline)
            .position([12, 482])
            .color(:white)
            .text("SKILLS")
            .size(2)
            .alignment(0)

  btn_4_text.font_style(:headline)
            .position([12, 413])
            .color(:white)
            .text("INVENTORY")
            .size(2)
            .alignment(0)

  btn_5_text.font_style(:headline)
            .position([12, 346])
            .color(:white)
            .text("PLAYER")
            .size(2)
            .alignment(0)

  btn_6_text.font_style(:headline)
            .position([12, 278])
            .color(:white)
            .text("MASTERY")
            .size(2)
            .alignment(0)

  btn_7_text.font_style(:headline)
            .position([12, 210])
            .color(:white)
            .text("OPTIONS")
            .size(2)
            .alignment(0)

  btn_8_text.font_style(:headline)
            .position([12, 140])
            .color(:white)
            .text("STATISTICS")
            .size(2)
            .alignment(0)

  btn  = [sidebar_w, 582, 30, 30, btn_1_sprite, 0, 255, 255, 255, 255]
  btn2 = [sidebar_w, 512, 30, 30, btn_2_sprite, 0, 255, 255, 255, 255]
  btn3 = [sidebar_w, 445, 30, 30, btn_3_sprite, 0, 255, 255, 255, 255]
  btn4 = [sidebar_w, 380, 30, 30, btn_4_sprite, 0, 255, 255, 255, 255]
  btn5 = [sidebar_w, 310, 30, 30, btn_5_sprite, 0, 255, 255, 255, 255]
  btn6 = [sidebar_w, 240, 30, 30, btn_6_sprite, 0, 255, 255, 255, 255]
  btn7 = [sidebar_w, 175, 30, 30, btn_7_sprite, 0, 255, 255, 255, 255]
  btn8 = [sidebar_w, 110, 30, 30, btn_8_sprite, 0, 255, 255, 255, 255]

  logo_text = Fonts.new
  logo_text.font_style(:runes)
                  .position([125, 705])
                  .color(:white)
                  .text("NORDSMAN")
                  .size(12)
                  .render if !@game_state[:sidebar_collapsed]

  logo_text_collapsed1 = Fonts.new
  logo_text_collapsed1.font_style(:runes)
                  .position([40, 705])
                  .color(:white)
                  .text("NORDS")
                  .size(-2)
                  .render if @game_state[:sidebar_collapsed]

  logo_text_collapsed2 = Fonts.new
  logo_text_collapsed2.font_style(:runes)
                  .position([40, 690])
                  .color(:white)
                  .text("MAN")
                  .size(-2)
                  .render if @game_state[:sidebar_collapsed]

  btn_1 = Sprite.new(:rectangle)
  btn_1.position([-190 + sidebar_w, 570])
       .size([250, 65])
       .alpha(255)
       .color(:btn_bg)
       .on_hover do
         btn_1.color(:primary) &&
           btn_1_text.color(:black) &&
           btn = [sidebar_w,582,30,30, btn_1_sprite,0,255,0,0,0]
       end

  btn_2 = Sprite.new(:rectangle)
  btn_2.position([-190 + sidebar_w, 502])
        .size([250,65])
        .alpha(255)
        .color(:btn_bg)
        .on_hover do
          btn_2.color(:primary) &&
            btn_2_text.color(:black) &&
            btn2 = [sidebar_w,512,30,30, btn_2_sprite,0,255,0,0,0]
        end

  btn_3 = Sprite.new(:rectangle)
  btn_3.position([-190 + sidebar_w, 434])
       .size([250, 65])
       .alpha(255)
       .color(:btn_bg)
       .on_hover do
         btn_3.color(:primary) &&
           btn_3_text.color(:black) &&
           btn3 = [sidebar_w,445,30,30, btn_3_sprite,0,255,0,0,0]
       end

  btn_4 = Sprite.new(:rectangle)
  btn_4.position([-190 + sidebar_w, 366])
        .size([250, 65])
        .alpha(255)
        .color(:btn_bg)
        .on_hover do
          btn_4.color(:primary) &&
            btn_4_text.color(:black) &&
            btn4 = [sidebar_w, 380, 30, 30, btn_4_sprite, 0, 255, 0, 0, 0]
        end

  btn_5 = Sprite.new(:rectangle)
  btn_5.position([-190 + sidebar_w, 298])
       .size([250, 65])
       .alpha(255)
       .color(:btn_bg)
       .on_hover do
         btn_5.color(:primary) &&
           btn_5_text.color(:black) &&
           btn5 = [sidebar_w,310,30,30, btn_5_sprite, 0, 255, 0, 0, 0]
       end

  btn_6 = Sprite.new(:rectangle)
  btn_6.position([-190 + sidebar_w, 230])
       .size([250, 65])
       .alpha(255)
       .color(:btn_bg)
       .on_hover do
         btn_6.color(:primary) &&
           btn_6_text.color(:black) &&
           btn6 = [sidebar_w,240,30,30, btn_6_sprite, 0, 255, 0, 0, 0]
       end

  btn_7 = Sprite.new(:rectangle)
  btn_7.position([-190 + sidebar_w, 162])
       .size([250, 65])
       .alpha(255)
       .color(:btn_bg)
       .on_hover do
         btn_7.color(:primary) &&
           btn_7_text.color(:black) &&
           btn7 = [sidebar_w,175,30,30, btn_7_sprite, 0, 255, 0, 0, 0]
       end

  btn_8 = Sprite.new(:rectangle)
  btn_8.position([-190 + sidebar_w, 94])
       .size([250, 65])
       .alpha(255)
       .color(:btn_bg)
       .on_hover do
         btn_8.color(:primary) &&
           btn_8_text.color(:black) &&
           btn8 = [sidebar_w,110,30,30, btn_8_sprite, 0, 255, 0, 0, 0]
       end

  sprites << btn_1.render
  sprites << btn_2.render
  sprites << btn_3.render
  sprites << btn_4.render
  sprites << btn_5.render
  sprites << btn_6.render
  sprites << btn_7.render
  sprites << btn_8.render

  btn_1_text.render if !@game_state[:sidebar_collapsed]
  btn_2_text.render if !@game_state[:sidebar_collapsed]
  btn_3_text.render if !@game_state[:sidebar_collapsed]
  btn_4_text.render if !@game_state[:sidebar_collapsed]
  btn_5_text.render if !@game_state[:sidebar_collapsed]
  btn_6_text.render if !@game_state[:sidebar_collapsed]
  btn_7_text.render if !@game_state[:sidebar_collapsed]
  btn_8_text.render if !@game_state[:sidebar_collapsed]

  sprites << btn
  sprites << btn2
  sprites << btn3
  sprites << btn4
  sprites << btn5
  sprites << btn6
  sprites << btn7
  sprites << btn8
end
def skill_screen
  sidebar_w = sidebar_collapsed?
  skill_btn = Sprite.new(:rectangle)
  skill_btn.position([500, 93])
       .size([100, 1])
       .alpha(255)
       .color(:red)
       sprites << skill_btn.render

       layout_screen([20,15],[200,75],20)
end

def layout_screen(gutter_size, component_size, component_quantity)
  window_x_min = (sidebar_collapsed? + 61)
  window_x_max = 1279
  window_width = window_x_max - window_x_min

  window_h_max = 674
  window_h_min = 93
  window_height = window_h_min - window_h_min

  horizontal_gutter = gutter_size[0]
  verticle_gutter = gutter_size[1]
  component_w = component_size[0]
  component_h = component_size[1]

  component_w_total = component_w + horizontal_gutter
  component_h_total = component_h + verticle_gutter

  horizontal_components_per_line = (window_width / component_w_total).round(0)
  vertical_components_per_line = window_height - (component_h_total)
  current_x = window_x_min
  current_y = 1

  result = Array.new(component_quantity, 0)
  split_comps = result.slice(horizontal_components_per_line).to_a
  split_comps.each_with_index do |x, idx|
    puts idx
  end


    # for num in 0...component_quantity do
    #   new_arr = []
    #   # Get Width
    #   current_x += (horizontal_gutter / 2)
    #   new_arr << current_x
    #   current_x += component_w + (horizontal_gutter / 2)
    #   # Get Height
    #   new_arr << (window_h_max - ((vertical_components_per_line / 2 + component_h) * current_y))
    #   result[num] = new_arr

    #   current_x = window_x_min and  current_y += 1 if num > horizontal_components_per_line

    # end
    # puts result
    # result

end

def woodcutting_screen
  skill_bg = Sprite.new(:rectangle)
  skill_bg.position([252, 94])
          .size([1027, 580])
          .color(:background)

  sprites << skill_bg.render
  # wc_comps = ["NORMAL","TEAK","OAK","WILLOW","ASH","PINE","YEW","MAGIC"]
  wc_hash = {
    types:          ["NORMAL TREE", "TEAK TREE", "OAK TREE", "WILLOW TREE", "ASH TREE", "PINE TREE", "YEW TREE", "MAGIC TREE"],
    product:        ["Normal Logs", "Teak Logs", "Oak Logs", "Willow Logs", "Ash Logs", "Pine Logs", "Yew Logs", "Magic Logs"],
    xp_amt:         [3,                7,             15,        31,         63,         127,         255,          511],
    xp_measurement: "XP / Log",
    action:         "CHOP",
    sprite_loc:     ['normal_tree', 'teak_tree', 'oak_tree', 'willow_tree', 'ash_tree', 'pine_tree', 'yew_tree','magic_tree']
  }
    layout_skillscreen(wc_hash, 'wc')
end


def layout_skillscreen(skill_comps, type)
  window_w_min = (sidebar_collapsed? + 62)
  window_w_max = 1279
  window_w = window_w_max - window_w_min

  window_h_min = 93
  window_h_max = 675
  window_h = window_h_max - window_h_min

  gutter_w = window_w / 12
  gutter_h = window_h / 12
  comp_w = 175
  comp_h = 200
  comp_w_total = comp_w + gutter_w
  comp_h_total = comp_h + gutter_h

  line_height = window_h_max - (comp_h + gutter_h / 2)
  components_per_line = (window_w / comp_w_total).round(0)

  skill_comps[:types].each_with_index do |comp, idx|
    if idx < components_per_line
      skill_component(
        (window_w_min + gutter_w / 2) + (comp_w_total * idx),
        line_height,
        comp,
        skill_comps[:xp_amt][idx],
        skill_comps[:xp_measurement],
        skill_comps[:action],
        skill_comps[:product][idx],
        skill_comps[:sprite_loc][idx],
        type)
    elsif idx >= components_per_line
      skill_component(
        (window_w_min + gutter_w / 2) + (comp_w_total * (idx - components_per_line)),
        (line_height - comp_h_total),
        comp,
        skill_comps[:xp_amt][idx],
        skill_comps[:xp_measurement],
        skill_comps[:action],
        skill_comps[:product][idx],
        skill_comps[:sprite_loc][idx],
         type)
    end
  end
end

def skill_component(x,y,component_name,xp_amt,xp_measurement,action,product,url, category)
  component_title = Fonts.new
  component_title.font_style(:subtitle)
                  .position([x + ((175 + action.length) / 2), y + 185])
                  .color(:white)
                  .text(action)
                  .size(-4)
                  .alignment(1)
                  .render

  component_title = Fonts.new
  component_title.font_style(:button)
                  .position([x + ((175 + component_name.length) / 2), y + 170])
                  .color(:white)
                  .text(component_name)
                  .size(-3)
                  .alignment(1)
                  .render

  component_title = Fonts.new
  component_title.font_style(:subtitle)
                  .position([x + ((175 + "#{xp_amt} #{xp_measurement}".length) / 2), y + 150])
                  .color(:white)
                  .text("#{xp_amt} #{xp_measurement}")
                  .size(-4)
                  .alignment(1)
                  .render


  component_window = Sprite.new(:rectangle_rounded)
  component_window.position([x, y])
                  .color(:btn_bg)
                  .alpha(255)
                  .size([175, 200])


  skill_bar = Sprite.new(:rectangle_rounded)
  skill_bar.position([x + 25, y + 25])
           .color(:btn_1)
           .alpha(255)
           .size([125, 20])


  if click_listener([x, y, x + 175, y + 200])
    @game_state[:current_skill] = category
    @game_state[:component_info] = [x, y, xp_amt, product,category]
    state.progress_timer = 0
  end

  sprites << component_window.render
  sprites << [x + 60, y + 55, 64, 64, "/app/wyvern/sprites/game/#{category}/#{url}.png"]
  sprites << skill_bar.render


  skill_bar_animate(@game_state[:component_info]) if @game_state[:current_skill] == 'wc'
end

def skill_bar_animate(component_info)
  x = component_info[0]
  y = component_info[1]
  xp_amount = component_info[2]
  product = component_info[3]
  category = component_info[4]

  num_of_sprites = 125
  num_of_frames = 1
  new_frame = state.progress_timer.idiv(num_of_frames).mod(num_of_sprites)

  if new_frame == (num_of_sprites - 1)
    state.progress_timer = 0
    System.add_total_xp(xp_amount)
    System.add_to_inventory(product, 1)
    @game_state[:latest_activity] << "+#{xp_amount} #{category.upcase} XP, 1 #{product}"
    System.save_game
  end
  sprites << [x + 25, y + 25, new_frame, 20, Shapes.get_shape(:rectangle_rounded), 0, 255, Colors.get_color(:green)]

end


def tick(args)
  # if state.tick_count == 0
  #   System.load_game
  # end

  state.progress_timer ||= 0
  ui = UI.new(state.sidebar_size)

  ui.render
end
$gtk.args.state.view = 0
$gtk.args.state.current_screen = nil
$gtk.args.state.system_info = {
  player: {
    username: 'Default Username',
    level: 1,
    total_xp: nil,
    gold: 10,
    religion: "none",
    profession: "none"
  },
  inventory: {

  },
  game_stats: {
    time_played: 0,
    died: 0
  },
  skills: {
    agility: {
      level: 1,
      xp: 0
    },
    archery: {
      level: 1,
      xp: 0
    },
    barter: {
      level: 1,
      xp: 0
    },
    cooking: {
      level: 1,
      xp: 0
    },
    crafting: {
      level: 1,
      xp: 0
    },
    defense: {
      level: 1,
      xp: 0
    },
    exploring: {
      level: 1,
      xp: 0
    },
    farming: {
      level: 1,
      xp: 0
    },
    fishing: {
      level: 1,
      xp: 0
    },
    forging: {
      level: 1,
      xp: 0
    },
    health: {
      level: 1,
      xp: 0
    },
    hunting: {
      level: 1,
      xp: 0
    },
    leadership: {
      level: 1,
      xp: 0
    },
    luck: {
      level: 1,
      xp: 0
    },
    magic: {
      level: 1,
      xp: 0
    },
    mining: {
      level: 1,
      xp: 0
    },
    prayer: {
      level: 1,
      xp: 0
    },
    sailing: {
      level: 1,
      xp: 0
    },
    stamina: {
      level: 1,
      xp: 0
    },
    strength: {
      level: 1,
      xp: 0
    },
    woodcraft: {
      level: 1,
      xp: 0
    },
    wisdom: {
      level: 1,
      xp: 0
    }
  }
}

def labels
  $gtk.args.outputs.labels
end

def state
  $gtk.args.state
end

def inputs
  $gtk.args.inputs
end

def outputs
  $gtk.args.outputs
end

def sprites
  $gtk.args.outputs.sprites
end

def mouse
  $gtk.args.inputs.mouse
end

def logged_in?
  @logged_in
end

def args
  $gtk.args
end