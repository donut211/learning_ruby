class Item #potions that increase chance to hit or AP
  TYPES = [:potion, :sword, :armor]

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
      player.attack_power = rand(2..4)
    when :armor
      puts "You pick up #{self}"
      player.armor_points -= 3
    end
  end

  def to_s
    "a shiny awesome #{@type.to_s}"
  end
end
