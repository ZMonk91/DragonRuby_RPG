require '/app/settings.rb'
require '/app/wyvern/wyvern.rb'

## Font Locations
  $noto = '/fonts/NotoSans-Regular.ttf'
  $hack_bold = '/fonts/Hack-Bold.ttf'
  $lib_mono_bold = '/fonts/LiberationMono-Bold.ttf'
  $inconsolata = '/fonts/Inconsolata-Regular.ttf'
  $comfortaa = '/fonts/Comfortaa-Regular.ttf'

## Sprite Locations
  @sprite_static_bg = "/mygame/sprites/bg/bg_0.png"

  
#### Icons
  @sprite_identity   = 'mygame/sprites/ui/icons/identity.png'
  @sprite_pencil     = 'mygame/sprites/ui/icons/pencil.png'
  @sprite_gear       = 'mygame/sprites/ui/icons/gear.png'
  @sprite_back_arrow = 'mygame/sprites/ui/icons/back_arrow.png'

#### Shapes
  @sprite_pill  = 'mygame/sprites/ui/shapes/white_pill.png'
  @sprite_graybox = 'mygame/sprites/ui/shapes/rounded_box.png'
  @sprite_circle = 'mygame/sprites/ui/shapes/white_circle.png'

## Variables
  @logged_in = false
  @show_menu = true
  @show_settings = false
  @play = false


def sine_gen(count)
  count += 600  # Maintains a minimum speed
  255 * Math.sin(state.tick_count/count).abs
end

def w_per(percentage_requested)
  return 1280 * (percentage_requested / 100)
end

def h_per(percentage_requested)
  return 720 * (percentage_requested / 100)
end

def timer(desired_time)
  ## args.state.tick_count / fps %total frames
  return (state.tick_count / 60 % desired_time).floor
end

def alpha_flash(desired_time)
  return (state.tick_count / desired_time % 255).floor
end

def display_splash_screen
  sprites << [ w_per(45), h_per(45), 130, 100, 'console-logo.png',0,alpha_flash(2)]
  labels << [ w_per(50), h_per(70), 'MADE WITH' ,13,1, 255, 0, 0,alpha_flash(2), $comfortaa]
  labels << [ w_per(50), h_per(40), 'DRAGONRUBY' ,25,1, 255, 0, 0,alpha_flash(2), $hack_bold]
end

def display_login(x,y)
  # Login_Box
  sprites << [w_per(44), h_per(49), 300, 40, @sprite_graybox,0,50,255,255,255]
  sprites << [w_per(45), h_per(50), 30, 30, @sprite_identity]
  labels << [ w_per(49), h_per(53.5), 'Login' , 255, 255, 255 ]
  # Register_Box
  sprites << [w_per(44), h_per(42), 300, 40, @sprite_graybox,0,50,255,255,255]
  sprites << [w_per(45), h_per(43), 30, 30, @sprite_pencil]
  labels << [ w_per(49), h_per(46.5), 'Register' , 255, 255, 255 ]
  # Settings_Box
  sprites << [w_per(44), h_per(35), 300, 40, @sprite_graybox,0,50,255,255,255]
  sprites << [w_per(45), h_per(36), 30, 30, @sprite_gear]
  labels << [ w_per(49), h_per(39.5), 'Settings' , 255, 255, 255 ]

  # Highlight on Hover
  if x.between?(w_per(44.5), w_per(44) + 294) && y.between?(h_per(49), h_per(49) + 40)
    sprites << [w_per(44), h_per(49), 300, 40, @sprite_graybox,0,50,255,255,255]
    if mouse.click
      @show_menu = false 
      @play = true
    end
  end

  if 
    x.between?(w_per(44.5), w_per(44) + 294) && y.between?(h_per(42), h_per(42) + 40)
      sprites << [w_per(44), h_per(42), 300, 40, @sprite_graybox,0,50,255,255,255]
      @show_menu = false if mouse.click
  end

  if x.between?(w_per(44.5), w_per(44) + 294) && y.between?(h_per(35), h_per(35) + 40)
    sprites << [w_per(44), h_per(35), 300, 40, @sprite_graybox,0,50,255,255,255]
    display_settings(x, y) if mouse.click
  end

end

def populate_settings_menu(x, y)
  locations = Array.new
  default_loc = h_per(30)

  # Generate Backbutton
    sprites << [w_per(42), h_per(65.5), 36, 36, @sprite_back_arrow]
    sprites << [w_per(42), h_per(65), 300, 40, @sprite_graybox,0,50]
    labels  << [w_per(50), h_per(69.5), 'Return', 3, 0, 255, 255, 255,$hack_bold]

  # Populate Settings buttons
  @system_settings.each do |setting|
    default_loc += 55
    locations << default_loc - 32

    sprites << [w_per(42), default_loc - 32, 300, 40, @sprite_graybox,0,50,255,255,255]
    labels << [w_per(43), default_loc, setting.values_at(:name),0,0, 255, 255, 255,255, $hack_bold]
    if setting.value?(true)
      sprites << [w_per(60), default_loc - 26, 60, 28, @sprite_pill,0,50,255,0,0]
      sprites << [w_per(62), default_loc - 29, 34, 34, @sprite_circle,0,250,255,0,0]
    else
      sprites << [w_per(60), default_loc - 26, 60, 28, @sprite_pill,0,50,255,255,255]
      sprites << [w_per(60), default_loc - 29, 34, 34, @sprite_circle,0,250,255,255,255]
    end
  end

  # Event Listeners
  locations.each_with_index do |location, index|
    if x.between?(w_per(42), w_per(42) + 300) && y.between?(location, location + 40)
      $gtk.args.outputs.sprites << [w_per(42), location, 300, 40, @sprite_graybox,0,50,255,255,255]
      $gtk.args.outputs.labels << [w_per(50),100,@system_settings[index].values_at(:description),0,1, 255, 255, 255]
      @system_settings[index][:value] = !@system_settings[index][:value] if $gtk.args.inputs.mouse.click
    end
  end

  # Event Listener - Back Button
      if x.between?(w_per(42), w_per(42) + 300) && y.between?(h_per(65), h_per(65) + 40)
        $gtk.args.outputs.sprites << [w_per(42), h_per(65), 300, 40, @sprite_graybox,0,50]
        if $gtk.args.inputs.mouse.click
            @show_menu = true
            @show_settings = false
        end
      end

end

def display_settings(x, y)
  @show_menu = false
  @show_settings = true

  populate_settings_menu(x, y)
end

def fps_30
    ($gtk.args.state.tick_count / 3 % 301).floor
end

def render_bg(static)
  sprites << [0, 0, w_per(100), h_per(100), @sprite_static_bg,0,255,36,41,46]
  sprites << [0, 0, w_per(100), h_per(100), @sprite_loc,0,255,sine_gen(250),sine_gen(500),sine_gen(750)] unless static
end


def render_game()
  @logged_in = true
  @play = true
  @show_menu = false
  @show_settings = false

  # UI
  ## UI Containers
  ### Left UI Container
  left_ui_container_shadow = [w_per(20), h_per(0), w_per(0.5), h_per(110), @sprite_graybox,0,50,0,100,100]
  left_ui_container = [w_per(0), h_per(-4), w_per(20), h_per(110), @sprite_graybox,0,250,37,47,47]
  sprites << left_ui_container_shadow
  sprites << left_ui_container

  # square = UI.box("center","extra small","indigo")
  # UI.shadow(square, 5, "center", 32, "white")
  # sprites << square
 
  # circle = UI.circle("center_left", "extra small", "red")
  # UI.shadow(circle,8, "top and bottom",99,"orange")
  # sprites << circle
  
  # triangle = UI.triangle("bottom_left", "xs", "green")
  # UI.shadow(triangle,8, "left",99,"grey")
  # sprites << triangle

  ## UI Buttons
  ui_collapse_button = [w_per(16.5), h_per(94), w_per(3), h_per(4), @sprite_graybox,0,250,150,150,150]
  sprites << [w_per(16.5), h_per(94), w_per(3), h_per(4), @sprite_back_arrow,0,250,250,250,250]

    test_box = {
      position: :A0,
      size: [3,100],
      color: :blue,
      alpha: 255,
      box_shadow: [5,2,4, rgba(165, 124, 156, 99.5)],
      border: [25, rgba(266, 36, 0, 0)]

    }

    UI.box2(test_box)
  # sprites << UI.box2(test_box)


end

def tick(args)
  # Create UI Grid
  Grid.create
  # Variable Declarations
  mouse_x = mouse.x
  mouse_y = mouse.y


  ## SETTINGS
  ### Animate BG
  @sprite_loc = "/mygame/sprites/bg/bg_#{fps_30}.png"
  render_bg(@system_settings[3][:value]) 
  ### Display FPS
  labels << [10, 30, "#{args.gtk.current_framerate} FPS",255,0,0] if @system_settings[0][:value]

  # Display Splash Screen at startup
  display_splash_screen if args.state.tick_count <= 550 

  # Display Login Screen after Splash
  display_login(mouse_x, mouse_y) if state.tick_count > 550 && @show_menu
  display_settings(mouse_x, mouse_y) if @show_settings
  render_game if @play

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