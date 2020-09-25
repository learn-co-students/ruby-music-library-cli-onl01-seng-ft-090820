class Song
    extend Concerns::Findable

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist=(artist) if artist != nil
        self.genre=(genre) if genre != nil
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
        song = self.new(name)
        song.save
        song
    end

    def artist=(artist)
        @artist == nil ? @artist = artist : @artist = artist
        self.artist != nil ? @artist.add_song(self) : @artist
    end

    def genre=(genre)
        if @genre == nil
            @genre = genre
        else
            @genre = genre
        end
        
        if !@genre.songs.include?(self)
            @genre.songs << self
        else
            nil
        end
    end

    def self.new_from_filename(filename)
        song_details = filename.split(" - ")

        song_name = song_details[1]
        artist_name = song_details[0]
        genre_name = song_details[2].split(".mp3").join

        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)
        self.new(song_name, artist, genre)
    end

    def self.create_from_filename(filename)
        self.new_from_filename(filename).save        
    end

end