require 'ruby2d'
require_relative 'window'
require_relative 'obstacle'
require_relative 'player'

@obstacle_list = [Obstacle.new]
@obstacle_spawn_counter = 1
@player = Player.new
@jump_counter = 0
@count = 0

on :key_down do |event|
  if event.key == 'space'
    @jump_counter += 1
  end
end

update do
  if @player.through?(@obstacle_list[0])
    @count += 1
    print @count
  end
  if @jump_counter % 10 == 0
    @player.fall
    @jump_counter = 0
  else
    @player.jump
    @jump_counter += 1
  end
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

show
