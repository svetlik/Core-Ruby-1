require 'yaml'

class Track
  attr_reader :artist, :name, :album, :genre
  def initialize(track_as_hash = {}, *track_info)
    p track_as_hash
    p track_info
    @artist = track_info.fetch(0, track_as_hash[:artist] || track_as_hash['artist'])
    @name = track_info.fetch(1, track_as_hash[:name] || track_as_hash['name'])
    @album = track_info.fetch(2, track_as_hash[:album] || track_as_hash['album'])
    @genre = track_info.fetch(3, track_as_hash[:genre] || track_as_hash['genre'])
  end

  def artist
    @artist
  end

  def name
    @name
  end

  def album
    @album
  end

  def genre
    @genre
  end
end

class Playlist
  def self.from_yaml(path)
    Playlist.new *YAML.load_file(path).map { |track_as_hash| Track.new(track_as_hash) }
  end

  def initialize(*tracks)
    @tracks = []
    tracks.each { |track| @tracks << track }
  end

  def each
    return to_enum(:each) unless block_given?
  end

  def find(&block)
    new_playlist = Playlist.new
    new_playlist = select { |track| yield(track) == true }
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
    @tracks.each { |track| new_playlist << track if track.name == name }
  end

  def find_by_artist(artist)
    new_playlist = Playlist.new
    @tracks.each { |track| new_playlist << track if track.artist == artist }
    new_playlist
  end

  def find_by_album(album)
    new_playlist = Playlist.new
    @tracks.each { |track| new_playlist << track if track.album == album }
    new_playlist
  end

  def find_by_genre(genre)
    new_playlist = Playlist.new
    @tracks.each { |track| new_playlist << track if track.genre == genre }
    new_playlist
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

class HashWithIndifferentAccess
  def initialize(hash)
    @hash = {}
    hash.each do |key, value|
      if key.is_a? Symbol
        @hash[key.to_s] = value
      else
        @hash[key] = value
      end
    end
  end

  def [](key)
    if key.is_a? Symbol
      @hash[key.to_s]
    else
      @hash[key]
    end
  end

  def fetch(key)
    if key.is_a? Symbol
      @hash.fetch key.to_s
    else
      @hash.fetch key
    end
  end
end

class Hash
  def with_indifferent_access
    HashWithIndifferentAccess.new(self)
  end
end