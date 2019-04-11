require 'ruby2d'
require_relative 'window'
require_relative 'obstacle'

@obstacle_list = [Obstacle.new]
@obstacle_spawn_counter = 1

update do
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
