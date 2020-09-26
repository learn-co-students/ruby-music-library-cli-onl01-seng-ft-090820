require 'pry'
class MusicImporter 
    attr_accessor :path 

    def initialize(path)
        @path = path
    end 

    # def path
    #     @path 
    #     # "./spec/fixtures/mp3s"
    # end

    def files
        # binding.pry
        files_arr = Dir.entries(@path) - [".", ".."]
        files_arr
    end
    
    def import
        files.each {|file| Song.create_from_filename(file)}
    end
end 
