require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    a = Activity.new('soccer', 200, 20)

    assert_instance_of Activity, a
  end

  def test_it_takes_in_attributes
    a = Activity.new('soccer', 200, 20)

    assert_equal 'soccer', a.name
    assert_equal 200, a.base_cost
    assert_equal 20, a.cost_per_participant
  end

  def test_it_adds_participant
    a = Activity.new('soccer', 200, 20)
    expected_1 = {}
    expected_2 = {'bob'=>0}

    assert_equal expected_1, a.participants

    a.add_participants('bob', 0)
    assert_equal expected_2, a.participants
  end
end
