class MusicLibraryController

  def initialize(path)

    song = MusicImporter.new(path = './db/mp3s')
    song.import
  end


  def call
    puts "Welcome to your music library!"
  end
end
