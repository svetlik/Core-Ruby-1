require 'yaml'

class Track
  attr_accessor :artist, :name, :album, :genre
  def initialize(*track_info)
    @artist = track_info[0]
    @name = track_info[1]
    @album = track_info[2]
    @genre = track_info[3]
    if track_info[0].class != String
      hash_info = track_info[0]
      @artist = hash_info[:artist]
      @name = hash_info[:name]
      @album = hash_info[:album]
      @genre = hash_info[:genre]
    end
  end
end

class Playlist
  def self.from_yaml(path)
    # check for field that is missing -> when parsing the yaml file
    @tracks = YAML.load_file(path)
  end

  def initialize(*tracks)
    @tracks = tracks
  end

  def each
    return to_enum(:each) unless block_given?
  end

  def find(&block)
    # Filter the playlist by a block. Should return a new Playlist.
  end

  def find_by(*filters)
    # Filter is any object that responds to the method #call. #call accepts one
    # argument, the track it should match or not match.
    #
    # Should return a new Playlist.
  end

  def find_by_name(name)
    new_playlist = Playlist.new
    @tracks.each { |track| new_playlist << track unless track.name != name }
    new_playlist
  end

  def find_by_artist(artist)
    # Finds all the tracks by the artist. Should return a new Playlist.
  end

  def find_by_album(album)
    # Finds all the tracks from the album. Should return a new Playlist.
  end

  def find_by_genre(genre)
    # Finds all the tracks by genre. Should return a new Playlist.
  end

  def shuffle
    @tracks.shuffle
  end

  def random
    @tracks.sample
  end

  def to_s
    # It should return a nice tabular representation of all the tracks.
    # Checkout the String class for something that can help you with that.
  end

  def &(playlist)
    new_playlist = self
    playlist.each { |track| new_playlist << track }
    new_playlist
    # Your code goes here. This _should_ return new playlist.
  end

  def |(playlist)
    # Your code goes here. This _should_ return new playlist.
  end

  def -(playlist)
    # Your code goes here. This _should_ return new playlist.
  end
end

class AwesomeRockFilter
  AWESOME_ARTISTS = %w(Led\ Zeppellin The\ Doors Black\ Sabbath)

  def call(track)
    AWESOME_ARTISTS.include? track.artist
  end
end

class HashWithIndifferentAccess < Hash
  # Your code goes here.
end

class Hash
  def with_indifferent_access
    HashWithIndifferentAccess.new(self)
  end
end