class Monster
  include Combat
  attr_accessor :hit_points, :attack_power, :hit_chance, :chance_to_hit
  MONSTER_TYPES = ["rat", "goblin", "troll"]


  def initialize
    @monster = MONSTER_TYPES.sample

    case @monster
    when "rat"
      @hit_points   = 8
      @attack_power = 1
      @hit_chance   = 4
    when "goblin"
      @hit_points   = 12
      @attack_power = 3
      @hit_chance   = 7
    when "troll"
      @hit_points   = 16
      @attack_power = 5
      @hit_chance    = 10
    end
  end

  def get_chance_to_hit
    @chance_to_hit = rand(1..20)
  end

  def miss #build hash for miss descriptions
    puts "The monster swings and misses you, doing no damage!"
    puts "*" * 80
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
