 #A character has a class, base stats,
class Character
  attr_accessor :hit_points, :attack_power, :chance_to_hit

  MAX_HIT_POINTS = 100

  def initialize
    @hit_points = MAX_HIT_POINTS
    @attack_power = 1d3
 hash of character classses
 initialize
 alive, hurt heal
end
