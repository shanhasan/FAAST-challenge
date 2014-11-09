class Station

attr_accessor :location, :station

	def initialize(station = [], location = 'Station')
		@station = station
		@location = location
	end
	
	def has_passengers?
		!@station.empty?
	end

	def has_location?
		@location
	end

	def allow_entrance(passenger)
		@station << passenger if passenger.has_enough_money?
	end

	def passenger_in_the_station(train)
		@station << train.in_transit
	end



end


