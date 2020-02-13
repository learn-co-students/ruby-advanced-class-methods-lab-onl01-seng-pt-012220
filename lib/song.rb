class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    song = self.new
    self.all << song 
    song
  end
  
  def self.new_by_name (song_name)
    song = self.new
    song.name = song_name
    song 
  end
  
  def self.create_by_name (song_name)
    song = self.create 
    song.name = song_name
    song 
  end
  
  def self.find_by_name (song_name)
    result = self.all.find {|songs| songs.name == song_name}
    result
  end
  
  def self.find_or_create_by_name (song_name)
    result = self.find_by_name(song_name)
    if result
      return result
    else
      self.create_by_name(song_name)
    end
  end
  
  def self.alphabetical
   sort = self.all.sort_by {|w| w.name}
   sort
  end
    
 def self.new_from_filename(filename)
    new_array = filename.split(" - ")
    new_array[1] = new_array[1].chomp(".mp3")
    song = self.new
    song.name = new_array[1]
    song.artist_name = new_array[0]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new
    song.name = (filename.split(" - ")[1].chomp(".mp3"))
    song.artist_name = (filename.split(" - ")[0])
    @@all << song
    song
  end
  
  def self.destroy_all
    @@all.clear
  end
end
