class MusicImporter
  attr_reader :path
  
  
  def initialize(path)
    @path = path
    @files = []
    @files = Dir.children(path)
  end
  
  def files
    @files
  end
  
  def import
    @files.each {|file| Song.create_from_filename(file)}
  end
  
end