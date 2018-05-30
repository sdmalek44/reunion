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
end
