module Combat
# COMBAT -
#Needs a way to compare die rolls from both player and monster TABLE?
#Roll dice for damage


  def start_a_fight(player)
    case player.alive?
    when true
      player.get_chance_to_hit
      if player.chance_to_hit >= @hit_chance
        puts "You hit the monster for #{player.attack_power} points."
        hurt(player.attack_power)
      else
        player.miss
      end
      get_chance_to_hit
        if get_chance_to_hit <= player.armor_points
          puts "The monster hits you for #{attack_power} point."
          player.hurt(attack_power)
          puts "*" * 80
        else
          miss
        end
      end
      case alive?
      when false
        puts "The monster dies. Blargh!!"
      end
    end
  end
#Need to indicate that the monster is dead!!!
