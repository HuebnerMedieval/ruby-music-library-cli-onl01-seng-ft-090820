class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
  end
  
  def call
    
  end
  
end