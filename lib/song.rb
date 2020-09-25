class Song 
  
attr_accessor :name, :artist, :genre
@@all = []
  
  def initialize(name, artist=nil, genre=nil)
  @name = name 
  self.artist = artist if artist != nil 
  self.genre = genre if genre != nil
  end 
  
  def artist 
    @artist 
  end
  
  def artist=(artist)
    @artist = artist 
  artist.add_song(self)
  end 
  
  def genre 
    @genre 
  end 
  
  def genre=(genre)
  @genre = genre 
  genre.songs << self unless genre.songs.include?(self)
  end
  
  def save
  @@all << self
  end
  
  def self.create(song)
  song = self.new(song)
  song.save
  song
end

  def self.all 
  @@all 
  end
  
  def self.destroy_all
  @@all = []
  end

  def self.find_by_name(name)
  @@all.find {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
  if self.find_by_name(name)
  return self.find_by_name(name)
  else 
  Song.create(name) 
  end 
  end
  
  def self.new_from_filename(filename)
  parsedname = filename.split(" - ")
  artist = Artist.find_or_create_by_name(parsedname[0])
  name = parsedname[1]
  genre = Genre.find_or_create_by_name(parsedname[2].split(".mp3")[0])
  song = Song.new(name, artist, genre)
  song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  end
  
