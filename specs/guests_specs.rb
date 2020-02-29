
require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../guests")

class GuestTest < MiniTest::Test
  def setup
    @guest1 = Guest.new("John", 32, "Bohemian Rhapsody", 300, 0)
    @guest2 = Guest.new("Jasper", 29, "Sunshine on Leith", 200, 0)
    @guest3 = Guest.new("Jonah", 30, "Pub Feed", 250, 0)
    @guest4 = Guest.new("Jim", 31, "Identity Theft", 180, 0)

    @JParty = [@guest1, @guest2, @guest3, @guest4]

  end

  def test_get_age
    assert_equal(29, @guest2.age)
  end

  def test_get_name
      assert_equal("Jim", @guest4.name)
  end

  def test_get_fav_song
    assert_equal("Bohemian Rhapsody", @guest1.fav_song)
  end

  

end
