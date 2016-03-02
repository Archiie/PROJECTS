class Appliances

	def initialize(door: :closed, power: :on)
		@door = door
		@power = power
	end

	def door_closed?
		@door == :closed
	end

	def power_on?
		@power == :on
	end
end