require './lib/appliances'

class Microwave < Appliances
	def initialize(door: :closed, timer: :on, power: :on)
		super(door: door, power: power)
		@timer = timer
	end

	def timer_on?
		@timer == :on
	end

	def start
		if (door_closed? && timer_on? && power_on?)
			"Microwave is starting"
		else
			"Microwave could not start for some reason..."
		end
	end

	def self.create(door: :closed, timer: :on, power: :on)
		"I am a class method, not of instance's.."
		Microwave.new(door: door, timer: timer, power: power)
	end

end