module Combat
# COMBAT -  
#Needs a way to compare die rolls from both player and monster TABLE?
#STOP after each round and get input
#Roll dice for damage and chance to hit


  # def start_a_fight(player)
    # while player.alive?
      # puts "You hit the monster for #{player.attack_power} points."
      # hurt_monster
      # break unless alive?
      # player.hurt(attack_power)
      # puts "The monster hits you for #{attack_power} points."
    # end
  # end
# end

  def start_a_fight(player)
    case player.alive?
    when true
      puts "You hit the monster for #{player.attack_power} points."
      hurt(player.attack_power)
      player.hurt(attack_power)
      puts "The monster hits you for #{attack_power} point."
    end
  end
end