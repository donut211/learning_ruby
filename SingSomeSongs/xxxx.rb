class Song
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    @lyrics.each {|line| puts line }
    puts "*" * 80
  end
end

class BeerSong

  def initialize(num_bottles)
    num_bottles = num_bottles
  end

  def sing_lyrics_A (num_bottles)
     puts "#{num_bottles} bottles of beer on the wall,"
     puts "#{num_bottles} bottles of beer,"
     puts "You take 1 down,\nand pass it around,"
   end

   def sing_lyrics_B(num_bottles)
     puts "#{num_bottles} bottles of beer on the wall!"
       puts "*" * 80
   end

   def one_left(num_bottles)
     puts "#{num_bottles} more bottle of beer on the wall,"
     puts "#{num_bottles} more bottle of beer,"
     puts "You take it down,\nand pass it around,"
     puts "You ran out of bottles of beer on the wall!"
   end
end

songs = {
  hb_song:       ["Happy birthday to you,",
                 "I don't want to get sued,",
                 "So I'll stop right here"],
  bulls_song:    ["They rally round the family,",
                "With a pocket full of shells"],
}

happy_bday = Song.new(songs[:hb_song])
bulls_on_parade = Song.new(songs[:bulls_song])

happy_bday.sing_me_a_song()
bulls_on_parade.sing_me_a_song()

num_bottles = 99
song = BeerSong.new(num_bottles)
while num_bottles > 1
  song.sing_lyrics_A(num_bottles)
  num_bottles -= 1
  song.sing_lyrics_B(num_bottles)
end
song.one_left(1)
