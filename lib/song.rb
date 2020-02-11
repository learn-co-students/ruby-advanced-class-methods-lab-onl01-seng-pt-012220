class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

song = Song.create
Song.all.include?(song)
end

song = Song.new_by_name("The 
Middle")
end

song = Song.create_by_name("The 
Middle")

song = Song.all.include?(song)
end

the_middle =
Song.create_by_name("The 
Middle")

Song.find_by_name("The 
Middle")
end

song_1 =
Song.find_or_create_by_name("
Blank Space")
song_2 =
Song.find_or_create_by_name("
Blank Space")
end

def song.alphabetical
  songs_in_ascending_alphabetical_order(
  sort → array
  sort { |a, b| block } → array)
  
end

Song.new_from_filename("Taylor
Swift - Blank Space.mp3".)
end

song = 
Song.new_from_filename("Taylor
Swift - Blank Space.mp3")
song.name
song.artist_name
end

Song.create_from_filename("Taylor
Swift - Blank Space.mp3.")
end

Song.destroy_all
end


end



song_1 == song_2
Song.create_from_filename

end
