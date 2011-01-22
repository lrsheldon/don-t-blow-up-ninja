class Player
  
  def initialize(game_window)
    @game_window = game_window
    @icon = Gosu::Image.new(@game_window, "images/ninja2.png", true)
    @x = 70
    @y = 150
  end
  
  def draw
    @icon.draw(@x,@y,1)
  end
  
  def move_left
    if @x < 0
      @x = 0
    else
      @x = @x - 10
    end
  end
  
  def move_right
    if @x > (@game_window.width - 75)
      @x = @game_window.width - 75
    else
      @x = @x + 10
    end
  end
  
  def move_up
    if @y < 0
      @y = 0
    else
      @y = @y - 10
    end
  end
  
  def move_down
    if @y > (@game_window.height-75)
      @y = @game_window.height - 75
    else
      @y = @y + 10
    end
  end

  def hit_by?(balls)
    balls.any? {|ball| Gosu::distance(@x, @y, ball.x, ball.y) < 50} 
  end
  def zombie
    @icon = Gosu::Image.new(@game_window, "images/zombie.png", true)
  end
  def reset!
    @icon = Gosu::Image.new(@game_window, "images/ninja2.png", true)
  end
  
end