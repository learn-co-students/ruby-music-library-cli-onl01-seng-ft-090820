class Genre
    extend Concerns::Findable

    attr_accessor :name, :artist, :song

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
        genre = self.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def artists
        # binding.pry
        artists = self.songs.collect {|song| song.artist}
        artists.uniq
    end


end