
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

    @Tim_Roth = Guest.new("Tim Roth", 44, "Electric Avenue", 3000, 0)
    @Bruce_Willis = Guest.new("Bruce Willis", 51, "Don't Stop Me Now", 500, 0)
    @John_Travolta = Guest.new("John Travolta", 48 , "Bohemian Rhapsody", 500, 0)
    @Sam_Jackson = Guest.new("Sam Jackson", 52, "Killing in the Name", 810, 0)
    @Uma_Therman= Guest.new("Uma Therman", 49 , "Killing in the Name", 1000, 0)
    @Harvey_Keitel= Guest.new("Harvey Keitel", 80, "Killing in the Name", 30, 0)
    @Christopher_Walken = Guest.new("Christopher Walken", 76, "Killing in the Name", 600, 0)

    @Pulp_Party = [@Tim_Roth, @Bruce_Willis, @John_Travolta, @Sam_Jackson,
      @Uma_Therman, @Harvey_Keitel, @Christopher_Walken]

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

  def test_reduce_wallet
      @Tim_Roth.reduce_wallet(500)
      assert_equal(2500, @Tim_Roth.wallet)
    end


end
