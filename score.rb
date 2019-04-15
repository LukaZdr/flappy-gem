require 'ruby2d'

class Score < Text
  def initialize(count)
    super(
      count,
      x: 220, y: 50,
      size: 100
    )
  end
end