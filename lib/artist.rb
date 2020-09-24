class Artist
  attr_accessor :name
  attr_reader :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.create(name)
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end
  
  def save
    @@all << self
  end
  
  def add_song(song)
    if !(self.songs.include?(song))
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def genres
    genres = []
    @songs.each do |song| 
      genres << song.genre if !(genres.include?(song.genre))
    end
    genres
  end
end