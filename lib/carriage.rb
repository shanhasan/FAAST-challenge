class Carriage

	attr_accessor :coach, :capacity

	DEFAULT_CAPACITY = 40

	def initialize(capacity = DEFAULT_CAPACITY)
		@coach = []
		@capacity = capacity
	end

	def empty?
		@coach.empty?
	end

	def full?
		@capacity == DEFAULT_CAPACITY
	end



end