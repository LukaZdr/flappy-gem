require 'ruby2d'

class LoseScreen
  def initialize(score)
    @background = Image.new(
      'assets/frame.png',
      x: 125, y: 75,
      height: 325, width: 225
    )
    @title = Text.new(
      'Score:',
      x: 155, y: 120,
      size: 50,
      color: 'black'
    )
    @score = Text.new(
      score,
      x: 155, y: 180,
      size: 100,
      color: 'black'
    )
    @restart_text = Text.new(
      "'space' to restart",
      x: 155, y: 300,
      size: 15,
      color: 'black'
    )
    @exit_text = Text.new(
      "'esc' to end the game",
      x: 155, y: 330,
      size: 15,
      color: 'black'
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