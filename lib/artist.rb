class Artist 
  
  extend Concerns::Findable 
  
 attr_accessor :name, :songs  
 
 @@all = []
 
 def initialize(name)
   @name = name
   @songs = []
   save
 end
  
  def save 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end
  
 def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end 
  
  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if self.songs.include?(song) == false

  end 
    
  def genres
    self.songs.map {|song| song.genre}.uniq
  end  

  
end 