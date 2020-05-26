class Song
  attr_accessor :name, :artist_name
  @@all = []

def initialize 
  @name = name 
  @artist_name = artist_name 

end 

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new 
    song.save 
    song
  end

  def self.new_by_name(song_name)
    song = self.new 
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song = self.new 
    song.name = song_name
    song.save 
    song 
  end 

  def self.find_by_name(song_name)
    self.all.find {|song| song.name == song_name}
  end 

  def self.find_or_create_by_name(song_name)
    # if self.find_by_name == self 
    #  return song_name 
    # else 
    #   self.create_by_name 
    # end 
    # !self.find_by_name ? puts song_name : self.create_by_name
    self.find_by_name(song_name) || self.create_by_name(song_name) 
  end 
  
  def self.alphabetical
      sorted = Song.all.sort_by {|song| song.name}
      sorted # self.find_or_create_by_name.sort 
  end

  def self.new_from_filename(filename)
    new_file = filename.split(" - ") #'initializes a song and artist_name based on the filename format'
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    new_file = filename.split(" - ") #'initializes a song and artist_name based on the filename format'
    artist_name = new_file[0]
    song_name = new_file[1].gsub(".mp3","")
    song = self.create 
    song.name = song_name
    song.artist_name = artist_name
    song
  end 

  def self.destroy_all 
    self.all.clear 
  end 
end





