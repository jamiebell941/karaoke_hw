
require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bar")
require_relative("../drink")
require_relative("../guests")
require_relative("../rooms")

class TestBar < Minitest::Test

  def setup
    @bar1 = Bar.new(1000, [], [])
  end

  def test_increase_till
  @bar1.increase_till(4)
  assert_equal(1004, @bar1.till)
  end

  # def test_guest_buys_room
  #   @bar1.guest_buys_room(@Tim_Roth, @Room3)
  #   assert_equal(1250, @bar1.till)
  #   assert_equal(2750, @Tim_Roth.wallet)
  # end

end
