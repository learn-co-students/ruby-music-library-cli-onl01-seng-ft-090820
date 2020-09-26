require 'pry'

class Song 
    # extend Concerns::Findable

    attr_accessor :name
    attr_reader :artist, :genre

    @@all = [] 

    def initialize(name, artist = nil, genre = nil)
        @name = name 
        self.artist=artist if artist 
        self.genre=genre if genre 
    end 

    def self.all 
        @@all
    end 

    def save 
        @@all << self 
    end 

    def self.destroy_all 
        @@all = []
    end 

    def self.create(name) 
        song = self.new(name) 
        song.save
        song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
        # artist.songs << self 
        @artist
    end 

    def genre=(genre)
        @genre = genre
        if genre.songs.include? (self) 
        else 
            genre.songs << self 
        end
    end

    def self.find_by_name(name)
        @@all.detect{|s| s.name == name}
        # uniq.find {|s| s.name == name}
    end

    def self.find_or_create_by_name(name)
        if song = find_by_name(name) 
           song
        else
        song = Song.create(name)
        end
    end

    def self.new_from_filename(filename)
        # binding.pry
        song_arr = filename.split(".mp3")[0].split(" - ")
        song = Song.find_or_create_by_name(song_arr[1])
        artist = Artist.find_or_create_by_name(song_arr[0])
        genre = Genre.find_or_create_by_name(song_arr[2])
        song.artist = artist
        song.genre = genre 
        song
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end
end 