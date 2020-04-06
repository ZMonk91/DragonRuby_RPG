require '/app/wyvern/index.rb'

def render_bg()
  background = UI.new
  background.square
            .position([0,0])
            .size([1280,720])
            .color(:dark)
            .render
end

def render_game

  tester = UI.new

  tester.square
            .position([500,220])
            .size([16,16])
            .color(:red)
            .shadow()
            .shadow_offset([12,0])
            .render


            

# tester.color(:green).shadow([1,2])

    # test = UI.new.triangle_rounded
    # test2 = UI.new.hexagon
    # test3 = UI.new.star

    # def get_randoms(func)
    #   pos = []
    #   func.position([rand(1280),rand(720)])
    #   func.color([rand(255), rand(255), rand(255)])
    #   func.size([rand(50), rand(50)])
    # end

    # get_randoms(test)
    # get_randoms(test2)
    # get_randoms(test3)
    # test.render
    # test2.render
    # test3.render

end


def tick(args)
  render_bg
  render_game
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