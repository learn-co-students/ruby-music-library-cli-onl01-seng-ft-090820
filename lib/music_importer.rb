class MusicImporter
  
  def initialize(path)
    @path = path 
  end 
  
  def path 
    @path 
  end 
  
  def files
		files = Dir.glob("#{path}**/*")
		files = files.collect{|file|file.scan(/(?<=mp3s\/)(.*)/)}.flatten 
	end
  
  def import()
    files.each do |filename|
      Song.create_from_filename(filename)
    end
  end 
  
  
  
end 