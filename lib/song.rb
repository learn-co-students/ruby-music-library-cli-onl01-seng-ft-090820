class Song 
  
 attr_accessor :name 
 
 @@all = []
 
 def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

def self.create(name)
    instance = Song.new(name)
    instance.save
    instance
  end

 def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end
  
  def artist
    @artist
  end 

   def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end
  
  def genre 
    @genre 
  end 

  def self.find_by_name(name)
    @@all.find do |song| 
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
   def self.new_from_filename(file_name)
    file_bits = file_name.gsub(/(\.mp3)/,'')
    file_bits = file_bits.split(" - ")
    artist = Artist.find_or_create_by_name(file_bits[0])
    genre = Genre.find_or_create_by_name(file_bits[2])
    song = Song.find_or_create_by_name(file_bits[1])
    song.genre = genre
    song.artist = artist
    song
  end

  def self.create_from_filename(file_name)
    file = Song.new_from_filename(file_name)
    file.save
    file
  end
  
  
end