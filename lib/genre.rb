require 'pry'

class Genre 
    extend Concerns::Findable
    attr_accessor :name
    attr_reader :artist 

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
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        @songs 
    end

    def artists 
    artists_arr = @songs.map {|s| s.artist}
    artists_arr.uniq
    end
end 