require "pry"
require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../rooms")
require_relative("../songs")
require_relative("../guests")
require_relative("../bar")

class TestRoom < MiniTest::Test

  def setup

      @bar1 = Bar.new(1000, [], [])


    @guest1 = Guest.new("John", 32, "Bohemian Rhapsody", 300, 0)
    @guest2 = Guest.new("Jasper", 29, "Sunshine on Leith", 200, 0)
    @guest3 = Guest.new("Jonah", 30, "Pub Feed", 250, 0)
    @guest4 = Guest.new("Jim", 31, "Identity Theft", 180, 0)

    @JParty = [@guest1, @guest2, @guest3, @guest4]

    @Tim_Roth = Guest.new("Tim Roth", 44, "Electric Avenue", 3000, 0)
    @Bruce_Willis = Guest.new("Bruce Willis", 51, "Don't Stop Me Now", 500, 0)
    @John_Travolta = Guest.new("John Travolta", 48 , "Bohemian Rhapsody", 500, 0)
    @Sam_Jackson = Guest.new("Sam Jackson", 52, "Killing in the Name", 810, 0)
    @Uma_Therman= Guest.new("Uma Therman", 49 , "Killing in the Name", 1000, 0)
    @Harvey_Keitel= Guest.new("Harvey Keitel", 80, "Killing in the Name", 30, 0)
    @Christopher_Walken = Guest.new("Christopher Walken", 76, "Killing in the Name", 600, 0)

    @Pulp_Party = [@Tim_Roth, @Bruce_Willis, @John_Travolta, @Sam_Jackson,
      @Uma_Therman, @Harvey_Keitel, @Christopher_Walken]

    @Party2 = [@Tim_Roth, @Bruce_Willis, @John_Travolta, @Sam_Jackson,
      @Uma_Therman, @Harvey_Keitel, @Christopher_Walken, @guest1, @guest2]


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

       @room1 = Room.new(1, 4, 150, 1800, @songs, 1000)
       @room2 = Room.new(2, 6, 200, 1800, @songs, 1000)
       @room3 = Room.new(3, 8, 250, 1800, @songs, 1000)
  end

  def test_get_room_number
      assert_equal(1, @room1.room_number)
  end

  def test_get_room_size
      assert_equal(6, @room2.room_size)
  end

  def test_get_room_price
      assert_equal(250, @room3.room_price)
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

  def test_fill_room
    @room1.fill_room(@JParty)
    assert_equal(4, @room1.occupance.count)
  end

  def test_fill_room__bigger_room
    @room1.fill_room(@Pulp_Party)
    assert("Your party will need a larger room")
  end

  def test_fill_room__no_room_available
    @room3.fill_room(@Party2)
    assert("Sorry we don't have a room big enough")
  end



  def test_check_in
    @room1.check_in(@guest1)
    assert_equal(1, @room1.occupance.length)
    assert_equal("John", @room1.occupance.last.name)
    assert_equal(150, @guest1.wallet)
  end

  def test_check_in_room_full
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    @room1.check_in(@guest3)
    @room1.check_in(@guest4)
    @room1.check_in(@guest1)
    assert_equal(4, @room1.occupance.length)
  end

  def test_check_in_cant_afford
       @room3.check_in(@guest2)
    assert("Sorry, that room is too much")
  end

  def test_check_out
    @room1.check_in(@guest1)
    @room1.check_out(@guest1)
    assert_equal(0, @room1.occupance.count)
  end

  def test_check_out_empty
    @room1.check_out(@guest1)
      assert("This room is empty now")
  end

  # def test_party_wallet
  #   result = party_wallet(@JParty)
  #   assert_equal(930, result)
  # end

  # def test_party_check_in
  #   @room1.party_check_in(@JParty)
  #   assert_equal(4, @room1.occupance.count)
  # end




end
