require 'ruby2d'
require_relative 'obstacle'

class Player < Image
  attr_accessor :pos
  attr_accessor :velocity
  SIDE_LENGTH = 30
  X_POS = 100
  GRAVITY = 9.81
  DT  = 1.0/5
  JUMP_HEIGHT = 40
  def initialize
    @pos = [X_POS, 250]
    @velocity = 0
    @rotation = 50
    super(
      'assets/flappy-gem-player.png',
      x: @pos[0], y: @pos[1],
      height: SIDE_LENGTH, width: SIDE_LENGTH,
      color: 'red',
      rotate: @rotation
    )
  end

  def y=(y_pos)
    @pos = [@pos[0], y_pos]
    super(y_pos)
  end

  def hits?(obstacle)
    corners.each do |corner|
      return true if corner[0].between?(obstacle.rekt_upper.x, obstacle.rekt_upper.x + Obstacle::WIDTH) && !corner[1].between?(obstacle.pos[1]-Obstacle::DISTANZ/2, obstacle.pos[1]+Obstacle::DISTANZ/2)
    end
    false
  end

  def through?(obstacle)
    corners[0][0] == obstacle.pos[0]
  end

  def corners
    [@pos, [@pos[0]+SIDE_LENGTH, @pos[1]],
    [@pos[0], @pos[1]+SIDE_LENGTH], [@pos[0]+SIDE_LENGTH, @pos[1]+SIDE_LENGTH]]
  end

  def fall
    @velocity += GRAVITY * DT
    self.y += @velocity * DT
    rotate
  end

  def jump
     self.y -= JUMP_HEIGHT * DT
     @velocity = 0
     rotate
  end

  def rotate
    @rotation += @velocity/3
    self.rotate = @rotation
  end
end