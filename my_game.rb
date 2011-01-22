require 'rubygems'
require 'gosu'
require 'player'
require 'ball'

class MyGame < Gosu::Window
  def initialize
    super(1000, 1000, false)
    @player1 = Player.new(self)
    @balls = 9.times.map {Ball.new(self)}
    @running = true
    @font = Gosu::Font.new(self, Gosu::default_font_name, 30)
    @score = 0
  end

  def update
    if @running
      @score = @score + 1
      if button_down? Gosu::Button::KbLeft
        @player1.move_left
      end

      if button_down? Gosu::Button::KbRight
        @player1.move_right
      end

      if button_down? Gosu::Button::KbUp
        @player1.move_up
      end

      if button_down? Gosu::Button::KbDown
        @player1.move_down
      end
      

      @balls.each {|ball| ball.update}

      if @player1.hit_by? @balls
        stop_game!
      end

    else
      if button_down? Gosu::Button::KbEscape
        restart_game
      end
    end
  end

  def draw
    @player1.draw
    @balls.each{|ball| ball.draw}
    @font.draw("The Score is: #{@score}", 20,20,5)
  end

  def stop_game!
    @running = false
    @balls.each {|ball| ball.bloody_splatter}
    @player1.zombie
  end

  def restart_game
    @score = 0
    @running = true
    @balls.each {|ball| ball.reset!}
    @player1.reset!
  end

end
game = MyGame.new
game.show
