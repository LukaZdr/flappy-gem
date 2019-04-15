require 'ruby2d'

class LoseScreen
  def initialize(score)
    @background = Rectangle.new(
      x: 150, y: 100,
      height: 300, width: 200,
      color: 'gray'
    )
    @title = Text.new(
      'Score:',
      x: 155, y: 110,
      size: 50,
    )
    @score = Text.new(
      score,
      x: 155, y: 180,
      size: 100,
    )
    @restart_text = Text.new(
      "'space' to restart",
      x: 155, y: 320,
      size: 20,
    )
    @exit_text = Text.new(
      "'esc' to end the game",
      x: 155, y: 350,
      size: 20,
    )
  end

  def remove
    @background.remove
    @title.remove
    @score.remove
    @restart_text.remove
    @exit_text.remove
  end
end