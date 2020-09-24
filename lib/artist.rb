class Artist 
attr_accessor :name
extend Concerns::Findable 
@@all = []

  def initialize(name)
  @name = name 
  @artist = artist
  @@all << self
  end 
  
  def self.all 
  @@all 
  end
  
  def self.create(name)
  new_artist = self.new(name)
  new_artist.save
  new_artist 
end

  def add_song(song)
  song.artist = self
  end
  
  def songs 
  Song.all.select {|song| song.artist == self}
  end
  
  def self.find_or_create_by_name(name)
  if @@all.find {|artist| artist.name == name}
  return @@all.find {|artist| artist.name == name}
  else 
  Artist.new(name) 
  end 
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
  
end