require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  
  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
  
  def save
    @@all << self
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self if !(genre.songs.include?(self))
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.new_from_filename(filename)
    parsed_name = filename.split(" - ")
    artist = Artist.find_or_create_by_name(parsed_name[0])
    name = parsed_name[1]
    genre = Genre.find_or_create_by_name(parsed_name[2].split(".")[0])
    new_song = Song.new(name, artist, genre)
    new_song
  end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
end