require 'pry'
class MusicLibraryController 

    def initialize(path="./db/mp3s")
        MusicImporter.new(path).import
    end 

    def call 
        puts "Welcome to your music library!"
        puts "What would you like to do?"
        #  input = gets.strip
        #  if input !=exit
        puts "To quit, type 'exit'."
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        input = gets.chomp

        case input
        when "list songs"
          self.list_songs
        when 'list artists'
          self.list_artists
        when 'list genres'
          self.list_genres
        when 'list artists'
          self.list_artists
        when 'list artist'
          self.list_songs_by_artist
        when 'list genre'
          self.list_songs_by_genre
        when 'play song'
          self.play_song
        else
          "Type in a valid request please"
        end
    end

    def list_songs
        song_list = Song.all.sort{|a,b| a.name <=> b.name}
        song_list.each.with_index(1) do |song, index|
            # binding.pry
            puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
        end
    end

    def list_artists
        Artist.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |artist, index|
            # binding.pry
            puts "#{index}. #{artist.name}"
        end
    end 

    def list_genres
        genres = Genre.all.sort{|a,b| a.name <=> b.name}
        genres.each.with_index(1) do |genre, index|
            # binding.pry
            puts "#{index}. #{genre.name}" 
        end
    end 

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        # binding.pry
        input = gets.strip
        if Artist.find_by_name(input) == nil 
        elsif artist = Artist.find_by_name(input)
        # binding.pry
         artist.songs.sort{|a, b| a.name <=> b.name}
         artist.each.with_index(1) do |artist, index|
            puts "#{index}. #{artist.name} - #{genre.name}"
            end 
        end
    end 

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        # binding.pry
        gen_input = gets.strip
        if Genre.find_by_name(gen_input) == nil
         # puts "Genre not found."
        elsif genre = Genre.find_by_name(gen_input)
        # binding.pry
         Genre.songs.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |genre, index|
            puts "#{index}. #{genre.name} - #{song.name}"
             end
        end
    end 

    def play_song
        puts "Which song number would you like to play?"
        # binding.pry
        input = gets.strip.to_i
        if input > 1 && (input - 1) <= Song.all.length 
            # binding.pry
           song = Song.all.sort{|a,b| a.name <=> b.name}[(input - 1)]
           puts "Playing #{song.name} by #{song.artist.name}"
        # Song.all.each.with_index do |song, index| 
        #     if index + 1 == input 
        #         puts "Playing #{song.name} by #{song.artist.name}"
        else 
        end 
      end 

end 