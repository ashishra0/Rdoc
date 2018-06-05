# Album class
class Album
  include Enumerable
  # Setter and getter method
  attr_reader :songs

# creates empty songs array upon instantiation of new object.
  def initialize
    @songs = []
  end

# Adds new song to the songs array
  def add_song(song)
    songs << song
  end

# iterates over songs in the songs array
  def each
    songs.each do |song|
      yield song
    end
  end
end

# Creates new object
thriller = Album.new
thriller.add_song("Thriller")
thriller.add_song("Billie Jean")
puts thriller.songs
