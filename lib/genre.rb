class Genre
  attr_accessor :name, :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
  
  def songs
    Song.all.each do |song|
      if song.genre == self
        @songs << songs
      end
    end
    @songs
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
def artists
    artists = []
    @songs.each do |song| 
      artists << song.artist if !(artists.include?(song.artist))
    end
   artists
  end
  
end