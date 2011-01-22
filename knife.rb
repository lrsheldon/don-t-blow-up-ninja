class Knife
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/ninjaknife.png", true)
    @speed = rand(10)
    reset! 
  end
  
  def update
    if @y > @game_window.height
      reset!
    else
      @y = @y + @speed
    end
  end
  
  def draw
    @icon.draw(@x,@y,20)
  end

  def x
    @x
  end

  def y
    @y
  end

  def reset!
    @y = 0
    @x = rand(@game_window.width)
    knife
  end
  
  def bloody_splatter
    @icon = Gosu::Image.new(@game_window, "images/blood_splat.png", true)
  end
  
  def knife
    @icon = Gosu::Image.new(@game_window, "images/ninjaknife.png", true)
  end
end
