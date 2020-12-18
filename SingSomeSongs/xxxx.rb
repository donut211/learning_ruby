class Song
  attr_accessor :lyrics, :title
  def initialize(lyrics, title)
    @lyrics = lyrics
    @title = title
  end

  def sing_me_a_song()
    puts "The title of this song is #{@title}:"
    @lyrics.each {|line| puts line }
    puts "*" * 80
  end
end

class BeerSong
attr_accessor :title
  def initialize(num_bottles, title)
    num_bottles = num_bottles
    @title = title
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
titles = {
  song_one: "Happy Birthday",
  song_two: "Bulls on Parade",
  song_three: "99 Bottles of Beer on the Wall"
}


happy_bday = Song.new(songs[:hb_song], titles[:song_one])
bulls_on_parade = Song.new(songs[:bulls_song], titles[:song_two])

happy_bday.sing_me_a_song()
bulls_on_parade.sing_me_a_song()

num_bottles = 99
song = BeerSong.new(num_bottles, titles[:song_three])
while num_bottles > 1
  song.sing_lyrics_A(num_bottles)
  num_bottles -= 1
  song.sing_lyrics_B(num_bottles)
end
song.one_left(1)
