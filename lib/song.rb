class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    new_song = self.new
    @@all << new_song
    return new_song
  end
  
   def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    return new_song
  end
  
  def self.new_by_name(name)
     new_song = self.create
     new_song.name = name
     new_song
  end
   
  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      new_song = self.create_by_name(name)
      return new_song
    else
      return self.find_by_name(name)
    end
  end
  
  
  def self.new_from_filename(filename)
    new_song = self.create
    file_ary = filename.split(" - ")
    artist = file_ary[0]
    file = file_ary[1].split(".mp3")
    name = file[0]
    new_song.artist_name = artist
    new_song.name = name
    new_song
  end
  
  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    @@all << new_song
  end
  
  def self.alphabetical
    sorted= []
    sorted = @@all.sort_by{|a| a.name}
    sorted
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    self.class.all << self
  end
end
song = Song.create
puts Song.all.include?(song)
puts Song.all

