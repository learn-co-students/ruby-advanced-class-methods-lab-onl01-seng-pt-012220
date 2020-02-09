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
    song.save
    song
  end 

  def self.new_by_name(name)
   song = self.new 
   song.name = name 
   song 
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save 
    song 
  end 
  
  def self.find_by_name(name)
   @@all.find {|each| each.name == name} 
  end 
    
  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create_by_name(name)
  end 
  
  def self.alphabetical
   @@all.sort_by {|each| each.name}
  end 
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array[1] = array[1].chomp(".mp3")
    song = self.new
    song.name = array[1]
    song.artist_name = array[0]
    song
   end
   
   def self.create_from_filename(filename)
     array = self.new_from_filename(filename)
     song = self.create 
     song.name = array.name 
     song.artist_name = array.artist_name
     return array 
   end
   
   def self.destroy_all 
     self.all.clear 
   end 
end
