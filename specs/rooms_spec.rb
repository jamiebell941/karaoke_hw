require "pry"
require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../rooms")
require_relative("../songs")

class TestRoom < MiniTest::Test

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

       @room1 = Room.new(1, 4, 15, 1800, @songs)
       @room2 = Room.new(2, 6, 20, 1800, @songs, )
       @room3 = Room.new(3, 8, 25, 1800, @songs)
  end

  def test_get_room_number
      assert_equal(1, @room1.room_number)
  end

  def test_get_room_size
      assert_equal(6, @room2.room_size)
  end

  def test_get_room_price
      assert_equal(25, @room3.room_price)
  end

  def test_get_queue
    assert_equal([], @room1.queued_songs)
  end

  def test_get_songs_available
    assert_equal(@songs, @room1.available_songs)
    assert_equal(12, @room1.available_songs.length)
  end

  def test_add_song_to_queue
    @room1.add_song_to_queue(@song4)
    assert_equal("Pub Feed", @room1.queued_songs.first.track)
  end

  def test_move_queue_to_current
    @room1.add_song_to_queue(@song4)
    @room1.add_song_to_queue(@song3)
    @room1.add_song_to_queue(@song2)
    assert_equal("Pub Feed", @room1.queued_songs.first.track)
    @room1.move_queue_to_current
    assert_equal("Pub Feed", @room1.current_song.first)
  end
  # def test_add_song_to_queue
  #     @room1.add_song_to_queue(@song4)
  #     assert_equal("Pub Feed", @room1.queued_songs)
  # end

end
