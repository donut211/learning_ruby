class Player
  attr_accessor :hit_points, :attack_power
  attr_accessor :x_coord, :y_coord

  MAX_HIT_POINTS = 100

  def initialize
    @hit_points        = MAX_HIT_POINTS
    @attack_power      = 1
    @x_coord, @y_coord = 0, 0
  end

  def alive?
    @hit_points > 0
  end

  def hurt(amount)
    @hit_points -= amount
  end

  def heal(amount)
    @hit_points += amount
    @hit_points = [@hit_points, MAX_HIT_POINTS].min
  end

  def print_status
    puts "*" * 80
    puts "HP: #{@hit_points}/#{MAX_HIT_POINTS}"
    puts "AP: #{@attack_power}"
    puts "*" * 80
  end
end

#class Inventory

class Item #potions that increase chance to hit or AP
  TYPES = [:potion, :sword]

  attr_accessor :type

  def initialize
    @type = TYPES.sample
  end

  def interact(player)
    case @type
    when :potion
      puts "You pick up #{self}."
      player.heal(10)
    when :sword
      puts "You pick up #{self}."
      player.attack_power += 1
    end
  end

  def to_s
    "a shiny awesome #{@type.to_s}"
  end
end

require_relative 'Adventure_game/Combat'
class Monster
  include Combat
  
  attr_accessor :hit_points, :attack_power
  MONSTER_TYPES = ["rat", "goblin", "troll"]


  def initialize 
    @monster = MONSTER_TYPES.sample
    
    case @monster
    when "rat"
      @hit_points   = 8
      @attack_power = 1
      #chance to hit
    when "goblin"
      @hit_points   = 12
      @attack_power = 3
      #chance to hit
    when "troll"
      @hit_points   = 16
      @attack_power = 5
      #chance to hit
    end
  end

  def alive?
    @hit_points > 0
  end

  def hurt(amount)
    @hit_points = @hit_points.-(amount)
  end

  def to_s
    "a horrible #{@monster} appears! 'garurururu!'"
  end

  def interact(player)
    start_a_fight(player)
  end
  
  def print_status
    puts "Monster is at #{hit_points} hit points"
  end
  
end

class World
  WORLD_WIDTH  = 10
  WORLD_HEIGHT = 10

  def initialize
    @rooms = Array.new(WORLD_HEIGHT, Array.new(WORLD_WIDTH))
  end

  def move_entity_north(entity)
    entity.y_coord -= 1 if entity.y_coord > 0
  end

  def move_entity_south(entity)
    entity.y_coord += 1 if entity.y_coord < WORLD_HEIGHT - 1
  end

  def move_entity_east(entity)
    entity.x_coord += 1 if entity.x_coord < WORLD_WIDTH - 1
  end

  def move_entity_west(entity)
    entity.x_coord -= 1 if entity.x_coord > 0
  end

  def get_room_of(entity)
    @rooms[entity.x_coord][entity.y_coord] ||= Room.new
  end
end

class Room #Add player interactions with items in the room. Get forked up!!
  attr_accessor :size, :content

  def initialize
    @content   = get_content
    @size      = get_size
    @adjective = get_adjective
  end

  def interact(player) #This code is confusing to me, please inquire
    if @content
      @content.interact(player)
      @content = nil unless (@content.is_a?(Monster) && @content.alive?)
    end
  end
  
  
  def to_s
    "You are in a #{@size} room. It is #{@adjective}."
  end

  private
  def get_content
    [Monster, Item].sample.new
  end

  def get_size
    ["small", "medium", "large"].sample
  end

  def get_adjective
    ["pretty", "ugly", "hideous"].sample
  end
end

class Game
  ACTIONS = [
    :north, :east, :south, :west, :look, :fight, :take, :status, :monster
  ] 

  def initialize
    @world = World.new
    @player = Player.new

    start_game
  end

  private
  def start_game
    while @player.alive?
      @current_room = @world.get_room_of(@player)

      print_status

      action = take_player_input
      next unless ACTIONS.include? action

      take_action(action)
    end
  end

  def take_player_input
    print "What's the plan, Stan? "
    gets.chomp.to_sym
  end

  def print_status
    puts "You are at map coordinates [#{@player.x_coord}, #{@player.y_coord}]"

    puts @current_room
    if @current_room.content
      puts "You see #{@current_room.content}."
    end
  end

  def take_action(action)
    case action
    when :look
      print_status
    when :north
      @world.move_entity_north(@player)
    when :east
      @world.move_entity_east(@player)
    when :south
      @world.move_entity_south(@player)
    when :west
      @world.move_entity_west(@player)
    when :fight, :take
      @current_room.interact(@player)
    when :status
      @player.print_status
    end
  end
end

Game.new