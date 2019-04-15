require 'ruby2d'

# Brick to brake to win
class Obstacle
  attr_accessor :pos
  attr_accessor :rekt_upper
  attr_accessor :rekt_lower
  SPEED = 2
  HEIGHT = 500
  WIDTH = 80
  DISTANZ = 150
  def initialize
    @pos = [500, Random.rand(100..400)]
    @rekt_upper = Rectangle.new(
      x: @pos[0], y: (@pos[1]- HEIGHT - DISTANZ/2),
      width: WIDTH, height: HEIGHT,
      color: 'green'
    )
    @rekt_lower = Rectangle.new(
      x: @pos[0], y: (@pos[1] + DISTANZ/2),
      width: WIDTH, height: HEIGHT,
      color: 'green'
    )
  end

  def move
    @rekt_lower.x -= SPEED
    @rekt_upper.x -= SPEED
    @pos[0] -= SPEED
  end

  def remove
    @rekt_lower.remove
    @rekt_upper.remove
  end
end