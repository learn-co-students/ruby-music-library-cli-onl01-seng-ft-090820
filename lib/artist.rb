class Artist 
attr_accessor :name, :songs
extend Concerns::Findable 
@@all = []

  def initialize(name)
  @name = name 
  @songs = []
  end 
  
  def self.all 
  @@all 
  end
  
  def save 
  @@all << self 
  end 
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
  artist = self.new(name)
  artist.save
  artist 
  end

  def add_song(song)
  if song.artist == nil 
    song.artist = self 
  else 
    nil 
  end 
  if @songs.include?(song)
    nil 
  else 
    @songs << song 
  end 
  song
  end 
  
  def print_songs 
  songs.each {|song| puts song.name}
  end
  
  def genres 
  genres = []
  @songs.each do |song|
  genres << song.genre if !(genres.include?(song.genre))
  end 
  genres
  end 
  end
  
