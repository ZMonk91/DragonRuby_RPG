require '/app/wyvern/index.rb'


@game_state = {
  main_menu: true,
  game: false
}

def render_bg
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
  game_bg = Sprite.new(:square)
game_bg.position([0,0])
       .size([1279,675])
       .color(:black)
       .alpha(255)

game_border = Sprite.new(:square)
game_border.position([0,0])
           .size([1280,676])
           .color(:teal)


sidebar_container = Sprite.new(:square)
sidebar_container.position([0,0])
                 .size([250,1280])
                 .color(:dark)
                 .alpha(255)

sidebar_border = Sprite.new(:square)
sidebar_border.position([0,0])
                 .size([251,1280])
                 .color(:teal)
                 .alpha(255)

bottom_bar_container = Sprite.new(:square)
bottom_bar_container.position([0,0])
                 .size([1280,92])
                 .color(:dark)
                 .alpha(255)

bottom_bar_border = Sprite.new(:square)
bottom_bar_border.position([0,0])
                 .size([1280,93])
                 .color(:teal)
                 .alpha(255)

sprites << game_border.render
sprites << game_bg.render
sprites << bottom_bar_border.render
sprites << bottom_bar_container.render
sprites << sidebar_border.render
sprites << sidebar_container.render
end


def play_game
  @game_state[:main_menu] = false
  @game_state[:game] = true

  populate_ui
  populate_side_bar

end

def populate_side_bar
  logo_text = Fonts.new
  logo_text.font_style(:runes)
                  .position([125, 705])
                  .color(:white)
                  .text("NORDSMAN")
                  .size(8)
                  .render

  btn_1 = Sprite.new(:rectangle)
  btn_1.position([0,570])
                .size([250,65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {btn_1.color(:teal)}
  
  btn_2 = Sprite.new(:rectangle)
  btn_2.position([0,502])
                .size([250,65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {btn_2.color(:teal)}
  btn_3 = Sprite.new(:rectangle)
  btn_3.position([0,434])
                .size([250, 65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {btn_3.color(:teal)}
  
  btn_4 = Sprite.new(:rectangle)
  btn_4.position([0,366])
                .size([250, 65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {btn_4.color(:teal)}

  btn_5 = Sprite.new(:rectangle)
  btn_5.position([0,298])
                .size([250, 65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {btn_5.color(:teal)}

  btn_6 = Sprite.new(:rectangle)
  btn_6.position([0,230])
                .size([250, 65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {btn_6.color(:teal)}

  btn_7 = Sprite.new(:rectangle)
  btn_7.position([0,162])
                .size([250, 65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {btn_7.color(:teal)}

  btn_8 = Sprite.new(:rectangle)
  btn_8.position([0,94])
                .size([250, 65])
                .alpha(255)
                .color(:btn_bg)
                .on_hover() {btn_8.color(:teal)}


                sprites << btn_1.render
                sprites << btn_2.render
                sprites << btn_3.render
                sprites << btn_4.render
                sprites << btn_5.render
                sprites << btn_6.render
                sprites << btn_7.render
                sprites << btn_8.render


  btn_1_text = Fonts.new
  btn_1_text.font_style(:headline)
                  .position([12, 620])
                  .color(:white)
                  .text("SHOP")
                  .size(4)
                  .alignment(0)
                  .render
  btn_2_text = Fonts.new
  btn_2_text.font_style(:headline)
                  .position([12, 550])
                  .color(:white)
                  .text("BANK")
                  .size(4)
                  .alignment(0)
                  .render
  btn_3_text = Fonts.new
  btn_3_text.font_style(:headline)
                  .position([12, 482])
                  .color(:white)
                  .text("SKILLS")
                  .size(4)
                  .alignment(0)
                  .render
  btn_4_text = Fonts.new
  btn_4_text.font_style(:headline)
                  .position([12, 413])
                  .color(:white)
                  .text("INVENTORY")
                  .size(4)
                  .alignment(0)
                  .render
  btn_5_text = Fonts.new
  btn_5_text.font_style(:headline)
                  .position([12, 346])
                  .color(:white)
                  .text("PLAYER")
                  .size(4)
                  .alignment(0)
                  .render
  btn_6_text = Fonts.new
  btn_6_text.font_style(:headline)
                  .position([12, 278])
                  .color(:white)
                  .text("MASTERY")
                  .size(4)
                  .alignment(0)
                  .render
  btn_7_text = Fonts.new
  btn_7_text.font_style(:headline)
                  .position([12, 210])
                  .color(:white)
                  .text("OPTIONS")
                  .size(4)
                  .alignment(0)
                  .render
  btn_8_text = Fonts.new
  btn_8_text.font_style(:headline)
                  .position([12, 140])
                  .color(:white)
                  .text("STATISTICS")
                  .size(4)
                  .alignment(0)
                  .render

btn_1_sprite = '/app/wyvern/sprites/icons/shop.png'
btn_2_sprite = '/app/wyvern/sprites/icons/bank.png'
btn_3_sprite = '/app/wyvern/sprites/icons/skills.png'
btn_4_sprite = '/app/wyvern/sprites/icons/inventory.png'
btn_5_sprite = '/app/wyvern/sprites/icons/player.png'
btn_6_sprite = '/app/wyvern/sprites/icons/mastery.png'
btn_7_sprite = '/app/wyvern/sprites/icons/settings.png'
btn_8_sprite = '/app/wyvern/sprites/icons/statistics.png'


btn = [190,582,40,40, btn_1_sprite,0,255,255,255,255]
btn2 = [190,512,40,40, btn_2_sprite,0,255,255,255,255]
btn3 = [190,445,40,40, btn_3_sprite,0,255,255,255,255]
btn4 = [190,380,40,40, btn_4_sprite,0,255,255,255,255]
btn5 = [190,310,40,40, btn_5_sprite,0,255,255,255,255]
btn6 = [190,240,40,40, btn_6_sprite,0,255,255,255,255]
btn7 = [190,175,40,40, btn_7_sprite,0,255,255,255,255]
btn8 = [190,110,40,40, btn_8_sprite,0,255,255,255,255]


sprites << btn
sprites << btn2
sprites << btn3
sprites << btn4
sprites << btn5
sprites << btn6
sprites << btn7
sprites << btn8

end



def tick(args)

  render_bg
  render_main_menu if @game_state[:main_menu]
  play_game if @game_state[:game]
  play_game


end

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