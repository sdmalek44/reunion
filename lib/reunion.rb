require './lib/activity'

class Reunion
  attr_reader :activities,
              :location

  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity if activity.class == Activity
  end

  def total_cost
    @activities.inject(0.0) {|sum, activity| activity.total_cost + sum}
  end

  def breakdown
    bill = {}
    @activities.each do |activity|
      activity.owed_amounts.each {|person, owed| bill[person] = owed}
    end
    bill
  end
end
