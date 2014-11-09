class Train

attr_accessor :itinerary, :location, :in_transit, :carriages

	def initialize(carriages = [])
		@carriages = carriages
		@itinerary = []
		@in_transit = [] 
	end

	def add_carriage(carriage)
		@carriages << carriage if @carriages.size < 3
	end

	def has_passengers?
		@carriages.any?(&:has_passengers?)
	end

	def full?
		@carriages.all?(&:full?)
	end
	
	def add_station_to_itinerary(station)
		@itinerary << station
	end

	def passenger_destination_in_itinerary?(passenger)
		@itinerary.include?(passenger.destination)
	end

	def actual_location(station)
		@location = station
	end

	def board_where
		@carriages.reject(&:full?).first
	end

	def board(passenger)
		self.board_where.push(passenger) if passenger_destination_in_itinerary?(passenger)
	end

	def passengers_to_depart
		@carriages.select(&:has_passengers?).map(&:carriage).flatten.select do |passenger| 
			passenger.destination == location
		end
	end

	def alight_here
		@in_transit = passengers_to_depart
		@carriages.delete_if{ |passenger| in_transit.include?(passenger) }	
	end

end
