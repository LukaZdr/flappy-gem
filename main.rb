require 'ruby2d'
require_relative 'window'
require_relative 'obstacle'
require_relative 'player'
require_relative 'score'
require_relative 'start_screen'
require_relative 'lose_screen'

@obstacle_spawn_counter = 1
@obstacle_list = [Obstacle.new]
@player = Player.new
@jump_counter = 0
@score_count = 0
@game_started = false
@game_over = false
@start_screen = StartScreen.new

on :key_down do |event|
  if event.key == 'space'
    start_game unless @game_started
    if @game_over
      restart_game
    end
    @jump_counter += 1
  end
  if event.key == 'escape'
    close
  end
end

update do
  next unless @game_started
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
    @score_count += 1
    @score = Score.new(@score_count)
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
    end_game
  end
end

def start_game
  @game_started = true
  @score = Score.new(@score_count)
  @start_screen.remove
  @start_screen = nil
  print @obstacle_list
end

def end_game
  @game_over = true
  @lose_screen = LoseScreen.new(@score_count)
end

def restart_game
  @obstacle_spawn_counter = 1
  @score.remove
  @lose_screen.remove
  @obstacle_list.each { |obstacle| obstacle.remove }
  @obstacle_list = [Obstacle.new]
  @player.remove
  @player = Player.new
  @jump_counter = 0
  @score_count = 0
  @game_started = false
  @game_over = false
  @start_screen = StartScreen.new
end

show
