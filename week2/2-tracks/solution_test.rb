require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  # def test_initialize_track
  #   # test
  # end

  # def test_initialize_playlist
  #   # test
  # end

  def test_self_from_yaml
    track1 = Track.new "iamamiwhoami", "t", "Bounty", "electronic"
    track2 = Track.new "Babymetal", "Babymetal Death", "Babymetal", "J-metal"

    playlist = Playlist.new [track1, track2]
    assert_equal playlist, Playlist.from_yaml('alt_tracks.yaml')
  end

#   def test_each
#     # FIX
#     playlist = Playlist.new("Babymetal Death", "Babymetal", "Babymetal", "J-metal")
#     assert_equal true, playlist.each
#   end

#   def test_find
#     playlist = Playlist.from_yaml('alt_tracks.yaml')
#     assert_equal true, playlist.find
#   end

#   def test_find_by
#     playlist = Playlist.from_yaml('alt_tracks.yaml')
#     assert_equal true, playlist.find_by(awesome_rock_filter)
#   end

  def test_find_by_name
    playlist = Playlist.from_yaml('alt_tracks.yaml')
    assert_equal true, playlist.find_by_name('t')
  end

#   def test_find_by_artist
#     playlist = Playlist.from_yaml('tracks.yaml')
#     assert_equal true, playlist.find_by_artist('t')
#   end

#   def test_find_by_album
#     playlist = Playlist.from_yaml('tracks.yaml')
#     assert_equal true, playlist.find_by_album('t')
#   end

#   def test_find_by_genre
#     playlist = Playlist.from_yaml('tracks.yaml')
#     assert_equal true, playlist.find_by_genre('t')
#   end

#   def test_shuffle
#     playlist = Playlist.from_yaml('tracks.yaml')
#     shuffled = playlist.shuffle

#     assert_equal true, playlist != shuffled
#     assert_equal false, playlist = shuffled
#   end

#   def test_random
#     playlist = Playlist.from_yaml('tracks.yaml')
#     random_track = playlist.random
#     assert_equal true, playlist.include?(random_track)
#   end

#   def test_to_s
#     playlist = Playlist.from_yaml('alt_tracks.yaml')
#     assert_equal '', playlist.to_s
#   end

#   def test_and
#     big_playlist = Playlist.from_yaml('tracks.yaml')
#     small_playlist = Playlist.from_yaml('alt_tracks.yaml')

#     assert_equal true, big_playlist & small_playlist
#   end

#   def test_or
#     big_playlist = Playlist.from_yaml('tracks.yaml')
#     small_playlist = Playlist.from_yaml('alt_tracks.yaml')

#     assert_equal true, big_playlist | small_playlist
#   end

#   def test_minus
#     big_playlist = Playlist.from_yaml('tracks.yaml')
#     small_playlist = Playlist.from_yaml('alt_tracks.yaml')

#     assert_equal true, big_playlist - small_playlist
#   end

#   def test_call
#     # test
#   end

  def test_with_indifferent_access
    hash = {key1: 1, key2: 2}.with_indifferent_access
    
    assert_equal true, hash[:key1] == hash["key1"]
  end

  def test_with_indifferent_access_fetch
    hash = {key1: 1, key2: 2}.with_indifferent_access
    
    assert_equal true, hash.fetch(:key1) == hash.fetch("key1")
  end

# end

# class AwesomeRockFilter
#   AWESOME_ARTISTS = %w(Led\ Zeppellin The\ Doors Black\ Sabbath)

#   def call(track)
#     AWESOME_ARTISTS.include? track.artist
#   end
end
