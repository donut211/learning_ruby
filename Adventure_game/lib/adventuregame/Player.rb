class Player
  attr_accessor :hit_points, :attack_power, :chance_to_hit
  attr_accessor :x_coord, :y_coord, :armor_points

  MAX_HIT_POINTS = 100
  BASE_ARMOR_POINTS = 18

  def initialize
    @hit_points        = MAX_HIT_POINTS
    @attack_power      = rand(1, 2)
    @x_coord, @y_coord = 0, 0
    @armor_points      = BASE_ARMOR_POINTS
  end

  def get_chance_to_hit
    @chance_to_hit = rand(1..20)
  end

  def miss
    puts "You swing your sword, but you missed! The monster takes no damage!"
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
