require 'pry'

class Artist 
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :genre

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
        @@all = []
    end 

    def self.create(name) 
        artist = self.new(name)
        artist.save
        artist
    end

    def songs
        @songs
    end

    def add_song(song)
        if !song.artist 
        song.artist = self    
        end
        @songs << song unless @songs.include?(song)
        @songs.uniq
    end 

    def genres
        genre_arr = @songs.map {|s| s.genre}
        genre_arr.uniq
    end

end 