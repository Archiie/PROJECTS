require './lib/appliances'

class Dishwasher < Appliances
	
	def initialize(door: :closed, power: :on)
		super(door: door, power: power)
	end

	def start
		if (door_closed? && power_on?)
			"Dishwasher is starting"
		else
			"Dishwasher could not start..."
		end
	end

	def self.create(door: :closed, power: :on)
		"I am a class method, not of instance's.."
		Dishwasher.new(door: door, power: power)
	end

end