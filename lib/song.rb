class Song 
  
attr_accessor :name, :artist, :genre
@@all = []
  
  def initialize(name)
  @name = name 
  @genre = genre
  end 
  
  def save
  @@all << self
  end
  
  def self.create(name)
  new_song = self.new(name)
  new_song.save
  new_song 
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
  if @@all.find {|song| song.name == name}
  return @@all.find {|song| song.name == name}
  else 
  Song.new(name) 
  end 
  end
  
  def self.new_from_filename(filename)
  parsedname = filename.split(" - ")[1]
  artist = Artist.find_or_create_by_name(parsed[0])
  name = parsedname[1]
  genre = Genre.find_or_create_by_name(parsedname[2].split(" - ")[0])
  new_song = Song.new(name, artist, genre)
  newsong
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  end
  
end