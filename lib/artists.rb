class Artist
    extend Concerns::Findable

    attr_accessor :name, :song, :genre

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

    def songs
        @songs
    end

    def add_song(song)
        song.artist == nil ? song.artist = self : nil
        @songs.include?(song) ? nil : @songs << song
    end

    def genres
        # binding.pry
        genres = self.songs.collect {|song| song.genre}
        genres.uniq
    end

end