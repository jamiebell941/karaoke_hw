
require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bar")
require_relative("../drink")

class TestBar < Minitest::Test

  def setup
    @bar1 = Bar.new(1000, [], [])
  end

  def test_increase_till
  @bar1.increase_till(4)
  assert_equal(1004, @bar1.till)
end
end
