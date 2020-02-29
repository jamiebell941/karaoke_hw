
require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../songs")

class SongTest < Minitest::Test

  def setup
    @song1 = Song.new("Smoko", "The Chats", 179, 0)
    @song2 = Song.new("Bus Money", "The Chats", 158, 0)
    @song3 = Song.new("Identity Theft", "The Chats", 180, 0)
    @song4 = Song.new("Pub Feed", "The Chats", 146, 0)
    @song5 = Song.new("Sunshine on Leith", "The Proclaimers", 317, 0)
    @song6 = Song.new("I'm Gonna Be(500 Miles)", "The Proclaimers", 219, 0)
    @song7 = Song.new("Electric Avenue", "Eddy Grant", 197, 0)
    @song8 = Song.new("Ballroom Blitz", "Sweet", 241, 0)
    @song9 = Song.new("Killing in the Name", "Rage Against The Machine", 315, 0)
    @song10 = Song.new("Bohemian Rhapsody", "Queen", 360, 0)
    @song11 = Song.new("Don't Stop Me Now!", "Queen", 246, 0)

    @songs = [@song1, @song2, @song3, @song4, @song5, @song6, @song7,
       @song8, @song9, @song10, @song11, @song12]
  end

  def test_get_track
    assert_equal("Smoko", @song1.track)
  end

  def test_get_duration
    assert_equal(317, @song5.duration)
  end

  def test_get_artist
    assert_equal("Queen", @song10.artist)
  end

  def test_find_song_by_name
    assert_equal("Electric Avenue", @song7.track)
  end

end
