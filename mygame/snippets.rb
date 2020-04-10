A collection of useful snippets

  Useful Snippets
  # Display Timer
  def timer(desired_time)
  ## args.state.tick_count / fps %total frames
  return (state.tick_count / 60 % desired_time).floor
end
  args.outputs.labels << [ 20, 150, "Timer: #{timer(30)}", 255, 0, 0 ]

  ## Display Mouse Loc
  $gtk.args.outputs.labels << [ 10, 80, "#{x},#{y}", 255, 0, 0 ]

  module AttrGTK
  attr_accessor :args

  def keyboard
    args.inputs.keyboard
  end

  def grid
    args.grid
  end

  def state
    args.state
  end

  def inputs
    args.inputs
  end

  def outputs
    args.outputs
  end

  def gtk
    args.gtk
  end

  def passes
    args.passes
  end

  def geometry
    args.geometry
  end
end

  # define starting and ending points of properties to animate
  args.state.target_x = 1180
  args.state.target_y = 620
  args.state.target_w = 100
  args.state.target_h = 100
  args.state.starting_x = 0
  args.state.starting_y = 0
  args.state.starting_w = 300
  args.state.starting_h = 300
 

  # define start time and duration of animation
  args.state.start_animate_at = 3.seconds # this is the same as writing 60 * 5 (or 300)
  args.state.duration = 2.seconds # this is the same as writing 60 * 2 (or 120)

  # define type of animations
  # Here are all the options you have for values you can put in the array:
  # :identity, :quad, :cube, :quart, :quint, :flip

  # Linear is defined as:
  # [:identity]
  #
  # Smooth start variations are:
  # [:quad]
  # [:cube]
  # [:quart]
  # [:quint]

  # Linear reversed, and smooth stop are the same as the animations defined above, but reversed:
  # [:flip, :identity]
  # [:flip, :quad, :flip]
  # [:flip, :cube, :flip]
  # [:flip, :quart, :flip]
  # [:flip, :quint, :flip]

  # You can also do custom definitions. See the bottom of the file details
  # on how to do that. I've defined a couple for you:
  # [:smoothest_start]
  # [:smoothest_stop]

  # CHANGE THIS LINE TO ONE OF THE LINES ABOVE TO SEE VARIATIONS
  args.state.animation_type = [:identity]
  # args.state.animation_type = [:quad]
  # args.state.animation_type = [:cube]
  # args.state.animation_type = [:quart]
  # args.state.animation_type = [:quint]
  # args.state.animation_type = [:flip, :identity]
  # args.state.animation_type = [:flip, :quad, :flip]
  # args.state.animation_type = [:flip, :cube, :flip]
  # args.state.animation_type = [:flip, :quart, :flip]
  # args.state.animation_type = [:flip, :quint, :flip]
  # args.state.animation_type = [:smoothest_start]
  # args.state.animation_type = [:smoothest_stop]

  #  pow()
  # smoothstep