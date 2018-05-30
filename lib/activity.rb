class Activity
  attr_reader :name,
              :participants,
              :base_cost,
              :cost_per_participant

  def initialize(name, base, per_participant)
    @name = name
    @participants = {}
    @base_cost = base
    @cost_per_participant = per_participant
  end

  def add_participants(participant, payment)
    @participants[participant] = payment
  end

  def calculate_fair_share
    total_cost = @base_cost.to_f + (@cost_per_participant * @participants.count)
    (total_cost / @participants.count).round(2)
  end

  def owed_amounts
    owed = {}
    @participants.each do |participant, paid|
        owed[participant] = calculate_fair_share - paid
    end
    owed
  end
end
