require 'ruby2d'

class LoseScreen
  X = 140
  def initialize(score)
    @background = Image.new(
      'assets/frame.png',
      x: X, y: 75,
      height: 325, width: 225
    )
    @title = Text.new(
      'Score:',
      x: X+45, y: 120,
      size: 30,
      color: 'black'
    )
    @score = Text.new(
      score,
      x: X+45, y: 160,
      size: 80,
      color: 'black'
    )
    @high_score = Text.new(
      "Highscore: #{ highscore(score) }",
      x: X+45, y: 255,
      size: 20,
      color: 'black'
    )
    @restart_text = Text.new(
      "'space' to restart",
      x: X+55, y: 300,
      size: 15,
      color: 'black'
    )
    @exit_text = Text.new(
      "'esc' to end the game",
      x: X+45, y: 330,
      size: 15,
      color: 'black'
    )
  end

  def remove
    @high_score.remove
    @background.remove
    @title.remove
    @score.remove
    @restart_text.remove
    @exit_text.remove
  end

  def highscore(score)
    oldhighscore = File.read('score').to_i
    if score > oldhighscore
      File.open('score', 'w') { |file| file.write(score) }
      return score
    end
    oldhighscore
  end
end