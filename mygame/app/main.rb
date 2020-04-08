require '/app/wyvern/index.rb'

@game_state = {
  main_menu: true,
  game: false
}

def render_bg()
  background = UI.new
  background.square
            .position([0,0])
            .size([1270,710])
            .color(:dark)
            .shadow()
            .shadow_spread([4,4])
            .shadow_offset([-2,-2])
            .shadow_color(:border)
            .shadow_alpha(100)
            .render
end


def render_main_menu
  play_button = UI.new
  play_button.rectangle
              .position([540,320])
              .size([10,4])
              .alpha(255)
              .color(:btn_bg)
              .shadow()
              .shadow_spread([4,4])
              .shadow_color(:border)
              .shadow_alpha(100)
              .hover(color: :highlight)
              .shadow_offset([-2, -2])
              .render

  options_button = UI.new
  options_button.rectangle
              .position([540,220])
              .size([10,4])
              .alpha(255)
              .color(:btn_bg)
              .shadow()
              .shadow_spread([4,4])
              .shadow_color(:border)
              .shadow_alpha(100)
              .hover(color: :highlight)
              .shadow_offset([-2,-2])
              .render

  play_button_text = Fonts.new
  play_button_text.font_style(:headline)
                  .position([620, 375])
                  .color(:white)
                  .text("PLAY")
                  .size(10)
                  .render

  play_button_text = Fonts.new
  play_button_text.font_style(:headline)
                  .position([620, 268])
                  .color(:white)
                  .text("OPTIONS")
                  .size(6)
                  .render

new_obj = Sprite.new(:star)
new_obj.color([150, 44, 90])
       .position([550, 339])
       .position([210, 223])
       .on_click { new_obj.color([210, 2, 20]).position([288, 499]) }
       .on_hover { new_obj.color([0,0,0])}

new_obj2 = Sprite.new(:rectangle_rounded)
new_obj2.color([100, 144, 90])
       .position([250, 339])
       .on_click { new_obj2.color([210, 2, 220]).position([288, 499]) }
       .on_hover { new_obj2.color([0,3,41])}
sprites << new_obj.render

sprites << new_obj2.render


test2 = Sprite.new(:circle)
test2.color([123,0,123])
# test2.build_obj(:rectangle)

sprites << test2.render




end



def render_game
  tester = UI.new

  tester.circle
            .position([500,220])
            .size([16,16])
            .color(:red)
            .shadow()
            .shadow_spread([6,6])
            .hover(color: :blue)
            .shadow_offset([-5,15])
            .render

tester.shadow_color(:red).render

end



def tick(args)
  render_bg
  render_main_menu if @game_state[:main_menu]
  render_game if @game_state[:game]
  # render_game
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
