class Track
  # Your code goes here.
end

class Playlist
  def self.from_yaml(path)
    # Your code goes here.
  end

  def initialize(*tracks)
    # Your code goes here.
  end

  def each
    # Your code goes here.
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
    # Finds all the tracks by the name
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
    # Give me a new playlist that shuffles the tracks of the current one.
  end

  def random
    # Give me a random track.
  end

  def to_s
    # It should return a nice tabular representation of all the tracks.
    # Checkout the String class for something that can help you with that.
  end

  def &(playlist)
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