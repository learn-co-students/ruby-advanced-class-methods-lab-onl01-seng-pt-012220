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
    Song.all << song
    song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end
  
  def self.create_by_name(name)
    song = self.new
    Song.all << song
    song.name = name
    song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
  
    found_song = self.find_by_name(name)
    
    if found_song
      found_song
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    song = self.new
    
    data = filename.split(" - ")
    data[1].delete_suffix!".mp3"
    song.name = data[1]
    song.artist_name = data[0]
    
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    
    data = filename.split(" - ")
    data[1].delete_suffix!".mp3"
    song.name = data[1]
    song.artist_name = data[0]
    
    Song.all << song
    
    song
  end
  
  def self.destroy_all
    self.all.clear
  end


end
