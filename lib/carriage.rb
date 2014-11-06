class Carriage

	attr_accessor :carriage, :capacity

	DEFAULT_CAPACITY = 40

	def initialize(capacity = DEFAULT_CAPACITY)
		@carriage = []
		@capacity = capacity
	end

	def has_passengers?
		!@carriage.empty?
	end

	def full?
		@carriage.size == @capacity
	end

	def passengers_number
		@carriage.size
	end

	def board(passenger)
		@carriage << passenger
	end




end