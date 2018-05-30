require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def test_it_exists
    r = Reunion.new('park')

    assert_instance_of Reunion, r
  end

  def test_it_has_attributes
    r = Reunion.new('park')

    assert_equal 'park', r.location
    assert_equal [], r.activities
  end

  def test_it_adds_an_activity
    r = Reunion.new('park')
    soccer = Activity.new('soccer', 200, 20)
    cornhole = Activity.new('cornhole', 10, 5)
    r.add_activity(soccer)
    r.add_activity(cornhole)

    assert_equal [soccer, cornhole], r.activities
  end

  def test_total_cost_of_reunion
    r = Reunion.new('park')
    soccer = Activity.new('soccer', 200, 20)
    soccer.add_participants('bob', 20)
    soccer.add_participants('tim', 106.67)
    cornhole = Activity.new('cornhole', 10, 5)
    r.add_activity(soccer)
    r.add_activity(cornhole)

    assert_equal 250.0, r.total_cost
  end
end
