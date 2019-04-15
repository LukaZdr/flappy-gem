require 'ruby2d'
require_relative 'window'
require_relative 'obstacle'
require_relative 'player'
require_relative 'score'

@obstacle_list = [Obstacle.new]
@obstacle_spawn_counter = 1
@player = Player.new
@jump_counter = 0
@count = 0
@score = Score.new(@count)
@game_over = false

on :key_down do |event|
  if event.key == 'space'
    @jump_counter += 1
  end
  if event.key == 'escape'
    close
  end
end

update do
  next if @game_over
  score_count
  player_move
  obstacles_move
  spawn_obstacle
end

def spawn_obstacle
  if @obstacle_spawn_counter % 100 == 0
    @obstacle_list << Obstacle.new
    @obstacle_spawn_counter = 1
  end
  @obstacle_spawn_counter += 1
end

def obstacles_move
  @obstacle_list.each { |obstacle| obstacle.move }
  @obstacle_list = @obstacle_list.select { |obstacle|  obstacle.pos[0] + Obstacle::WIDTH > 0 }
end

def score_count
  if @player.through?(@obstacle_list[0])
    @score.remove
    @count += 1
    @score = Score.new(@count)
  end
end

def player_move
  if @jump_counter % 10 == 0
    @player.fall
    @jump_counter = 0
  else
    @player.jump
    @jump_counter += 1
  end
  if @player.hits?(@obstacle_list[0])
    @game_over = true
  end
end

show
