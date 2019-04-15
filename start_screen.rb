require 'ruby2d'

class StartScreen
  def initialize
    @title = Text.new(
      'Flappy-Gem',
      x: 60, y: 150,
      size: 70,
    )
    @subtext =Text.new(
      "press 'space' to start",
      x: 70, y: 300,
      size: 40,
    )
  end

  def remove
    @title.remove
    @subtext.remove
  end
end