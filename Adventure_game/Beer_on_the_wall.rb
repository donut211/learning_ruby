class BeerSong
  def sing_lyrics_A (current_beer)
      puts "#{current_beer} bottles of beer on the wall,"
      puts "#{current_beer} bottles of beer,"
      puts "You take 1 down,\nand pass it around,"
    end
    
  def sing_lyrics_B(current_beer)
    puts "#{current_beer} bottles of beer on the wall!"
    puts "*" * 80
  end
    
  def one_left(current_beer)
    puts "#{current_beer} more bottle of beer on the wall,"
    puts "#{current_beer} more bottle of beer,"
    puts "You take it down,\nand pass it around,"
    puts "You ran out of bottles of beer on the wall!"
  end
end


current_beer = 99
song = BeerSong.new
while current_beer > 1
  song.sing_lyrics_A(current_beer)
  current_beer -= 1
  song.sing_lyrics_B(current_beer)
end
song.one_left(1)



