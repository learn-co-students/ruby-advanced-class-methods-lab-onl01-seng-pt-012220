class Song
  attr_accessor :name, :artist_name
  @@all = []
 def Song.create
   song= self.new 
   song.save
   song 
 end 
 
 def Song.new_by_name(name)
   song= self.new 
   song.name=name 
   song
 end 
 
 def Song.create_by_name(name_string)
   song=self.new 
   song.name=name_string
   song.save
   song
 end 
 
 def Song.find_by_name(name)
   self.all.find{|s| s.name==name}
 end 
 
 def Song.find_or_create_by_name(name_search)
   found = Song.find_by_name(name_search)
   if found == nil 
   Song.create_by_name(name_search)
  
 else
   return found 
 end 
 end 
 
 def Song.alphabetical
   self.all.sort_by{|a| a.name}
 end 
 
 def Song.new_from_filename(name_mp3)
  song = self.new 
    song.name = name_mp3.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = name_mp3.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song
end 

def Song.create_from_filename(name_from_file)
   song = self.new 
    song.name = name_from_file.split(/[^a-zA-Z\s]|\s-\s/)[1] 
    song.artist_name = name_from_file.split(/[^a-zA-Z\s]|\s-\s/)[0]
    song.save 
    song
 end 
 
 def Song.destroy_all
   self.all.clear 
 end 
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
